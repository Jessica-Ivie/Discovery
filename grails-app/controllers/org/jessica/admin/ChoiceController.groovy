package org.jessica.admin

import org.jessica.Choice
import org.springframework.dao.DataIntegrityViolationException

class ChoiceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [choiceInstanceList: Choice.list(params), choiceInstanceTotal: Choice.count()]
    }

    def create() {
        [choiceInstance: new Choice(params)]
    }

    def save() {
        def choiceInstance = new Choice(params)
        if (!choiceInstance.save(flush: true)) {
            render(view: "create", model: [choiceInstance: choiceInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'choice.label', default: 'Choice'), choiceInstance.id])
        redirect(action: "show", id: choiceInstance.id)
    }

    def show(Long id) {
        def choiceInstance = Choice.get(id)
        if (!choiceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'choice.label', default: 'Choice'), id])
            redirect(action: "list")
            return
        }

        [choiceInstance: choiceInstance]
    }

    def edit(Long id) {
        def choiceInstance = Choice.get(id)
        if (!choiceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'choice.label', default: 'Choice'), id])
            redirect(action: "list")
            return
        }

        [choiceInstance: choiceInstance]
    }

    def update(Long id, Long version) {
        def choiceInstance = Choice.get(id)
        if (!choiceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'choice.label', default: 'Choice'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (choiceInstance.version > version) {
                choiceInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'choice.label', default: 'Choice')] as Object[],
                          "Another user has updated this Choice while you were editing")
                render(view: "edit", model: [choiceInstance: choiceInstance])
                return
            }
        }

        choiceInstance.properties = params

        if (!choiceInstance.save(flush: true)) {
            render(view: "edit", model: [choiceInstance: choiceInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'choice.label', default: 'Choice'), choiceInstance.id])
        redirect(action: "show", id: choiceInstance.id)
    }

    def delete(Long id) {
        def choiceInstance = Choice.get(id)
        if (!choiceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'choice.label', default: 'Choice'), id])
            redirect(action: "list")
            return
        }

        try {
            choiceInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'choice.label', default: 'Choice'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'choice.label', default: 'Choice'), id])
            redirect(action: "show", id: id)
        }
    }
}
