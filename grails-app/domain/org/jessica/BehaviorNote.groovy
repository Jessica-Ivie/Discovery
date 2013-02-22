package org.jessica

class BehaviorNote {
    Date date
    Course course
    Student student
    String note
    String resolution


    static constraints = {
        date()
        course()
        student()
        note()
        resolution()
    }
}
