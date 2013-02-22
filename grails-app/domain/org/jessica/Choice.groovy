package org.jessica

class Choice {

    Student student
    Session session
    Course course

    static constraints = {
        student()
        session()
        course()
    }
}
