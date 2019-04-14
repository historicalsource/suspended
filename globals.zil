"GLOBALS for
			      SUSPENSION
	(c) Copyright 1982 Infocom, Inc.  All Rights Reserved.
"

<DIRECTIONS NORTH EAST WEST SOUTH UP DOWN IN OUT SE SW NE NW>

"SUBTITLE GLOBAL OBJECTS"

<GLOBAL WINNER-HERE <>>
<GLOBAL LOAD-ALLOWED 100>
<GLOBAL LOAD-MAX 0>

<OBJECT GLOBAL-OBJECTS
	(FLAGS RMUNGBIT INVISIBLE TOUCHBIT SURFACEBIT TRYTAKEBIT
	       CUTBIT OPENBIT SEARCHBIT TRANSBIT WEARBIT FIXABLEBIT)>

<OBJECT LOCAL-GLOBALS
	(IN GLOBAL-OBJECTS)
	(SYNONYM ZZMGCK)
	(DESCFCN 0)
        (GLOBAL GLOBAL-OBJECTS)
	(PSEUDO 0)
	(CONTFCN 0)
	(SIZE 0)>
;"Yes, this synonym for LOCAL-GLOBALS needs to exist... sigh"

<OBJECT ROOMS>

<OBJECT INTNUM
	(IN GLOBAL-OBJECTS)
	(SYNONYM INTNUM)
	(DESC "number")>

<OBJECT LISTENING
	(IN GLOBAL-OBJECTS)
	(SYNONYM LISTEN)
	(DESC "listening")>

<OBJECT DRAGGING
	(IN GLOBAL-OBJECTS)
	(SYNONYM DRAGGI)
	(DESC "dragging")>

<OBJECT LEFT
	(IN GLOBAL-OBJECTS)
	(SYNONYM LEFT BACK BACKWA)
	(DESC "left")>

<OBJECT RIGHT
	(IN GLOBAL-OBJECTS)
	(SYNONYM RIGHT FORWARD)
	(DESC "right")>

<OBJECT LOCATION
	(IN GLOBAL-OBJECTS)
	(SYNONYM LOCATION LOC)
	(DESC "location")>

<OBJECT PSEUDO-OBJECT
	(DESC "pseudo")
	(ACTION CRETIN)>

<OBJECT IT	;"was IT"
	(IN GLOBAL-OBJECTS)
	(SYNONYM IT THAT HER HIM)
	(DESC "random object")
	(FLAGS NDESCBIT TOUCHBIT)>

<OBJECT COMPLEX
	(IN GLOBAL-OBJECTS)
	(SYNONYM COMPLEX)
	(ADJECTIVE UNDERG)
	(FLAGS NDESCBIT TOUCHBIT)
	(DESC "underground complex")
	(OBJDESCS <PLTABLE 1 1 1 1 1 1 "underground complex" "underground complex" "underground complex" "underground complex" "underground complex" "underground complex" 0 0 0 0 0 0>)
	(CLC-TXT <PLTABLE 0 0 "The Complex was started on this terraformed planet to provide the surface-side dwellers with a simpler, easier life. The Complex was built 122 years after the planet was settled, and was designed to operate on its own, with human intervention required only by emergency situations.">)>

<OBJECT PLANET
	(IN GLOBAL-OBJECTS)
	(DESC "planetary surface")
	(SYNONYM CONTRA)
	(ADJECTIVE SURFACE)
	(OBJDESCS <PLTABLE 1 1 1 1 1 1 "planetary surface" "planetary surface" "planetary surface" "planetary surface" "planetary surface" "planetary surface" 0 0 0 0 0 0>)
	(CLC-TXT <PLTABLE "Access to the surface is through the Sterilization Chamber." "The three Filtering Computers must be brought into balance for there to be a surface much longer." "The surface systems were originally controlled by the people living on the surface, but this situation changed once long-term terraforming had been accomplished.">)>

<OBJECT ZORK
	(IN GLOBAL-OBJECTS)
	(DESC "Zork")
	(SYNONYM ZORK)
	(FLAGS NDESCBIT TOUCHBIT)
	(OBJDESCS <PLTABLE 1 1 1 1 1 1 "Zork""Zork""Zork""Zork""Zork""Zork"
			  0 0 0 0 0 0>)>

<OBJECT FRANKLIN
	(IN GLOBAL-OBJECTS)
	(DESC "Franklin")
	(SYNONYM GREGOR FRANKL)
	(FLAGS NDESCBIT TOUCHBIT)
	(OBJDESCS <PLTABLE 1 1 1 1 1 1 "Gregory""Gregory""Gregory""Gregory""Gregory""Gregory" 0 0 0 0 0 0>)
	(CLC-TXT <PLTABLE 0 0 "Refer to your manual for further data.">)>

