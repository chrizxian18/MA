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
                if (appFiles.id == null) {
                    corfilename = "${applicationFormInstance.merchantName}-cor${appFiles.count()+1}_${birCorFullPath.originalFilename}"
                }
                else {corfilename = "${applicationFormInstance.merchantName}-cor${appFiles.id}_${birCorFullPath.originalFilename}"
                }
                
                appFiles.birCorFullPath = uploadFolder + corfilename
                birCorFullPath.transferTo(new File(appFiles.birCorFullPath))
        }

        if(dtiCertFullPath == null) {
        appFiles.birCorFullPath = appFiles.birCorFullPath
        } 
        else if(dtiCertFullPath.empty) {
                appFiles.dtiCertFullPath = appFiles.dtiCertFullPath
        } else {
                 if (appFiles.id == null) {
                    dtiCertfilename = "${applicationFormInstance.merchantName}-dtiCert${appFiles.count()+1}_${dtiCertFullPath.originalFilename}"
                }
                else {
                     dtiCertfilename = "${applicationFormInstance.merchantName}-dtiCert${appFiles.id}_${dtiCertFullPath.originalFilename}"
                }
            
            appFiles.dtiCertFullPath = uploadFolder + dtiCertfilename
            dtiCertFullPath.transferTo(new File(appFiles.dtiCertFullPath))
        }

        if(bizPermFullPath == null) {
        appFiles.birCorFullPath = appFiles.birCorFullPath
        } 
        else if(bizPermFullPath.empty) {
                appFiles.bizPermFullPath = appFiles.bizPermFullPath
        } else {
                 if (appFiles.id == null) {
                    bizPermfilename = "${applicationFormInstance.merchantName}-bizPerm${appFiles.count()+1}_${bizPermFullPath.originalFilename}"
                }
                else {
                     bizPermfilename = "${applicationFormInstance.merchantName}-bizPerm${appFiles.id}_${bizPermFullPath.originalFilename}"
                }
            
            appFiles.bizPermFullPath = uploadFolder + bizPermfilename
            bizPermFullPath.transferTo(new File(appFiles.bizPermFullPath))
        }

        if(govIdFullPath == null) {
        appFiles.birCorFullPath = appFiles.birCorFullPath
        } 
        else if(govIdFullPath.empty) {
                appFiles.govIdFullPath = appFiles.govIdFullPath
        } else {
                 if (appFiles.id == null) {
                    govIdfilename = "${applicationFormInstance.merchantName}-govId${appFiles.count()+1}_${govIdFullPath.originalFilename}"
                }
                else {
                     govIdfilename = "${applicationFormInstance.merchantName}-govId${appFiles.id}_${govIdFullPath.originalFilename}"
                }
            
            appFiles.govIdFullPath = uploadFolder + govIdfilename
            govIdFullPath.transferTo(new File(appFiles.govIdFullPath))
        }


        if(secCertFullPath == null) {
        appFiles.birCorFullPath = appFiles.birCorFullPath
        } 
        else if(secCertFullPath.empty) {
                appFiles.secCertFullPath = appFiles.secCertFullPath
        } else {
                 if (appFiles.id == null) {
                    secCertfilename = "${applicationFormInstance.merchantName}-secCert${appFiles.count()+1}_${secCertFullPath.originalFilename}"
                }
                else {
                     secCertfilename = "${applicationFormInstance.merchantName}-secCert${appFiles.id}_${secCertFullPath.originalFilename}"
                }
            
            appFiles.secCertFullPath = uploadFolder + secCertfilename
            secCertFullPath.transferTo(new File(appFiles.secCertFullPath))
            }

        if(gisFullPath == null) {
        appFiles.birCorFullPath = appFiles.birCorFullPath
        } 
        else if(gisFullPath.empty) {
                appFiles.gisFullPath = appFiles.gisFullPath
        } else {
                 if (appFiles.id == null) {
                    gisfilename = "${applicationFormInstance.merchantName}-gis${appFiles.count()+1}_${gisFullPath.originalFilename}"
                }
                else {
                     gisfilename = "${applicationFormInstance.merchantName}-gis${appFiles.id}_${gisFullPath.originalFilename}"
                }
            
            appFiles.gisFullPath = uploadFolder + gisfilename
            gisFullPath.transferTo(new File(appFiles.gisFullPath))
            }
        
        if(articleFullPath == null) {
        appFiles.birCorFullPath = appFiles.birCorFullPath
        } 
        else if(articleFullPath.empty) {
                appFiles.articleFullPath = appFiles.articleFullPath
        } else {
                 if (appFiles.id == null) {
                    articlefilename = "${applicationFormInstance.merchantName}-article${appFiles.count()+1}_${articleFullPath.originalFilename}"
                }
                else {
                     articlefilename = "${applicationFormInstance.merchantName}-article${appFiles.id}_${articleFullPath.originalFilename}"
                }
            
            appFiles.articleFullPath = uploadFolder + articlefilename
            articleFullPath.transferTo(new File(appFiles.articleFullPath))
        }

        if(byLawFullPath == null) {
        appFiles.birCorFullPath = appFiles.birCorFullPath
        } 
        else if(byLawFullPath.empty) {
                appFiles.byLawFullPath = appFiles.byLawFullPath
        } else {
                 if (appFiles.id == null) {
                    byLawfilename = "${applicationFormInstance.merchantName}-byLaw${appFiles.count()+1}_${byLawFullPath.originalFilename}"
                }
                else {
                     byLawfilename = "${applicationFormInstance.merchantName}-byLaw${appFiles.id}_${byLawFullPath.originalFilename}"
                }
            
            appFiles.byLawFullPath = uploadFolder + byLawfilename
            byLawFullPath.transferTo(new File(appFiles.byLawFullPath))
        }

        if(finStateFullPath == null) {
        appFiles.birCorFullPath = appFiles.birCorFullPath
        } 
        else if(finStateFullPath.empty) {
                appFiles.finStateFullPath = appFiles.finStateFullPath
        } else {
                 if (appFiles.id == null) {
                    finStatefilename = "${applicationFormInstance.merchantName}-finState${appFiles.count()+1}_${finStateFullPath.originalFilename}"
                }
                else {
                     finStatefilename = "${applicationFormInstance.merchantName}-finState${appFiles.id}_${finStateFullPath.originalFilename}"
                }
            
            appFiles.finStateFullPath = uploadFolder + finStatefilename
            finStateFullPath.transferTo(new File(appFiles.finStateFullPath))
        }
            
       appFiles.save()
    }
}
