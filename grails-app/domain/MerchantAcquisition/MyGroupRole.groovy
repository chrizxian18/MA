package MerchantAcquisition

import grails.gorm.DetachedCriteria
import groovy.transform.ToString

import org.apache.commons.lang.builder.HashCodeBuilder

@ToString(cache=true, includeNames=true, includePackage=false)
class MyGroupRole implements Serializable {

	private static final long serialVersionUID = 1

	MyGroup myGroup
	Role role

	MyGroupRole(MyGroup g, Role r) {
		this()
		myGroup = g
		role = r
	}

	@Override
	boolean equals(other) {
		if (!(other instanceof MyGroupRole)) {
			return false
		}

		other.role?.id == role?.id && other.myGroup?.id == myGroup?.id
	}

	@Override
	int hashCode() {
		def builder = new HashCodeBuilder()
		if (myGroup) builder.append(myGroup.id)
		if (role) builder.append(role.id)
		builder.toHashCode()
	}

	static MyGroupRole get(long myGroupId, long roleId) {
		criteriaFor(myGroupId, roleId).get()
	}

	static boolean exists(long myGroupId, long roleId) {
		criteriaFor(myGroupId, roleId).count()
	}

	private static DetachedCriteria criteriaFor(long myGroupId, long roleId) {
		MyGroupRole.where {
			myGroup == MyGroup.load(myGroupId) &&
			role == Role.load(roleId)
		}
	}

	static MyGroupRole create(MyGroup myGroup, Role role, boolean flush = false) {
		def instance = new MyGroupRole(myGroup: myGroup, role: role)
		instance.save(flush: flush, insert: true)
		instance
	}

	static boolean remove(MyGroup rg, Role r, boolean flush = false) {
		if (rg == null || r == null) return false

		int rowCount = MyGroupRole.where { myGroup == rg && role == r }.deleteAll()

		if (flush) { MyGroupRole.withSession { it.flush() } }

		rowCount
	}

	static void removeAll(Role r, boolean flush = false) {
		if (r == null) return

		MyGroupRole.where { role == r }.deleteAll()

		if (flush) { MyGroupRole.withSession { it.flush() } }
	}

	static void removeAll(MyGroup rg, boolean flush = false) {
		if (rg == null) return

		MyGroupRole.where { myGroup == rg }.deleteAll()

		if (flush) { MyGroupRole.withSession { it.flush() } }
	}

	static constraints = {
		role validator: { Role r, MyGroupRole rg ->
			if (rg.myGroup == null || rg.myGroup.id == null) return
			boolean existing = false
			MyGroupRole.withNewSession {
				existing = MyGroupRole.exists(rg.myGroup.id, r.id)
			}
			if (existing) {
				return 'roleGroup.exists'
			}
		}
	}

	static mapping = {
		id composite: ['myGroup', 'role']
		version false
	}
}
