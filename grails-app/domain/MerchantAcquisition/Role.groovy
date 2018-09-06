package MerchantAcquisition

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes='authority')
@ToString(includes='authority', includeNames=true, includePackage=false)
class Role implements Serializable {

	private static final long serialVersionUID = 1

	String authority
	String description
    Date dateCreated
	User createdBy
	Date lastUpdated
	User updatedBy

	Role(String authority) {
		this()
		this.authority = authority
	}

	static constraints = {
		authority (blank: false, unique: true)
		description(nullable: true, blank: true, unique: true)
        dateCreated(nullable: true)
        createdBy(nullable: true)
        lastUpdated(nullable: true)
        updatedBy(nullable: true)
	}

	static mapping = {
		cache true
	}
}
