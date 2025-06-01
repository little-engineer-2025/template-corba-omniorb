// hello.cpp
#include <string>
#include "hello.hh"

class HelloImpl : public Hello {
    char* sayHello(const char* mesg) {
	    return CORBA::string_dup(mesg);
    }
};

