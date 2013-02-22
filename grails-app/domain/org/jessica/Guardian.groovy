package org.jessica

class Guardian {
    String firstName
    String lastName
    String email
    String phoneNumber
    String addressLine1
    String addressLine2


    static constraints = {
        firstName()
        lastName()
        email()
        phoneNumber()
        addressLine1()
        addressLine2()
    }
}
