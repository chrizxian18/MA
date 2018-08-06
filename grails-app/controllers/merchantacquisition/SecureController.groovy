package merchantacquisition
import grails.plugin.springsecurity.annotation.Secured

@Secured(['IS_AUTHENTICATED_FULLY'])
class SecureController {
   // @Secured('ROLE_ADMIN')
    def index() { 
    	render 'Secure access only <br> Welcome Merchant!'
    }
}
