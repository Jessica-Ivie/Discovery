package discovery

class UtilTagLib {

    def tabItem={attrs, body->
        def label= attrs.label
        if (attrs.controller?.equalsIgnoreCase(controllerName))  {
          out <<  "<li><a href=\"${attrs.controller}\" class=\"here\">${label}</a></li>"
        }
        else{
            out <<  "<li><a href=\"${attrs.controller}\">${label}</a></li>"
        }
    }

}
