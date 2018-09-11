package MerchantAcquisition

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes='name')
@ToString(includes='name', includeNames=true, includePackage=false)
class MyGroup implements Serializable {

	private static final long serialVersionUID = 1

	String name

	MyGroup(String name) {
		this()
		this.name = name
	}

	Set<Role> getAuthorities() {
		MyGroupRole.findAllByMyGroup(this)*.role
	}

	static constraints = {
		name blank: false, unique: true
	}

	static mapping = {
		cache true
	}
}
