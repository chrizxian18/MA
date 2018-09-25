package merchantacquisition

import MerchantAcquisition.User

class ApplicationForm {
	// 7-Connect Model
	Boolean sConnectWebIntegration
	Boolean cliqq
	// CLiQQ Type
	Boolean billsPayment
	Boolean eload
	Boolean ePins
	Boolean eMoney
	Boolean remittance
	
	String merchantName
	String companyType
	String companyAddress
	String natureOfBusiness
	String businessDescription
	Integer noOfSubscribers
	String websiteLink
	String coveredAreas
	Date launchDate
	BigDecimal commissionFee
	String modeOfPayment
	String bankName
	String accountType
	String accountName
	Integer accountNumber
	String moaSignatory
	String moaWitness
	String mainContactPerson
	String itContactPerson
	String afterSalesContactPerson
	String financeContactPerson
	Date dateApplied

	String status
	User createdBy
	User updatedBy
	Date dateCreated
	Date lastUpdated
	Boolean	drafts
	AppFormFiles appFormFiles
	String remarks
	String catManagerDecision
	String secManagerDecision
	String divHeadDecision
	String catManagerApprover
	String secManagerApprover
	String divHeadApprover
	







    static constraints = {
    		sConnectWebIntegration()
			cliqq()
			billsPayment()
			eload()
			ePins()
			eMoney()
			remittance()
			merchantName()
			companyType()
			companyAddress()
			natureOfBusiness()
			businessDescription()
			noOfSubscribers(nullable:true)
			websiteLink(nullable:true)
			coveredAreas(nullable:true)
			launchDate()
			commissionFee(nullable:true)
			modeOfPayment()
			bankName(nullable:true)
			accountType(nullable:true)
			accountName(nullable:true)
			accountNumber(nullable:true)
			moaSignatory(nullable:true)
			moaWitness(nullable:true)
			mainContactPerson()
			itContactPerson(nullable:true)
			afterSalesContactPerson(nullable:true)
			financeContactPerson(nullable:true)
			status(nullable:true)
			createdBy(nullable:true)
			updatedBy(nullable:true)
			drafts(nullable:true)
			dateApplied(nullable:true)
			remarks(nullable:true)
			catManagerDecision(nullable:true)
			secManagerDecision(nullable:true)
			divHeadDecision(nullable:true)
    }
}
