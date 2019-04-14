"OBJECTS for
			      SUSPENDED
	(c) Copyright 1982 Infocom, Inc.  All Rights Reserved.
"

;"OBJECTS & ASSOCIATED ACTIONS FOR SUSPENDED"

<OBJECT HOME
	(IN CPU-ROOM)
	(FLAGS CONTBIT TOUCHBIT NDESCBIT)
	(DESC "HOME")
	(OBJDESCS <PLTABLE
1 1 1 1 1 1 "tall column""hollow column""electrical column""noiseless column""sweet home""CPU" 0 0 0 0 0 0>)
	(SYNONYM COLUMN HOME CPU DOOR)
	(CLC-TXT <PLTABLE "The column houses our supervisor and over-seeing control unit: YOU." "Keep the door to the column closed. Life-support wires run from the inner door surface directly to your body." "See the information on Franklin in your manual.">)
	(ADJECTIVE TALL HOLLOW ELECTR HIGH SWEET)
	(ACTION OOPS-FCN)>

<GLOBAL OOPS-QUIPS
	<PLTABLE "Okay, I've opened it. OH MY GOD!!!"
		"Grasping mechanisms have accomplished the task. Sonar detects -- BLECH!"
		"Sensory mechanisms indicate the door has been opened.|
WARNING! Biochemical electrical activity dropping!"
		"I hear the door opening and the heavy sigh of a human."
		"Okey Dokey. Man, you look like death warmed over!"
		"CLC indicates extreme danger to you, though the door has been opened.">>

<ROUTINE OOPS-FCN ()
	 <COND (<VERB? OPEN>
	        <ROBOT-TELL <GET ,OOPS-QUIPS ,ROFF>>
		<TELL
"As the door swings open you are blinded by intense light and incredible
pain. Just before everything overloads and you fade from existence, you can
make out a shape outside, holding onto the door of the cylinder, and then
everything goes dark." CR>
		<CRLF>
		<QUIT>)>>

<OBJECT PANEL
	(IN IRIS)
	(FLAGS CONTBIT NDESCBIT)
	(CAPACITY 16)
	(SYNONYM BARRIER PANEL MP1 DOOR)
	(ADJECTIVE MAINTE ACCESS SMOOTH METAL TRANSM)
	(DESC "panel")
	(ACTION PANEL-FCN)
	(CLC-TXT <PLTABLE "It is merely an openable panel." "Open the panel with care." 0>)
	(OBJDESCS <PLTABLE
"My eyestalks can't swivel that far."
"A maintenance panel can be detected beneath my extensions."
"Iris's central core is near exposure, the area from which all data is
transmitted." 0
"Exposure to the elemental realities, baring one's essence, is what Iris
is currently concerned with."
"CLC tagged object MP1 is now exposed."
"maintenance panel" "smooth metal panel" "transmission barrier"
"muted mechanism" "door" "MP1" 
"My maintenance panel has openings which fit a robot extension. Beneath it is my delicate visual circuitry."
"My extensions detect places which I can grasp to open it."
"The barrier itself emits no specific vibrations. It is inert."
"The object makes no sound, though muted noises come from beneath it."
"The door into Iris is like the window to our souls."
"MP1 is an internal plate, CLC tagged.">)>

<ROUTINE PANEL-FCN ("AUX" STR)
	 <COND (<VERB? LOOK EXAMINE>
		<COND (<AND <FSET? ,PANEL ,OPENBIT>
			    <NOT 
			    <EQUAL? <SET STR <GET <GETP ,PANEL ,P?OBJDESCS>
					  <+ ,RTOFF ,ROFF>>> 0>>>
		       <ROBOT-TELL .STR>
		       <TELL "The " D ,PANEL " is open." CR>
		       <RTRUE>)>)
	       (<VERB? OPEN>
		<COND (<NOT <WALDO?>>
		       <ROBOT-TELL "I'm not equipped to do that to the "<>>
		       <TELL D ,PANEL "." CR>
		       <RTRUE>)
		      (<NOT <FSET? ,SURGERY-HAND ,WEARBIT>>
		       <ROBOT-TELL 
			"It's too delicate for my normal extensions.">)
		      (,IRIS-FIXED
		       <ROBOT-TELL "Opened.">
		       <FSET ,PANEL ,OPENBIT>
		       <TELL CR <GET ,INTER-TBL 1>
				    " Hey! Who turned the lights out?" CR>
		       <SETG IRIS-FIXED <>>)>)
	       (<AND <VERB? CLOSE>
		     <NOT <WALDO?>>>
		<ROBOT-TELL "I'm not equipped to do that to the "<>>
		<TELL D ,PANEL "." CR>
		<RTRUE>)
	       (<VERB? CLOSE>
		<ROBOT-TELL "Closed.">
		<FCLEAR ,PANEL ,OPENBIT>
		<COND (<AND <IN? ,NEWCHIP1 ,PANEL>
			    <IN? ,CHIP2 ,PANEL>
			    <IN? ,CHIPS0 ,PANEL>>
		       <COND (<NOT ,IRIS-FIXED>
			      <SETG IRIS-FIXED T>
			      <TELL CR <GET ,INTER-TBL 1> 
				    " You never looked so good." CR>)>)
		      (T
		       <COND (,IRIS-FIXED
			      <SETG IRIS-FIXED <>>
			      <TELL CR <GET ,INTER-TBL 1> 
				    " Where'd everybody go?" CR>)>)>
		<RTRUE>)>>

<OBJECT CHIPS0
	(IN PANEL)
	(FLAGS TAKEBIT TOUCHBIT)
	(SYNONYM CHIPS CHIP DEVICE ZERO)
	(ADJECTIVE QUIET ZERO RED SMOOTH POLARI CX0 BRAIN)
	(OBJDESCS <PLTABLE 1 1 1 0 1 1 "red chip""smooth device""polarized device""quiet device""brain zero""CX0 chip" 0 0 0 0 0 0 >)
	(DESC "chip")
	(CLC-TXT <PLTABLE "This chip is a polarization processor (CX0)." 0 0>)
	(ACTION CHIPFILTER-FCN)>

<OBJECT CHIP1
	(IN PANEL)
	(SYNONYM CHIP CHIPS DEVICE UNO)
	(ADJECTIVE SCANNI BRAIN ROUGH BLUE SMALL DELICATE CX1)
	(OBJDESCS <PLTABLE 1 1 1 0 1 1 "blue chip" "rough device" "scanning device" "silent device" "brain uno" "CX1 chip" 0 0 "This device has been electrically fried." 0 0 0 "Electrons can no longer find flow paths through this brain." >)
	(FLAGS TAKEBIT TOUCHBIT)
	(DESC "obj")
	(CLC-TXT <PLTABLE "This chip is a scanning processor (CX1)." 0 0>)
	(ACTION CHIPFILTER-FCN)>

<OBJECT CHIP2
	(IN PANEL)
	(SYNONYM CHIP CHIPS DEVICE DOS)
	(ADJECTIVE NOISEL BRAIN BUMPY SMALL FILTERING YELLOW CX2)
	(OBJDESCS <PLTABLE 1 1 1 0 1 1 "small yellow chip""bumpy device"
"filtering device" "noiseless device""brain dos""CX2 chip"0 0 0 0 0 0 >)
	(FLAGS TAKEBIT TOUCHBIT)
	(DESC "obj")
	(CLC-TXT <PLTABLE "This chip is a filtering processor (CX2)." 0 0>)
	(ACTION CHIPFILTER-FCN)>

<OBJECT BASKET
	(IN SUPPLIES-MID)
	(FLAGS OPENBIT CONTBIT TAKEBIT SEARCHBIT)
	(SYNONYM CONTAI BASKET BA1)
	(ADJECTIVE HOLLOW SMALL OPEN)
	(DESC "BASKET")
	(CAPACITY 26)
	(OBJDESCS <PLTABLE
"Among the rubble I can see a little basket, sitting on the floor."
"I just bumped into a small object which has an open top."
"I perceive a small container which holds several small devices." 0
"Contained spirits, like thoughts, fly from reach."
"CLC tagged object BA1." "little wire basket" "hollow container" "small container" "soundless container" "basket of goodies for Grandma""BA1"
"It is a small, wire basket, designed for robot gripping extensions."
"It is made of woven wire and has a small handle which fits my extensions."
"The unique frame is suggested by the way it reflects electrons."
"Listening to it is boring."
"A tisket, a tasket, what's that in your basket?"
"CLC tagged object is a basket.">)
	(ACTION BASKET-FCN)>

<ROUTINE BASKET-FCN ()
	 <COND (<VERB? CLIMB-ON STAND-ON STEP-ON>
		<ROBOT-TELL "It won't support my weight.">
		<RTRUE>)>>

<OBJECT FIRST-FRIED
	(IN SOCKET1)
	(FLAGS TAKEBIT TOUCHBIT)
	(SYNONYM CHIPS CHIP DEVICE TRES)
	(ADJECTIVE SLEEPY TRES BURNED DISFIG RUINED CX3 BRAIN)
	(OBJDESCS <PLTABLE 1 1 1 0 1 1 "burned chip""disfigured device""ruined device""sleepy device""brain tres""CX3 chip" 0 0 0 0 0 0 >)
	(DESC "chip")
	(CLC-TXT <PLTABLE "This chip is a switching processor (CX3)." 0 0>)
	(ACTION CHIPFILTER-FCN)>

<OBJECT NEXT-FRIED
	(IN SOCKET2)
	(FLAGS TAKEBIT TOUCHBIT)
	(SYNONYM CHIPS CHIP DEVICE QUART)
	(ADJECTIVE SNOOZY QUART FRIED BUBBLY SEIZED CX4 BRAIN)
	(OBJDESCS <PLTABLE 1 1 1 0 1 1 "fried chip""bubbly device""seized device""snoozy device""brain quart""CX4 chip" 0 0 0 0 0 0 >)
	(DESC "chip")
	(CLC-TXT <PLTABLE "This chip is a replacement switching processor (CX4)." 0 0>)
	(ACTION CHIPFILTER-FCN)>

<OBJECT NEWCHIP1
	(IN BASKET)
	(FLAGS TAKEBIT TOUCHBIT)
	(SYNONYM IC OBJECT PLAIN)
	(ADJECTIVE RX1 BLUE ROUGH BRAIN SILENT SCANNI)
	(DESC "IC")
	(OBJDESCS <PLTABLE 1 1 1 0 1 1  "blue IC""rough object""scanning object""silent object""brain plain""RX1 IC"0 0 0 0 0 0 >)
	(ACTION CHIPFILTER-FCN)
	(CLC-TXT <PLTABLE "This chip is a replacement scanning processor (RX1)." 0 0>)>

