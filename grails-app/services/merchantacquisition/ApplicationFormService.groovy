package merchantacquisition

import grails.transaction.Transactional

@Transactional
class ApplicationFormService {

    def serviceMethod() {

    }


   def uploadFiles(uploadFolder, applicationFormInstance, birCorFullPath, dtiCertFullPath, bizPermFullPath, govIdFullPath, secCertFullPath, gisFullPath, articleFullPath, byLawFullPath, finStateFullPath) {
        
         AppFormFiles appFiles = applicationFormInstance.appFormFiles
         def corfilename
         def dtiCertfilename
         def bizPermfilename
         def govIdfilename
         def secCertfilename
         def gisfilename
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
                if (appFiles.id == null || appFiles.birCorFullPath == null) {
                    corfilename = "${applicationFormInstance.merchantName}-cor${appFiles.count()+1}_${birCorFullPath.originalFilename}"
                }
                else {corfilename = "${applicationFormInstance.merchantName}-cor${appFiles.id}_${birCorFullPath.originalFilename}"
                def path = new File(appFiles.birCorFullPath)
                path.delete()

                }
                
                appFiles.birCorFullPath = uploadFolder + corfilename
                birCorFullPath.transferTo(new File(appFiles.birCorFullPath))
        }

        if(dtiCertFullPath == null) {
        appFiles.dtiCertFullPath = appFiles.dtiCertFullPath
        } 
        else if(dtiCertFullPath.empty) {
                appFiles.dtiCertFullPath = appFiles.dtiCertFullPath
        } else {
                 if (appFiles.id == null || appFiles.dtiCertFullPath == null) {
                    dtiCertfilename = "${applicationFormInstance.merchantName}-dtiCert${appFiles.count()+1}_${dtiCertFullPath.originalFilename}"
                }
                else {
                     dtiCertfilename = "${applicationFormInstance.merchantName}-dtiCert${appFiles.id}_${dtiCertFullPath.originalFilename}"
                     def path = new File(appFiles.dtiCertFullPath)
                     path.delete()
                }
            
            appFiles.dtiCertFullPath = uploadFolder + dtiCertfilename
            dtiCertFullPath.transferTo(new File(appFiles.dtiCertFullPath))
        }

        if(bizPermFullPath == null) {
        appFiles.bizPermFullPath = appFiles.bizPermFullPath
        } 
        else if(bizPermFullPath.empty) {
                appFiles.bizPermFullPath = appFiles.bizPermFullPath
        } else {
                 if (appFiles.id == null || appFiles.bizPermFullPath == null) {
                    bizPermfilename = "${applicationFormInstance.merchantName}-bizPerm${appFiles.count()+1}_${bizPermFullPath.originalFilename}"
                }
                else {
                     bizPermfilename = "${applicationFormInstance.merchantName}-bizPerm${appFiles.id}_${bizPermFullPath.originalFilename}"
                     def path = new File(appFiles.bizPermFullPath)
                     path.delete()
                }
            
            appFiles.bizPermFullPath = uploadFolder + bizPermfilename
            bizPermFullPath.transferTo(new File(appFiles.bizPermFullPath))
        }

        if(govIdFullPath == null) {
        appFiles.govIdFullPath = appFiles.govIdFullPath
        } 
        else if(govIdFullPath.empty) {
                appFiles.govIdFullPath = appFiles.govIdFullPath
        } else {
                 if (appFiles.id == null || appFiles.govIdFullPath == null) {
                    govIdfilename = "${applicationFormInstance.merchantName}-govId${appFiles.count()+1}_${govIdFullPath.originalFilename}"
                }
                else {
                     govIdfilename = "${applicationFormInstance.merchantName}-govId${appFiles.id}_${govIdFullPath.originalFilename}"
                     def path = new File(appFiles.govIdFullPath)
                     path.delete()                     
                }
            
            appFiles.govIdFullPath = uploadFolder + govIdfilename
            govIdFullPath.transferTo(new File(appFiles.govIdFullPath))
        }


