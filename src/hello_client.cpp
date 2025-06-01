// hello_client.cpp
// #include <omniORB4/omniORB.h>
#include <iostream>
#include <omniORB4/CORBA.h>

#include "hello.hh"

int main(int argc, char** argv) {
	CORBA::ORB_var orb = CORBA::ORB_init(argc, argv, "omniORB4");

	CORBA::Object_var obj = orb->resolve_initial_references("RootPOA");
	PortableServer::POA_var poa = PortableServer::POA::_narrow(obj);

	PortableServer::Servant_var<_objref_Hello> myhello = new _objref_Hello();
	PortableServer::ObjectId_var myhelloid = poa->activate_object(myhello);

	Hello_var myhelloref = myhello->_this();

	// Activating POA
	PortableServer::POAManager_var pman = poa->the_POAManager();
	pman->activate();

	Hello(myhelloref);

	orb->destroy();
	return 0;
}
