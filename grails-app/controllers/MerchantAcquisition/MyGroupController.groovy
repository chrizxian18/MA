package MerchantAcquisition



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.springframework.security.access.annotation.Secured

@Transactional(readOnly = false)
@Secured(['ROLE_ADMIN'])
class MyGroupController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond MyGroup.list(params), model:[myGroupInstanceCount: MyGroup.count()]
    }

    def show(MyGroup myGroupInstance) {
        respond myGroupInstance
    }

    def create() {
        respond new MyGroup(params)
    }

    @Transactional
    def save(MyGroup myGroupInstance) {
        if (myGroupInstance == null) {
            notFound()
            return
        }

        if (myGroupInstance.hasErrors()) {
            respond myGroupInstance.errors, view:'create'
            return
        }

        myGroupInstance.createdBy = authenticatedUser
        myGroupInstance.dateCreated = new Date()
        myGroupInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'myGroup.label', default: 'MyGroup'), myGroupInstance.id])
                redirect myGroupInstance
            }
            '*' { respond myGroupInstance, [status: CREATED] }
        }
    }

    def edit(MyGroup myGroupInstance) {
        // def myRoles = Role.list()
        // respond myGroupInstance, model:[roles:myRoles]
         setupPaging(params)
         if (!myGroupInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'myGroup.label', default: 'MyGroup'), params.id])}"
            redirect(action: "index")
        }
        else {
            return [myGroupInstance: myGroupInstance]
        }
    }

    // def edit() {
    //     setupPaging(params)
    //     def myGroupInstance = MyGroup.get(params.id)
    //     if (!myGroupInstance) {
    //         flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'userGroup.label', default: 'MyGroup'), params.id])}"
    //         redirect(action: "index")
    //     }
    //     else {
    //         return [myGroupInstance: myGroupInstance]
    //     }
    // }

    @Transactional
    def update(MyGroup myGroupInstance) {
        if (myGroupInstance == null) {
            notFound()
            return
        }

        if (myGroupInstance.hasErrors()) {
            respond myGroupInstance.errors, view:'edit'
            return
        }

        myGroupInstance.updatedBy = authenticatedUser
        myGroupInstance.lastUpdated = new Date()

        // MyGroupRole.create myGroupInstance, Role.get(params.userRoles), true
        myGroupInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'MyGroup.label', default: 'MyGroup'), myGroupInstance.id])
                redirect myGroupInstance
            }
            '*'{ respond myGroupInstance, [status: OK] }
        }
    }

    static def MAX_ROWS = 21

    def setupPaging(params) {
        params.max = MAX_ROWS
        if(!params.page){
            params.offset = 0
            params.page = 1
        }else{
            params.page = new Long(params.page)
            params.offset = (params.page - 1 ) * MAX_ROWS

        }
    }

    def getAvailableRoles(params,myGroup) {
        def named_params = [myGroup:myGroup]
        def qry = new StringBuffer()
        qry << "from Role r1 "
        qry << "where r1.id not in"
        qry << "(select r2.id from MyGroupRole ugr join ugr.role r2 where ugr.myGroup = :myGroup) "
        if(params.value){
            qry << "and lower(r1.authority) like :filter "
            named_params['filter']="%${params.value}%".toLowerCase()
        }
        qry << "order by r1.id asc"
        qry = qry.toString()
        log.info "qry:"+qry
        def available = Role.findAll(qry,named_params,params)
        return available
    }

    def countAvailableRoles(params,myGroup) {
        def named_params = [myGroup:myGroup]
        def qry = new StringBuffer()
        qry << "select count(r1) from Role r1 "
        qry << "where r1.id not in"
        qry << "(select r2.id from MyGroupRole ugr join ugr.role r2 where ugr.myGroup = :myGroup) "
        if(params.value){
            qry << "and lower(r1.authority) like :filter "
            named_params['filter']="%${params.value}%".toLowerCase()
        }
        qry = qry.toString()
        return Role.executeQuery(qry,named_params)[0]
    }

    def getCurrentRoles(params,myGroup) {
        def named_params = [myGroup:myGroup]
        def qry = new StringBuffer()
        qry << "from MyGroupRole ugr join ugr.role r1 where ugr.myGroup = :myGroup "
        if(params.value){
            qry << "and lower(r1.authority) like :filter "
            named_params['filter']="%${params.value}%".toLowerCase()
        }
        qry << "order by r1.id asc"
        qry = qry.toString()
        def current = MyGroupRole.findAll(qry,named_params,params).collect{it[1]}
        return current
    }

    def countCurrentRoles(params,myGroup) {
        def named_params = [myGroup:myGroup]
        def qry = new StringBuffer()
        qry << "select count(r1.id) from MyGroupRole ugr join ugr.role r1 where ugr.myGroup = :myGroup "
        if(params.value){
            qry << "and lower(r1.authority) like :filter "
            named_params['filter']="%${params.value}%".toLowerCase()
        }
        qry = qry.toString()
        return MyGroupRole.executeQuery(qry,named_params)[0]
    }


    // @Secured(['ROLE_UPDATE_GROUP'])
    def updateAvailableList() {
        log.info "MyGROUP : UPDATEAVAILABLELIST : " + params
        setupPaging(params)
        def myGroupInstance = MyGroup.get(params.id)
        def available_roles = getAvailableRoles(params,myGroupInstance)
        def model = [list_items:available_roles]
        model['page']=params.page
        model['update_action']='updateAvailabList'
        model['display_field']='authority'
        model['select_id']='role_available_list'
        model['update_script']='role_updateAvailable'
        def rowCount = countAvailableRoles(params,myGroupInstance)
        params.pageCount = computePageCount(rowCount,MAX_ROWS)
        render (template:'/layouts/dual_list_select',model:model)
    }

    // @Secured(['ROLE_UPDATE_GROUP'])
    def updateCurrentList() {
        log.info "MyGROUP : UPDATECURRENTLIST : " + params
        setupPaging(params)
        def myGroupInstance = MyGroup.get(params.id)
        def current_roles = getCurrentRoles(params,myGroupInstance)
        def model = [list_items:current_roles,'select_id':'current_list']
        model['page']=params.page
        model['update_action']='updateCurrentList'
        model['display_field']='authority'
        model['select_id']='role_current_list'
        model['update_script']='role_updateCurrent'
        def rowCount = countCurrentRoles(params,myGroupInstance)
        params.pageCount = computePageCount(rowCount,MAX_ROWS)
        render (template:'/layouts/dual_list_select',model:model)
    }

    def computePageCount(rowCount, pageSize) {
        def divisionResult = rowCount/pageSize
        return (Integer)(Math.ceil(divisionResult))
    }

    // @Secured(['ROLE_UPDATE_GROUP'])
    def removeSelected() {
        log.info "REMOVE SELECTED : " + params
        def myGroupInstance = MyGroup.get(params.id)
        def roles_to_remove = params.selected_id.split(',')
        roles_to_remove.each{ role_id ->
            MyGroupRole.remove myGroupInstance, Role.get(role_id), true
        }
        forward(action:'updateCurrentList')
    }

    // @Secured(['ROLE_UPDATE_GROUP'])
    def addSelected() {
        log.info "ADD SELECTED : " + params
        def myGroupInstance = MyGroup.get(params.id)
        def roles_to_add = params.selected_id.split(',')
        roles_to_add.each{ role_id ->
            MyGroupRole.create myGroupInstance, Role.get(role_id), true
        }
        forward(action:'updateCurrentList')
    }

    @Transactional
    def delete(MyGroup myGroupInstance) {

        if (myGroupInstance == null) {
            notFound()
            return
        }

        try {
              myGroupInstance.delete flush:true

                request.withFormat {
                    form multipartForm {
                        flash.message = message(code: 'default.deleted.message', args: [message(code: 'MyGroup.label', default: 'MyGroup'), myGroupInstance.id])
                        redirect action:"index", method:"GET"
                    }
                    '*'{ render status: NO_CONTENT }
                }   
        }
        catch(Exception e) {
                flash.error = "Please remove the authorities before deleting! If it's empty, this group might be currently used by a user please remove it from the user before deleting."
            flash.message = e
            redirect uri:"/myGroup/show/${myGroupInstance.id}"
             log.info "mylog.error:failed to delete"
        }
        
      
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'myGroup.label', default: 'MyGroup'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
