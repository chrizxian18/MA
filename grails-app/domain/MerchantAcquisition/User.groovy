package MerchantAcquisition

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class User implements Serializable {

	private static final long serialVersionUID = 1

	transient springSecurityService

	String username
	String password
	String email
    Long telephone
    String mobileNo
    String confirmCode
    Date dateCreated
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	User(String username, String password) {
		this()
		this.username = username
		this.password = password
	}

	Set<MyGroup> getAuthorities() {
		UserMyGroup.findAllByUser(this)*.myGroup
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}

	static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true
		password blank: false
		email(email:true, nullable:true, unique: true)
	    telephone(nullable:true)
	    mobileNo(nullable:true, maxSize:13)
	    confirmCode(nullable:true)
	    dateCreated(nullable:true)
	}

	static mapping = {
		password column: '`password`'
	}
}
