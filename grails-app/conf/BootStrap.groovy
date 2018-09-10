import MerchantAcquisition.Role
import MerchantAcquisition.User
import MerchantAcquisition.UserRole

class BootStrap {

    def init = { servletContext ->

    	 //      def adminRole = new Role('ROLE_ADMIN').save()
      // def userRole = new Role('ROLE_USER').save()

      // def testUser = new User()
      // testUser.username = "alpha"
      // testUser.password = "Password1!"
      // // ('alpha', 'Password1!').save()
      // testUser.email = "janchristian@apollo.com.ph"
      // testUser.save()
      // UserRole.create testUser, adminRole, true

      // assert User.count() == 1
      // assert Role.count() == 2
      // assert UserRole.count() == 1
    }
    def destroy = {
    }
}
