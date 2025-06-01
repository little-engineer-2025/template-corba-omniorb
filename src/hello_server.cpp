// hello_server.cpp

#include <omniORB4/CORBA.h>

#include "hello.hh"

int main(int argc, char** argv) {
	CORBA::ORB_var orb = CORBA::ORB_init(argc, argv);

	CORBA::Object_var obj = orb->resolve_initial_references("RootPOA");
	PortableServer::POA_var poa = PortableServer::POA::_narrow(obj);

	PortableServer::Servant_var<Echo_i> myhello = new HelloImpl();

	PortableServer::ObjectId_var myhelloid = poa->activate_object(myhello);

	obj = myhello->_this();
	CORBA::String_var sior(orb->object_to_string(obj));
	cerr << sior << endl;

	PortableServer::POAManager_var pman = poa->the_POAManager();
	pman->activate();

	orb->run();
	orb->destroy();
	return 0;
}

