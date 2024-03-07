# Automatic JACK connections
## From Ardour to tpf-client
All strips from the group `to_TPF` are connected to the inputs of
tpf-client until either the strips of the group named `to_TPF` or
the input channels of tpf-client are depleted.

## From tpf-client to Ardour
All outputs from the peer of the first slot are connected to the
inputs of the strip named LOC-A, the outputs of the seconds slot
to inputs of the strip named LOC-B, etc. This happens for each
peer slot until either the input channels of the strip in Ardour
or the number of outputs in tpf-client is depleted. Also, this
happens for as many peer slots as are available or as many input
strips following the LOC-X name scheme as are available.

# How tpf-client identifies Ardour strips for labelling and hiding/showing

## Group Inputs
The first two groups of strips is identified by their group name, namely
`Inputs`. Individual channels are identified by their strip ID.
## Group to_TPF
The mechanism for identifying those strips works similar to the group
`Inputs`.

## Peer strips (LOC-A, LOC-B, etc.)
The peer strips (the ones that collect all channels from a peer output
of tpf-client) are identified by their name. tpf-client can only deal with
those if they adhere to the naming convention:
  * LOC-A
  * LOC-B
  * LOC-C
  * etc.
tpf-client uses the strip's group label to display the peer's name.

## Strips in the Mixer group
This is st 


