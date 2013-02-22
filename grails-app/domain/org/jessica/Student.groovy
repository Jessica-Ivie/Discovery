package org.jessica

class Student {
    String firstName
    String lastName
    Integer grade
    String studentId
    static hasMany = [guardians : Guardian]


    static constraints = {
        firstName()
        lastName()
        grade()
        studentId()
        guardians(nullable:true)
    }
}
