tpf-client
==========

![alt text](tpf-client.png "tpf-client")

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

You can download the client from:

  https://gitlab.zhdk.ch/TPF/tpf-client

The client is pre-configured to connect to a tpf-server
running on telematic.zhdk.ch (TCP-Port 3025) which is supposed
to be running anytime in the area of Zurich, Switzerland. The
tpf-server software can be found here:

  https://gitlab.zhdk.ch/TPF/tpf-server

Depending on the locations of the endpoints it is advised to
run a server closer to one of the endpoints in order to
keep transmission latency low.


Prerequisites
-------------

Make sure to get the latest Pure Data from:

  https://puredata.info/downloads/

You need the following externals to run tpf-client
  * iemnet
  * osc
  * slip

You can install externals through the Pd menu:
'Help' -> 'Find Externals'


Running the client
------------------

To run the client, open the patch tpf-client in Pure Data. Typically,
you run Pd with jack as audio backend, so that you can send audio from
and to the tpf-client to other software. When running from the command-
line, the recommended parameters are:

  pd -rt -jack -inchannels 8 -outchannels 65 -nojackconnect \
     -jackname tpf-client -open tpf-client/tpf-client.pd

Before connecting to the server, make sure to set a name in <Location>
and all parameters. The parameters sr (samplerate) and bs (blocksize)
must be the same for all clients. The first connecting client defines
the values of those parameters for the session. After configuring those
parameters the client can connect to the server by clicking the top
left button. Blue indicates connection is established. Red indicates that
some error occured. Check the message for the reason. Reasons for connection
failure include samplerate or name conflict (configured name is already in
use by someone else).

Once connected, other endpoints appear in one of the 8 rows. In order to
establish audio transmission, either of one side needs to initiate the
connection by clicking the black square in the left and the other side
has to confirm. A flashing button indicates the other side is waiting
for confirmation. Once the audio connection is established, the
corresponding button turns blue and the numbered squares indicate the
number of received channels and the level of each. The numbers on the
channel indicators correspond with the numbers in the qjackctl connection
dialog.

By double-clicking the left square, a request for a connection using
UDP hole punching is sent. When confirmed, a direct transmission between
endpoints without using the server as UDP proxy is established. However,
this feature is considered experimental and can't be used in certain
network environments.


Ready-to-use macOS app
----------------------

If your computer runs macOS, you may download a self-contained
application bundle from:

  https://gitlab.zhdk.ch/TPF/tpf-client/-/releases/


Bugs
----

  * tpf-client crashes Pd when receiving a stream with 3 channels

For any bug, issue, or suggestion, please open an issue [here](https://github.com/reduzent/tpf-client/issues).


Authors
-------

  * Roman Haefeli <roman.haefeli@zhdk.ch>
  * Johannes Schütt <johannes.schuett@zhdk.ch>


License
-------

  GPL 3.0 (see LICENSE.txt)

