package org.jessica

import org.jessica.admin.BehaviorNoteController
import grails.test.mixin.*

@TestFor(BehaviorNoteController)
@Mock(BehaviorNote)
class BehaviorNoteControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/behaviorNote/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.behaviorNoteInstanceList.size() == 0
        assert model.behaviorNoteInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.behaviorNoteInstance != null
    }

    void testSave() {
        controller.save()

        assert model.behaviorNoteInstance != null
        assert view == '/behaviorNote/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/behaviorNote/show/1'
        assert controller.flash.message != null
        assert BehaviorNote.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/behaviorNote/list'

        populateValidParams(params)
        def behaviorNote = new BehaviorNote(params)

        assert behaviorNote.save() != null

        params.id = behaviorNote.id

        def model = controller.show()

        assert model.behaviorNoteInstance == behaviorNote
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/behaviorNote/list'

        populateValidParams(params)
        def behaviorNote = new BehaviorNote(params)

        assert behaviorNote.save() != null

        params.id = behaviorNote.id

        def model = controller.edit()

        assert model.behaviorNoteInstance == behaviorNote
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/behaviorNote/list'

        response.reset()

        populateValidParams(params)
        def behaviorNote = new BehaviorNote(params)

        assert behaviorNote.save() != null

        // test invalid parameters in update
        params.id = behaviorNote.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/behaviorNote/edit"
        assert model.behaviorNoteInstance != null

        behaviorNote.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/behaviorNote/show/$behaviorNote.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        behaviorNote.clearErrors()

        populateValidParams(params)
        params.id = behaviorNote.id
        params.version = -1
        controller.update()

        assert view == "/behaviorNote/edit"
        assert model.behaviorNoteInstance != null
        assert model.behaviorNoteInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/behaviorNote/list'

        response.reset()

        populateValidParams(params)
        def behaviorNote = new BehaviorNote(params)

        assert behaviorNote.save() != null
        assert BehaviorNote.count() == 1

        params.id = behaviorNote.id

        controller.delete()

        assert BehaviorNote.count() == 0
        assert BehaviorNote.get(behaviorNote.id) == null
        assert response.redirectedUrl == '/behaviorNote/list'
    }
}
