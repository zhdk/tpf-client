tpf-client
----------

NOTE: tpf-client is still in development and might break
      backwards compatibility. Make sure to always run the
      latest version available.


About
-----

tpf-client is a low-latency audio transmission software based
on the jacktrip protocol and built in Pure Data.

It tries to overcome some limitations that are often encountered
when using the traditional jacktrip commandline utility:

 * None of the endpoints are required to have a public IP address.
   All clients can be behind a firewall.

 * The tpf-client reduces complexity when configuring a session
   with many endpoints.

The client registers itself to a tpf-server which keeps track
of the connected clients. Thus the clients learn about the other
clients and establish a jacktrip audio connection to their
peers either by routing the packets through the tpf-server or
directly to the peer by employing a technique called UDP hole
punching (https://en.wikipedia.org/wiki/UDP_hole_punching).

For more information visit:

  https://gitlab.zhdk.ch/TPF/tpf-client

The client is pre-configured to connect to a tpf-server
running on telematic.zhdk.ch (TCP-Port 3025) which is supposed
to be running anytime. The tpf-server software can be found
here:

  https://gitlab.zhdk.ch/TPF/tpf-server


Installation
------------

Make sure to get the latest Pure Data from:

  https://puredata.info/downloads/

You need the following externals to run tpf-client
  * iemnet
  * osc
  * slip

You can install externals through the Pd menu:
'Help' -> 'Find Externals'


Authors
-------

  * Roman Haefeli <roman.haefeli@zhdk.ch>
  * Johannes Schütt <johannes.schuett@zhdk.ch>

License
-------

TO_BE_DEFINED

