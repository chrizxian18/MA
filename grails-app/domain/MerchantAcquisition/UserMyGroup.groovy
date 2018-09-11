package MerchantAcquisition

import grails.gorm.DetachedCriteria
import groovy.transform.ToString

import org.apache.commons.lang.builder.HashCodeBuilder

@ToString(cache=true, includeNames=true, includePackage=false)
class UserMyGroup implements Serializable {

	private static final long serialVersionUID = 1

	User user
	MyGroup myGroup

	UserMyGroup(User u, MyGroup rg) {
		this()
		user = u
		myGroup = rg
	}

	@Override
	boolean equals(other) {
		if (!(other instanceof UserMyGroup)) {
			return false
		}

		other.user?.id == user?.id && other.myGroup?.id == myGroup?.id
	}

	@Override
	int hashCode() {
		def builder = new HashCodeBuilder()
		if (user) builder.append(user.id)
		if (myGroup) builder.append(myGroup.id)
		builder.toHashCode()
	}

	static UserMyGroup get(long userId, long myGroupId) {
		criteriaFor(userId, myGroupId).get()
	}

	static boolean exists(long userId, long myGroupId) {
		criteriaFor(userId, myGroupId).count()
	}

	private static DetachedCriteria criteriaFor(long userId, long myGroupId) {
		UserMyGroup.where {
			user == User.load(userId) &&
			myGroup == MyGroup.load(myGroupId)
		}
	}

	static UserMyGroup create(User user, MyGroup myGroup, boolean flush = false) {
		def instance = new UserMyGroup(user: user, myGroup: myGroup)
		instance.save(flush: flush, insert: true)
		instance
	}

	static boolean remove(User u, MyGroup rg, boolean flush = false) {
		if (u == null || rg == null) return false

		int rowCount = UserMyGroup.where { user == u && myGroup == rg }.deleteAll()

		if (flush) { UserMyGroup.withSession { it.flush() } }

		rowCount
	}

	static void removeAll(User u, boolean flush = false) {
		if (u == null) return

		UserMyGroup.where { user == u }.deleteAll()

		if (flush) { UserMyGroup.withSession { it.flush() } }
	}

	static void removeAll(MyGroup rg, boolean flush = false) {
		if (rg == null) return

		UserMyGroup.where { myGroup == rg }.deleteAll()

		if (flush) { UserMyGroup.withSession { it.flush() } }
	}

	static constraints = {
		user validator: { User u, UserMyGroup ug ->
			if (ug.myGroup == null || ug.myGroup.id == null) return
			boolean existing = false
			UserMyGroup.withNewSession {
				existing = UserMyGroup.exists(u.id, ug.myGroup.id)
			}
			if (existing) {
				return 'userGroup.exists'
			}
		}
	}

	static mapping = {
		id composite: ['myGroup', 'user']
		version false
	}
}
