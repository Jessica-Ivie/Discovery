package org.jessica

import org.jessica.admin.PermissionFormController
import grails.test.mixin.*

@TestFor(PermissionFormController)
@Mock(PermissionForm)
class PermissionFormControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/permissionForm/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.permissionFormInstanceList.size() == 0
        assert model.permissionFormInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.permissionFormInstance != null
    }

    void testSave() {
        controller.save()

        assert model.permissionFormInstance != null
        assert view == '/permissionForm/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/permissionForm/show/1'
        assert controller.flash.message != null
        assert PermissionForm.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/permissionForm/list'

        populateValidParams(params)
        def permissionForm = new PermissionForm(params)

        assert permissionForm.save() != null

        params.id = permissionForm.id

        def model = controller.show()

        assert model.permissionFormInstance == permissionForm
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/permissionForm/list'

        populateValidParams(params)
        def permissionForm = new PermissionForm(params)

        assert permissionForm.save() != null

        params.id = permissionForm.id

        def model = controller.edit()

        assert model.permissionFormInstance == permissionForm
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/permissionForm/list'

        response.reset()

        populateValidParams(params)
        def permissionForm = new PermissionForm(params)

        assert permissionForm.save() != null

        // test invalid parameters in update
        params.id = permissionForm.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/permissionForm/edit"
        assert model.permissionFormInstance != null

        permissionForm.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/permissionForm/show/$permissionForm.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        permissionForm.clearErrors()

        populateValidParams(params)
        params.id = permissionForm.id
        params.version = -1
        controller.update()

        assert view == "/permissionForm/edit"
        assert model.permissionFormInstance != null
        assert model.permissionFormInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/permissionForm/list'

        response.reset()

        populateValidParams(params)
        def permissionForm = new PermissionForm(params)

        assert permissionForm.save() != null
        assert PermissionForm.count() == 1

        params.id = permissionForm.id

        controller.delete()

        assert PermissionForm.count() == 0
        assert PermissionForm.get(permissionForm.id) == null
        assert response.redirectedUrl == '/permissionForm/list'
    }
}
