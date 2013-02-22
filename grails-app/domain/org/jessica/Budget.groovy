package org.jessica

class Budget {

    Session session
    Currency amount


    static constraints = {
        session()
        amount()
    }
}
