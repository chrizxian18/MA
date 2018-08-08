package merchantacquisition

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

	String status
	// String createdBy
	// String updatedBy
	Date dateCreated
	Date lastUpdated







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
    }
}
