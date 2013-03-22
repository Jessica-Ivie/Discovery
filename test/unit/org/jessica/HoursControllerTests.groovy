package org.jessica

import org.jessica.admin.HoursController
import grails.test.mixin.*

@TestFor(HoursController)
@Mock(Hours)
class HoursControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/hours/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.hoursInstanceList.size() == 0
        assert model.hoursInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.hoursInstance != null
    }

    void testSave() {
        controller.save()

        assert model.hoursInstance != null
        assert view == '/hours/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/hours/show/1'
        assert controller.flash.message != null
        assert Hours.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/hours/list'

        populateValidParams(params)
        def hours = new Hours(params)

        assert hours.save() != null

        params.id = hours.id

        def model = controller.show()

        assert model.hoursInstance == hours
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/hours/list'

        populateValidParams(params)
        def hours = new Hours(params)

        assert hours.save() != null

        params.id = hours.id

        def model = controller.edit()

        assert model.hoursInstance == hours
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/hours/list'

        response.reset()

        populateValidParams(params)
        def hours = new Hours(params)

        assert hours.save() != null

        // test invalid parameters in update
        params.id = hours.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/hours/edit"
        assert model.hoursInstance != null

        hours.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/hours/show/$hours.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        hours.clearErrors()

        populateValidParams(params)
        params.id = hours.id
        params.version = -1
        controller.update()

        assert view == "/hours/edit"
        assert model.hoursInstance != null
        assert model.hoursInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/hours/list'

        response.reset()

        populateValidParams(params)
        def hours = new Hours(params)

        assert hours.save() != null
        assert Hours.count() == 1

        params.id = hours.id

        controller.delete()

        assert Hours.count() == 0
        assert Hours.get(hours.id) == null
        assert response.redirectedUrl == '/hours/list'
    }
}
