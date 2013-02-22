package org.jessica

class Course {

    String title
    String description
    Integer grade
    Instructor instructor
    String picture
    Integer sizeLimit
    Boolean requiresPermission
    Boolean needsTravel


    static constraints = {
        title()
        description (nullable:true)
        grade()
        instructor()
        picture()
        sizeLimit()
        requiresPermission()
        needsTravel()

    }
}
