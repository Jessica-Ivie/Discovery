package org.jessica.admin

import org.jessica.Guardian
import org.springframework.dao.DataIntegrityViolationException

class GuardianController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [guardianInstanceList: Guardian.list(params), guardianInstanceTotal: Guardian.count()]
    }

    def create() {
        [guardianInstance: new Guardian(params)]
    }

    def save() {
        def guardianInstance = new Guardian(params)
        if (!guardianInstance.save(flush: true)) {
            render(view: "create", model: [guardianInstance: guardianInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'guardian.label', default: 'Guardian'), guardianInstance.id])
        redirect(action: "show", id: guardianInstance.id)
    }

    def show(Long id) {
        def guardianInstance = Guardian.get(id)
        if (!guardianInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'guardian.label', default: 'Guardian'), id])
            redirect(action: "list")
            return
        }

        [guardianInstance: guardianInstance]
    }

    def edit(Long id) {
        def guardianInstance = Guardian.get(id)
        if (!guardianInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'guardian.label', default: 'Guardian'), id])
            redirect(action: "list")
            return
        }

        [guardianInstance: guardianInstance]
    }

    def update(Long id, Long version) {
        def guardianInstance = Guardian.get(id)
        if (!guardianInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'guardian.label', default: 'Guardian'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (guardianInstance.version > version) {
                guardianInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'guardian.label', default: 'Guardian')] as Object[],
                          "Another user has updated this Guardian while you were editing")
                render(view: "edit", model: [guardianInstance: guardianInstance])
                return
            }
        }

        guardianInstance.properties = params

        if (!guardianInstance.save(flush: true)) {
            render(view: "edit", model: [guardianInstance: guardianInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'guardian.label', default: 'Guardian'), guardianInstance.id])
        redirect(action: "show", id: guardianInstance.id)
    }

    def delete(Long id) {
        def guardianInstance = Guardian.get(id)
        if (!guardianInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'guardian.label', default: 'Guardian'), id])
            redirect(action: "list")
            return
        }

        try {
            guardianInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'guardian.label', default: 'Guardian'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'guardian.label', default: 'Guardian'), id])
            redirect(action: "show", id: id)
        }
    }
}
