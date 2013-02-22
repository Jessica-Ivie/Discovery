package org.jessica

class PermissionForm {

    Course course
    Date date

    static constraints = {
        course()
        date(nullable:true)
    }
}
