This repo contains matlab routines for generating original infiniminer worlds. The matlab routines can easily be transcoded into any language, it was just used for convenience (previewing the worlds). Another option is to get yourself a copy of "octave" which is an opensource matlab clone (http://www.gnu.org/software/octave/). Get a copy anyways, it is a great language for signal processing in S and Z domains. Anyways, pretty sure most of the routines will work eventually in octave without major changes, except for the klein bottle perhaps :)

Infiniminer worlds are cubes of 64x64x64 in size of which the outher edges are not used. So effectively, the world is 62x62x62 in size. The horizontal plane is the x-z plane, the height is coded as y (and stored as 64-y) . Finally, world files are text files containing two numbers per line separated by a comma. The first number represents the block type, the second number the team code.

Block types are:
EMPTY=0;DIRT=1;ORE=2;GOLD=3;DIAMOND=4;STONE=5;LADDER=6;
TNT=7;JUMP=8;SHOCK=9;BANKRED=10;BANKBLUE=11;BEACONRED=12;
BEACONBLUE=13;ROAD=14;SOLIDRED=15;SOLIDBLUE=16;STEEL=17;
DIGHERE=18;LAVA=19;FORCERED=20;FORCEBLUE=21;

Team codes are:
BLUETEAM=2;REDTEAM=1;NEUTRALTEAM=0;


The easiest way to generate a world is to start with two 64^3 cubes, one containing the block codes and one containing the team codes.

% make an empty world
level=zeros(64,64,64) + EMPTY;
team=zeros(64,64,64)  + NEUTRALTEAM;

Next, fill the cubes with whatever and write them to file using the routine SaveWorld. With LoadWorld you can load an existing world to alter. All the other routines are used to generate objects. Use ClipAdd to add an newly generated object to the world. LinearizeBox is used to strip the void from objects.


Guess I'm done with Infiniminer for now, it was fun, met some nice people and I wished I was there too when it all started. Infiniminer is too adictive and I gotta move on ...but maybe if somebody can explain the header info and the compression scheme used for P2 maps...

Cheers guys, Proshchaniye!

--Cafeteriaz
