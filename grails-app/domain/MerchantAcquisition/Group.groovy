package MerchantAcquisition

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes='name')
@ToString(includes='name', includeNames=true, includePackage=false)
class Group implements Serializable {

	private static final long serialVersionUID = 1

	String name
	Date dateCreated
    Date lastUpdated
    User createdBy
    User updatedBy

	Group(String name) {
		this()
		this.name = name
	}

	Set<Role> getAuthorities() {
		GroupRole.findAllByGroup(this)*.role
	}

	static constraints = {
		name blank: false, unique: true
		createdBy(nullable: true)
		updatedBy(nullable: true)
		dateCreated(nullable: true)
		lastUpdated(nullable: true)
	}

	static mapping = {
		cache true
	}
}
