package org.jessica

class Expense {

    Course course
    Date date
    Currency amount

    static constraints = {
        course()
        date()
        amount()
    }
}
