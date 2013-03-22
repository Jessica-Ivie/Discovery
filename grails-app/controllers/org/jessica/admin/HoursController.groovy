package org.jessica.admin

import org.jessica.Hours
import org.springframework.dao.DataIntegrityViolationException

class HoursController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [hoursInstanceList: Hours.list(params), hoursInstanceTotal: Hours.count()]
    }

    def create() {
        [hoursInstance: new Hours(params)]
    }

    def save() {
        def hoursInstance = new Hours(params)
        if (!hoursInstance.save(flush: true)) {
            render(view: "create", model: [hoursInstance: hoursInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'hours.label', default: 'Hours'), hoursInstance.id])
        redirect(action: "show", id: hoursInstance.id)
    }

    def show(Long id) {
        def hoursInstance = Hours.get(id)
        if (!hoursInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'hours.label', default: 'Hours'), id])
            redirect(action: "list")
            return
        }

        [hoursInstance: hoursInstance]
    }

    def edit(Long id) {
        def hoursInstance = Hours.get(id)
        if (!hoursInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'hours.label', default: 'Hours'), id])
            redirect(action: "list")
            return
        }

        [hoursInstance: hoursInstance]
    }

    def update(Long id, Long version) {
        def hoursInstance = Hours.get(id)
        if (!hoursInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'hours.label', default: 'Hours'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (hoursInstance.version > version) {
                hoursInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'hours.label', default: 'Hours')] as Object[],
                          "Another user has updated this Hours while you were editing")
                render(view: "edit", model: [hoursInstance: hoursInstance])
                return
            }
        }

        hoursInstance.properties = params

        if (!hoursInstance.save(flush: true)) {
            render(view: "edit", model: [hoursInstance: hoursInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'hours.label', default: 'Hours'), hoursInstance.id])
        redirect(action: "show", id: hoursInstance.id)
    }

    def delete(Long id) {
        def hoursInstance = Hours.get(id)
        if (!hoursInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'hours.label', default: 'Hours'), id])
            redirect(action: "list")
            return
        }

        try {
            hoursInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'hours.label', default: 'Hours'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'hours.label', default: 'Hours'), id])
            redirect(action: "show", id: id)
        }
    }
}
