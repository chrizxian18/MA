
package MerchantAcquisition



import static org.springframework.http.HttpStatus.*
import org.springframework.security.access.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityUtils
// import grails.converters.JSON


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
        def userInstanceList
        def userInstanceCount
        def username = "%${params.username}%"
        if (params.username) {
            userInstanceList = User.findAllByUsernameLike(username)
            userInstanceCount = User.findAllByUsernameLike(username, params)
        }
        else {
            userInstanceList = User.list(params)
            userInstanceCount = User.list()
        }
        [userInstanceList:userInstanceList, userInstanceCount: userInstanceCount.size()]  
    }

    def viewSelected(User userInstance) {
        respond userInstance
    }

    def create() {
        respond new User(params)
    }

    def contactEmail() {
        User userInstance = User.findByUsername("contactUs")
        respond userInstance
    }

    def contactUs() {
        User userInstance = authenticatedUser
        if (userInstance == null) {
            return
        }
        respond userInstance
    }

    def submitContactUs() {
        def name = params.name
        def username = params.username
        if (username == null) {
            username = "(Not Registered)"
        }
        log.info "xtian.username:" + username
        def email = params.email
        def csubject = params.csubject
        def details = params.details

        def group = MyGroup.findByName("Reviewer")
        def userGroups = UserMyGroup.createCriteria().list {
            and {
                eq("myGroup", group)
            }
        }
        def emails = []
        for(UserMyGroup ug : userGroups) {
        emails.add(ug.user.email)
        }
         log.info "emails without contacts" + emails
        def contacts = User.findByUsername("contactUs")
        log.info "contacts.email" + contacts.email
        log.info "contacts" + contacts
        emails.add(contacts.email)
        log.info "emails with contacts" + emails
        sendMail {
            async true
            to emails
            subject "Merchant Acquisition Contact Us - ${csubject}"
            html g.render(template:"contactUsEmail", model:[name:name, username:username, email:email, details:details])
        }
        flash.message = "Your inquiry has been sent!"
        redirect(action: "success")
    }

    def forgotPassword() {

    }

    def resetPassword() {
        User userInstance = User.findByUsername(params.username) 
        log.info "userInstance:" + userInstance
         if (userInstance == null) {
             flash.error = "User Name does not exist!"
             redirect(action: "forgotPassword")
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'forgotPassword'
            return
        }

        userInstance.confirmCode= UUID.randomUUID().toString()
        userInstance.save flush:true
        flash.message = "An email will be sent to the registered email"
        redirect(action: "success")

          sendMail {
            async true
            to userInstance.email
            subject "Forgot Password"
            html g.render(template:"forgotPasswordEmail",model:[code:userInstance.confirmCode])
        }

    }

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
            async true
            to userInstance.email
            subject "Merchant Acquisition Account Creation"
            html g.render(template:"mailtemplate",model:[code:userInstance.confirmCode])
        }

        render(view: "index", model: [userInstance: userInstance])
        flash.message = "Your account has been created. Please confirm your email address. Confirmation link has been sent to your account"
        redirect(action: "success")
        log.info "mylog.error:success"
    }

    def success(){
    }   


    def confirmForgotPassword(String id)
    {

        User userInstance= User.findByConfirmCode(id)
        if(!userInstance)
        {
            render(view: "success", model: [message: 'Session expired or invalid link.'])
            return
        }

        def pool = ['a'..'k','m'..'z','A'..'N','P'..'Z',2..9].flatten()
        Random rand = new Random(System.currentTimeMillis())
        def randChars = (0..5).collect { pool[rand.nextInt(pool.size())] }
        def randPass = randChars.join()
        userInstance.password = randPass
        userInstance.save flush:true
        flash.message = "Your password has been reset successfully! Your new password has been sent to your registered email address."
        redirect(action: "success")

          sendMail {
            async true
            to userInstance.email
            subject "Forgot Password Confirmed"
            html g.render(template:"confirmForgotPasswordEmail",model:[randomPassword:randPass])
        }
    }

    def confirm(String id)
    {

        User userInstance= User.findByConfirmCode(id)
        if(!userInstance)
        {
            render(view: "success", model: [message: 'Session expired or invalid link.'])
            return
        }

        def group = MyGroup.findByName("Merchant")
        UserMyGroup.create userInstance, MyGroup.get(group.id), true
        userInstance.enabled=true;
        if (!userInstance.save(flush: true)) {
            render(view: "success", model: [message: 'Problem activating account.'])
            return
        }
        flash.message = "Your account has been successfully activated!"
        redirect(action: "success")
    }

    @Secured(['ROLE_ADMIN'])
    def edit(User userInstance) {
         def myGroups = MyGroup.list()
        respond userInstance, model:[myGroups:myGroups]

    }

    def account(User userInstance) {
        userInstance = authenticatedUser
        respond userInstance

    }

     def updateAccount(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'account'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = "Successfully updated Account"
                 redirect uri:"/user/account/"
            }
            '*'{ respond userInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_ADMIN'])
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
            if (userInstance.username =="contactUs") {
                flash.message = "Contact Email has been updated!"
                 redirect uri:"/user/contactEmail/"
            } else{
                flash.message = "Successfully updated User"
                 redirect uri:"/user/viewSelected/${userInstance.id}"
            }
    }

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

    // def changePasswordViaWebService() {
    //         def output = [:]
    //         try {
    //             def requestData = request.JSON
    //            log.info "Change Password API: ${requestData}"
    //             if(requestData.username && requestData.currentPassword && requestData.newPassword) {
    //                 String username
    //                 String base64Username = requestData.username
    //                 def result = getValidUsername(base64Username)
    //                 if(result.status == 0) {
    //                     username = result.username
    //                     def userInstance = User.findByUsername(username)
    //                     if(userInstance) {
    //                         def decodedCurrentPassword = new String(requestData.currentPassword.decodeBase64())
    //                         log.info "decodedCurrentPassword:" + decodedCurrentPassword
    //                         def decodedNewPassword = new String(requestData.newPassword.decodeBase64())
    //                         log.info "decodedNewPassword:" + decodedNewPassword
    //                         if (springSecurityService.passwordEncoder.isPasswordValid(userInstance.password, decodedCurrentPassword, null)) {
    //                                 userInstance.password = decodedNewPassword
    //                                 if(userInstance.save(flush:true)) {
    //                                 output.status = 0
    //                                 output.message = "Sucessfully updated password for user: ${requestData.username}"
    //                                 log.info "Change Password API: Sucessfully updated password for user: ${requestData.username}"
    //                                 response.status = 200
    //                             } else {
    //                                 output.status = 1
    //                                 output.message = "Error saving password."
    //                                 log.error "Error saving password: ${userInstance.errors}"
    //                                 response.status = 404
    //                             }
    //                         }
    //                         else {
    //                             output.status = 1
    //                             output.message = "CurrentPassword is incorrect."
    //                             response.status = 401
    //                         }
    //                     } else {
    //                         output.status = 1
    //                         output.message = "User not found."
    //                         response.status = 401
    //                     }
    //                 } else {
    //                     output.status = 1
    //                     output.message = result.message
    //                     response.status = 404
    //                 }
    //             } else {
    //                 output.status = 1
    //                 output.message = "Invalid request parameters."
    //                 response.status = 404
    //             }
    //         } catch(Exception e) {
    //             output.status = 1
    //             output.message = "Error updating password."
    //             log.error "Error updating password.", e
    //             response.status = 404
    //         }
    //         render output as JSON
    //     }

    // def getValidUsername(String base64Username) {
    //      def hashCode = "2k18merchantapikey"//Holders.config.dashboardApiKey
    //     def data = [:]
    //    log.info "hashCode: ${hashCode}"
    //     def decodedBase64Username = new String(base64Username.decodeBase64())
    //    log.info "decodedBase64Username: ${decodedBase64Username}"
    //     def userData = decodedBase64Username.split(":")
    //     if(userData.size() == 2) {
    //         def apikey = userData[0]
    //         def username = userData[1]
    //         log.info "apikey: ${apikey}"
    //         log.info "username: ${username}"
    //         if(apikey.equals(hashCode)) {
    //             data.status = 0
    //             data.username = username
    //             data.message = "success"
    //         } else {
    //             data.status = 1
    //             data.message = "Invalid api key."
    //         }
    //     } else {
    //         data.status = 1
    //         data.message = "Invalid request Parameters."
    //     }
    //     return data
    // }

    // def test(params) {
        
    //     def a = params.a
    //     def b = params.b
    //     // def currentPassword = springSecurityService.encodePassword(a)
    //     def currentPassword = a?.bytes.encodeBase64().toString()
    //     // def newPassword = springSecurityService.encodePassword(b)
    //     def newPassword = b.bytes.encodeBase64().toString()
    //      // def username = "admin"
    //      def username = params.u
    //     def hashCode = "2k18merchantapikey"
    //     def verificationCode = "${hashCode}:${username}"
    //     String encodedUser = verificationCode.bytes.encodeBase64().toString()
    //     render "username: ${encodedUser}, currentPass: ${currentPassword}, newPass: ${newPassword}"
    // }

}
