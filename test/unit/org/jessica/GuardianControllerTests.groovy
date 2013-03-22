package org.jessica

import org.jessica.admin.GuardianController
import grails.test.mixin.*

@TestFor(GuardianController)
@Mock(Guardian)
class GuardianControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/guardian/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.guardianInstanceList.size() == 0
        assert model.guardianInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.guardianInstance != null
    }

    void testSave() {
        controller.save()

        assert model.guardianInstance != null
        assert view == '/guardian/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/guardian/show/1'
        assert controller.flash.message != null
        assert Guardian.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/guardian/list'

        populateValidParams(params)
        def guardian = new Guardian(params)

        assert guardian.save() != null

        params.id = guardian.id

        def model = controller.show()

        assert model.guardianInstance == guardian
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/guardian/list'

        populateValidParams(params)
        def guardian = new Guardian(params)

        assert guardian.save() != null

        params.id = guardian.id

        def model = controller.edit()

        assert model.guardianInstance == guardian
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/guardian/list'

        response.reset()

        populateValidParams(params)
        def guardian = new Guardian(params)

        assert guardian.save() != null

        // test invalid parameters in update
        params.id = guardian.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/guardian/edit"
        assert model.guardianInstance != null

        guardian.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/guardian/show/$guardian.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        guardian.clearErrors()

        populateValidParams(params)
        params.id = guardian.id
        params.version = -1
        controller.update()

        assert view == "/guardian/edit"
        assert model.guardianInstance != null
        assert model.guardianInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/guardian/list'

        response.reset()

        populateValidParams(params)
        def guardian = new Guardian(params)

        assert guardian.save() != null
        assert Guardian.count() == 1

        params.id = guardian.id

        controller.delete()

        assert Guardian.count() == 0
        assert Guardian.get(guardian.id) == null
        assert response.redirectedUrl == '/guardian/list'
    }
}
