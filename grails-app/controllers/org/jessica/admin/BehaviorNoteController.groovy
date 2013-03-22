package org.jessica.admin

import org.jessica.BehaviorNote
import org.springframework.dao.DataIntegrityViolationException

class BehaviorNoteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [behaviorNoteInstanceList: BehaviorNote.list(params), behaviorNoteInstanceTotal: BehaviorNote.count()]
    }

    def create() {
        [behaviorNoteInstance: new BehaviorNote(params)]
    }

    def save() {
        def behaviorNoteInstance = new BehaviorNote(params)
        if (!behaviorNoteInstance.save(flush: true)) {
            render(view: "create", model: [behaviorNoteInstance: behaviorNoteInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'behaviorNote.label', default: 'BehaviorNote'), behaviorNoteInstance.id])
        redirect(action: "show", id: behaviorNoteInstance.id)
    }

    def show(Long id) {
        def behaviorNoteInstance = BehaviorNote.get(id)
        if (!behaviorNoteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'behaviorNote.label', default: 'BehaviorNote'), id])
            redirect(action: "list")
            return
        }

        [behaviorNoteInstance: behaviorNoteInstance]
    }

    def edit(Long id) {
        def behaviorNoteInstance = BehaviorNote.get(id)
        if (!behaviorNoteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'behaviorNote.label', default: 'BehaviorNote'), id])
            redirect(action: "list")
            return
        }

        [behaviorNoteInstance: behaviorNoteInstance]
    }

    def update(Long id, Long version) {
        def behaviorNoteInstance = BehaviorNote.get(id)
        if (!behaviorNoteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'behaviorNote.label', default: 'BehaviorNote'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (behaviorNoteInstance.version > version) {
                behaviorNoteInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'behaviorNote.label', default: 'BehaviorNote')] as Object[],
                          "Another user has updated this BehaviorNote while you were editing")
                render(view: "edit", model: [behaviorNoteInstance: behaviorNoteInstance])
                return
            }
        }

        behaviorNoteInstance.properties = params

        if (!behaviorNoteInstance.save(flush: true)) {
            render(view: "edit", model: [behaviorNoteInstance: behaviorNoteInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'behaviorNote.label', default: 'BehaviorNote'), behaviorNoteInstance.id])
        redirect(action: "show", id: behaviorNoteInstance.id)
    }

    def delete(Long id) {
        def behaviorNoteInstance = BehaviorNote.get(id)
        if (!behaviorNoteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'behaviorNote.label', default: 'BehaviorNote'), id])
            redirect(action: "list")
            return
        }

        try {
            behaviorNoteInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'behaviorNote.label', default: 'BehaviorNote'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'behaviorNote.label', default: 'BehaviorNote'), id])
            redirect(action: "show", id: id)
        }
    }
}
