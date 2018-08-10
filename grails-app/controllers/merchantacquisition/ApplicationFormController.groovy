package merchantacquisition

import MerchantAcquisition.User

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
@Transactional(readOnly = false)
@Secured(['IS_AUTHENTICATED_FULLY'])
class ApplicationFormController {
    // def user = new MerchantAcquisition.User
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def showDrafts(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ApplicationForm.findAllByDrafts(true), model:[applicationFormInstanceCount: ApplicationForm.count()]

    }

    def show(ApplicationForm applicationFormInstance) {
        respond applicationFormInstance
    }

    def viewSelected(ApplicationForm applicationFormInstance) {
        respond applicationFormInstance
    }

    def create() {
        respond new ApplicationForm(params)
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

        // def username = "${sec.loggedInUserInfo(field:'username')}"
        // applicationFormInstance.createdBy = username
        // applicationFormInstance.updatedBy = username
        User user = authenticatedUser
        applicationFormInstance.createdBy = user
        applicationFormInstance.updatedBy = user
        applicationFormInstance.dateCreated = new Date()
        applicationFormInstance.lastUpdated = new Date()
        applicationFormInstance.status = "New"
        applicationFormInstance.drafts = true

        //  def file1 = request.getFile('corIssuedByBir')//.getInputSTream()
        // // if(file1.empty) {
        // // // if(file1.empty || file2.empty) {
        // //     flash.message = "File cannot be empty"
        // // } else {
        //     applicationFormInstance.corIssuedByBir = file1.originalFilename
        //     def fullPath1 = grailsApplication.config.uploadFolder + applicationFormInstance.corIssuedByBir
        //     file1.transferTo(new File(fullPath1))
            
        
        


        applicationFormInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'applicationForm.label', default: 'ApplicationForm'), applicationFormInstance.id])
                redirect applicationFormInstance
            }
            '*' { respond applicationFormInstance, [status: CREATED] }
        }
    }

    def saveAndSend(ApplicationForm applicationFormInstance) {
        if (applicationFormInstance == null) {
            notFound()
            return
        }

        if (applicationFormInstance.hasErrors()) {
            respond applicationFormInstance.errors, view:'create'
            return
        }

        User user = authenticatedUser

        applicationFormInstance.createdBy = user
        applicationFormInstance.updatedBy = user
        applicationFormInstance.dateCreated = new Date()
        applicationFormInstance.lastUpdated = new Date()
        applicationFormInstance.status = "New"
        applicationFormInstance.drafts = false

        //  def file1 = request.getFile('corIssuedByBir')//.getInputSTream()
        // // if(file1.empty) {
        // // // if(file1.empty || file2.empty) {
        // //     flash.message = "File cannot be empty"
        // // } else {
        //     applicationFormInstance.corIssuedByBir = file1.originalFilename
        //     def fullPath1 = grailsApplication.config.uploadFolder + applicationFormInstance.corIssuedByBir
        //     file1.transferTo(new File(fullPath1))
            
        
        


        applicationFormInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'applicationForm.label', default: 'ApplicationForm'), applicationFormInstance.id])
                redirect applicationFormInstance
            }
            '*' { respond applicationFormInstance, [status: CREATED] }
        }

        sendMail {
             def recipient = user.email
            to recipient
            // to "janchristian@apollo.com.ph"
            subject "7-Connect Application - Status: New"
            html g.render(template:"acknowledgementEmail")
            // html g.render(template:"mailtemplate",model:[code:userInstance.confirmCode])
        }
    }

    def edit(ApplicationForm applicationFormInstance) {
        respond applicationFormInstance
    }

    

    // @Transactional
    def delete(ApplicationForm applicationFormInstance) {

        if (applicationFormInstance == null) {
            notFound()
            return
        }

        applicationFormInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ApplicationForm.label', default: 'ApplicationForm'), applicationFormInstance.id])
                redirect action:"showDrafts", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'applicationForm.label', default: 'ApplicationForm'), params.id])
                redirect action: "showDrafts", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
