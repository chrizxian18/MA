package MerchantAcquisition

import grails.gorm.DetachedCriteria
import groovy.transform.ToString

import org.apache.commons.lang.builder.HashCodeBuilder

@ToString(cache=true, includeNames=true, includePackage=false)
class UserGroup implements Serializable {

	private static final long serialVersionUID = 1

	User user
	Group group

	UserGroup(User u, Group rg) {
		this()
		user = u
		group = rg
	}

	@Override
	boolean equals(other) {
		if (!(other instanceof UserGroup)) {
			return false
		}

		other.user?.id == user?.id && other.group?.id == group?.id
	}

	@Override
	int hashCode() {
		def builder = new HashCodeBuilder()
		if (user) builder.append(user.id)
		if (group) builder.append(group.id)
		builder.toHashCode()
	}

	static UserGroup get(long userId, long groupId) {
		criteriaFor(userId, groupId).get()
	}

	static boolean exists(long userId, long groupId) {
		criteriaFor(userId, groupId).count()
	}

	private static DetachedCriteria criteriaFor(long userId, long groupId) {
		UserGroup.where {
			user == User.load(userId) &&
			group == Group.load(groupId)
		}
	}

	static UserGroup create(User user, Group group, boolean flush = false) {
		def instance = new UserGroup(user: user, group: group)
		instance.save(flush: flush, insert: true)
		instance
	}

	static boolean remove(User u, Group rg, boolean flush = false) {
		if (u == null || rg == null) return false

		int rowCount = UserGroup.where { user == u && group == rg }.deleteAll()

		if (flush) { UserGroup.withSession { it.flush() } }

		rowCount
	}

	static void removeAll(User u, boolean flush = false) {
		if (u == null) return

		UserGroup.where { user == u }.deleteAll()

		if (flush) { UserGroup.withSession { it.flush() } }
	}

	static void removeAll(Group rg, boolean flush = false) {
		if (rg == null) return

		UserGroup.where { group == rg }.deleteAll()

		if (flush) { UserGroup.withSession { it.flush() } }
	}

	static constraints = {
		user validator: { User u, UserGroup ug ->
			if (ug.group == null || ug.group.id == null) return
			boolean existing = false
			UserGroup.withNewSession {
				existing = UserGroup.exists(u.id, ug.group.id)
			}
			if (existing) {
				return 'userGroup.exists'
			}
		}
	}

	static mapping = {
		id composite: ['group', 'user']
		version false
	}
}
