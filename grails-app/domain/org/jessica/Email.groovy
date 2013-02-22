package org.jessica

class Email {

    String subject
    String body
    Session session
    Course course

    static constraints = {
        subject()
        body()
        session()
        course()
    }
}