        if(secCertFullPath == null) {
        appFiles.secCertFullPath = appFiles.secCertFullPath
        } 
        else if(secCertFullPath.empty) {
                appFiles.secCertFullPath = appFiles.secCertFullPath
        } else {
                 if (appFiles.id == null || appFiles.secCertFullPath == null) {
                    secCertfilename = "${applicationFormInstance.merchantName}-secCert${appFiles.count()+1}_${secCertFullPath.originalFilename}"
                }
                else {
                     secCertfilename = "${applicationFormInstance.merchantName}-secCert${appFiles.id}_${secCertFullPath.originalFilename}"
                     def path = new File(appFiles.secCertFullPath)
                     path.delete() 
                }
            
            appFiles.secCertFullPath = uploadFolder + secCertfilename
            secCertFullPath.transferTo(new File(appFiles.secCertFullPath))
            }

        if(gisFullPath == null) {
        appFiles.gisFullPath = appFiles.gisFullPath
        } 
        else if(gisFullPath.empty) {
                appFiles.gisFullPath = appFiles.gisFullPath
        } else {
                 if (appFiles.id == null || appFiles.gisFullPath == null) {
                    gisfilename = "${applicationFormInstance.merchantName}-gis${appFiles.count()+1}_${gisFullPath.originalFilename}"
                }
                else {
                     gisfilename = "${applicationFormInstance.merchantName}-gis${appFiles.id}_${gisFullPath.originalFilename}"
                     def path = new File(appFiles.gisFullPath)
                     path.delete()
                }
            
            appFiles.gisFullPath = uploadFolder + gisfilename
            gisFullPath.transferTo(new File(appFiles.gisFullPath))
            }
        
        if(articleFullPath == null) {
        appFiles.articleFullPath = appFiles.articleFullPath
        } 
        else if(articleFullPath.empty) {
                appFiles.articleFullPath = appFiles.articleFullPath
        } else {
                 if (appFiles.id == null || appFiles.articleFullPath == null) {
                    articlefilename = "${applicationFormInstance.merchantName}-article${appFiles.count()+1}_${articleFullPath.originalFilename}"
                }
                else {
                     articlefilename = "${applicationFormInstance.merchantName}-article${appFiles.id}_${articleFullPath.originalFilename}"
                     def path = new File(appFiles.articleFullPath)
                     path.delete()
                }
            
            appFiles.articleFullPath = uploadFolder + articlefilename
            articleFullPath.transferTo(new File(appFiles.articleFullPath))
        }

        if(byLawFullPath == null) {
        appFiles.byLawFullPath = appFiles.byLawFullPath
        } 
        else if(byLawFullPath.empty) {
                appFiles.byLawFullPath = appFiles.byLawFullPath
        } else {
                 if (appFiles.id == null || appFiles.byLawFullPath == null) {
                    byLawfilename = "${applicationFormInstance.merchantName}-byLaw${appFiles.count()+1}_${byLawFullPath.originalFilename}"
                }
                else {
                     byLawfilename = "${applicationFormInstance.merchantName}-byLaw${appFiles.id}_${byLawFullPath.originalFilename}"
                     def path = new File(appFiles.byLawFullPath)
                     path.delete()
                }
            
            appFiles.byLawFullPath = uploadFolder + byLawfilename
            byLawFullPath.transferTo(new File(appFiles.byLawFullPath))
        }

        if(finStateFullPath == null) {
        appFiles.finStateFullPath = appFiles.finStateFullPath
        } 
        else if(finStateFullPath.empty) {
                appFiles.finStateFullPath = appFiles.finStateFullPath
        } else {
                 if (appFiles.id == null || appFiles.finStateFullPath == null) {
                    finStatefilename = "${applicationFormInstance.merchantName}-finState${appFiles.count()+1}_${finStateFullPath.originalFilename}"
                }
                else {
                     finStatefilename = "${applicationFormInstance.merchantName}-finState${appFiles.id}_${finStateFullPath.originalFilename}"
                     def path = new File(appFiles.finStateFullPath)
                     path.delete()
                }
            
            appFiles.finStateFullPath = uploadFolder + finStatefilename
            finStateFullPath.transferTo(new File(appFiles.finStateFullPath))
        }
            
       appFiles.save()
    }
}
