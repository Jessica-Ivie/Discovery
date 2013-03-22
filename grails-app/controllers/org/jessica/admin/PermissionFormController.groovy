package org.jessica.admin

import org.jessica.PermissionForm
import org.springframework.dao.DataIntegrityViolationException

class PermissionFormController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [permissionFormInstanceList: PermissionForm.list(params), permissionFormInstanceTotal: PermissionForm.count()]
    }

    def create() {
        [permissionFormInstance: new PermissionForm(params)]
    }

    def save() {
        def permissionFormInstance = new PermissionForm(params)
        if (!permissionFormInstance.save(flush: true)) {
            render(view: "create", model: [permissionFormInstance: permissionFormInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'permissionForm.label', default: 'PermissionForm'), permissionFormInstance.id])
        redirect(action: "show", id: permissionFormInstance.id)
    }

    def show(Long id) {
        def permissionFormInstance = PermissionForm.get(id)
        if (!permissionFormInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'permissionForm.label', default: 'PermissionForm'), id])
            redirect(action: "list")
            return
        }

        [permissionFormInstance: permissionFormInstance]
    }

    def edit(Long id) {
        def permissionFormInstance = PermissionForm.get(id)
        if (!permissionFormInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'permissionForm.label', default: 'PermissionForm'), id])
            redirect(action: "list")
            return
        }

        [permissionFormInstance: permissionFormInstance]
    }

    def update(Long id, Long version) {
        def permissionFormInstance = PermissionForm.get(id)
        if (!permissionFormInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'permissionForm.label', default: 'PermissionForm'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (permissionFormInstance.version > version) {
                permissionFormInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'permissionForm.label', default: 'PermissionForm')] as Object[],
                          "Another user has updated this PermissionForm while you were editing")
                render(view: "edit", model: [permissionFormInstance: permissionFormInstance])
                return
            }
        }

        permissionFormInstance.properties = params

        if (!permissionFormInstance.save(flush: true)) {
            render(view: "edit", model: [permissionFormInstance: permissionFormInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'permissionForm.label', default: 'PermissionForm'), permissionFormInstance.id])
        redirect(action: "show", id: permissionFormInstance.id)
    }

    def delete(Long id) {
        def permissionFormInstance = PermissionForm.get(id)
        if (!permissionFormInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'permissionForm.label', default: 'PermissionForm'), id])
            redirect(action: "list")
            return
        }

        try {
            permissionFormInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'permissionForm.label', default: 'PermissionForm'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'permissionForm.label', default: 'PermissionForm'), id])
            redirect(action: "show", id: id)
        }
    }
}
