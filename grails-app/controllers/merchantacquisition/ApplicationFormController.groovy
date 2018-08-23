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

    def showApplications(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ApplicationForm.findAllByDraftsAndCreatedByAndStatusNotEqual(false, authenticatedUser, "Withdrawn"), model:[applicationFormInstanceCount: ApplicationForm.count()]

    }

    def show(ApplicationForm applicationFormInstance) {
        respond applicationFormInstance
    }

    def viewSelected(ApplicationForm applicationFormInstance) {
        respond applicationFormInstance
    }

    def viewSelectedApplication(ApplicationForm applicationFormInstance) {
        respond applicationFormInstance
    }

    def merchantAppDetails(ApplicationForm applicationFormInstance) {
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
        def birCorFullPath = request.getFile('birCorFullPath')
        def dtiCertFullPath = request.getFile('dtiCertFullPath')
        def bizPermFullPath = request.getFile('bizPermFullPath')
        def govIdFullPath = request.getFile('govIdFullPath')
        def secCertFullPath = request.getFile('secCertFullPath')
        def gsisFullPath = request.getFile('gsisFullPath')
        def articleFullPath = request.getFile('articleFullPath')
        def byLawFullPath = request.getFile('byLawFullPath')
        def finStateFullPath = request.getFile('finStateFullPath')
         AppFormFiles appFiles = applicationFormInstance.appFormFiles
         def corfilename
         def dtiCertfilename
         def bizPermfilename
         def govIdfilename
         def secCertfilename
         def gsisfilename
         def articlefilename
         def byLawfilename
         def finStatefilename

        if(birCorFullPath == null) {
                appFiles.birCorFullPath = appFiles.birCorFullPath
        } 
       else if(birCorFullPath.empty) {
                appFiles.birCorFullPath = appFiles.birCorFullPath
        } 
         else {
                if (appFiles.id == null) {
                    corfilename = "cor${appFiles.count()+1}_${birCorFullPath.originalFilename}"
                }
                else {corfilename = "cor${appFiles.id}_${birCorFullPath.originalFilename}"
                }
                
                appFiles.birCorFullPath = grailsApplication.config.uploadFolder + corfilename
                birCorFullPath.transferTo(new File(appFiles.birCorFullPath))
        }

        if(dtiCertFullPath == null) {
        appFiles.birCorFullPath = appFiles.birCorFullPath
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

        if(bizPermFullPath == null) {
        appFiles.birCorFullPath = appFiles.birCorFullPath
        } 
        else if(bizPermFullPath.empty) {
                appFiles.bizPermFullPath = appFiles.bizPermFullPath
        } else {
                 if (appFiles.id == null) {
                    bizPermfilename = "bizPerm${appFiles.count()+1}_${bizPermFullPath.originalFilename}"
                }
                else {
                     bizPermfilename = "bizPerm${appFiles.id}_${bizPermFullPath.originalFilename}"
                }
            
            appFiles.bizPermFullPath = grailsApplication.config.uploadFolder + bizPermfilename
            bizPermFullPath.transferTo(new File(appFiles.bizPermFullPath))
            }

        if(govIdFullPath == null) {
        appFiles.birCorFullPath = appFiles.birCorFullPath
        } 
        else if(govIdFullPath.empty) {
                appFiles.govIdFullPath = appFiles.govIdFullPath
        } else {
                 if (appFiles.id == null) {
                    govIdfilename = "govId${appFiles.count()+1}_${govIdFullPath.originalFilename}"
                }
                else {
                     govIdfilename = "govId${appFiles.id}_${govIdFullPath.originalFilename}"
                }
            
            appFiles.govIdFullPath = grailsApplication.config.uploadFolder + govIdfilename
            govIdFullPath.transferTo(new File(appFiles.govIdFullPath))
            }


        if(secCertFullPath == null) {
        appFiles.birCorFullPath = appFiles.birCorFullPath
        } 
        else if(secCertFullPath.empty) {
                appFiles.secCertFullPath = appFiles.secCertFullPath
        } else {
                 if (appFiles.id == null) {
                    secCertfilename = "secCert${appFiles.count()+1}_${secCertFullPath.originalFilename}"
                }
                else {
                     secCertfilename = "secCert${appFiles.id}_${secCertFullPath.originalFilename}"
                }
            
            appFiles.secCertFullPath = grailsApplication.config.uploadFolder + secCertfilename
            secCertFullPath.transferTo(new File(appFiles.secCertFullPath))
            }

        if(gsisFullPath == null) {
        appFiles.birCorFullPath = appFiles.birCorFullPath
        } 
        else if(gsisFullPath.empty) {
                appFiles.gsisFullPath = appFiles.gsisFullPath
        } else {
                 if (appFiles.id == null) {
                    gsisfilename = "gsis${appFiles.count()+1}_${gsisFullPath.originalFilename}"
                }
                else {
                     gsisfilename = "gsis${appFiles.id}_${gsisFullPath.originalFilename}"
                }
            
            appFiles.gsisFullPath = grailsApplication.config.uploadFolder + gsisfilename
            gsisFullPath.transferTo(new File(appFiles.gsisFullPath))
            }
        
        if(articleFullPath == null) {
        appFiles.birCorFullPath = appFiles.birCorFullPath
        } 
        else if(articleFullPath.empty) {
                appFiles.articleFullPath = appFiles.articleFullPath
        } else {
                 if (appFiles.id == null) {
                    articlefilename = "article${appFiles.count()+1}_${articleFullPath.originalFilename}"
                }
                else {
                     articlefilename = "article${appFiles.id}_${articleFullPath.originalFilename}"
                }
            
            appFiles.articleFullPath = grailsApplication.config.uploadFolder + articlefilename
            articleFullPath.transferTo(new File(appFiles.articleFullPath))
            }

        if(byLawFullPath == null) {
        appFiles.birCorFullPath = appFiles.birCorFullPath
        } 
        else if(byLawFullPath.empty) {
                appFiles.byLawFullPath = appFiles.byLawFullPath
        } else {
                 if (appFiles.id == null) {
                    byLawfilename = "byLaw${appFiles.count()+1}_${byLawFullPath.originalFilename}"
                }
                else {
                     byLawfilename = "byLaw${appFiles.id}_${byLawFullPath.originalFilename}"
                }
            
            appFiles.byLawFullPath = grailsApplication.config.uploadFolder + byLawfilename
            byLawFullPath.transferTo(new File(appFiles.byLawFullPath))
            }

        if(finStateFullPath == null) {
        appFiles.birCorFullPath = appFiles.birCorFullPath
        } 
        else if(finStateFullPath.empty) {
                appFiles.finStateFullPath = appFiles.finStateFullPath
        } else {
                 if (appFiles.id == null) {
                    finStatefilename = "finState${appFiles.count()+1}_${finStateFullPath.originalFilename}"
                }
                else {
                     finStatefilename = "finState${appFiles.id}_${finStateFullPath.originalFilename}"
                }
            
            appFiles.finStateFullPath = grailsApplication.config.uploadFolder + finStatefilename
            finStateFullPath.transferTo(new File(appFiles.finStateFullPath))
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
                redirect uri:"/applicationForm/viewSelected/${applicationFormInstance.id}"
            }
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
        def birCorFullPath = request.getFile('birCorFullPath')
        def dtiCertFullPath = request.getFile('dtiCertFullPath')
        def bizPermFullPath = request.getFile('bizPermFullPath')
        def govIdFullPath = request.getFile('govIdFullPath')
        def secCertFullPath = request.getFile('secCertFullPath')
        def gsisFullPath = request.getFile('gsisFullPath')
        def articleFullPath = request.getFile('articleFullPath')
        def byLawFullPath = request.getFile('byLawFullPath')
        def finStateFullPath = request.getFile('finStateFullPath')
         AppFormFiles appFiles = applicationFormInstance.appFormFiles
         def corfilename
         def dtiCertfilename
         def bizPermfilename
         def govIdfilename
         def secCertfilename
         def gsisfilename
         def articlefilename
         def byLawfilename
         def finStatefilename

        if(birCorFullPath == null) {
                appFiles.birCorFullPath = appFiles.birCorFullPath
        } 
       else if(birCorFullPath.empty) {
                appFiles.birCorFullPath = appFiles.birCorFullPath
        } 
         else {
                if (appFiles.id == null) {
                    corfilename = "cor${appFiles.count()+1}_${birCorFullPath.originalFilename}"
                }
                else {corfilename = "cor${appFiles.id}_${birCorFullPath.originalFilename}"
                }
                
                appFiles.birCorFullPath = grailsApplication.config.uploadFolder + corfilename
                birCorFullPath.transferTo(new File(appFiles.birCorFullPath))
        }

        if(dtiCertFullPath == null) {
        appFiles.birCorFullPath = appFiles.birCorFullPath
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

        if(bizPermFullPath == null) {
        appFiles.birCorFullPath = appFiles.birCorFullPath
        } 
        else if(bizPermFullPath.empty) {
                appFiles.bizPermFullPath = appFiles.bizPermFullPath
        } else {
                 if (appFiles.id == null) {
                    bizPermfilename = "bizPerm${appFiles.count()+1}_${bizPermFullPath.originalFilename}"
                }
                else {
                     bizPermfilename = "bizPerm${appFiles.id}_${bizPermFullPath.originalFilename}"
                }
            
            appFiles.bizPermFullPath = grailsApplication.config.uploadFolder + bizPermfilename
            bizPermFullPath.transferTo(new File(appFiles.bizPermFullPath))
            }

        if(govIdFullPath == null) {
        appFiles.birCorFullPath = appFiles.birCorFullPath
        } 
        else if(govIdFullPath.empty) {
                appFiles.govIdFullPath = appFiles.govIdFullPath
        } else {
                 if (appFiles.id == null) {
                    govIdfilename = "govId${appFiles.count()+1}_${govIdFullPath.originalFilename}"
                }
                else {
                     govIdfilename = "govId${appFiles.id}_${govIdFullPath.originalFilename}"
                }
            
            appFiles.govIdFullPath = grailsApplication.config.uploadFolder + govIdfilename
            govIdFullPath.transferTo(new File(appFiles.govIdFullPath))
            }


        if(secCertFullPath == null) {
        appFiles.birCorFullPath = appFiles.birCorFullPath
        } 
        else if(secCertFullPath.empty) {
                appFiles.secCertFullPath = appFiles.secCertFullPath
        } else {
                 if (appFiles.id == null) {
                    secCertfilename = "secCert${appFiles.count()+1}_${secCertFullPath.originalFilename}"
                }
                else {
                     secCertfilename = "secCert${appFiles.id}_${secCertFullPath.originalFilename}"
                }
            
            appFiles.secCertFullPath = grailsApplication.config.uploadFolder + secCertfilename
            secCertFullPath.transferTo(new File(appFiles.secCertFullPath))
            }

        if(gsisFullPath == null) {
        appFiles.birCorFullPath = appFiles.birCorFullPath
        } 
        else if(gsisFullPath.empty) {
                appFiles.gsisFullPath = appFiles.gsisFullPath
        } else {
                 if (appFiles.id == null) {
                    gsisfilename = "gsis${appFiles.count()+1}_${gsisFullPath.originalFilename}"
                }
                else {
                     gsisfilename = "gsis${appFiles.id}_${gsisFullPath.originalFilename}"
                }
            
            appFiles.gsisFullPath = grailsApplication.config.uploadFolder + gsisfilename
            gsisFullPath.transferTo(new File(appFiles.gsisFullPath))
            }
        
        if(articleFullPath == null) {
        appFiles.birCorFullPath = appFiles.birCorFullPath
        } 
        else if(articleFullPath.empty) {
                appFiles.articleFullPath = appFiles.articleFullPath
        } else {
                 if (appFiles.id == null) {
                    articlefilename = "article${appFiles.count()+1}_${articleFullPath.originalFilename}"
                }
                else {
                     articlefilename = "article${appFiles.id}_${articleFullPath.originalFilename}"
                }
            
            appFiles.articleFullPath = grailsApplication.config.uploadFolder + articlefilename
            articleFullPath.transferTo(new File(appFiles.articleFullPath))
            }

        if(byLawFullPath == null) {
        appFiles.birCorFullPath = appFiles.birCorFullPath
        } 
        else if(byLawFullPath.empty) {
                appFiles.byLawFullPath = appFiles.byLawFullPath
        } else {
                 if (appFiles.id == null) {
                    byLawfilename = "byLaw${appFiles.count()+1}_${byLawFullPath.originalFilename}"
                }
                else {
                     byLawfilename = "byLaw${appFiles.id}_${byLawFullPath.originalFilename}"
                }
            
            appFiles.byLawFullPath = grailsApplication.config.uploadFolder + byLawfilename
            byLawFullPath.transferTo(new File(appFiles.byLawFullPath))
            }

        if(finStateFullPath == null) {
        appFiles.birCorFullPath = appFiles.birCorFullPath
        } 
        else if(finStateFullPath.empty) {
                appFiles.finStateFullPath = appFiles.finStateFullPath
        } else {
                 if (appFiles.id == null) {
                    finStatefilename = "finState${appFiles.count()+1}_${finStateFullPath.originalFilename}"
                }
                else {
                     finStatefilename = "finState${appFiles.id}_${finStateFullPath.originalFilename}"
                }
            
            appFiles.finStateFullPath = grailsApplication.config.uploadFolder + finStatefilename
            finStateFullPath.transferTo(new File(appFiles.finStateFullPath))
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
                redirect uri:"/applicationForm/viewSelected/${applicationFormInstance.id}"
            }
        }
    }

    def saveAndSend(ApplicationForm applicationFormInstance) {
        if (applicationFormInstance == null) {
            notFound()
            return
        }

        if (applicationFormInstance.hasErrors()) {
            if (applicationFormInstance.drafts == true) {
                respond applicationFormInstance.errors, view:'edit'
                return
            } else if (applicationFormInstance.drafts == false) {
                 respond applicationFormInstance.errors, view:'editApplication'
                return
            } else {
            respond applicationFormInstance.errors, view:'create'
            return
            }
        }

        //upload files
        def birCorFullPath = request.getFile('birCorFullPath')
        def dtiCertFullPath = request.getFile('dtiCertFullPath')
        def bizPermFullPath = request.getFile('bizPermFullPath')
        def govIdFullPath = request.getFile('govIdFullPath')
        def secCertFullPath = request.getFile('secCertFullPath')
        def gsisFullPath = request.getFile('gsisFullPath')
        def articleFullPath = request.getFile('articleFullPath')
        def byLawFullPath = request.getFile('byLawFullPath')
        def finStateFullPath = request.getFile('finStateFullPath')
         AppFormFiles appFiles = applicationFormInstance.appFormFiles
         def corfilename
         def dtiCertfilename
         def bizPermfilename
         def govIdfilename
         def secCertfilename
         def gsisfilename
         def articlefilename
         def byLawfilename
         def finStatefilename

        if(birCorFullPath == null) {
                appFiles.birCorFullPath = appFiles.birCorFullPath
        } 
       else if(birCorFullPath.empty) {
                appFiles.birCorFullPath = appFiles.birCorFullPath
        } 
         else {
                if (appFiles.id == null) {
                    corfilename = "cor${appFiles.count()+1}_${birCorFullPath.originalFilename}"
                }
                else {corfilename = "cor${appFiles.id}_${birCorFullPath.originalFilename}"
                }
                
                appFiles.birCorFullPath = grailsApplication.config.uploadFolder + corfilename
                birCorFullPath.transferTo(new File(appFiles.birCorFullPath))
        }

        if(dtiCertFullPath == null) {
        appFiles.birCorFullPath = appFiles.birCorFullPath
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

        if(bizPermFullPath == null) {
        appFiles.birCorFullPath = appFiles.birCorFullPath
        } 
        else if(bizPermFullPath.empty) {
                appFiles.bizPermFullPath = appFiles.bizPermFullPath
        } else {
                 if (appFiles.id == null) {
                    bizPermfilename = "bizPerm${appFiles.count()+1}_${bizPermFullPath.originalFilename}"
                }
                else {
                     bizPermfilename = "bizPerm${appFiles.id}_${bizPermFullPath.originalFilename}"
                }
            
            appFiles.bizPermFullPath = grailsApplication.config.uploadFolder + bizPermfilename
            bizPermFullPath.transferTo(new File(appFiles.bizPermFullPath))
            }

        if(govIdFullPath == null) {
        appFiles.birCorFullPath = appFiles.birCorFullPath
        } 
        else if(govIdFullPath.empty) {
                appFiles.govIdFullPath = appFiles.govIdFullPath
        } else {
                 if (appFiles.id == null) {
                    govIdfilename = "govId${appFiles.count()+1}_${govIdFullPath.originalFilename}"
                }
                else {
                     govIdfilename = "govId${appFiles.id}_${govIdFullPath.originalFilename}"
                }
            
            appFiles.govIdFullPath = grailsApplication.config.uploadFolder + govIdfilename
            govIdFullPath.transferTo(new File(appFiles.govIdFullPath))
            }


        if(secCertFullPath == null) {
        appFiles.birCorFullPath = appFiles.birCorFullPath
        } 
        else if(secCertFullPath.empty) {
                appFiles.secCertFullPath = appFiles.secCertFullPath
        } else {
                 if (appFiles.id == null) {
                    secCertfilename = "secCert${appFiles.count()+1}_${secCertFullPath.originalFilename}"
                }
                else {
                     secCertfilename = "secCert${appFiles.id}_${secCertFullPath.originalFilename}"
                }
            
            appFiles.secCertFullPath = grailsApplication.config.uploadFolder + secCertfilename
            secCertFullPath.transferTo(new File(appFiles.secCertFullPath))
            }

        if(gsisFullPath == null) {
        appFiles.birCorFullPath = appFiles.birCorFullPath
        } 
        else if(gsisFullPath.empty) {
                appFiles.gsisFullPath = appFiles.gsisFullPath
        } else {
                 if (appFiles.id == null) {
                    gsisfilename = "gsis${appFiles.count()+1}_${gsisFullPath.originalFilename}"
                }
                else {
                     gsisfilename = "gsis${appFiles.id}_${gsisFullPath.originalFilename}"
                }
            
            appFiles.gsisFullPath = grailsApplication.config.uploadFolder + gsisfilename
            gsisFullPath.transferTo(new File(appFiles.gsisFullPath))
            }
        
        if(articleFullPath == null) {
        appFiles.birCorFullPath = appFiles.birCorFullPath
        } 
        else if(articleFullPath.empty) {
                appFiles.articleFullPath = appFiles.articleFullPath
        } else {
                 if (appFiles.id == null) {
                    articlefilename = "article${appFiles.count()+1}_${articleFullPath.originalFilename}"
                }
                else {
                     articlefilename = "article${appFiles.id}_${articleFullPath.originalFilename}"
                }
            
            appFiles.articleFullPath = grailsApplication.config.uploadFolder + articlefilename
            articleFullPath.transferTo(new File(appFiles.articleFullPath))
            }

        if(byLawFullPath == null) {
        appFiles.birCorFullPath = appFiles.birCorFullPath
        } 
        else if(byLawFullPath.empty) {
                appFiles.byLawFullPath = appFiles.byLawFullPath
        } else {
                 if (appFiles.id == null) {
                    byLawfilename = "byLaw${appFiles.count()+1}_${byLawFullPath.originalFilename}"
                }
                else {
                     byLawfilename = "byLaw${appFiles.id}_${byLawFullPath.originalFilename}"
                }
            
            appFiles.byLawFullPath = grailsApplication.config.uploadFolder + byLawfilename
            byLawFullPath.transferTo(new File(appFiles.byLawFullPath))
            }

        if(finStateFullPath == null) {
        appFiles.birCorFullPath = appFiles.birCorFullPath
        } 
        else if(finStateFullPath.empty) {
                appFiles.finStateFullPath = appFiles.finStateFullPath
        } else {
                 if (appFiles.id == null) {
                    finStatefilename = "finState${appFiles.count()+1}_${finStateFullPath.originalFilename}"
                }
                else {
                     finStatefilename = "finState${appFiles.id}_${finStateFullPath.originalFilename}"
                }
            
            appFiles.finStateFullPath = grailsApplication.config.uploadFolder + finStatefilename
            finStateFullPath.transferTo(new File(appFiles.finStateFullPath))
            }
            
           appFiles.save()
        //end upload

        User user = authenticatedUser
        applicationFormInstance.createdBy = user
        applicationFormInstance.updatedBy = user
        
        applicationFormInstance.lastUpdated = new Date()
        applicationFormInstance.dateApplied = new Date()
        applicationFormInstance.drafts = false

        if (applicationFormInstance.status == "Declined") {
            applicationFormInstance.status = "Resubmitted"
        }
        else {
        applicationFormInstance.status = "New"
        }

        if (applicationFormInstance.dateCreated == null) {
            applicationFormInstance.dateCreated = new Date()
        } else {applicationFormInstance.dateCreated = applicationFormInstance.dateCreated}

        if (applicationFormInstance.createdBy == null) {
            applicationFormInstance.createdBy = user
        } else {applicationFormInstance.createdBy = applicationFormInstance.createdBy}

        applicationFormInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = "Application has been submitted for review. Kindly check your email for more details."
                redirect applicationFormInstance
            }
        }

        sendMail {
             def recipient = user.email
            to recipient
            subject "7-Connect Application - Status: ${applicationFormInstance.status}"
            html g.render(template:"acknowledgementEmail")
        }

        sendMail {
             def recipient = "janjanoracion18@gmail.com" //admin's email
            to recipient
            subject "7-Connect Application For Review - ${user.username} - Status: ${applicationFormInstance.status}"
            html g.render(template:"newApplicationEmail", model:[user:user.username, id:applicationFormInstance.id])
        }
    }

    def edit(ApplicationForm applicationFormInstance) {
        respond applicationFormInstance
    }

    def editApplication(ApplicationForm applicationFormInstance) {
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
        }
    }

    def withdraw(ApplicationForm applicationFormInstance) {
        if (applicationFormInstance == null) {
            notFound()
            return
        }

        if (applicationFormInstance.hasErrors()) {
            respond applicationFormInstance.errors, view:'create'
            return
        }


        User user = authenticatedUser
        applicationFormInstance.updatedBy = user
        applicationFormInstance.lastUpdated = new Date()
        applicationFormInstance.status = "Withdrawn"
        applicationFormInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = "Your Application has been withdrawn!"
                redirect applicationFormInstance
            }
        }

        sendMail {
             def recipient = "janjanoracion18@gmail.com"
            to recipient
            subject "7-Connect Application Withdrawn - ${user.username}"
            html g.render(template:"applicationWithdrawnEmail", model:[user:user.username, id:applicationFormInstance.id, remarks:applicationFormInstance.remarks])
        }
    }

    def inReview(ApplicationForm applicationFormInstance) {
        if (applicationFormInstance == null) {
            notFound()
            return
        }

        if (applicationFormInstance.hasErrors()) {
            respond applicationFormInstance.errors, view:'merchantAppDetails'
            return
        }


        User user = authenticatedUser
        applicationFormInstance.updatedBy = user
        applicationFormInstance.lastUpdated = new Date()
        applicationFormInstance.status = "In-Review"
        applicationFormInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = "Application is now In-Review!"
                redirect uri:"/applicationForm/merchantAppDetails/${applicationFormInstance.id}"
            }
        }

    }

    def onHold(ApplicationForm applicationFormInstance) {
        if (applicationFormInstance == null) {
            notFound()
            return
        }

        if (applicationFormInstance.hasErrors()) {
            respond applicationFormInstance.errors, view:'merchantAppDetails'
            return
        }

        User merchant = applicationFormInstance.createdBy
        User admin = authenticatedUser
        applicationFormInstance.updatedBy = admin
        applicationFormInstance.lastUpdated = new Date()
        applicationFormInstance.status = "On-hold"
        applicationFormInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = "Application has been put on-hold!"
                redirect uri:"/applicationForm/merchantAppDetails/${applicationFormInstance.id}"
            }
        }

        sendMail {
             def recipient = merchant.email
            to recipient
            subject "7-Connect Application - Status: On-hold"
            html g.render(template:"applicationOnHoldEmail", model:[remarks:applicationFormInstance.remarks])
        }
    }

    def forApproval(ApplicationForm applicationFormInstance) {
        if (applicationFormInstance == null) {
            notFound()
            return
        }

        if (applicationFormInstance.hasErrors()) {
            respond applicationFormInstance.errors, view:'merchantAppDetails'
            return
        }

        User merchant = applicationFormInstance.createdBy
        User admin = authenticatedUser
        applicationFormInstance.updatedBy = admin
        applicationFormInstance.lastUpdated = new Date()
        applicationFormInstance.status = "For Approval"
        applicationFormInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = "Application has been reviewed and is now ready for approval"
                redirect uri:"/applicationForm/merchantAppDetails/${applicationFormInstance.id}"
            }
        }

        sendMail {
             def recipient = "janchristian.apollo.com.ph@gmail.com" //manager's email
            to recipient
            subject "7-Connect Application For Approval - ${merchant.username}"
            html g.render(template:"applicationForApprovalEmail", model:[user:merchant.username, id:applicationFormInstance.id] )
        }
    }


    def declined(ApplicationForm applicationFormInstance) {
        if (applicationFormInstance == null) {
            notFound()
            return
        }

        if (applicationFormInstance.hasErrors()) {
            respond applicationFormInstance.errors, view:'merchantAppDetails'
            return
        }

        User merchant = applicationFormInstance.createdBy
        User admin = authenticatedUser
        applicationFormInstance.updatedBy = admin
        applicationFormInstance.lastUpdated = new Date()
        applicationFormInstance.status = "Declined"
        applicationFormInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = "Application has been Declined"
                redirect uri:"/applicationForm/merchantAppDetails/${applicationFormInstance.id}"
            }
        }

        sendMail {
             def recipient = merchant.email
            to recipient
            cc admin.email
            subject "7-Connect Application - Status: Declined"
            html g.render(template:"applicationDeclinedEmail", model:[remarks:applicationFormInstance.remarks])
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

    



    def downloadcor(ApplicationForm applicationFormInstance) {

        if ( applicationFormInstance.appFormFiles == null) {
            notFound()
            return
        } else {
            response.setContentType("APPLICATION/OCTET-STREAM")
            def filename = ("${applicationFormInstance.appFormFiles.birCorFullPath - grailsApplication.config.uploadFolder}")
            response.setHeader("Content-Disposition", "Attachment;Filename=\"${filename}\"")
            def file = new File(applicationFormInstance.appFormFiles.birCorFullPath)
            def fileInputStream = new FileInputStream(file)
            def outputStream = response.getOutputStream()
            byte[] buffer = new byte[4096];
            int len;
            while ((len = fileInputStream.read(buffer)) > 0) {
                outputStream.write(buffer, 0, len);
            }
            outputStream.flush()
            outputStream.close()
            fileInputStream.close()

        }
    }


    def downloaddtiCert(ApplicationForm applicationFormInstance) {

        if ( applicationFormInstance.appFormFiles == null) {
            notFound()
            return
        } else {
            response.setContentType("APPLICATION/OCTET-STREAM")
            def filename = ("${applicationFormInstance.appFormFiles.dtiCertFullPath - grailsApplication.config.uploadFolder}")
            response.setHeader("Content-Disposition", "Attachment;Filename=\"${filename}\"")
            def file = new File(applicationFormInstance.appFormFiles.dtiCertFullPath)
            def fileInputStream = new FileInputStream(file)
            def outputStream = response.getOutputStream()
            byte[] buffer = new byte[4096];
            int len;
            while ((len = fileInputStream.read(buffer)) > 0) {
                outputStream.write(buffer, 0, len);
            }
            outputStream.flush()
            outputStream.close()
            fileInputStream.close()

        }
    }

     def downloadbizPerm(ApplicationForm applicationFormInstance) {

        if ( applicationFormInstance.appFormFiles == null) {
            notFound()
            return
        } else {
            response.setContentType("APPLICATION/OCTET-STREAM")
            def filename = ("${applicationFormInstance.appFormFiles.bizPermFullPath - grailsApplication.config.uploadFolder}")
            response.setHeader("Content-Disposition", "Attachment;Filename=\"${filename}\"")
            def file = new File(applicationFormInstance.appFormFiles.bizPermFullPath)
            def fileInputStream = new FileInputStream(file)
            def outputStream = response.getOutputStream()
            byte[] buffer = new byte[4096];
            int len;
            while ((len = fileInputStream.read(buffer)) > 0) {
                outputStream.write(buffer, 0, len);
            }
            outputStream.flush()
            outputStream.close()
            fileInputStream.close()

        }
    }

     def downloadgovId(ApplicationForm applicationFormInstance) {

        if ( applicationFormInstance.appFormFiles == null) {
            notFound()
            return
        } else {
            response.setContentType("APPLICATION/OCTET-STREAM")
            def filename = ("${applicationFormInstance.appFormFiles.govIdFullPath - grailsApplication.config.uploadFolder}")
            response.setHeader("Content-Disposition", "Attachment;Filename=\"${filename}\"")
            def file = new File(applicationFormInstance.appFormFiles.govIdFullPath)
            def fileInputStream = new FileInputStream(file)
            def outputStream = response.getOutputStream()
            byte[] buffer = new byte[4096];
            int len;
            while ((len = fileInputStream.read(buffer)) > 0) {
                outputStream.write(buffer, 0, len);
            }
            outputStream.flush()
            outputStream.close()
            fileInputStream.close()

        }
    }

    def downloadsecCert(ApplicationForm applicationFormInstance) {

        if ( applicationFormInstance.appFormFiles == null) {
            notFound()
            return
        } else {
            response.setContentType("APPLICATION/OCTET-STREAM")
            def filename = ("${applicationFormInstance.appFormFiles.secCertFullPath - grailsApplication.config.uploadFolder}")
            response.setHeader("Content-Disposition", "Attachment;Filename=\"${filename}\"")
            def file = new File(applicationFormInstance.appFormFiles.secCertFullPath)
            def fileInputStream = new FileInputStream(file)
            def outputStream = response.getOutputStream()
            byte[] buffer = new byte[4096];
            int len;
            while ((len = fileInputStream.read(buffer)) > 0) {
                outputStream.write(buffer, 0, len);
            }
            outputStream.flush()
            outputStream.close()
            fileInputStream.close()

        }
    }

    def downloadgsis(ApplicationForm applicationFormInstance) {

        if ( applicationFormInstance.appFormFiles == null) {
            notFound()
            return
        } else {
            response.setContentType("APPLICATION/OCTET-STREAM")
            def filename = ("${applicationFormInstance.appFormFiles.gsisFullPath - grailsApplication.config.uploadFolder}")
            response.setHeader("Content-Disposition", "Attachment;Filename=\"${filename}\"")
            def file = new File(applicationFormInstance.appFormFiles.gsisFullPath)
            def fileInputStream = new FileInputStream(file)
            def outputStream = response.getOutputStream()
            byte[] buffer = new byte[4096];
            int len;
            while ((len = fileInputStream.read(buffer)) > 0) {
                outputStream.write(buffer, 0, len);
            }
            outputStream.flush()
            outputStream.close()
            fileInputStream.close()

        }
    }

    def downloadarticle(ApplicationForm applicationFormInstance) {

        if ( applicationFormInstance.appFormFiles == null) {
            notFound()
            return
        } else {
            response.setContentType("APPLICATION/OCTET-STREAM")
            def filename = ("${applicationFormInstance.appFormFiles.articleFullPath - grailsApplication.config.uploadFolder}")
            response.setHeader("Content-Disposition", "Attachment;Filename=\"${filename}\"")
            def file = new File(applicationFormInstance.appFormFiles.articleFullPath)
            def fileInputStream = new FileInputStream(file)
            def outputStream = response.getOutputStream()
            byte[] buffer = new byte[4096];
            int len;
            while ((len = fileInputStream.read(buffer)) > 0) {
                outputStream.write(buffer, 0, len);
            }
            outputStream.flush()
            outputStream.close()
            fileInputStream.close()

        }
    }

    def downloadbyLaw(ApplicationForm applicationFormInstance) {

        if ( applicationFormInstance.appFormFiles == null) {
            notFound()
            return
        } else {
            response.setContentType("APPLICATION/OCTET-STREAM")
            def filename = ("${applicationFormInstance.appFormFiles.byLawFullPath - grailsApplication.config.uploadFolder}")
            response.setHeader("Content-Disposition", "Attachment;Filename=\"${filename}\"")
            def file = new File(applicationFormInstance.appFormFiles.byLawFullPath)
            def fileInputStream = new FileInputStream(file)
            def outputStream = response.getOutputStream()
            byte[] buffer = new byte[4096];
            int len;
            while ((len = fileInputStream.read(buffer)) > 0) {
                outputStream.write(buffer, 0, len);
            }
            outputStream.flush()
            outputStream.close()
            fileInputStream.close()

        }
    }

    def downloadfinState(ApplicationForm applicationFormInstance) {

        if ( applicationFormInstance.appFormFiles == null) {
            notFound()
            return
        } else {
            response.setContentType("APPLICATION/OCTET-STREAM")
            def filename = ("${applicationFormInstance.appFormFiles.finStateFullPath - grailsApplication.config.uploadFolder}")
            response.setHeader("Content-Disposition", "Attachment;Filename=\"${filename}\"")
            def file = new File(applicationFormInstance.appFormFiles.finStateFullPath)
            def fileInputStream = new FileInputStream(file)
            def outputStream = response.getOutputStream()
            byte[] buffer = new byte[4096];
            int len;
            while ((len = fileInputStream.read(buffer)) > 0) {
                outputStream.write(buffer, 0, len);
            }
            outputStream.flush()
            outputStream.close()
            fileInputStream.close()

        }
    }


}
