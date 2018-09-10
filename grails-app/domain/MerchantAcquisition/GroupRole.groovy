package MerchantAcquisition

import grails.gorm.DetachedCriteria
import groovy.transform.ToString

import org.apache.commons.lang.builder.HashCodeBuilder

@ToString(cache=true, includeNames=true, includePackage=false)
class GroupRole implements Serializable {

	private static final long serialVersionUID = 1

	Group group
	Role role

	GroupRole(Group g, Role r) {
		this()
		group = g
		role = r
	}

	@Override
	boolean equals(other) {
		if (!(other instanceof GroupRole)) {
			return false
		}

		other.role?.id == role?.id && other.group?.id == group?.id
	}

	@Override
	int hashCode() {
		def builder = new HashCodeBuilder()
		if (group) builder.append(group.id)
		if (role) builder.append(role.id)
		builder.toHashCode()
	}

	static GroupRole get(long groupId, long roleId) {
		criteriaFor(groupId, roleId).get()
	}

	static boolean exists(long groupId, long roleId) {
		criteriaFor(groupId, roleId).count()
	}

	private static DetachedCriteria criteriaFor(long groupId, long roleId) {
		GroupRole.where {
			group == Group.load(groupId) &&
			role == Role.load(roleId)
		}
	}

	static GroupRole create(Group group, Role role, boolean flush = false) {
		def instance = new GroupRole(group: group, role: role)
		instance.save(flush: flush, insert: true)
		instance
	}

	static boolean remove(Group rg, Role r, boolean flush = false) {
		if (rg == null || r == null) return false

		int rowCount = GroupRole.where { group == rg && role == r }.deleteAll()

		if (flush) { GroupRole.withSession { it.flush() } }

		rowCount
	}

	static void removeAll(Role r, boolean flush = false) {
		if (r == null) return

		GroupRole.where { role == r }.deleteAll()

		if (flush) { GroupRole.withSession { it.flush() } }
	}

	static void removeAll(Group rg, boolean flush = false) {
		if (rg == null) return

		GroupRole.where { group == rg }.deleteAll()

		if (flush) { GroupRole.withSession { it.flush() } }
	}

	static constraints = {
		role validator: { Role r, GroupRole rg ->
			if (rg.group == null || rg.group.id == null) return
			boolean existing = false
			GroupRole.withNewSession {
				existing = GroupRole.exists(rg.group.id, r.id)
			}
			if (existing) {
				return 'roleGroup.exists'
			}
		}
	}

	static mapping = {
		id composite: ['group', 'role']
		version false
	}
}
