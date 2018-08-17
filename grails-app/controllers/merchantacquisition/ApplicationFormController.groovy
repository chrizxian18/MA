package merchantacquisition

import MerchantAcquisition.User

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
@Transactional(readOnly = false)
@Secured(['IS_AUTHENTICATED_FULLY'])
class ApplicationFormController {
    // def applicationFormService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def showDrafts(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ApplicationForm.findAllByDraftsAndCreatedBy(true, authenticatedUser), model:[applicationFormInstanceCount: ApplicationForm.count()]

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


    @Transactional
    def updateDrafts(ApplicationForm applicationFormInstance) {

        if (applicationFormInstance == null) {
            notFound()
            return
        }

        if (applicationFormInstance.hasErrors()) {
            respond applicationFormInstance.errors, view:'edit'
            return
        }
         //upload files
        def corFullPath = request.getFile('corFullPath')
        def dtiCertFullPath = request.getFile('dtiCertFullPath')
         AppFormFiles appFiles = applicationFormInstance.appFormFiles
         def corfilename
         def dtiCertfilename
        if(corFullPath == null) {
                appFiles.corFullPath = appFiles.corFullPath
        } 
       else if(corFullPath.empty) {
                appFiles.corFullPath = appFiles.corFullPath
        } 
         else {
                if (appFiles.id == null) {
                    corfilename = "cor${appFiles.count()+1}_${corFullPath.originalFilename}"
                }
                else {corfilename = "cor${appFiles.id}_${corFullPath.originalFilename}"
                }
                
                appFiles.corFullPath = grailsApplication.config.uploadFolder + corfilename
                corFullPath.transferTo(new File(appFiles.corFullPath))
        }

        if(dtiCertFullPath == null) {
        appFiles.corFullPath = appFiles.corFullPath
        } 
        else if(dtiCertFullPath.empty) {
                appFiles.dtiCertFullPath = appFiles.dtiCertFullPath
        } else {
                 if (appFiles.id == null) {
                    dtiCertfilename = "dtiCert${appFiles.count()+1}_${dtiCertFullPath.originalFilename}"
                }
                else {
                     dtiCertfilename = "dtiCert${appFiles.id}_${dtiCertFullPath.originalFilename}"
                }
            
            appFiles.dtiCertFullPath = grailsApplication.config.uploadFolder + dtiCertfilename
            dtiCertFullPath.transferTo(new File(appFiles.dtiCertFullPath))

            }
           appFiles.save()
        //end upload
        User user = authenticatedUser
        applicationFormInstance.updatedBy = user
        applicationFormInstance.lastUpdated = new Date()
        applicationFormInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = "Application has been updated, Saved to Drafts. To submit application, click on Submit button"
                // redirect applicationFormInstance
                redirect uri:"/applicationForm/viewSelected/${applicationFormInstance.id}"
                // redirect(controller:'applicationForm', action: 'showDrafts') 
            }
            // '*'{ respond applicationFormInstance, [status: OK] }
        }
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

        //upload files
        def corFullPath = request.getFile('corFullPath')
        def dtiCertFullPath = request.getFile('dtiCertFullPath')
         AppFormFiles appFiles = applicationFormInstance.appFormFiles
         def corfilename
         def dtiCertfilename
        if(corFullPath == null) {
                appFiles.corFullPath = appFiles.corFullPath
        } 
       else if(corFullPath.empty) {
                appFiles.corFullPath = appFiles.corFullPath
        } 
         else {
                if (appFiles.id == null) {
                    corfilename = "cor${appFiles.count()+1}_${corFullPath.originalFilename}"
                }
                else {corfilename = "cor${appFiles.id}_${corFullPath.originalFilename}"
                }
                
                appFiles.corFullPath = grailsApplication.config.uploadFolder + corfilename
                corFullPath.transferTo(new File(appFiles.corFullPath))
        }

        if(dtiCertFullPath == null) {
        appFiles.corFullPath = appFiles.corFullPath
        } 
        else if(dtiCertFullPath.empty) {
                appFiles.dtiCertFullPath = appFiles.dtiCertFullPath
        } else {
                 if (appFiles.id == null) {
                    dtiCertfilename = "dtiCert${appFiles.count()+1}_${dtiCertFullPath.originalFilename}"
                }
                else {
                     dtiCertfilename = "dtiCert${appFiles.id}_${dtiCertFullPath.originalFilename}"
                }
            
            appFiles.dtiCertFullPath = grailsApplication.config.uploadFolder + dtiCertfilename
            dtiCertFullPath.transferTo(new File(appFiles.dtiCertFullPath))

            }
           appFiles.save()
        //end upload


        User user = authenticatedUser
        applicationFormInstance.createdBy = user
        applicationFormInstance.updatedBy = user
        applicationFormInstance.dateCreated = new Date()
        applicationFormInstance.lastUpdated = new Date()
        applicationFormInstance.status = "None"
        applicationFormInstance.drafts = true

        applicationFormInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = "Application has been successfully saved as draft. To submit application, click on Submit button"
                // flash.message = message(code: 'default.created.message', args: [message(code: 'applicationForm.label', default: 'ApplicationForm'), applicationFormInstance.id])
                // redirect applicationFormInstance
                redirect uri:"/applicationForm/viewSelected/${applicationFormInstance.id}"
            }
            // '*' { respond applicationFormInstance, [status: CREATED] }
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

        //upload files
        def corFullPath = request.getFile('corFullPath')
        def dtiCertFullPath = request.getFile('dtiCertFullPath')
         AppFormFiles appFiles = applicationFormInstance.appFormFiles
         def corfilename
         def dtiCertfilename
        if(corFullPath == null) {
                appFiles.corFullPath = appFiles.corFullPath
        } 
       else if(corFullPath.empty) {
                appFiles.corFullPath = appFiles.corFullPath
        } 
         else {
                if (appFiles.id == null) {
                    corfilename = "cor${appFiles.count()+1}_${corFullPath.originalFilename}"
                }
                else {corfilename = "cor${appFiles.id}_${corFullPath.originalFilename}"
                }
                
                appFiles.corFullPath = grailsApplication.config.uploadFolder + corfilename
                corFullPath.transferTo(new File(appFiles.corFullPath))
        }

        if(dtiCertFullPath == null) {
        appFiles.corFullPath = appFiles.corFullPath
        } 
        else if(dtiCertFullPath.empty) {
                appFiles.dtiCertFullPath = appFiles.dtiCertFullPath
        } else {
                 if (appFiles.id == null) {
                    dtiCertfilename = "dtiCert${appFiles.count()+1}_${dtiCertFullPath.originalFilename}"
                }
                else {
                     dtiCertfilename = "dtiCert${appFiles.id}_${dtiCertFullPath.originalFilename}"
                }
            
            appFiles.dtiCertFullPath = grailsApplication.config.uploadFolder + dtiCertfilename
            dtiCertFullPath.transferTo(new File(appFiles.dtiCertFullPath))

            }
           appFiles.save()
        //end upload

        User user = authenticatedUser
        applicationFormInstance.createdBy = user
        applicationFormInstance.updatedBy = user
        
        applicationFormInstance.lastUpdated = new Date()
        applicationFormInstance.status = "New"
        applicationFormInstance.drafts = false

        if (applicationFormInstance.dateCreated == null) {
            applicationFormInstance.dateCreated = new Date()
        } else {applicationFormInstance.dateCreated = applicationFormInstance.dateCreated}

        if (applicationFormInstance.createdBy == null) {
            applicationFormInstance.createdBy = user
        } else {applicationFormInstance.createdBy = applicationFormInstance.createdBy}

        applicationFormInstance.save flush:true

        request.withFormat {
            form multipartForm {
                // flash.message = message(code: 'default.created.message', args: [message(code: 'applicationForm.label', default: 'ApplicationForm'), applicationFormInstance.id])
                flash.message = "Application has been submitted for review. Kindly check your email for more details."
                redirect applicationFormInstance
            }
            // '*' { respond applicationFormInstance, [status: CREATED] }
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
                flash.message = "Application has been deleted"
                redirect action:"showDrafts", method:"GET"
            }
            // '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'applicationForm.label', default: 'ApplicationForm'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    



    // def download(ApplicationForm applicationFormInstance) {

    //     if ( applicationFormInstance.appFormFiles == null) {
    //         notFound()
    //         return
    //     } else {
    //         response.setContentType("APPLICATION/OCTET-STREAM")
    //         def filename = ("${applicationFormInstance.appFormFiles.corFullPath - grailsApplication.config.uploadFolder}")
    //         response.setHeader("Content-Disposition", "Attachment;Filename=\"${filename}\"")
    //         def file = new File(applicationFormInstance.appFormFiles.corFullPath)
    //         def fileInputStream = new FileInputStream(file)
    //         def outputStream = response.getOutputStream()
    //         byte[] buffer = new byte[4096];
    //         int len;
    //         while ((len = fileInputStream.read(buffer)) > 0) {
    //             outputStream.write(buffer, 0, len);
    //         }
    //         outputStream.flush()
    //         outputStream.close()
    //         fileInputStream.close()

    //     }
    // }
}
