package org.jessica

class Instructor {

    String firstName
    String lastName
    Course course
    String email
    String phoneNumber
    Boolean backgroundCheck
    String picture
    String employer

    static constraints = {
        firstName()
        lastName()
        course(nullable:true)
        email()
        phoneNumber()
        backgroundCheck()
        picture()
        employer()
    }
}