<OBJECT NEWCHIP0
	(IN BASKET)
	(FLAGS TAKEBIT TOUCHBIT)
	(SYNONYM IC OBJECT ZIP)
	(ADJECTIVE RX0 RED SMOOTH QUIET BRAIN POLARI)
	(DESC "IC")
	(CLC-TXT <PLTABLE "This chip is a replacement polarization processor (RX0)." 0 0>)
	(OBJDESCS <PLTABLE 1 1 1 0 1 1 "red IC""smooth object""polarized object""quiet object""brain zip""RX0 IC" 0 0 0 0 0 0 >)
	(ACTION CHIPFILTER-FCN)>

<OBJECT NEWCHIP2
	(IN BASKET)
	(FLAGS TAKEBIT TOUCHBIT)
	(SYNONYM IC OBJECT TWO)
	(ADJECTIVE RX2 BRAIN BUMPY NOISEL YELLOW FILTERING)
	(DESC "IC")
	(OBJDESCS <PLTABLE 1 1 1 0 1 1 "yellow IC""bumpy object""filtering object""noiseless object""brain two""RX2 IC" 0 0 0 0 0 0 >)
	(ACTION CHIPFILTER-FCN)
	(CLC-TXT <PLTABLE "This chip is a replacement filtering processor (RX2)." 0 0>)>

<OBJECT NEWCHIP3
	(IN BASKET)
	(FLAGS TAKEBIT TOUCHBIT)
	(SYNONYM IC OBJECT TRIO)
	(ADJECTIVE RX3 GREEN WAVY NONVERBAL BRAIN MAXIMI)
	(DESC "IC")
	(CLC-TXT <PLTABLE "This chip is a replacement maximizing processor (RX3)." 0 0>)
	(OBJDESCS <PLTABLE 1 1 1 0 1 1 "green IC""wavy object""maximized object""nonverbal object""brain trio""RX3 IC" 0 0 0 0 0 0 >)
	(ACTION CHIPFILTER-FCN)>

<OBJECT NEWCHIP4
	(IN BASKET)
	(FLAGS TAKEBIT TOUCHBIT)
	(SYNONYM IC OBJECT QUARTE)
	(ADJECTIVE RX4 PLAID PEBBLE SHHHHH BRAIN BUSS)
	(DESC "IC")
	(CLC-TXT <PLTABLE "This chip is a replacement buss processor (RX4)." 0 0>)
	(OBJDESCS <PLTABLE 1 1 1 0 1 1 "plaid IC""pebbled object""buss object""shhhhh object""brain quartet""RX4 IC" 0 0 0 0 0 0 >)
	(ACTION CHIPFILTER-FCN)>

<ROUTINE CHIPFILTER-FCN ()
	 <COND (<AND <VERB? TAKE>
		     <IN? ,PRSO ,PANEL>
		     <NOT <FSET? ,PANEL ,OPENBIT>>>
		<CANT-DETECT ,PRSO>
		<RFATAL>)
	       (<VERB? PUT>
		<COND (<EQUAL? ,PRSI ,SOCKET1 ,SOCKET2>
		       <COND (<FIRST? ,PRSI>
			      <ROBOT-TELL "The " <>>
			      <TELL D ,PRSI " is already full." CR>
			      <RTRUE>)>
		       <MOVE ,PRSO ,PRSI>
		       <ROBOT-TELL "Done.">
		       <COND (<EQUAL? ,PRSO ,NEWCHIP1 ,NEWCHIP2>
			      <COND (<SENSA?>
				     <TELL "Surges of electricity flow." CR>)
				    (<POET?>
				     <TELL
"I can't place the tune, but I recognize the humming." CR>)
				    (<WHIZ?>
				     <TELL "Device now warming up." CR>)>)>
		       <RTRUE>)
		      (<EQUAL? ,PRSI ,IRIS>
		       <PERFORM ,PRSA ,PRSO ,PANEL>
		       <RTRUE>)>)>>
		
<OBJECT WIRECUTTER
	(IN TOPSHELF)
	(OBJDESCS <PLTABLE
"Sitting on the top shelf is a pair of wire cutters."
"Sonar detects a small tool which could be used for cutting, sitting on the top
shelf."
"Vibrational output from the top shelf shows a small metal object there."
0
"Among the various things in life I've learned, it's to examine all shelving.
This one has a slicer on it."
"CLC tagged object CU1 sits on top of the shelf."
"pair of cutters"
"cutting tool"
"metal tool"
"noiseless object"
"life slicer"
"CU1"
0 0 0 0 0 0>)
	(SYNONYM CU1 TOOL CUTTERS SLICER)
	(CLC-TXT <PLTABLE "This is a standard cutting instrument." "It can prove useful for salvaging wires and cables." 0>)
	(ADJECTIVE LIFE WIRE LITTLE CUTTING NOISEL METAL)
	(FLAGS TAKEBIT TOOLBIT)>

<OBJECT TOPSHELF
	(IN TOOL-AREA)
	(DESC "top shelf")
	(FLAGS OPENBIT CONTBIT TOUCHBIT SURFACEBIT)
	(OBJDESCS <PLTABLE 0 1 1 0 1 1 
0 "high extending holder" "stable holder" 0 "furthest holder" "TS"
0 "It appears to be a solid, long extension from the wall."
"It is inert, transmitting and receiving no vibrations." 0
"Perhaps the most useful adjunct to the modern, everyday living situation is
the proper use of space."
"TS appears to be little more than a piece of furniture.">)
	(SYNONYM TS HOLDER SHELF)
	(ACTION TOPSHELF-FCN)
	(ADJECTIVE HIGH EXTENDING TOP FURTHEST FARTHEST STABLE)
	(CAPACITY 50)>

<ROUTINE TOPSHELF-FCN ("AUX" TBL)
	 <COND (<AND <VERB? LOOK-INSIDE>
		     <NOT ,ON-WEDGE>>
		<ROBOT-TELL "It's too high up there.">)
	       (<VERB? CLOSE>
		<ROBOT-YUKS>
		<RTRUE>)>>