<OBJECT FCS
	(IN GLOBAL-OBJECTS)
	(DESC "Filtering Computers")
	(FLAGS NDESCBIT TOUCHBIT)
	(OBJDESCS <PLTABLE 1 1 1 1 1 1 "FCs""FCs""FCs""FCs""FCs""FCs" 0 0 0 0 0 0>)
	(SYNONYM FC FCS COMPUTER)
	(ADJECTIVE FILTERING)
	(CLC-TXT <PLTABLE "The three Filtering Computers are kept in balance by two series of four cables. Four cables run through the Primary Channel, while another four run through the Secondary Channel." "All defective cables should be replaced, then the reset code should be entered at the machine in the Main Supply Room." "The Filtering Computers have long provided Contra with surface-side maintenance, providing the surface-dwellers with an easy lifestyle.">)>

<OBJECT CLONES
	(IN GLOBAL-OBJECTS)
	(DESC "clones")
	(FLAGS NDESCBIT TOUCHBIT)
	(OBJDESCS <PLTABLE 1 1 1 1 1 1 "clones""clones""clones""clones""clones""clones" 0 0 0 0 0 0>)
	(SYNONYM CLONES)
	(CLC-TXT <PLTABLE 0 0 "These clones are clones of you and are your replacements.">)>

<OBJECT GROUND	;"was GROUND"
	(IN GLOBAL-OBJECTS)
	(SYNONYM FLOOR)
	(DESC "floor")
	(OBJDESCS <PLTABLE 1 1 1 1 1 1
	 "floor""floor""floor""floor""floor""floor"
	 0 0 0 0 0 0>)>

<OBJECT WALLS
	(IN GLOBAL-OBJECTS)
	(FLAGS NDESCBIT TOUCHBIT)
	(DESC "wall")
	(SYNONYM WALL WALLS)
	(OBJDESCS <PLTABLE 1 1 1 1 1 1 "wall""wall""wall""wall""wall""wall" 0 0 0 0 0 0>)>

<OBJECT CEILING
	(IN GLOBAL-OBJECTS)
	(FLAGS NDESCBIT TOUCHBIT)
	(DESC "ceiling")
	(SYNONYM CEILIN)
	(OBJDESCS <PLTABLE 1 1 1 1 1 1 "ceiling""ceiling""ceiling""ceiling""ceiling""ceiling" 0 0 0 0 0 0>)>

<OBJECT HANDS	;"was HANDS"
	(IN GLOBAL-OBJECTS)
	(SYNONYM EXTENS)
	(ADJECTIVE GRASPING)
	(DESC "extensions")
	(FLAGS NDESCBIT TOOLBIT TOUCHBIT)
	(OBJDESCS <PLTABLE
1 1 1 1 1 1 "grasping extension""grasping extension""grasping extension"
"grasping extension""grasping extension""grasping extension" 0 0 0 0 0 0>)>

<OBJECT ME
	(IN GLOBAL-OBJECTS)
	(SYNONYM ME MYSELF SELF WE)
	(DESC "cylinder occupant")
	(FLAGS VILLAIN TOUCHBIT)
	(OBJDESCS <PLTABLE 1 1 1 1 1 1  "cylinder occupant" "cylinder occupant" "cylinder occupant" "cylinder occupant" "cylinder occupant" "cylinder occupant" 0 0 0 0 0 0>)
	(ACTION CRETIN)> 
	
<ROUTINE CRETIN ()
	 <COND (<VERB? GIVE>
		<TELL "FC: I think you're a little confused." CR>
		<RTRUE>)
	       (<VERB? KILL MUNG>
		<COND (<IN? ,WINNER ,CPU-ROOM>
		       <ROBOT-TELL "I'll open the " <>>
		       <TELL D ,HOME " and see what I can do." CR>
		       <PERFORM ,V?OPEN ,HOME>)
		      (T
		       <ROBOT-TELL "I'll consider it only after I'm in the
Central Chamber.">
		       <RTRUE>)>)
	       (<VERB? TAKE>
		<ROBOT-TELL "Hey, let's do the job we're supposed to, okay?">)
	       (<VERB? DISEMBARK>
		<ROBOT-TELL "You'll have to do that on your own.">)
	       (<VERB? EXAMINE>
		<ROBOT-TELL "That's difficult unless the " <>>
		<TELL D ,HOME " has been opened." CR>)
	       (<VERB? FIND>
		<COND (<NOT <IN? ,WINNER ,CPU-ROOM>>
		       <PERFORM ,V?WALK-TO ,CPU-ROOM>)
		      (T <ROBOT-TELL
			  "You're right here, inside the " <>>
		       <TELL D ,HOME "." CR>)>
		<RTRUE>)>>





