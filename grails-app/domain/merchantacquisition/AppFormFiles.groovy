package merchantacquisition

class AppFormFiles {

	// ApplicationForm appForm
	String status // I only used this to pass an argument to the parameter
	String birCorFullPath //COR issued by BIR:
	String dtiCertFullPath // DTI Certificate
	String bizPermFullPath //Business/Mayor’s Permit
	String govIdFullPath // Copy of gov’t issued I.D
	String secCertFullPath // Sec Cert of authority of signatories showing authority of its representative to sign and enter this agreement (original)
	String gisFullPath // Latest GIS;(certified true copy)
	String articleFullPath // Articles of Incorporation or Amended Articles of Incorporation;(certified true copy)
	String byLawFullPath // By-Laws or Amended By-Laws approved by  SEC (certified true copy)
	String finStateFullPath //Latest Audited Financial Statement (certified true copy)


	Date dateUploaded = new Date()


    static constraints = {

	birCorFullPath(nullable:true)
	dtiCertFullPath(nullable:true)
	bizPermFullPath(nullable:true)
	govIdFullPath(nullable:true)
	secCertFullPath(nullable:true)
	gisFullPath(nullable:true)
	articleFullPath(nullable:true)
	byLawFullPath(nullable:true)
	finStateFullPath(nullable:true)
    }
}
