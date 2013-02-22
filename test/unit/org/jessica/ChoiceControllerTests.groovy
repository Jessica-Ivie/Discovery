package org.jessica



import org.junit.*
import grails.test.mixin.*

@TestFor(ChoiceController)
@Mock(Choice)
class ChoiceControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/choice/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.choiceInstanceList.size() == 0
        assert model.choiceInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.choiceInstance != null
    }

    void testSave() {
        controller.save()

        assert model.choiceInstance != null
        assert view == '/choice/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/choice/show/1'
        assert controller.flash.message != null
        assert Choice.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/choice/list'

        populateValidParams(params)
        def choice = new Choice(params)

        assert choice.save() != null

        params.id = choice.id

        def model = controller.show()

        assert model.choiceInstance == choice
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/choice/list'

        populateValidParams(params)
        def choice = new Choice(params)

        assert choice.save() != null

        params.id = choice.id

        def model = controller.edit()

        assert model.choiceInstance == choice
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/choice/list'

        response.reset()

        populateValidParams(params)
        def choice = new Choice(params)

        assert choice.save() != null

        // test invalid parameters in update
        params.id = choice.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/choice/edit"
        assert model.choiceInstance != null

        choice.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/choice/show/$choice.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        choice.clearErrors()

        populateValidParams(params)
        params.id = choice.id
        params.version = -1
        controller.update()

        assert view == "/choice/edit"
        assert model.choiceInstance != null
        assert model.choiceInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/choice/list'

        response.reset()

        populateValidParams(params)
        def choice = new Choice(params)

        assert choice.save() != null
        assert Choice.count() == 1

        params.id = choice.id

        controller.delete()

        assert Choice.count() == 0
        assert Choice.get(choice.id) == null
        assert response.redirectedUrl == '/choice/list'
    }
}
