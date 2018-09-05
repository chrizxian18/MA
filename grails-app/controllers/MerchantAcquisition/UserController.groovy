
package MerchantAcquisition



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.springframework.security.access.annotation.Secured

@Transactional(readOnly = false)

@Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
class UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userInstanceCount: User.count()]
    }

    def show(User userInstance) {
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
        respond userInstance
    }




    // @Transactional
    // def update(User userInstance) {
    //     if (userInstance == null) {
    //         notFound()
    //         return
    //     }

    //     if (userInstance.hasErrors()) {
    //         respond userInstance.errors, view:'edit'
    //         return
    //     }

    //     userInstance.save flush:true

    //     request.withFormat {
    //         form multipartForm {
    //             flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
    //             redirect userInstance
    //         }
    //         '*'{ respond userInstance, [status: OK] }
    //     }
    // }

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
}
