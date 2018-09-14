
package MerchantAcquisition



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.springframework.security.access.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityUtils

@Transactional(readOnly = false)

@Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
class UserController {

    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userInstanceCount: User.count()]
    }

    def show(User userInstance) {
        respond userInstance
    }

    def showUsers(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userInstanceCount: User.count()]

    }

    def viewSelected(User userInstance) {
        respond userInstance
    }

    def create() {
        respond new User(params)
    }

    @Transactional
    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            log.info "mylog.error:instance is null"
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'create'
            return
             log.info "mylog.error:${userInstance.errors}"
        }

        if (params.password != params.confirmPassword) { 
            flash.error = "Error: Password and Confirm Password should have the same values!"
           redirect(action: "create")
           log.info "mylog.error:confirm password is different from password"
           return
        }

        if (params.username.equalsIgnoreCase(params.password)) {
            flash.error = "Error: Merchant Name should not be the same as the Password!"
           redirect(action: "create")
           log.info "mylog.error:username is same as password"
           return
        }

        userInstance.dateCreated = new Date()
        userInstance.enabled=false;
        userInstance.confirmCode= UUID.randomUUID().toString()
        if (!userInstance.save(flush: true)) {
            log.info "mylog.error:failed to save"
            return
        }

        sendMail {
            to userInstance.email
            subject "Merchant Acquisition Account Creation"
            html g.render(template:"mailtemplate",model:[code:userInstance.confirmCode])
        }

        render(view: "index", model: [userInstance: userInstance])
        flash.message = "Your account has been created. Please confirm your email address. Confirmation link has been sent to your account"
        redirect(action: "success")
        log.info "mylog.error:success"


        // userInstance.save flush:true

        // request.withFormat {
        //     form multipartForm {
        //         flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), "has been successfully"])
        //         redirect userInstance
        //     }
        //     '*' { respond userInstance, [status: CREATED] }
        // }
    }

    def success(){
    }   


    def confirm(String id)
    {

        User userInstance= User.findByConfirmCode(id)
        if(!userInstance)
        {
            render(view: "success", model: [message: 'Session expired or invalid link.'])
            return
        }

        userInstance.enabled=true;
        if (!userInstance.save(flush: true)) {
            render(view: "success", model: [message: 'Problem activating account.'])
            return
        }
        flash.message = "Your account has been successfully activated!"
        redirect(action: "success")
    }


    def edit(User userInstance) {
         def myGroups = MyGroup.list()
        respond userInstance, model:[myGroups:myGroups]

    }




    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'edit'
            return
        }

        UserMyGroup.removeAll userInstance
        params.list("groups").each{ groupID ->
            log.info "Add to UserMyGroup: $groupID | User: $userInstance.id"
            UserMyGroup.create userInstance, MyGroup.get(groupID), true
        }
        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = "Successfully updated User"
                 redirect uri:"/user/viewSelected/${userInstance.id}"
            }
            '*'{ respond userInstance, [status: OK] }
        }
    }

    // @Transactional
    // def delete(User userInstance) {

    //     if (userInstance == null) {
    //         notFound()
    //         return
    //     }

    //     userInstance.delete flush:true

    //     request.withFormat {
    //         form multipartForm {
    //             flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
    //             redirect action:"index", method:"GET"
    //         }
    //         '*'{ render status: NO_CONTENT }
    //     }
    // }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def changePassword() {
         def userInstance = authenticatedUser
        User activeUser = springSecurityService.currentUser
        def currentPassword = params.currentPassword

        //check if the actual current password equals the input password
        if (springSecurityService.passwordEncoder.isPasswordValid(activeUser.getPassword(), currentPassword, null)) {
                def newPassword = params.newPassword
                //check if the input new password is not equal to the actual current password. 
                  if (!springSecurityService.passwordEncoder.isPasswordValid(activeUser.getPassword(), newPassword, null)) {
                        //check if the new password matches confirm password
                        if(newPassword.equals(params.confirmPassword)) {
                                userInstance.password = newPassword
                                if(userInstance.save(flush:true)) {
                                        flash.message = 'Password changed successfully'
                                } else {
                                        flash.message = 'Failed to change password'
                                }
                        } else {
                                flash.error = "New Password and Confirm Password does not match."
                        }
                } else {
                        flash.error = "New Password must be different from your Current Password."
                }
        } else {
                flash.error = "Current Password input is incorrect."
        }
        redirect uri: SpringSecurityUtils.securityConfig.successHandler.defaultTargetUrl
        return

    }
}
