package org.jessica

class Volunteer {

    String firstName
    String lastName
    String email
    String phoneNumber
    Session session
    Course preferredCourse

    static constraints = {
        firstName()
        lastName()
        email()
        phoneNumber()
        session()
        preferredCourse()
    }
}
