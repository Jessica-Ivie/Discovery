package org.jessica

class Comment {

    String note
    Student student
    Course course

    static constraints = {
        note ()
        student()
        course()
    }
}
