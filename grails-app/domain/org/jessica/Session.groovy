package org.jessica

class Session {


    ArrayList<Date> dates
    String theme
    static hasMany = [courses : Course]





    static constraints = {
        dates()
        theme()
        courses()
    }
}
