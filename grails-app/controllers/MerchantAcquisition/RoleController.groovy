package MerchantAcquisition



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.springframework.security.access.annotation.Secured

@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class RoleController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Role.list(params), model:[roleInstanceCount: Role.count()]
    }

    def show(Role roleInstance) {
        respond roleInstance
    }

    def create() {
        respond new Role(params)
    }

    @Transactional
    def save(Role roleInstance) {
        if (roleInstance == null) {
            notFound()
            return
        }

        if (roleInstance.hasErrors()) {
            respond roleInstance.errors, view:'create'
            return
        }

        roleInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'role.label', default: 'Role'), roleInstance.id])
                redirect roleInstance
            }
            '*' { respond roleInstance, [status: CREATED] }
        }
    }

    def edit(Role roleInstance) {
        respond roleInstance
    }

    @Transactional
    def update(Role roleInstance) {
        if (roleInstance == null) {
            notFound()
            return
        }

        if (roleInstance.hasErrors()) {
            respond roleInstance.errors, view:'edit'
            return
        }

        roleInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Role.label', default: 'Role'), roleInstance.id])
                redirect roleInstance
            }
            '*'{ respond roleInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Role roleInstance) {

        if (roleInstance == null) {
            notFound()
            return
        }
        try {
            roleInstance.delete (flush:true)
             request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.deleted.message', args: [message(code: 'Role.label', default: 'Role'), roleInstance.id])
                    redirect action:"index", method:"GET"
                }
                '*'{ render status: NO_CONTENT }
              }
        }
        catch(Exception e) {
            flash.error = "This role is currently used in a group role please remove it from the group before deleting."
            // flash.message = e
            redirect uri:"/role/show/${roleInstance.id}"
             log.info "mylog.error:failed to delete"
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'role.label', default: 'Role'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