;"LOCAL-GLOBALS start here for easier hunting of all ridiculousness which must
                be included in the game for sadistic game-testers."

<OBJECT SIGNPOST
	(IN LOCAL-GLOBALS)
	(DESC "sign")
	(FLAGS TOUCHBIT NDESCBIT)
	(OBJDESCS <PLTABLE 1 1 1 0 1 1 "little sign" "recessed sign" "sign" "buzzing sign" "signpost" "ACS" 0 0 0 0 0 0>)
	(CLC-TXT <PLTABLE "This sign shows the access code needed for resetting the Filtering Computers." "You should be able to get Iris to see it somehow." 0>)
	(SYNONYM SIGN SIGNPOST ACS)
	(ADJECTIVE BUZZIN LITTLE RECESS)>

<OBJECT CONTROL-PANELS
	(IN LOCAL-GLOBALS)
	(FLAGS NDESCBIT TOUCHBIT)
	(DESC "panel")
	(OBJDESCS <PLTABLE 1 1 1 1 1 "panel""panel""panel""panel""panel""panel" 0 0 0 0 0 0>)
	(SYNONYM PANEL CONSOL)
	(ADJECTIVE SMALL)>

<OBJECT AIRCON
	(IN LOCAL-GLOBALS)
	(DESC "air conditioning")
	(FLAGS NDESCBIT TOUCHBIT)
	(SYNONYM CONDIT AIRCON)
	(ADJECTIVE AIR)
	(OBJDESCS <PLTABLE 0 0 0 1 0 0
			  "air conditioning""air conditioning""air conditioning"
			  "air conditioning""air conditioning""air conditioning"
			  0 0 0 0 0 0>)> 

<OBJECT DEBRIS
	(IN LOCAL-GLOBALS)
	(SYNONYM DEBRIS JUNK RUBBLE)
	(DESC "debris")
	(FLAGS NDESCBIT TOUCHBIT)
	(OBJDESCS <PLTABLE 1 1 0 0 1 0 "debris""debris""debris""debris""debris"
"debris" 0 0 0 0 0 0>)>


<OBJECT CABLES
	(IN LOCAL-GLOBALS)
	(SYNONYM TUBES CABLES)
	(ADJECTIVE CONNECTING)
	(DESC "cables")
	(FLAGS NDESCBIT TOUCHBIT)
	(OBJDESCS <PLTABLE
1 1 1 1 1 1
"cables""cables""cables""cables""cables""cables"
"The first, second, third and fourth cables are of all different colors."
"The first, second, third and fourth cables are of all different lengths.""The first, second, third and fourth cables are of all different lengths.""The first, second, third and fourth cables are of all different lengths.""The first, second, third and fourth cables are of all different lengths.""The first, second, third and fourth cables are of all different lengths."
>)
	(CLC-TXT <PLTABLE "These cables were designed for easy replacement. Each is equipped with a simple snap connector so replacement is virtually automatic. All cables of the same color conduct the same voltage charges and are totally interchangeable." "Be careful of removing or replacing active cables." "When this complex was built, a color-coding scheme was agreed upon for the sake of standardization.">)>

<OBJECT WIRING
	(IN LOCAL-GLOBALS)
	(FLAGS NDESCBIT TOUCHBIT)
	(SYNONYM WIRING CIRCUI)
	(DESC "wiring")
	(OBJDESCS <PLTABLE 1 1 1 1 1 1 "wiring""wiring""wiring""wiring""wiring""wiring" 0 0 0 0 0 0>)>

<OBJECT TVHOLE
	(IN LOCAL-GLOBALS)
	(SYNONYM PLUG HOLE PL-1)
	(ADJECTIVE SMALL)
	(DESC "hole")
	(OBJDESCS <PLTABLE
1 1 1 1 1 1 "plug with a cable in it""plug""plug""plug""plug""plug"
0 
"Its diameter may fit a small cable."
"It is a female receptacle."
0 
"Its depth just cannot compare to mine."
"This PL-1 forms a link for the TV-1.">)
	(FLAGS NDESCBIT TOUCHBIT)>

<OBJECT STEP
	(IN LOCAL-GLOBALS)
	(DESC "step")
	(FLAGS TOUCHBIT NDESCBIT)
	(SYNONYM STEP STAIR DROPOF)
	(ADJECTIVE SMALL)
	(ACTION STEP-FCN)
	(OBJDESCS <PLTABLE
1 1 1 0 1 1 "step" "step" "step" "step" "step" "step" 0 0 0 0 0 0 >)>

