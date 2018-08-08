package merchantacquisition



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
@Transactional(readOnly = true)
@Secured(['IS_AUTHENTICATED_FULLY'])
class ApplicationFormController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ApplicationForm.list(params), model:[applicationFormInstanceCount: ApplicationForm.count()]
    }

    def show(ApplicationForm applicationFormInstance) {
        respond applicationFormInstance
    }

    def create() {
        respond new ApplicationForm(params)
    }

    @Transactional
    def save(ApplicationForm applicationFormInstance) {
        if (applicationFormInstance == null) {
            notFound()
            return
        }

        if (applicationFormInstance.hasErrors()) {
            respond applicationFormInstance.errors, view:'create'
            return
        }

        applicationFormInstance.dateCreated = new Date()
        applicationFormInstance.lastUpdated = new Date()
        applicationFormInstance.status = "New"

        applicationFormInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'applicationForm.label', default: 'ApplicationForm'), applicationFormInstance.id])
                redirect applicationFormInstance
            }
            '*' { respond applicationFormInstance, [status: CREATED] }
        }
    }

    def edit(ApplicationForm applicationFormInstance) {
        respond applicationFormInstance
    }

    // @Transactional
    // def update(ApplicationForm applicationFormInstance) {
    //     if (applicationFormInstance == null) {
    //         notFound()
    //         return
    //     }

    //     if (applicationFormInstance.hasErrors()) {
    //         respond applicationFormInstance.errors, view:'edit'
    //         return
    //     }

    //     applicationFormInstance.save flush:true

    //     request.withFormat {
    //         form multipartForm {
    //             flash.message = message(code: 'default.updated.message', args: [message(code: 'ApplicationForm.label', default: 'ApplicationForm'), applicationFormInstance.id])
    //             redirect applicationFormInstance
    //         }
    //         '*'{ respond applicationFormInstance, [status: OK] }
    //     }
    // }

    // @Transactional
    // def delete(ApplicationForm applicationFormInstance) {

    //     if (applicationFormInstance == null) {
    //         notFound()
    //         return
    //     }

    //     applicationFormInstance.delete flush:true

    //     request.withFormat {
    //         form multipartForm {
    //             flash.message = message(code: 'default.deleted.message', args: [message(code: 'ApplicationForm.label', default: 'ApplicationForm'), applicationFormInstance.id])
    //             redirect action:"index", method:"GET"
    //         }
    //         '*'{ render status: NO_CONTENT }
    //     }
    // }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'applicationForm.label', default: 'ApplicationForm'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