<OBJECT WEDGE
	(IN SUPPLIES-SOUTH)
	(SYNONYM WEDGE OBJECT RAMP W1)
	(ADJECTIVE NOISEL SOLID RISING FALLIN SLANTING DENSE)
	(FLAGS CLIMBBIT TAKEBIT SURFACEBIT FURNITURE)
	(OBJDESCS <PLTABLE
"A steep, wedge-shaped ramp sits under some rubble near the wall."
"A slanting object seems distinct from the surrounding jumble of
debris."
"Nothing within this environment emits singular vibrations, but an
object does send out a CLC identifier."
0
"To rise and fall, and climb new heights, to descend the pit of robot
despair."
"CLC object W1 transmitting identifier wave from this location." 
"ramp"
"solid wedge"
"dense wedge"
"noiseless wedge"
"slanting wedge"
"W1"
"It looks like a useful wedge, an incline which could be used for
getting up and down areas where steps might stop us."
"It feels solid and sturdy. It is large enough for me to use as a ramp."
"The object is totally inert, emitting nothing but an identifier signal
on the CLC channel."
0
"Much like see-saws of our lives, this provides the opportunity to
descend and rise above our normal stations, oh slanter."
"CLC data indicate this wedge is normally used for descent and climbing
from level to level.">)
	(ACTION WEDGE2-FCN)
	(CLC-TXT <PLTABLE 0 "This 'wedge' can be used as a step or small platform." 0>) 
	(SIZE 15)>

<ROUTINE WEDGE2-FCN ("AUX" OFFSET)
	 <SET OFFSET <GETP ,WINNER ,P?ROBOT>>
	 <COND (<VERB? CLIMB-ON>
		<COND (<IN? ,WEDGE ,WINNER-HERE>
		       <COND (<NOT ,ON-WEDGE>
			      <SETG ON-WEDGE .OFFSET>
			      <ROBOT-TELL "Okay. I'm standing on the " <>>
			      <TELL D ,WEDGE " now." CR>
			      <RTRUE>)
			     (ELSE
			      <COND (<EQUAL? .OFFSET ,ON-WEDGE>
				     <ROBOT-TELL "I'm already on it.">)
				    (ELSE
      <ROBOT-TELL "Not while another robot is already on it.">)>
			      <RTRUE>)>)
		      (ELSE 
		       <COND (<IN? ,WEDGE ,WINNER>
			      <ROBOT-TELL "Not while I'm grasping it.">)
			     (ELSE
			      <CANT-DETECT ,WEDGE>
			      <RTRUE>)>)>)
	       (<AND <VERB? TAKE>
		     ,ON-WEDGE>
		<COND (<EQUAL? .OFFSET ,ON-WEDGE>
		       <TELL "(getting off " D ,WEDGE ")" CR>
		       <SETG ON-WEDGE <>>
		       <RFALSE>)
		      (ELSE
		       <ROBOT-TELL "Not while another robot is on it.">
		       <RTRUE>)>)
	       (<VERB? TAKE-OFF>
		<PERFORM ,V?GET-OFF ,PRSO>
		<RTRUE>)>>
	       
;<OBJECT EMPTYSHELF
	(IN SUPPLIES-SOUTH)
	(DESC "EMPTY SHELF")
	(FLAGS OPENBIT CONTBIT TOUCHBIT SURFACEBIT NDESCBIT)
	(OBJDESCS <PLTABLE
1 1 1 0 1 1
"shelf" "wall extension" "inert surface" 0 "surface" "S-3"
0 0 0 0 0 0>)
	(SYNONYM SHELF SURFAC S-3)
	(ADJECTIVE WALL EXTENS INERT)>

<OBJECT SURGERY-HAND
	(IN SUPPLIES-MID)
	(FLAGS TOOLBIT TAKEBIT WEARABLEBIT)
	(SYNONYM MH1 EXTENS GRASPER OBJECT)
	(ADJECTIVE ARM-SHAPED MICROSURGERY SMALL USABLE MICRO TINGIN)
	(OBJDESCS <PLTABLE
"Sitting on the floor, beneath the broken shelves, sits an extension device,
a microsurgery hand."
"Sonar detects an arm-shaped extension lying nearby."
"A small object emits a weak signal, specifically oriented toward
Waldo." 
"I can hear a small 'tinging' from an object on the floor."
"It is something we can all grasp, something to embrace, whose presence I
detect."
"CLC tagged object MH1 emitting identifier signal."
"microsurgery extension"
"usable extension"
"micro extension"
"tinging object"
"grasper"
"MH1"
"It looks like a delicate extension to me."
"I feel the extension and recognize it as belonging to me. I can utilize
it for microsurgery repairs."
"It emits electrical impulses which are attuned to Waldo, and only
Waldo."
"The pinging or tinging sound it emits is on the wavelength attuned to
Waldo."
"A problem to grapple with, a handy solution, and an extension of Waldo
in his incarnation."
"CLC tagged object offers no further data unless CLC accessed directly." > )
	(CLC-TXT <PLTABLE 0 "It looks like a simple waldo for Waldo, in a sense. It has small extensions on it which could probably be used for micro-surgery or something like that." 0>)
	(ACTION WALDO-ONLY-FCN)>

<ROUTINE WALDO-ONLY-FCN ()
	 <COND (<AND <NOT <WALDO?>>
		     <VERB? WEAR>>
		<ROBOT-TELL "I'm not equipped to do that.">
		<RTRUE>)>>
	
<OBJECT CABINET
	(IN REPAIR3)
	(FLAGS CONTBIT)
	(DESC "cabinet")
	(SYNONYM CAGE CB3 CABINE OBJECT)
	(ADJECTIVE LARGE HOLLOW EMITTING CIRCUI)
	(ACTION CABINET-FCN)
	(CAPACITY 100)
	(OBJDESCS <PLTABLE 0
"A large object sits before me. Sonar indicates it is hollow, but not
empty."
"A large object emits strange flows, its surface a tracery of filament-like
circuitry. The circuitry is concentrated near the center of one side."
0
"A cage to hold our ancestry sits on the floor, meek and timid, yet unwilling
to openly share."
"CLC tagged object CB3 located within this environment."
0 "hollow object" "large object" 0 "cage" "CB3"
0 0  
"Concentrated on the front surface of the large object is a flowswitch." 0 
"Further information regarding the cage can be gained if I touch it." 0 
"Data bits flow within the surface of the cage, concentrated in a circle.">)
	(CLC-TXT <PLTABLE "This container has a special locking mechanism." "Poet and Sensa can both perceive special characteristics of it." 0>)>

<ROUTINE CABINET-FCN ()
	 <COND (<VERB? OPEN>
		<ROBOT-TELL "I don't detect any easy way to do that.">
		<RTRUE>)
	       (<AND <OR <POET?> <SENSA?>>
		     <VERB? TOUCH EXAMINE>>
		<FCLEAR ,FLOWSWITCH ,INVISIBLE>
		<RFALSE>)
	       (<AND <VERB? CLOSE>
		     <FSET? ,CABINET ,OPENBIT>>
		<SETG FLOWSWITCH-TURNED <>>
		<RFALSE>)>>

<OBJECT FLOWSWITCH
	(IN REPAIR3)
	(FLAGS INVISIBLE NDESCBIT TURNBIT)
	(DESC "flowswitch")
	(SYNONYM PLATES FLOWSWITCH SWITCH CIRCLE)
	(ADJECTIVE FLOW ROUND)
	(OBJDESCS <PLTABLE
0 0 "flowswitch" 0 "lock" 0
"flowswitch" "flowswitch" "flowswitch" "flowswitch" "lock" "flowswitch"
0 0 
"The flowswitch is a series of plates which must be properly lined up to allow
proper electron flow." 0 
"This is actually a flowswitch which must be turned, allowing proper
electron flow." 0 
"Sensa has the ability to turn the plates and detect when they are properly
aligned.">)
	(ACTION FLOWSWITCH-FCN)
	(CLC-TXT <PLTABLE "The flowswitch is actually electrical 'plates' of polarity which can be properly aligned." 0 0>)>

<GLOBAL FLOWSWITCH-TURNED <>>

<ROUTINE FLOWSWITCH-FCN ()
	 <COND (<VERB? TURN>
		<COND (<NOT <SENSA?>>
		       <ROBOT-TELL "I can't seem to make it work.">)
		      (T
		       <COND (,FLOWSWITCH-TURNED
			      <ROBOT-TELL "It's already been turned.">)
			     (ELSE
			      <SETG FLOWSWITCH-TURNED T>
			      <FSET ,CABINET ,OPENBIT>
     <ROBOT-TELL "The flow of electrons aligns and the panel opens.">
                              <FSET ,CABINET ,TOUCHBIT>
			      <TELL <GET <GETP ,DEADBOT ,P?OBJDESCS> ,ROFF> CR>
			      <RTRUE>)>)>)
	       (<AND <VERB? EXAMINE>
		     <SENSA?>>
		<ROBOT-TELL 
"I feel the vibrations running through this flowswitch. The outer plate and
the inner plates must be aligned properly for it to work.">)>>
	       
<OBJECT DEADBOT
	(IN CABINET)
	(SYNONYM MECHAN CONSTRUCT DEVICE FRED)
	(ADJECTIVE BROKEN UNTAGG)
	(FLAGS TAKEBIT)
	(SIZE 200)
	(ACTION DEADBOT-FCN)
	(OBJDESCS <PLTABLE 0
"An open mechanism with similar parts to myself sits here, totally immobile."
"Miles of circuitry rest within the device sitting here, though it no longer
seems operational."
"A broken construct sits here, totally immobile."
"There once was a robot named Fred,|
Who never conceived being dead.|
  But late in the night,|
  A terrible fright|
Left him clearly without his own head."
"There is a device here which the CLC cannot identify."
0
"broken mechanism"
"broken device"
"broken construct"
"FRED"
"device the CLC cannot identify"
0 0 0 0 0 0>)
	(CLC-TXT <PLTABLE "This robot is a dead and departed robot who is totally beyond repair." "There may be some salvageable parts inside it." "This robot was an all-purpose, multi-function robot which proved inadequate for maintenance purposes.">)>

<ROUTINE DEADBOT-FCN ()
	 <COND (<VERB? TAKE PUT-ON>
		<ROBOT-TELL "I can't manage it. The " <>>
		<TELL D ,DEADBOT " is too heavy." CR>
		<RTRUE>)
	       (<VERB? MOVE>
		<ROBOT-TELL "I tried, but I failed.">
		<RTRUE>)
	       (<VERB? EXAMINE>
		<COND (<AND <NOT <FSET? ,REDWIRE ,TOUCHBIT>>
			    <IN? ,DEADBOT ,REPAIR3>>
		       <ROBOT-TELL "There's a " <>>
		       <TELL D ,REDWIRE " here that might prove useful." CR>
		       <RTRUE>)
		      (T <RFALSE>)>)>>

<OBJECT REDWIRE
	(IN REPAIR3)
	(FLAGS CUTABLEBIT INVISIBLE TAKEBIT)
	(DESC "wire")
	(OBJDESCS <PLTABLE
1 
"I can feel a bunch of smooth wire coming out of the mechanism."
"A group of conductors extend from the once-electronic mechanism."
"The broken device seems beyond repairing." 
"The currents of life are easily visible now."
"A CR streams out of the untagged device."  
"twelve-inch red cable"
"twelve-inch cable"
"twelve-inch cable"
"twelve-inch cable"
"twelve-inch cable"
"twelve-inch cable"
0 0 0 0 0 0>)
	(ADJECTIVE SMOOTH BUNCH CURRENT GROUP TWELVE)
	(SYNONYM WIRE LIFE CONDUC CABLE)
	(ACTION REDWIRE-FCN)>

<ROUTINE REDWIRE-FCN ()
	 <COND (<AND <VERB? TAKE REMOVE REPLACE>
		     <NOT <FSET? ,REDWIRE ,CUTBIT>>>
		<ROBOT-TELL "The " <>>
		<TELL D ,REDWIRE " is firmly attached to the " D ,DEADBOT
		      ". I'll need a tool to remove it." CR>
		<RTRUE>)
	       (<AND <VERB? CUT>
		     <EQUAL? ,PRSI ,SURGERY-HAND>>
		<ROBOT-TELL "The " <>>
		<TELL D ,REDWIRE " is too thick and would ruin the "
		      D ,SURGERY-HAND "." CR>)
	       (<AND <VERB? PUT PUT-ON>
		     <IN? ,WINNER ,TUBE2>
		     <EQUAL? ,PRSI ,GROOVE2>
		     <NOT <IN? ,REDCABLE ,GROOVE2>>>
		<SETG REDSET ,REDWIRE>
		<RFALSE>)>>

<OBJECT CAR
	(IN HALL-END)
	(FLAGS VEHBIT)
	(DESC "vehicle")
	(OBJDESCS <PLTABLE 0
"Sonar also detects a large hollow container sitting at the head of the long
tunnel."
"Sensors detect an egg-shaped object, large enough for me to enter, sitting at
the head of the long tunnel."
"The crackling ozone is muffled by a large object sitting before it."
"Before me sits a carriage of ancient splendor."
"Mobile CLC tagged object CAR is at the head of the tunnel."
0 "container" "egg-shaped object" "large object" "carriage" "CAR"
0 0 0 0 0 0 "The carriage is a complex mechanism capable of transporting one robot at a time over large distances and is in good working order." >)
	(ACTION CAR-FCN)
	(SYNONYM CONTAI OBJECT CARRIAGE CAR)
	(ADJECTIVE HOLLOW LARGE MOBILE EGG-SHAPED)
	(CLC-TXT <PLTABLE "Operating this vehicle is as simple as entering it." "Use this to get to the Biological Area and back." "This device was introduced after maintaining the Biological Area became necessary.">)>

<ROUTINE CAR-FCN ("OPTIONAL" (RARG ,M-OBJECT))
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL "Through the " D ,CAR " I can detect the following:" CR>
		<TELL <GET <GETP <LOC ,CAR> ,P?ROOMDESCS> ,ROFF> CR> <RTRUE>)
	       (<EQUAL? .RARG ,M-BEG>
		<COND (<AND <VERB? TAKE>
			    <IN? ,PRSO ,WINNER-HERE>>
		       <ROBOT-TELL "I can't reach it from here."> <RTRUE>)
		      (<AND <VERB? DROP>
			    <IN? ,PRSO ,WINNER>>
		       <ROBOT-TELL 
			"There's no convenient place to put anything down.">
		       <RTRUE>)
		      (<VERB? THROW>
		       <COND (<IN? ,PRSO ,WINNER>
			      <ROBOT-TELL "Thrown.">
			      <MOVE ,PRSO <LOC ,CAR>>
			      <RTRUE>)
			     (ELSE
			      <CANT-DETECT ,PRSO>
			      <RTRUE>)>)
		      (<VERB? WALK WALK-TO FOLLOW MOVE-ROBOT-TO-LOC>
		       <ROBOT-TELL 
			"An unlikely request, considering where I am.">)>)
	       (<EQUAL? .RARG ,M-OBJECT>
		<COND (<VERB? LOOK-INSIDE>
		       <COND (<NOT <EQUAL? ,CAR-FULL 0>>
			      <ROBOT-TELL  "I can detect " <>>
			      <TELL D ,CAR-FULL>
			      <TELL " inside the " D ,CAR "." CR>)
			     (ELSE
			      <ROBOT-TELL 
			       "I can detect nothing inside of it.">)>
		       <RTRUE>)>)>>

<OBJECT WDIAL1
	(IN WEATHER)
	(FLAGS TOUCHBIT NDESCBIT TURNBIT)
	(DESC "first dial")
	(OBJDESCS <PLTABLE
0 1 1 0 1 1 
0 "first dial" "first dial" "first dial" "first dial" "first dial"
0 "I can feel gradations etched into the dial which go from 0 to 100." "The dial is a variable potentiometer which has 100 settings." 0 "The dial can be set from 0 to 100 and is in proper working order."0"The dial is in working order.">)
	(SYNONYM DIAL)
	(ADJECTIVE FIRST)
	(DIAL 1)
	(CLC-TXT <PLTABLE "It is a simple dial with numbers etched into its surface." "Turn these dials to override the FCs and set the pressure manually." 0>)>

<OBJECT WDIAL3
	(IN WEATHER)
	(FLAGS NDESCBIT TOUCHBIT TURNBIT)
	(DESC "third dial")
	(OBJDESCS <PLTABLE
0 1 1 0 1 1
"third dial" "third dial" "third dial" "third dial" "third dial" "third dial"
0 "I can feel gradations etched into the dial which go from 0 to 100." "The dial is a variable potentiometer which has 100 settings." 0 "The dial can be set from 0 to 100 and is in proper working order." 0 "The dial is in working order.">)
	(SYNONYM DIAL)
	(ADJECTIVE THIRD)
	(DIAL 3)
	(CLC-TXT <PLTABLE "It is a simple dial with numbers etched into its surface." "Turn these dials to override the FCs and set the pressure manually." 0>)>

<OBJECT WDIAL2
	(IN WEATHER)
	(FLAGS TOUCHBIT NDESCBIT TURNBIT)
	(DESC "second dial")
	(OBJDESCS <PLTABLE
0 1 1 0 1 1
0 "second dial" "second dial" "second dial" "second dial" "second dial"
0 "I can feel gradations etched into the dial which go from 0 to 100." "The dial is a variable potentiometer which has 100 settings." 0 "The dial can be set from 0 to 100 and is in proper working order." 0 "The dial is in working order.">)
	(SYNONYM DIAL)
	(ADJECTIVE SECOND)
	(DIAL 2)
	(CLC-TXT <PLTABLE "It is a simple dial with numbers etched into its surface." "Turn these dials to override the FCs and set the pressure manually." 0>)>

<OBJECT CLONESWITCH
	(IN CRYOUNITS)
	(FLAGS NDESCBIT TURNBIT)
	(DESC "switch")
	(SYNONYM ROD SWITCH)
	(ADJECTIVE ELECTR LARGE STRAIG)
	(OBJDESCS <PLTABLE
0 1 1 0 1 1
0 "switch""switch""switch""switch""switch"
0 0 0 0 0 0>)
	(ACTION CLONESWITCH-FCN)>

<ROUTINE CLONESWITCH-FCN ()
	 <COND (<AND <VERB? THROW>
		     <EQUAL? ,PRSI ,WHEEL ,CLONESWITCH>>
		<RFALSE>)
	       (<VERB? TOUCH TURN THROW PUSH SET MOVE TAKE>
		<COND (,ON-WEDGE
		       <ROBOT-TELL 
"It's still out of my reach. Perhaps a creature of larger proportions would be able to help turn this thing.">)
		      (T
		       <ROBOT-TELL "It's too far out of reach.">)>
		<RTRUE>)>>

<OBJECT WHEEL
	(IN FCMAINT)
	(FLAGS TURNBIT)
	(DESC "WHEEL")
	(SYNONYM WHEEL WH OBJECT DEVICE)
	(ADJECTIVE CIRCUL HISSIN MECHAN)
	(OBJDESCS <PLTABLE 0
"I can detect a wheel, high overhead, with tubular structures running out of it, much like pipes."
"I can detect the pressure backup regulating mechanism high overhead here as it regulates and monitors hydraulic pressures."
"I can hear the gurgling of liquid overhead as it rushes through pipes and a regulatory wheel high overhead."
"You press the first valve down, the acid goes round and round, oh oh oh oh, oh oh and it comes out here."
"CLC tagged regulatory device WH detected overhead." "wheel""wheel""wheel""wheel""wheel""WH" 0 0 0 0 0 0>)
	(ACTION CLONESWITCH-FCN)
	(CLC-TXT <PLTABLE "This wheel controls the cooling acids which circulate through the Filtering Computers." 0 0>)>

<OBJECT TV
	(IN BIO-LAB)
	(FLAGS TAKEBIT CONTBIT)
	(DESC "camera")
	(OBJDESCS <PLTABLE
1 
"Sitting on the floor is a small sphere which has a jack trailing from it."
"I can detect a small device which is capable of transmitting signals on the RF band."
0
"A device useful for getting me to become a star is located nearby."
"CLC tagged device TV1 sits on the floor by a table."
"television camera" "small sphere" "transmitter" "television camera" "sender" "TV1"
0
"There are small grasping areas on it which correspond to my graspers."
"The device needs to be plugged in in order for it to be operational."
"It makes no sounds."
"Hey, baby, hang around Schwab's long enough and ... who knows?"
"This device seems linked with Iris.">)
	(SYNONYM TRANSM SENDER DEVICE SPHERE)
	(CLC-TXT <PLTABLE "This is a complex television camera which links directly to Iris." "It can be activated by plugging it in at the correct location." 0>)
	(ADJECTIVE PROJECTION TV1 SMALL CAMERA JACK TV TELEVI)
	(ACTION TV-FCN)>

<GLOBAL TV-QUIPS
	<PLTABLE
0
"I detect a vibration from it as it comes on."
"Electricity flows and RF transmissions begin."
"I hear it click on."
"We're on location, all systems go."
"CLC indicates object now functioning.">>

<ROUTINE TV-FCN ()
	 <COND (<VERB? CLIMB-ON STAND-ON STEP-ON>
		<ROBOT-TELL "It won't support my weight.">
		<RTRUE>)
	       (<AND <VERB? PLUGIN>
		     <NOT <EQUAL? <LOC ,WINNER> ,TUBE1 ,TUBE2>>>
		<ROBOT-TELL "The jack doesn't fit anything in this area.">
		<RTRUE>)
	       (<VERB? PLUGIN>
		<COND (<AND ,PRSI
			    <NOT <EQUAL? ,PRSI ,TVHOLE>>>
		       <ROBOT-TELL "I can't plug it into that.">
		       <RTRUE>)
		      (<NOT <IN? ,TV ,WINNER>>
		       <ROBOT-TELL "I can't. I'm not holding it.">
		       <RTRUE>)
		      (,TV-ON
		       <ROBOT-TELL "It's already plugged in.">)
		      (T
		       <ROBOT-TELL "I've plugged it in. " <>>
		       <TELL <GET ,TV-QUIPS ,ROFF> CR>
		       <COND (<AND <NOT <FSET? ,IRIS ,CUTBIT>>
				   ,IRIS-FIXED>
			      <CRLF>
			      <TELL <GET ,INTER-TBL 1> 
				    " Receiving transmissions." CR>)>)>
		<SETG TV-ON T>)
	       (<VERB? OPEN>
		<ROBOT-TELL "It's not a jack-in-the-box, you know.">)
	       (<VERB? UNPLUG>
		<ROBOT-TELL "The " <>>
		<TELL D ,TV " has been unplugged." CR>
		<SETG TV-ON <>>)
	       (<AND <VERB? TAKE>
		     <NOT <FSET? ,TV ,TOUCHBIT>>>
		<GENERATE-CODES>
		<RFALSE>)>>
		     
<OBJECT REDCABLE
	(IN GROOVE2)
	(DESC "red cable")
	(SYNONYM CABLE)
	(ADJECTIVE FOUR-INCH)
	(FLAGS TAKEBIT TOUCHBIT)
	(ACTION REDCABLE-FCN)
	(OBJDESCS <PLTABLE
1 1 1 1 1 1 
"red four-inch cable""four-inch cable""four-inch cable""four-inch cable""four-inch cable""four-inch cable"
0 0 
"The electrical flow within this cable seems irregular." 0 
"The data transmissions within this cable are irregular. Immediate replacement
recommended." 0>)>

<OBJECT YELLOWCABLE
	(IN GROOVE2)
	(DESC "yellow cable")
	(SYNONYM CABLE)
	(ADJECTIVE EIGHTEEN)
	(FLAGS  TAKEBIT TOUCHBIT)
	(ACTION KILL-CABLE-FCN)
	(OBJDESCS <PLTABLE
0 1 1 1 1 1
"eighteen-inch yellow cable""eighteen-inch cable""eighteen-inch cable""eighteen-inch cable""eighteen-inch cable""eighteen-inch cable"
0 0 0 0 0 0>)>

<OBJECT GREENCABLE
	(IN GROOVE2)
	(DESC "green cable")
	(SYNONYM CABLE)
	(ADJECTIVE TEN-INCH)
	(FLAGS  TAKEBIT TOUCHBIT)
	(ACTION KILL-CABLE-FCN)
	(OBJDESCS <PLTABLE
0 1 1 1 1 1
"ten-inch green cable""ten-inch cable""ten-inch cable"
"ten-inch cable""ten-inch cable""ten-inch cable"
0 0 0 0 0 0>)>

<OBJECT PINKCABLE
	(IN GROOVE2)
	(DESC "pink cable")
	(SYNONYM CABLE)
	(ADJECTIVE SIX-INCH)
	(FLAGS  TOUCHBIT TAKEBIT)
	(ACTION KILL-CABLE-FCN)
	(OBJDESCS <PLTABLE
1 1 1 1 1 1
"pink six-inch cable""six-inch cable""six-inch cable"
"six-inch cable""six-inch cable""six-inch cable"
0 0 0 0 0 0>)>


<OBJECT WHITECABLE
	(IN GROOVE1)
	(DESC "white cable")
	(SYNONYM CABLE)
	(ADJECTIVE FIVE-I)
	(FLAGS  TAKEBIT TOUCHBIT)
	(ACTION KILL-CABLE-FCN)
	(OBJDESCS <PLTABLE
0 1 1 1 1 1
"white five-inch cable""five-inch cable""five-inch cable"
"five-inch cable""five-inch cable""five-inch cable"
0 0 0 0 0 0>)>
	
<OBJECT BLUECABLE
	(IN GROOVE1)
	(DESC "blue cable")
	(SYNONYM CABLE)
	(ADJECTIVE TWENTY)
	(FLAGS  TAKEBIT TOUCHBIT)
	(ACTION KILL-CABLE-FCN)
	(OBJDESCS <PLTABLE
0 1 1 1 1 1 
"twenty-inch blue cable""twenty-inch cable""twenty-inch cable""twenty-inch cable"
"twenty-inch cable""twenty-inch cable"
0 0 0 0 0 0>)>

<OBJECT BLACKCABLE
	(IN GROOVE1)
	(DESC "black cable")
	(SYNONYM CABLE)
	(ADJECTIVE NINETEEN)
	(FLAGS  TAKEBIT TOUCHBIT)
	(ACTION KILL-CABLE-FCN)
	(OBJDESCS <PLTABLE
0 1 1 1 1 1
"black nineteen-inch cable""nineteen-inch cable""nineteen-inch cable""nineteen-inch cable""nineteen-inch cable""nineteen-inch cable"
0 0 0 0 0 0>)>

<OBJECT ORANGECABLE
	(IN GROOVE1)
	(DESC "orange cable")
	(SYNONYM CABLE)
	(ADJECTIVE NINE-INCH)
	(FLAGS  TAKEBIT TOUCHBIT)
	(ACTION ORANGECABLE-FCN)
	(OBJDESCS <PLTABLE
1 1 1 1 1 1
"nine-inch orange cable""nine-inch cable""nine-inch cable"
"nine-inch cable""nine-inch cable""nine-inch cable"
0 0 
"This cable is not transmitting energy properly." 0 0 0  
"Data transmissions are highly irregular through this cable.">)>

<ROUTINE KILL-CABLE-FCN ()
	 <COND (<VERB? REPLACE TAKE>
		<JIGS-UP "Oh oh. Maybe I shouldn't have done that . . ." 
			 ,WINNER>)>>

<ROUTINE REDCABLE-FCN ()
	 <COND (<VERB? TAKE REPLACE>
		<FCLEAR ,REDCABLE ,NDESCBIT>
		<RFALSE>)>>

<ROUTINE ORANGECABLE-FCN ()
	 <COND (<VERB? TAKE REPLACE>
		<FCLEAR ,ORANGECABLE ,NDESCBIT>
		<RFALSE>)>>

<OBJECT GROOVE1
	(IN TUBE1)
	(FLAGS SURFACEBIT NDESCBIT CONTBIT OPENBIT SEARCHBIT)
	(CAPACITY 21)
	(DESC "groove")
	(CLC-TXT <PLTABLE "The groove contains four wires and has an exposed section which allows for easy replacement of cables." "Make sure you know which cables are live." "The grooves were placed in the channels for making easy replacing and diagnosing of cables.">)
	(OBJDESCS <PLTABLE
0 1 1 1 1 1 
"groove""groove""groove""groove""groove""groove"
0 0 0 0 0 0>)
	(ACTION GROOVE-FCN)
	(CONTFCN GROOVE-CONT)
	(SYNONYM GROOVE TRACK)>

<OBJECT GROOVE2
	(IN TUBE2)
	(FLAGS SURFACEBIT NDESCBIT CONTBIT OPENBIT)
	(CAPACITY 21)
	(DESC "groove")
	(OBJDESCS <PLTABLE
0 1 1 1 1 1 
"groove""groove""groove""groove""groove""groove"
0 0 0 0 0 0>)
	(ACTION GROOVE-FCN)
	(CONTFCN GROOVE-CONT)
	(SYNONYM GROOVE TRACK)
	(CLC-TXT <PLTABLE "The groove contains four wires and has an exposed section which allows for easy replacement of cables." "Make sure you know which cables are live." "The grooves were placed in the channels for making easy replacing and diagnosing of cables.">)>

<ROUTINE GROOVE-FCN ()
	 <COND (<VERB? LOOK EXAMINE>
		<ROBOT-TELL "There are "<>>
		<TELL N <CABLECOUNT ,PRSO> " " D ,CABLES " in the grooves. ">
		<TELL <GET ,CABLE-TBL ,ROFF> CR>
		<RTRUE>)>>

<GLOBAL CABLE-TBL
	  <PLTABLE
"The cables are actually exposed sections of larger cables. They each
terminate at a connector. The connector itself poses no problem and, from what
I can see, easy replacement should be possible."
"I can feel that the cables are actually snap-in modules which can easily be
replaced."
"Sensory mechanisms indicate that the cables are modular in construction and
can be snapped in and out for easy replacement."
"I can hear slight buzzing at a junction for each of the cables."
"Ah, what an age we live in when replacement parts are the way of things."
"CLC data indicates the cables are modular, exposed at this juncture for easy
replacement. CLC also warns that contact with inappropriate cable sections can
be fatal.">>

<ROUTINE GROOVE-CONT ()
	 <COND (<VERB? REPLACE TAKE>
		<COND (<OR <EQUAL? ,PRSO ,PINKCABLE ,YELLOWCABLE ,GREENCABLE>
			   <EQUAL? ,PRSO ,WHITECABLE ,BLACKCABLE ,BLUECABLE>>
		       <TELL "Sizzzzzzzzzle..." CR>
		       <JIGS-UP 
			"Oh oh. Maybe I shouldn't have done that . . ." 
			,WINNER>)
		      ;(<AND <VERB? REPLACE>
			    <OR <EQUAL? ,PRSI ,REDWIRE ,ORANGE-WIRE ,REDCABLE>
				<EQUAL? ,PRSI ,ORANGECABLE>>>
		       <COND (<EQUAL? ,WINNER-HERE ,TUBE2>
			      <SETG REDSET ,PRSI>)
			     (T
			      <SETG ORANGESET ,PRSI>)>
		       <RFALSE>)
		      ;(<AND <VERB? TAKE>
			    <OR <EQUAL? ,PRSO ,REDWIRE ,ORANGE-WIRE ,REDCABLE>
				<EQUAL? ,PRSO ,ORANGECABLE>>>
		       <COND (<EQUAL? ,WINNER-HERE ,TUBE2>
			      <SETG REDSET ,PRSI>)
			     (T
			      <SETG ORANGESET ,PRSI>)>
		       <RFALSE>)
		      ;(T
		       <ROBOT-YUKS>)>)>>

<OBJECT PEOPLE-CABINET
	(IN TOOL-AREA)
	(FLAGS CONTBIT TOUCHBIT)
	(DESC "storage cabinet")
	(SYNONYM CABINE CONTAI OBJECT BROTHE)
	(ADJECTIVE BIG SQUARE C9 SOUNDL STRANG)
	(OBJDESCS <PLTABLE 0 1 1 0 1 1
"storage cabinet" "square container" "strange container" "soundless object"
"big brother" "C9" 0 0 0 0 0 0>)
	(ACTION PEOPLE-CABINET-FCN)>

<ROUTINE PEOPLE-CABINET-FCN ()
	 <COND (<VERB? OPEN>
		<TELL "FC: Robots are restricted from opening this cabinet." CR>
		<RTRUE>)>>

<OBJECT TOOLBAG
	(IN PEOPLE-CABINET)
	(FLAGS TAKEBIT CONTBIT TOUCHBIT)
	(DESC "tool bag")
	(OBJDESCS <PLTABLE
1 1 1 1 1 1
"tool bag" "tiny container" "tool container" "jingling bag" "tool bag" "TB"
0 0 0 0 0 0>)
	(ACTION TOOLBAG-FCN)
	(SYNONYM BAG CONTAI TB)
	(ADJECTIVE TOOL JINGLI TINY)>
	
<ROUTINE TOOLBAG-FCN ()
	 <COND (<VERB? TAKE>
		<COND (<NOT <IN? ,TOOLBAG ,PEOPLE>>
		       <RFALSE>)
		      (T <ROBOT-TELL "The " <>>
		       <TELL D ,PEOPLE " won't let me take it." CR>
		       <RTRUE>)>)
	       (<VERB? OPEN>
		<ROBOT-TELL "I can't. It requires a human access code.">)>>

<OBJECT CONVEYERBELTA
	(IN REPAIR1)
	(FLAGS FURNITURE CONTBIT SURFACEBIT NDESCBIT OPENBIT TOUCHBIT)
	(CAPACITY 200)
	(DESC "BLT")
	(SYNONYM WALKWA MECHAN GLIDER BLT)
	(ADJECTIVE MOVING CONVEY NOISY)
	(OBJDESCS <PLTABLE 0 1 1 1 1 1 0 "walkway" "conveying mechanism" "noisy walkway" "glider" "BLT" 0 0 0 0 0 0>)
	(ACTION CONVEYERBELT-FCN)
	(CLC-TXT <PLTABLE "This moving belt is actually a repair belt." "Placing an object on the north-most end will result in a repaired object at the south-most end." 0>)>

<OBJECT CONVEYERBELTB
	(IN REPAIR2)
	(FLAGS FURNITURE CONTBIT SURFACEBIT NDESCBIT OPENBIT TOUCHBIT)
	(CAPACITY 200)
	(DESC "BLT")
	(SYNONYM WALKWA MECHAN GLIDER BLT)
	(ADJECTIVE MOVING CONVEY NOISY)
	(OBJDESCS <PLTABLE 0 1 1 1 1 1 0 "walkway" "conveying mechanism" "noisy walkway" "glider" "BLT" 0 0 0 0 0 0>)
	(ACTION CONVEYERBELT-FCN)
	(CLC-TXT <PLTABLE "This moving belt is actually a repair belt." "Placing an object on the north-most end will result in a repaired object at the south-most end." 0>)>

<OBJECT CONVEYERBELTC
	(IN REPAIR3)
	(FLAGS TOUCHBIT FURNITURE CONTBIT SURFACEBIT NDESCBIT OPENBIT)
	(CAPACITY 200)
	(DESC "BLT")
	(SYNONYM WALKWA MECHAN GLIDER BLT)
	(ADJECTIVE MOVING CONVEY NOISY)
	(OBJDESCS <PLTABLE 0 1 1 1 1 1 0 "walkway" "conveying mechanism" "noisy walkway" "glider" "BLT" 0 0 0 0 0 0>)
	(ACTION CONVEYERBELT-FCN)
	(CLC-TXT <PLTABLE "This moving belt is actually a repair belt." "Placing an object on the north-most end will result in a repaired object at the south-most end." 0>)>

<ROUTINE CONVEYERBELT-FCN ()
	 <COND (<EQUAL? ,PRSI ,CONVEYERBELTA ,CONVEYERBELTB ,CONVEYERBELTC>
		<COND (<VERB? TAKE>
		       <ROBOT-TELL "I can't. It's moving too fast.">
		       <RFATAL>)
		      (<VERB? PUT-ON>
		       <COND (<OR <GETP ,PRSO ,P?ROBOT>
				  <EQUAL? ,PRSO ,DEADBOT>>
			      <ROBOT-TELL "There's no way I can lift " <>>
			      <COND (<EQUAL? ,PRSO ,DEADBOT>
				     <TELL "the ">)>
			      <TELL D ,PRSO " that high." CR>
			      <RTRUE>)>
		       <SETG BELT-ON T>
		       <COND (<NOT <GET <INT I-BELT> ,C-ENABLED?>>
			      <ENABLE <QUEUE I-BELT 2>>)>
		       <COND (<EQUAL? ,PRSI ,CONVEYERBELTA>
			      <FSET ,PRSO ,FIXABLEBIT>
			      <RFALSE>)>)>)
	       (<VERB? LAMP-ON LAMP-OFF>
		<ROBOT-TELL "It will automatically activate when something has been placed on it.">
		<RTRUE>)>>

<OBJECT LEVER1
	(IN HYDRO)
	(FLAGS TOUCHBIT NDESCBIT TURNBIT)
	(DESC "first lever")
	(OBJDESCS <PLTABLE
0 1 1 0 1 1 
0 "first lever""first lever""first lever""first lever""first lever" 0
"I can feel gradations etched into the panel beside the lever which goes from 0 to 100." "Sensory mechanisms detect the internal electrical flow can be set from 0 to 100." 0 "From zip to a c-note, the levers may be set." 0>)
	(CLC-TXT <PLTABLE "This is a standard push-pull lever which controls the flow of water." 0 0>) 
	(SYNONYM LEVER)
	(ADJECTIVE FIRST WATER)
	(DIAL 4)
	(ACTION LEVER-FCN)>

<OBJECT LEVER3
	(IN HYDRO)
	(FLAGS NDESCBIT TOUCHBIT TURNBIT)
	(DESC "third lever")
	(OBJDESCS <PLTABLE
0 1 1 0 1 1
0"third lever""third lever""third lever""third lever""third lever"
0
"I can feel gradations etched into the panel beside the lever which goes from 0 to 100." "Sensory mechanisms detect the internal electrical flow can be set from 0 to 100." 0 "From zip to a c-note, the levers may be set." 0>)
	(CLC-TXT <PLTABLE "This is a standard push-pull lever which controls the intensity of lighting." 0 0>)
	(SYNONYM LEVER)
	(ADJECTIVE THIRD LIGHTI)
	(DIAL 6)
	(ACTION LEVER-FCN)>

<OBJECT LEVER2
	(IN HYDRO)
	(FLAGS TOUCHBIT NDESCBIT TURNBIT)
	(DESC "second lever")
	(OBJDESCS <PLTABLE
0 1 1 0 1 1
0 "second lever""second lever""second lever""second lever""second lever"
0
"I can feel gradations etched into the panel beside the lever which goes from 0 to 100." "Sensory mechanisms detect the internal electrical flow can be set from 0 to 100." 0 "From zip to a c-note, the levers may be set." 0>)
	(CLC-TXT <PLTABLE "This is a standard push-pull lever which controls the flow of minerals." 0 0>)
	(SYNONYM LEVER)
	(ADJECTIVE SECOND MINERAL)
	(DIAL 5)
	(ACTION LEVER-FCN)>



<ROUTINE LEVER-FCN ()
	 <COND (<VERB? PUSH MOVE>
		<PERFORM ,V?SET ,PRSO ,PRSI>
		<RTRUE>)>>

<OBJECT SWITCH1
	(IN RTD)
	(FLAGS NDESCBIT TOUCHBIT ONBIT)
	(DESC "first switch")
	(OBJDESCS <PLTABLE 0 1 1 0 1 1 "floaters switch" "first bump" "first device" "first switch" "first switch" "first switch" 0 0 0 0 0 0>)
	(SYNONYM SWITCH BUMP DEVICE BUMPS)
	(ADJECTIVE FIRST RAISED)
	(CLC-TXT <PLTABLE "This is a simple off-on switch which cuts all power to the airborne floaters." "Cut this switch only when no human beings are in the air." "This switch is commonly used for maintenance on the floaters.">)
	(ACTION RTD-SWITCH-FCN)>

<OBJECT SWITCH3
	(IN RTD)
	(FLAGS NDESCBIT TOUCHBIT ONBIT)
	(DESC "third switch")
	(OBJDESCS <PLTABLE 0 1 1 0 1 1 "walkway switch" "third bump" "third device" "third switch" "third switch" "third switch" 0 0 0 0 0 0>)
	(SYNONYM SWITCH BUMP BUMPS DEVICE)
	(ADJECTIVE THIRD RAISED)
	(CLC-TXT <PLTABLE "This off-on switch cuts all power to the moving walkways on the planet's surface." 0 0>)
	(ACTION RTD-SWITCH-FCN)>

<OBJECT SWITCH2
	(IN RTD)
	(FLAGS NDESCBIT TOUCHBIT ONBIT)
	(DESC "second switch")
	(OBJDESCS <PLTABLE 0 1 1 0 1 1 "autotaxi switch" "second bump" "second device" "second switch" "second switch" "second switch" 0 0 0 0 0 0>)
	(SYNONYM SWITCH BUMP BUMPS DEVICE)
	(ADJECTIVE SECOND RAISED)
	(CLC-TXT <PLTABLE "This simple off-on switch cuts all power to the auto-taxis which cruise the surface." 0 0>)
	(ACTION RTD-SWITCH-FCN)>
			  
<ROUTINE RTD-SWITCH-FCN ()
	 <COND (<VERB? THROW>
		<PERFORM ,V?SET ,PRSO ,PRSI>
		<RTRUE>)
	       (<VERB? TURN>
		<COND (<FSET? ,PRSO ,ONBIT>
		       <PERFORM ,V?LAMP-OFF ,PRSO>
		       <RTRUE>)
		      (ELSE
		       <PERFORM ,V?LAMP-ON ,PRSO>
		       <RTRUE>)>)>>

<OBJECT PLAQUE
	(IN STERILE-AREA)
	(FLAGS TAKEBIT)
	(DESC "plaque")
	(OBJDESCS <PLTABLE 1 "A small plaque sits by the wall, easily detectable by the relief etched into it." "A small plaque radiates heat, sitting by the wall." "A small plaque makes tinging noises here." "An advert sits waiting to be read." "A small PLQ sits here, looking very informative.""small plaque" "small plaque" "small plaque" "small plaque" "small advert" "small PLQ" 0 0 0 0 0 0>)
	(ACTION PLAQUE-FCN)
	(SYNONYM PLAQUE RELIEF ADVERT PLQ)
	(ADJECTIVE SMALL)>

<ROUTINE PLAQUE-FCN ()
	 <COND (<NOT <VERB? READ>>
		<RFALSE>)>
	 <COND (<IRIS?>
		<COND (<NOT ,IRIS-FIXED>
		       <ROBOT-TELL "Forget it, big boy. Fix me first.">)
		      (T
		       <ROBOT-TELL "Sure. Here goes...">
		       <CRLF>
		       <TELL
"This Underground Complex was designed and built by the Frobozz Engineering Company, makers of such fine products as One-Way (tm) Bus Tickets, Ozone Nozone, and \"Best in the East\", soon to be a Smello-vision (tm) release.|
|
Chief Designer/Architect: Michael Berlyn." CR>)>)
	       (<WALDO?>
		<ROBOT-TELL "Sure. Here... Lemme feel...|
|
It says Bumpity bump-bump, groove bump, dot dot bump, and so on. I'm sure Iris is more suited for reading, though." >)
	       (<SENSA?>
		<ROBOT-TELL "Sure. Let me sense it...|
|
It says emmak...|
|
I don't know. It seems to lose something in the translation. Iris might be more helpful in reading this." >)
	       (<AUDA?>
		<ROBOT-TELL "I hear you. It says TING TINKLE DE DONG TONG. Iris should be able to tell the difference between that and a doorbell.">)
	       (<POET?>
		<ROBOT-TELL "Sure.|
|
It says 'While traveling the highways and byways of life, one doesn't always have time to stop and look at the roadmap' I think.  (But what do I know? I can't read -- I learned all my philosophy by reductive absurdium. Talk to Iris and she'll read it for you.)" >)
	       (<WHIZ?>
		<ROBOT-TELL "Hmm.... That's a tough one.
|
Nope, sorry. I only read data banks. You must want Iris.">)>>

;<ROUTINE PLAQUE-FCN ()
	 <COND (<NOT <VERB? READ>>
		<RFALSE>)
	       (T
		<COND (<NOT <IRIS?>>
		       <ROBOT-YUKS>
		       <RTRUE>)
		      >)>>
		
<OBJECT CLONETUBES
	(IN CRYOUNITS)
	(FLAGS NDESCBIT TOUCHBIT)
	(DESC "large objects")
	(SYNONYM OBJECT CANIST)
	(ADJECTIVE LARGE)
	(OBJDESCS <PLTABLE 1 1 1 0 1 1 "large canisters""large canisters""large canisters""large canisters""large canisters""large canisters" 0 "They're hollow and each one contains a duplicate of you." "They contain a primitive life force (compared to me)." 0 "We all wonder about ourselves." "CLC indicates these are the clone units.">)>

<OBJECT HERRINGBONE
	(IN SUPPLIES-MID)
	(DESC "sixteen-inch cable")
	(FLAGS TAKEBIT TOUCHBIT)
	(SYNONYM CABLE)
	(ADJECTIVE BLUE SIXTEE) 
	(OBJDESCS <PLTABLE 1 1 1 0 1 1 "blue sixteen-inch cable"
	 "sixteen-inch cable""sixteen-inch cable""sixteen-inch cable""sixteen-inch cable""sixteen-inch cable" 0 0 0 0 0 0>)>

<OBJECT NOZZLE
	(IN DECON-CHAMBER)
	(DESC "nozzle")
	(SYNONYM NOZZLE PORT)
	(ADJECTIVE SMALL HISSIN)
	(FLAGS NDESCBIT TOUCHBIT)
	(OBJDESCS <PLTABLE 1 1 1 1 1 1 "nozzle""small nozzle""nozzle""small port""nozzle""nozzle" 0 0 0 0 0 0>)>

<OBJECT BENCH
	(IN STERILE-AREA)
	(DESC "benches")
	(SYNONYM BENCH BENCHE)
	(OBJDESCS <PLTABLE 1 1 1 1 1 1 "benches""benches""benches""benches""benches""benches" 0 0 0 0 0 0>)
	(FLAGS NDESCBIT TOUCHBIT)>

<OBJECT RAILING
	(IN CLC-CORE)
	(FLAGS NDESCBIT TOUCHBIT)
	(SYNONYM RAILIN)
	(OBJDESCS <PLTABLE 0 1 1 0 1 1 "railing""railing""railing""railing""railing""railing" 0 0 0 0 0 0>)
	(DESC "railing")>

<OBJECT SMASHED-BOX
	(IN SUPPLIES-SOUTH)
	(DESC "crushed box")
	(FLAGS TAKEBIT CONTBIT INVISIBLE TOUCHBIT)
	(CAPACITY 20)
	(SYNONYM BOX CBX MUSH CONTAI)
	(ADJECTIVE CRUSHE FLAT RUINED QUIET SMUSHE)
	(OBJDESCS <PLTABLE  "crushed box" "flat container" "ruined box" "quiet box" "smushed mush" "CBX"
 "crushed box" "flat container" "ruined box" "quiet box" "smushed mush" "CBX" 0 0 0 0 0 0>)
	(CLC-TXT <PLTABLE "This CBX contains all of the replacement cables for the FCs." "All replacements can be easily done." "The box was placed here for easy replacements.">)>

<OBJECT RUINED-CABLES
	(IN SMASHED-BOX)
	(FLAGS TAKEBIT TOUCHBIT)
	(DESC "backup cable")
	(SYNONYM CABLE BUC)
	(SIZE 8)
	(ADJECTIVE RUINED SMASHE BROKEN BACKUP)
	(OBJDESCS <PLTABLE 1 1 1 0 1 1 "backup cable""backup cable""backup cable""backup cable""backup cable" "BUC"
"This cable looks beyond hope, crushed almost beyond recognition."
"From what my sonar and touching mechanisms provide as feedback, this thing is flatter than Whiz's intelligence curve."
"This cable is no longer capable of transmitting electrical charges."
0 "Like, oh wow, run over by a steamroller." "The BUC no longer seems functional.">)> 
	  
<OBJECT BROKEN-SHELF
	(IN SUPPLIES-SOUTH)
	(DESC "broken shelf")
	(FLAGS TAKEBIT)
	(SIZE 500)
	(OBJDESCS <PLTABLE 
	 "A broken shelf lies on the floor in a terrible state, beyond use."
	 "Sonar detects a broken platform on the floor in an irregular heap."
	 0
	 0
	 "Everything cracks under pressure, sooner or later."
	 0 "broken shelf" "broken platform" "broken shelf" "broken shelf" "broken holder" "broken shelf" 0 0 0 0 0 0>)
	(SYNONYM SHELF PLATFORM)
	(ADJECTIVE BROKEN CRACKED)>

<OBJECT PERIPH1-OBJ
	(IN PERIPH-1)
	(FLAGS NDESCBIT TOUCHBIT)
	(SYNONYM PEDEST)
	(ADJECTIVE INDEX FIRST)
	(OBJDESCS <PLTABLE 0 1 1 0 1 1 "Index pedestal""Index pedestal""Index pedestal""Index pedestal""Index pedestal""Index pedestal" 0 
"It feels smooth to the touch. Whiz can plug into it."
"A tremendous amount of vibrations is being output from this device."
0
"How can one describe the totality of knowing?"
"The CLC indicates the pedestal is ready for my plugging in.">)
	(DESC "Index pedestal")>

<OBJECT PERIPH2-OBJ
	(IN PERIPH-2)
	(FLAGS NDESCBIT TOUCHBIT)
	(SYNONYM PEDEST)
	(ADJECTIVE TECHNI SECOND)
	(OBJDESCS <PLTABLE 0 1 1 0 1 1 "Technical pedestal""Technical pedestal""Technical pedestal""Technical pedestal""Technical pedestal""Technical pedestal"0 "It feels smooth to the touch and Whiz should be able to plug into it."
"A tremendous amount of vibrations is being output from this device."
0
"How can one describe the totality of knowing?"
"The CLC indicates the pedestal is ready for me to plug into.">)
	(DESC "Technical Pedestal")>

<OBJECT PERIPH3-OBJ
	(IN PERIPH-3)
	(FLAGS TOUCHBIT NDESCBIT)
	(SYNONYM PEDEST)
	(ADJECTIVE ADVISO THIRD)
	(OBJDESCS <PLTABLE 0 1 1 0 1 1 "Advisory pedestal""Advisory pedestal""Advisory pedestal""Advisory pedestal""Advisory pedestal""Advisory pedestal" 0 
"It feels smooth to the touch and appears to be an interface for Whiz."
"A tremendous amount of vibrations is being output from this device."
0
"How can one describe the totality of knowing?"
"The CLC indicates the pedestal is ready for my plugging in.">)
	(DESC "Advisory Pedestal")>

<OBJECT PERIPH4-OBJ
	(IN PERIPH-4)
	(FLAGS TOUCHBIT NDESCBIT)
	(SYNONYM PEDEST)
	(ADJECTIVE HISTOR FOURTH)
	(OBJDESCS <PLTABLE 0 1 1 0 1 1 "Historical pedestal""Historical pedestal""Historical pedestal""Historical pedestal""Historical pedestal""Historical pedestal" 0 
"It feels smooth to the touch and is an interface for Whiz."
"A tremendous amount of vibrations is being output from this device."
0
"How can one describe the totality of knowing?"
"The CLC indicates the pedestal is ready to be plugged into.">)
	(DESC "Historical Pedestal")>

<OBJECT DIALS
	(IN WEATHER)
	(SYNONYM DIALS)
	(DESC "dials")
	(OBJDESCS <PLTABLE 1 1 1 1 1 1 "dials""dials""dials""dials""dials""dials" 0 "The dials go from 0 to 100." 0 0 0 0>)
	(FLAGS NDESCBIT TOUCHBIT)>

<OBJECT G-LEVERS
	(IN HYDRO)
	(FLAGS TOUCHBIT NDESCBIT)
	(DESC "levers")
	(OBJDESCS <PLTABLE
0 1 1 0 1 1 
0 "levers""levers""levers""levers""levers" 0
"I can feel gradations etched into the panel beside the levers which goes from 0 to 100." "Sensory mechanisms detect the internal electrical flow can be set from 0 to 100." 0 "From zip to a c-note, the levers may be set." 0>)
	(CLC-TXT <PLTABLE "These are standard push-pull levers which control the flow of water, minerals and lighting." 0 0>) 
	(SYNONYM LEVERS)>

 <OBJECT BEDS
	 (IN SLEEP-CHAMBER)
	 (FLAGS NDESCBIT TOUCHBIT)
	 (DESC "flat beds")
	 (SYNONYM BED BEDS EXTENS HSP)
	 (ADJECTIVE FLAT)
	 (OBJDESCS <PLTABLE 0 1 0 0 1 1 "flat beds""flat extensions""flat beds""flat beds""flat beds" "HSP" 0 0 0 0 0 0>)
	 (CLC-TXT <PLTABLE 0 0 "These Human Sleeping Platforms were provided for human visitors.">)>
	 
<OBJECT CLONETABLE
	(IN BIO-LAB)
	(FLAGS NDESCBIT TOUCHBIT CONTBIT SURFACEBIT OPENBIT)
	(CAPACITY 50)
	(SYNONYM TABLE STRUCT EQUIPT)
	(ADJECTIVE WORK LARGE)
	(DESC "work table")
	(OBJDESCS <PLTABLE 0 1 0 0 1 0 "work table""work table""work table"
			  "work table""work table""work table" 0 0 0 0 0 0>)> 

<OBJECT MACHINE
	(IN SUPPLIES-NORTH)
	(FLAGS CONTBIT SEARCHBIT NDESCBIT TOUCHBIT)
	(DESC "machine")
	(OBJDESCS <PLTABLE 1 1 1 1 1 1 "machine" "medium-sized object" "strange machine" "silent machine""pretty processor""GG1" 0 0 0 0 0 0 "This machine is live with high voltage electrical current.">)
	(CAPACITY 33)
	(CLC-TXT <PLTABLE "This machine holds the 8 circles used to reset the Filtering Computers." "Once the panel is opened (by pressing the button), the eight code circles will be revealed. If the Filtering Computers are operational and balanced, keying in the two codes will result in a system reset." "This mechanism was provided for resetting the Filtering Computers.">)
	(SYNONYM MACHINE OBJECT PROCESSOR GG1)
	(ADJECTIVE MEDIUM STRANG PRETTY SILENT)
	(ACTION MACHINE-FCN)>

<ROUTINE MACHINE-FCN ()
	 <COND (<VERB? CLOSE OPEN>
		<ROBOT-TELL
"I don't see any way to accomplish that.">)>>

<OBJECT ORANGE-BUTTON
	(IN SUPPLIES-NORTH)
	(FLAGS NDESCBIT)
	(SYNONYM BUTTON NUTTOB SPOT B5)
	(DESC "button")
	(ADJECTIVE ORANGE RAISED NOISLE)
	(OBJDESCS <PLTABLE
1 1 1 0 1 1 
"orange button""raised spot""button"
"noiseless button""nottub""B5"
0 0 0 0 0 0 "The button is a switch which can be activated by pressing it.">)
	(ACTION ORANGE-BUTTON-FCN)
	(CLC-TXT <PLTABLE "The button is a simple switch, activated by pressing." "Press the button once the chips which regulate the device have been inserted." 0>)>

<ROUTINE ORANGE-BUTTON-FCN ()
	 <COND (<AND <VERB? PUSH>
		     <NOT <FSET? ,MACHINE ,OPENBIT>>>
		<COND (<AND <IN? ,NEWCHIP0 ,SOCKET1>
			    <IN? ,NEWCHIP2 ,SOCKET2>
			    <IN? ,FUSE ,MACHINE>>
		       <ROBOT-TELL <GET ,BUTTON-PRESS-TBL ,ROFF>>
		       <FCLEAR ,ORANGE-WIRE ,INVISIBLE>
		       <FCLEAR ,FUSE ,INVISIBLE>
		       <FSET ,MACHINE ,OPENBIT>
		       <RTRUE>)
		      (T
		       <ROBOT-TELL "Nothing happens.">)>)
	       (<VERB? PUSH>
		<ROBOT-TELL "Nothing happens.">)>>

<GLOBAL BUTTON-PRESS-TBL
	<PLTABLE
"Okay. I've pressed the button. The front panel popped open, exposing a series of eight little circles with letters written on them. The front panel bears further examination. A bunch of orange wire is exposed, and beside it, in the panel, rests a small glass fuse."
"Okay, I've pressed the raised area. Sonar detects a front panel has popped open. A fourteen-inch cable rests beside a small cylinder which is inside the panel, both of which sit side by side inside the machine. The front panel has eight raised circles on it."
"Okay, I've pressed it. Sensory mechanisms detect electrical energy is exposed, running through a fourteen-inch cable. In addition, a glass fuse has been exposed, resting beside the wire in the panel. The front panel is electrically intensive and has odd properties."
"Okay, I've pressed it. I hear the sound of metal hitting metal."
"Okey Dokey. All pressed nottub. However, this thing has flashed me, exposing
a fourteen-inch cable and a tube interrupter, like Frick and Frack, side by side. The front panel, like a little piano, rests within view."
"Check. It's been pressed and a fourteen-inch cable has been exposed as well
as a GF1.">>  

<OBJECT ORANGE-WIRE
	(IN MACHINE)
	(FLAGS INVISIBLE TAKEBIT TOUCHBIT)
	(DESC "orange wire")
	(OBJDESCS <PLTABLE 1 1 1 1 1 1 "fourteen-inch cable of orange wire" "fourteen-inch cable" "fourteen-inch cable" "fourteen-inch cable" "fourteen-inch cable" "fourteen-inch cable" 0 0 0 0 0 0 "This is a cable in good working order and can be used as a replacement when needed.">)
	(ACTION ORANGE-WIRE-FCN)
	(SYNONYM WIRE CABLE STRAND OBJECT)
	(ADJECTIVE FOURTE ORANGE SENDER CONDUC)>

<ROUTINE ORANGE-WIRE-FCN ()
	 <COND (<VERB? TAKE REPLACE>
		<COND (<AND <IN? ,FUSE ,MACHINE>
			    <IN? ,ORANGE-WIRE ,MACHINE>>
		       <ROBOT-TELL "I'm reaching for the " <>>
		       <TELL D ,ORANGE-WIRE "..." CR>
		       <JIGS-UP "Oh oh!|
|
FC: Sizzle, pop, and snap-crackly noises. The delicious smell of fried robot. Mmm Mmm." ,WINNER>)>)
	       (<AND <VERB? PUT PUT-ON>
		     <IN? ,WINNER ,TUBE1>
		     <NOT <IN? ,ORANGECABLE ,GROOVE1>>
		     <EQUAL? ,PRSI ,GROOVE2>>
		<SETG ORANGESET ,ORANGE-WIRE>
		<RFALSE>)>>

<OBJECT SOCKET1
	(IN SUPPLIES-NORTH)
	(FLAGS TOUCHBIT CONTBIT OPENBIT NDESCBIT)
	(DESC "first socket")
	(OBJDESCS <PLTABLE
1 1 1 0 1 1 "red socket" "first depression" "plus receptacle" 0 "primo socket" "S1"
0 0 0 0 0 0"Diagnostic circuits detect the need for working IC to be inserted.">)
	(SYNONYM SOCKET S1 DEPRESSION RECEPTACLE)
	(ADJECTIVE RED FIRST PLUS PRIMO)
	(CAPACITY 5)
	(CLC-TXT <PLTABLE "This socket is the exact size and shape to accept a microchip." 0 0>)
	(ACTION SOCKET-FCN)>

<OBJECT SOCKET2
	(IN SUPPLIES-NORTH)
	(FLAGS TOUCHBIT CONTBIT OPENBIT NDESCBIT)
	(CLC-TXT <PLTABLE "This socket is the exact size and shape to accept a microchip." 0 0>)
	(DESC "secondary socket")
	(OBJDESCS <PLTABLE 1 1 1 0 1 1 "yellow socket" "second depression"
"negative socket" 0 "secondary socket" "S2" 0 0 0 0 0 0 "Diagnostic circuits detect the need for a working IC to be inserted.">)
	(SYNONYM SOCKET S2 DEPRESSION RECEPTACLE)
	(ADJECTIVE NEGATIVE YELLOW SECOND)
	(CAPACITY 5)
	(ACTION SOCKET-FCN)>

<ROUTINE SOCKET-FCN ("AUX" TBL)
	 <COND (<VERB? CLOSE>
		<ROBOT-YUKS>)>>

<OBJECT FUSE
	(IN MACHINE)
	(FLAGS NDESCBIT TOUCHBIT TAKEBIT INVISIBLE)
	(DESC "FUSE")
	(OBJDESCS <PLTABLE
1 1 1 0 1 1 "glass fuse""small cylinder""glass fuse""noiseless cylinder"
"glass interrupter" "GF1" 0 0 "There is a little conductor inside of it which prevents circuits from overloading." 0 0 0 "The device, a simple 32 amp fuse, is in proper working order.">)
	(SYNONYM FUSE INTERRUPTER GF1 CYLINDER)
	(ADJECTIVE SMALL GLASS NOISEL)
	(SIZE 7)
	(CLC-TXT <PLTABLE 0 "This is a small glass fuse which should be removed before tampering with any exposed sections. After tampering with machine internals, the fuse should be put back into the machine." 0>)>

<OBJECT FRONT-PANEL
	(IN MACHINE)
	(FLAGS CONTBIT SURFACEBIT TOUCHBIT OPENBIT)
	(DESC "front panel")
	(SYNONYM PANEL PIANO)
	(ADJECTIVE FRONT)
	(OBJDESCS <PLTABLE 1 1 1 0 1 1 "front panel""front panel""front panel"
			  "front panel""piano""front panel"
"On the panel are a series of eight circles. Each of these circles has a three letter code printed on it. The three letters correspond to half of the Filtering Computers' reset code."
"The panel appears to be smooth, but I can detect eight raised circles on it."
"The panel has a lot of electrical circuitry going through it, with circuits traced to a series of eight areas."
0
"The front panel is a piano, with only eight circle keys."
"CLC indicates the FP is a mechanism designed to reset the Filtering Computers.">)
	(SIZE 1)>

<OBJECT CIRCLE1
	(IN FRONT-PANEL)
	(DESC "FOO")
	(SYNONYM CIRCLE KEY)
	(ADJECTIVE FIRST FOO)
	(OBJDESCS <PLTABLE 1 1 1 0 1 1 "first circle""first circle""first circle""first circle""first circle""first circle" "The circle has some lettering on it which says FOO." 0 0 0 0 0>)
	(ACTION CIRCLE-FCN)
	(SIZE 1)>

<OBJECT CIRCLE8
	(IN FRONT-PANEL)
	(DESC "TRA")
	(SYNONYM CIRCLE KEY)
	(ADJECTIVE EIGHTH TRA)
	(OBJDESCS <PLTABLE 1 1 1 0 1 1 "eighth circle""eighth circle""eighth circle""eighth circle""eighth circle""eighth circle" "The circle has some lettering on it which says TRA." 0 0 0 0 0>)
	(ACTION CIRCLE-FCN)
	(SIZE 1)>

<OBJECT CIRCLE7
	(IN FRONT-PANEL)
	(DESC "BOZ")
	(SYNONYM CIRCLE KEY)
	(ADJECTIVE SEVENT BOZ)
	(OBJDESCS <PLTABLE 1 1 1 0 1 1 "seventh circle""seventh circle""seventh circle""seventh circle""seventh circle""seventh circle" "The circle has some lettering on it which says BOZ." 0 0 0 0 0>)
	(ACTION CIRCLE-FCN)
	(SIZE 1)>

<OBJECT CIRCLE6
	(IN FRONT-PANEL)
	(DESC "CON")
	(SYNONYM CIRCLE KEY)
	(ADJECTIVE SIXTH CON)
	(OBJDESCS <PLTABLE 1 1 1 0 1 1 "sixth circle""sixth circle""sixth circle""sixth circle""sixth circle""sixth circle" "The circle has some lettering on it which says CON." 0 0 0 0 0>)
	(ACTION CIRCLE-FCN)
	(SIZE 1)>

<OBJECT CIRCLE5
	(IN FRONT-PANEL)
	(DESC "KLA")
	(SYNONYM CIRCLE KEY)
	(ADJECTIVE FIFTH KLA)
	(OBJDESCS <PLTABLE 1 1 1 0 1 1 "fifth circle""fifth circle""fifth circle""fifth circle""fifth circle""fifth circle" "The circle has some lettering on it which says KLA." 0 0 0 0 0>)
	(ACTION CIRCLE-FCN)
	(SIZE 1)>

<OBJECT CIRCLE4
	(IN FRONT-PANEL)
	(DESC "BAR")
	(SYNONYM CIRCLE KEY)
	(ADJECTIVE FOURTH BAR)
	(OBJDESCS <PLTABLE 1 1 1 0 1 1 "fourth circle""fourth circle""fourth circle""fourth circle""fourth circle""fourth circle" "The circle has some lettering on it which says BAR." 0 0 0 0 0 >)
	(ACTION CIRCLE-FCN)
	(SIZE 1)>

<OBJECT CIRCLE3
	(IN FRONT-PANEL)
	(DESC "BLE")
	(SYNONYM CIRCLE KEY)
	(ADJECTIVE THIRD BLE)
	(OBJDESCS <PLTABLE 1 1 1 0 1 1 "third circle""third circle""third circle""third circle""third circle""third circle" "The circle has some lettering on it which says BLE." 0 0 0 0 0 >)
	(ACTION CIRCLE-FCN)
	(SIZE 1)>

<OBJECT CIRCLE2
	(IN FRONT-PANEL)
	(DESC "MUM")
	(SYNONYM CIRCLE KEY)
	(ADJECTIVE SECOND MUM)
	(OBJDESCS <PLTABLE 1 1 1 0 1 1"second circle""second circle""second circle""second circle""second circle""second circle" "The circle has some lettering on it which says MUM." 0 0 0 0 0 >)
	(ACTION CIRCLE-FCN)
	(SIZE 1)>

<ROUTINE CIRCLE-FCN ("AUX" (COUNT 0) (NUM-PRESSED 0) (PREMATURE T))
	 <COND (<VERB? PUSH>
		<COND (<NOT <IN? ,FUSE ,MACHINE>>
		       <ROBOT-TELL "Nothing is happening. I don't think it's working anymore.">
		       <RTRUE>)>
		<COND (<FSET? ,PRSO ,TOUCHBIT>
		       <TELL "FC: That one has already been pressed." CR>
		       <RTRUE>)
		      (T <FSET ,PRSO ,TOUCHBIT>)>
		<COND (<AND <EQUAL? ,REDSET ,REDWIRE>
			    <EQUAL? ,ORANGESET ,ORANGE-WIRE>>
		       <SET PREMATURE <>>
		       <COND (<EQUAL? ,PRSO ,CODE1>
			      <SETG CODE-SET1 T>)
			     (<EQUAL? ,PRSO ,CODE2>
			      <SETG CODE-SET2 T>)>)>
		<REPEAT ()
			<COND (<G? <SET COUNT <+ .COUNT 1>> 8>
			       <RETURN>)
			      (T
			       <COND (<FSET? <GET ,CODE-TBL .COUNT> ,TOUCHBIT>
				      <SET NUM-PRESSED <+ .NUM-PRESSED 1>>)>)>>
		<COND (<EQUAL? .NUM-PRESSED 1>
		       <COND (.PREMATURE
			      <TELL
"FC: Attempt for reset has been rejected. Code entry premature. FCs out of balance." CR>
			      <RESET-CODES>
			      <RTRUE>)
			     (T
			      <TELL
"FC: First access code accepted. Enter second access code now." CR>)>)
		      (<EQUAL? .NUM-PRESSED 2>
		       <TELL "FC: Second access code accepted. " CR>
		       <COND (<AND ,CODE-SET1 ,CODE-SET2>
			      <END-GAME>)
			     (T <TELL CR 
"FC: Code recognition failed. Pattern entered does not match the reset code. Reset procedures aborted. New reset code being generated due to possible tampering." CR>
			      <RESET-CODES>
			      <GENERATE-CODES>)>)>)>>

<ROUTINE RESET-CODES ("AUX" (COUNT 0))
	 <REPEAT ()
		 <COND (<G? <SET COUNT <+ .COUNT 1>> 8>
			<RETURN>)
		       (T
			<FCLEAR <GET ,CODE-TBL .COUNT> ,TOUCHBIT>)>>
	 <SETG CODE-SET1 <>>
	 <SETG CODE-SET2 <>>
	 <RTRUE>>

<ROUTINE GENERATE-CODES ()
	 <SETG CODE1 <PICK-ONE ,CODE-TBL>>
	 <SETG CODE2 <PICK-ONE ,CODE-TBL>>
	 <REPEAT ()
		 <COND (<EQUAL? ,CODE1 ,CODE2>
			<SETG CODE2 <PICK-ONE ,CODE-TBL>>)
		       (T <RETURN>)>>
	 <RESET-CODES>>