<ROUTINE STEP-FCN ()
	 <COND (<AND <VERB? PUT-AGAINST>
		     <EQUAL? ,PRSO ,WEDGE>
		     <OR <IN? ,WEDGE ,WINNER>
			 <IN? ,WEDGE ,WINNER-HERE>>>
		<COND (<NOT <EQUAL? ,WEDGE-PLACED 0>>
		       <ROBOT-TELL "It's already in position.">
		       <RTRUE>)>
		<COND (<EQUAL? ,WINNER-HERE ,REPAIR1>
		       <SETG WEDGE-PLACED 1>)
		      (<EQUAL? ,WINNER-HERE ,HALLWAY-JUNCTION ,HUMAN-ENTRY>
		       <SETG WEDGE-PLACED 2>)
		      (ELSE
		       <SETG WEDGE-PLACED 0>)>
		<MOVE ,WEDGE ,WINNER-HERE>
		<TELL "The " D ,WEDGE " has been positioned at the "
		      D ,PRSI "." CR>
		<RTRUE>)>>

<OBJECT STAIRS
	(IN LOCAL-GLOBALS)
	(SYNONYM STAIRS STEPS LADDER STAIRWAY)
	(DESC "stairs")
	(FLAGS NDESCBIT CLIMBBIT TOUCHBIT)
	(OBJDESCS <PLTABLE
1 1 1 1 1 1 "stairs""stairs""stairs""stairs""stairs""stairs" 0 0 0 0 0 0>)>

<OBJECT MONITOR
	(IN LOCAL-GLOBALS)
	(FLAGS NDESCBIT TOUCHBIT)
	(SYNONYM MONITO METERS UNITS)
	(ADJECTIVE SMALL)
	(DESC "monitor")
	(OBJDESCS <PLTABLE 1 1 1 1 1 1 "monitor""monitor""small unit""monitor""monitor""monitor"0 0 "The unit is active." 0 0 0 "The monitor has been diagnosed as working properly.">)>


;"GLOBAL ATOMS START HERE"

<GLOBAL NUM-EXT 0>
<GLOBAL CAR-FULL 0>
<GLOBAL WEDGE-PLACED 0>
<GLOBAL PLUGGED-IN <>>
<GLOBAL IRIS-FIXED <>>
<GLOBAL DEGREES 60>
<GLOBAL WINDS 10>
<GLOBAL PRESSURE1 55>
<GLOBAL PRESSURE2 50>
<GLOBAL PRESSURE3 55>
<GLOBAL NAME-TBL
	<TABLE IRIS
	       WALDO
	       SENSA
	       AUDA
	       POET
	       WHIZ
	       PEOPLE>>
<GLOBAL LIT T>
<GLOBAL MOVES 0>
<GLOBAL SCORE 3>
<GLOBAL WON-FLAG <>>
<GLOBAL INDENTS
	<TABLE ""
	       "  "
	       "    "
	       "      "
	       "        "
	       
"          ">>
<GLOBAL ON-WEDGE <>>
<GLOBAL DIALSETS
	<LTABLE 55 55 55 70 30 50>> ;"First 3 dials, 2nd 3 are Hydro Levers"
<GLOBAL DECAY 6>
<GLOBAL TV-ON <>>
<GLOBAL REDSET <>>
<GLOBAL ORANGESET <>>
<GLOBAL AUDA-LISTENS <>>
<GLOBAL CAR-GONE 0>
<GLOBAL ACID-FIXED T>
<GLOBAL RTHIEF 0>
<GLOBAL TAKE-BACK 0>
<GLOBAL SLEEPERS 0>
<GLOBAL BELT-ON <>>
<GLOBAL TOTAL-SCORE 3>
<GLOBAL PLAY-STARCROSS 0>
<GLOBAL WATER-LEVEL 70>
<GLOBAL MINERALS 30>
<GLOBAL WATTS 50>
<GLOBAL FOOD-TONS 100>

<GLOBAL FLOATERS 1>
<GLOBAL TAXIS 3>
<GLOBAL RAMP-SPEED 30>
<GLOBAL CRASH-RATE 0>
<GLOBAL COLLISIONS 0>
<GLOBAL RAMP-KILLS 0>

<CONSTANT WATER-OPT 70>
<CONSTANT MINERALS-OPT 30>
<CONSTANT WATTS-OPT 50>
<CONSTANT FOOD-OPT 100>

<GLOBAL CODE1 CIRCLE1>
<GLOBAL CODE2 CIRCLE1>
<GLOBAL CODE-TBL
	<LTABLE CIRCLE1 CIRCLE2 CIRCLE3 CIRCLE4
		CIRCLE5 CIRCLE6 CIRCLE7 CIRCLE8>>
<GLOBAL CODE-SET1 <>>
<GLOBAL CODE-SET2 <>>

<GLOBAL IRIS-HINTS 0>
<GLOBAL DYING1 3>
<GLOBAL DYING2 5>
<GLOBAL DYING3 7>
<GLOBAL ADVANCED-FLAG <>>

<GLOBAL WAITING-QUIP <>>