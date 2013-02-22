package org.jessica

class Donation {

    Currency amount
    Guardian guardian
    Date date
    String note


    static constraints = {
        amount()
        guardian(nullable:true)
        date()
        note()
    }
}
