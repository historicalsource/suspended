"ROOMS for
			      SUSPENDED
	(c) Copyright 1982 Infocom, Inc.  All Rights Reserved.
"

;"ROOM DESCS & DECLAR FOR SUSPENSION"

<ROOM CPU-ROOM
      (IN ROOMS)
      (DESC "Central Chamber")
      (FLAGS RLANDBIT ONBIT)
      (SYNONYM CHAMBER GLOBE)
      (ADJECTIVE CENTRAL)
      (WEST TO WEATHER-BANKS)
      (EAST TO SERVO-SYSTEMS)
      (SOUTH TO RTD-BANKS)
      (NE TO CORRIDOR-1)
      (GLOBAL WIRING)
      (ROOMDESCS <PLTABLE
"I'm in a large room which looks like the inside of a globe. The walls seem sculptured with wiring, swirling around the room's perimeter, leading into a tall column. The column itself has a door on its face. Doorways lead to the west, south, east and northeast." 
"Sonar indicates a large, spherical open area with a hollow column running from floor to ceiling. The column reflects sonar evenly indicating no distinguishing external characteristics."
"All around me charges flow, shaped by the very nature of this room. The electrons are being channeled into an electrical column, central to this environment."
"A small humming can be detected from a column which extends from floor to ceiling."
"It hops and skips and leaves a bit, and can't decide if it should quit. It tells the world what it should know, but doesn't know when it's been shown."
"The CLC indicates this area is tagged as the Central Processing Unit due to an object, the CPU, which sits in the center of the room.">)
      (ACTION CPU-FCN)
      (STATION CPU-ROOM)
      (LINE 1)
      (CORRIDOR 8)>

<ROUTINE CPU-FCN ("OPTIONAL" (RARG <>))
	 <COND (<EQUAL? .RARG ,M-BEG>
		<COND (<AND <IRIS?>
			    <VERB? WALK>
			    <EQUAL? ,PRSO ,P?NE>>
		       <ROBOT-TELL
"I can't go in that direction. Internal mapping does not extend into those
areas.">
		       <RTRUE>)>)>>

<ROOM WEATHER-BANKS
      (IN ROOMS)
      (DESC "Weather Monitors")
      (FLAGS RLANDBIT ONBIT)
      (SYNONYM MONITO)
      (ADJECTIVE WEATHE)
      (EAST TO CPU-ROOM)
      (WEST TO SUPPLIES-NORTH)
      (SOUTH TO SUPPLIES-SOUTH)
      (ACTION WEATHER-BANKS-FCN)
      (ROOMDESCS <PLTABLE
"All around me I see meters indicating the state of the weather conditions on all three planet-side continents."
"This large area has smooth walls."
"My receptors detect huge electrical flow through the walls and meters all around me."
0
"They puff and billow and strain a bit, roar then ebb with time."
"I detect communication between devices here and the CLC.">)
      (LINE 1)
      (STATION WEATHER-BANKS)
      (GLOBAL MONITOR)>

<ROUTINE WEATHER-BANKS-FCN ("OPTIONAL" (RARG <>) "AUX" STR)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<LONG-DESCS>
		<COND (<AND <IRIS?>
			    ,IRIS-FIXED>
	               <COND (<L? ,DEGREES 31>
			      <COND (<L? ,WINDS 10>
				     <SET STR "snow">)
				    (<L? ,WINDS 30>
				     <SET STR "snowstorm">)
				    (<L? ,WINDS 60>
				     <SET STR "heavy snow">)
				    (<L? ,WINDS 80>
				     <SET STR "blinding snowstorm">)
				    (<L? ,WINDS 100>
				     <SET STR "blizzard">)
				    (ELSE
				     <SET STR "raging blizzard">)>)
			     (<L? ,DEGREES 41>
			      <COND (<L? ,WINDS 10>
				     <SET STR "light sleet">)
				    (<L? ,WINDS 20>
				     <SET STR "heavy sleet">)
				    (<L? ,WINDS 30>
				     <SET STR "blinding sleet">)
				    (<L? ,WINDS 40>
				     <SET STR "wall of sleet">)
				    (<L? ,WINDS 50>
				     <SET STR "torrential sleet">)
				    (ELSE
				     <SET STR "raging sleet storm">)>)
			     (ELSE
			      <COND (<L? ,WINDS 10>
				     <SET STR "fine, light mist">)
				    (<L? ,WINDS 20>
				     <SET STR "light drizzle">)
				    (<L? ,WINDS 30>
				     <SET STR "rain shower">)
				    (<L? ,WINDS 40>
				     <SET STR "downpour">)
				    (<L? ,WINDS 50>
				     <SET STR "wall of rain">)
				    (ELSE
				     <SET STR "hurricane-like storm">)>)>
		       <TELL
"The monitors for surface weather show:|
">
		       <FIXED-FONT-ON>
		       <TELL "|
  TEMP: " N ,DEGREES "   WINDS: " N ,WINDS "|
  PRECIPITATION: a " .STR "|
  TOWER PRESSURES: Tower 1 -- " N ,PRESSURE1 "|
                   Tower 2 -- " N ,PRESSURE2 "|
                   Tower 3 -- " N ,PRESSURE3>
		       <CRLF>
		       <FIXED-FONT-OFF>
		       <WEATHER-ROBOTS>)>
		<RTRUE>)>>

<ROUTINE WEATHER-ROBOTS ("AUX" (COUNT 0) (OFFSET 0) OBJ CHECK-LOC)
	 <COND (<IN? ,IRIS ,WEATHER-BANKS>
		<SET CHECK-LOC ,WEATHER>)
	       (<IN? ,IRIS ,RTD-BANKS>
		<SET CHECK-LOC ,RTD>)
	       (T
		<SET CHECK-LOC ,HYDRO>)>
	 <REPEAT ()
		 <COND (<IN? <GET ,NAME-TBL .OFFSET> .CHECK-LOC>
			<SET COUNT <+ .COUNT 1>>)>
		 <COND (<G? <SET OFFSET <+ .OFFSET 1>> 5>
			<RETURN>)>>
	 <COND (<EQUAL? .COUNT 0> <RTRUE>)>
	 <TELL "Through the monitors I can see ">
	 <SET OFFSET 0>
	 <REPEAT () 
		 <COND (<AND <IN? <SET OBJ <GET ,NAME-TBL .OFFSET>> .CHECK-LOC>
			     <NOT <EQUAL? ,WINNER .OBJ>>>
			<TELL D .OBJ>
			<COND (<EQUAL? .COUNT 1>
			       <RETURN>)
			      (<EQUAL? .COUNT 2>
			       <TELL " and ">)
			      (T <TELL ", ">)>
			<SET COUNT <- .COUNT 1>>)>
		 <SET OFFSET <+ .OFFSET 1>>>
	 <TELL " in the " SD .CHECK-LOC "." CR>>

<ROOM SUPPLIES-SOUTH
       (IN ROOMS)
       (DESC "Sub Supply Room")
       (FLAGS ONBIT RLANDBIT)
       (SYNONYM SUPPLY)
       (ADJECTIVE SUB)
       (NORTH TO WEATHER-BANKS)
       (WEST TO SUPPLIES-MID)
       (GLOBAL DEBRIS)
       (ROOMDESCS <PLTABLE
"I am in a sub-station of the supply rooms. The room is small, with debris littering the floor."
"Sonar detects totally irregular patterns on the walls as if shelving had been mounted there."
"The air here is still. No vibrational activity."
0
"It burns and wields tremendous light and makes our joints delight its might."
0>)
       (LINE 1)
       (STATION WEATHER-BANKS)>

<ROOM CORRIDOR-1
      (IN ROOMS)
      (DESC "Angling Corridor")
      (FLAGS RLANDBIT ONBIT)
      (SYNONYM CORRID)
      (ADJECTIVE ANGLING)
      (SW TO CPU-ROOM)
      (NE TO CORRIDOR-2)
      (ROOMDESCS <PLTABLE
"This is a long, angling corridor which continues to the northeast."
"I am in a narrow, long, straight tunnel with smooth walls."
0
"The steady hum of the air conditioning seems to drown out subtler noises."
"Through which it all flows, we are as one."
"I can feel the emanations of my parent machine, the CLC, nearby.">)
      (LINE 1)
      (STATION CORRIDOR-1)
      (CORRIDOR 8)
      (GLOBAL AIRCON)>

<ROOM SUPPLIES-MID
      (IN ROOMS)
      (DESC "Middle Supply Room")
      (SYNONYM SUPPLY)
      (ADJECTIVE MIDDLE)
      (FLAGS RLANDBIT ONBIT)
      (GLOBAL DEBRIS)
      (NORTH TO SUPPLIES-NORTH)
      (EAST TO SUPPLIES-SOUTH)
      (ROOMDESCS <PLTABLE
"This is the middle of an L-shaped supply room. Scattered about on the floor
are all kinds of debris. Nothing looks salvageable."
"I keep bumping into all sorts of junk on the floor, none of which seems to
be intact." 0 0 "From junk we spring, to junk we go." 0 >)
      (LINE 1)
      (STATION SUPPLIES-MID)>

<ROOM SUPPLIES-NORTH
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (DESC "Main Supply Room")
      (SYNONYM SUPPLY)
      (ADJECTIVE MAIN)
      (ROOMDESCS <PLTABLE "foo">)
      (EAST TO WEATHER-BANKS)
      (SOUTH TO SUPPLIES-MID)
      (ACTION SUPPLIES-N-FCN)
      (GLOBAL DEBRIS)
      (LINE 1)
      (STATION SUPPLIES-NORTH)>

<GLOBAL LDSUPPLIES
	<PLTABLE
"I'm in the northernmost portion of a large, messy area where debris is scattered about as if something had shaken it loose from the walls. Sitting near the wall is a machine which has a little orange button on its face. Beside the button are two small sockets, one red and one yellow"
"Moving about here is difficult due to the debris scattered about but I can detect a medium-sized object distinct from the jumble. Sonar detects two small depressions beside a raised spot in the object"
"A strange apparatus sits before me, processing electrons internally. This device seems active, though some internal mechanisms are exposed. There are two receptacles, designed to hold small circuitry, and a button beside them"
"I can hear the slight noise of machinery operating here"
"This is another fine mess you've got me into.  Umm, umm umm! A processor sits on the floor, munching and spitting electrons. Button, button, who's got the button while the socks ablaze with color"
"CLC reports this area is abnormal in its arrangement. A GG-1 sits here, barely operating">>

<GLOBAL WIRE-FIRST
	<PLTABLE
" The front panel is open and a "
" The front panel is open and a "
" The front panel is open and a "
""
" This thing has exposed itself, showing a "
" A front panel is open and a ">>

<GLOBAL WIRE-SECOND
	<PLTABLE
" is exposed."
" is exposed."
" is exposed."
""
"."
" is exposed">>

<ROUTINE SUPPLIES-N-FCN ("OPTIONAL" (RARG <>) "AUX" OBJ)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<COND (<AND <IRIS?> <NOT ,IRIS-FIXED>>
		       <TELL <PICK-ONE ,IRIS-BLIND> CR> <RFATAL>)
		      (T <TELL <GET ,LDSUPPLIES ,ROFF>>
		       <COND (<AND <SET OBJ <FIRST? ,SOCKET1>>
				   <NOT <AUDA?>>>
			      <TELL ". A " D .OBJ " sits in the " D ,SOCKET1>)
			     (<NOT <AUDA?>>
			      <TELL ". The " D ,SOCKET1 " is empty">)>
		       <COND (<AND <SET OBJ <FIRST? ,SOCKET2>>
				   <NOT <AUDA?>>>
			      <COND (<FIRST? ,SOCKET1>
				     <TELL ", and">)
				    (T
				     <TELL ", but">)>
			      <TELL " a " D .OBJ 
				    " sits in the " D ,SOCKET2>)
			     (<NOT <AUDA?>>
			      <COND (<FIRST? ,SOCKET1>
				     <TELL
				      ", but the " D ,SOCKET2 " is empty">)
				    (T
				     <TELL " as is the " D ,SOCKET2>)>)>
		       <TELL ".">
		       <COND (<AND <IN? ,ORANGE-WIRE ,MACHINE>
				   <FSET? ,MACHINE ,OPENBIT>>
			      <TELL <GET ,WIRE-FIRST ,ROFF> D ,ORANGE-WIRE
				    <GET ,WIRE-SECOND ,ROFF>>)>
		       <COND (<AND <IN? ,FUSE ,MACHINE>
				   <FSET? ,MACHINE ,OPENBIT>
				   <NOT <AUDA?>>>
			      <COND (<IRIS?> <TELL
" A small glass fuse it sits in the panel.">)
				    (<POET?> <TELL
" Meanwhile, a " D ,FUSE " monitors the situation.">)
				    (ELSE <TELL
" A " D ,FUSE " sits in the panel.">)>)>
		       <COND (<AND <FSET? ,MACHINE ,OPENBIT>
				   <NOT <AUDA?>>>
			      <TELL <GET ,CIRCLE-DESCS ,ROFF>>)>)>
		<COND (<AND <IN? ,NEWCHIP0 ,SOCKET1>
			    <IN? ,NEWCHIP2 ,SOCKET2>>
		       <COND (<OR <SENSA?> <POET?> <AUDA?>
				  <AND <IRIS?> ,IRIS-FIXED>>
			      <TELL " " <GET ,FLASHING ,ROFF>>)>)>
		<CRLF>
		<RTRUE>)>>

<GLOBAL CIRCLE-DESCS
	<PLTABLE
" On the front panel is a series of eight circles."
" On the front panel a series of eight raised circles is visible."
" I can sense a delicate tracery of circuitry going into eight circles on the front panel."
" "
" On the exposed panel is a little piano with only eight circle keys."
" The panel has eight circles mounted in it.">>

<GLOBAL FLASHING
	<PLTABLE
"The orange button is flashing."
""
"Electricity pulses through the button."
"Metal parts click and gears whir."
"Button flashes while time passes."
"">>

<ROOM CORRIDOR-2
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (DESC "Bending Corridor")
      (SYNONYM CORRID)
      (ADJECTIVE BENDING)
      (SW TO CORRIDOR-1)
      (EAST TO HALLWAY-JUNCTION)
      (ROOMDESCS <PLTABLE
0
"I've approached a bend in the tube. One section continues to the east, while
the other section goes to the southwest."
"Vibrational activity picked up, though intensity too slight to determine
locational fix at this point."
"With audio sensors on full power I can detect some 'background' noise coming
from the east."
"Into all lives the flow proceeds, weaving its web of mystery like that of an
enigmatic spider."
"My source signals become stronger and clearer to the east.">)
      (LINE 1)
      (STATION CORRIDOR-2)
      (CORRIDOR 24)>

<ROOM RTD-BANKS
      (IN ROOMS)
      (DESC "Transit Monitors")
      (SYNONYM MONITO)
      (ADJECTIVE TRANSI)
      (FLAGS RLANDBIT ONBIT)
      (NORTH TO CPU-ROOM)
      (ROOMDESCS <PLTABLE
0
"Sonar indicates these walls are filled with irregularities which could be
monitors."
"Surges of electrical flow can be detected from small units mounted on the
walls, most probably meters."
0
"They bounce back and forth like metro's gnomes."
"The CLC is not linked to these devices.">)
      (ACTION TRANSIT-MONITOR-FCN)
      (LINE 1)
      (STATION CPU-ROOM)
      (GLOBAL MONITOR)>

<ROUTINE TRANSIT-MONITOR-FCN ("OPTIONAL" (RARG <>))
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<LONG-DESCS>
		<COND (<OR <NOT <IRIS?>>
			   <AND <IRIS?>
				<NOT ,IRIS-FIXED>>>
		       <RTRUE>)>
		<TELL
"All around I can see monitors which show the status of the Transit Systems on the surface of the planet. The monitors describe the following situation:|
">
		<FIXED-FONT-ON>
		<TELL "|
  FLOATERS AIRBORNE: " N ,FLOATERS "000|
  TAXIS IN USE: " N ,TAXIS "000|
  GLIDE RAMP SPEEDS: " N ,RAMP-SPEED " mph|
  FLOATER CRASH RATE: " N ,CRASH-RATE "0|
  TAXI ACCIDENT RATE: " N ,COLLISIONS "0|
  GLIDE RAMP CASUALTIES: " N ,RAMP-KILLS "0|
">
		<FIXED-FONT-OFF>
		<WEATHER-ROBOTS>)>>
		
<ROOM SERVO-SYSTEMS
      (IN ROOMS)
      (FLAGS ONBIT RLANDBIT)
      (WEST TO CPU-ROOM)
      (DESC "Hydroponics Monitors")
      (SYNONYM MONITO)
      (ADJECTIVE HYDROP)
      (ACTION HYDROMONITORS-FCN)
      (GLOBAL MONITOR)
      (ROOMDESCS <PLTABLE 0 
"This area has walls with irregular protrusions, most likely some kind of
monitors or meters."
"Meters and electrons within this room seem extremely variable with each
passing second."
"I hear a voice saying, \"Food, food for the truth\"."
"They move like snakes, without a bone."
"Nothing here is linked to the CLC.">)
      (LINE 1)
      (STATION CPU-ROOM)>

<ROUTINE HYDROMONITORS-FCN ("OPTIONAL" (RARG <>) "AUX" STRW STRM STRL WL ML LL)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<COND (<NOT <IRIS?>>
		       <LONG-DESCS>
		       <RTRUE>)
		      (<NOT ,IRIS-FIXED>
		       <LONG-DESCS>
		       <RTRUE>)>
		<SET WL <+ <ABS <- ,WATER-LEVEL ,WATER-OPT>> 0>>
		<SET ML <+ <ABS <- ,MINERALS ,MINERALS-OPT>> 0>>
		<SET LL <+ <ABS <- ,WATTS ,WATTS-OPT>> 0>>
		<COND (<G? ,WATER-LEVEL ,WATER-OPT>
		       <SET STRW "high">)
		      (<EQUAL? ,WATER-LEVEL ,WATER-OPT>
		       <SET STRW " =">)
		      (<SET STRW "low">)>
		<COND (<G? ,MINERALS ,MINERALS-OPT>
		       <SET STRM "high">)
		      (<EQUAL? ,MINERALS ,MINERALS-OPT>
		       <SET STRM " =">)
		      (<SET STRM "low">)>
		<COND (<G? ,WATTS ,WATTS-OPT>
		       <SET STRL "high">)
		      (<EQUAL? ,WATTS ,WATTS-OPT>
		       <SET STRL " =">)
		      (<SET STRL "low">)>
		<TELL
"Through the monitors I can see the following information:|
">
		<FIXED-FONT-ON>
		<TELL "|
           LEVEL  SETTING  OUTPUT|
WATER:      "> <NUMBER-PRINT ,WATER-LEVEL>
	       <NUMBER-PRINT <GET ,DIALSETS 4>>
	       <TELL .STRW CR>
	       <TELL "MINERALS:   ">
	       <NUMBER-PRINT ,MINERALS>
	       <NUMBER-PRINT <GET ,DIALSETS 5>>
	       <TELL .STRM CR>
	       <TELL "LIGHTING:   ">
	       <NUMBER-PRINT ,WATTS>
	       <NUMBER-PRINT <GET ,DIALSETS 6>>
	       <TELL .STRL CR>
	       <TELL "FOOD TONS:  ">
	       <COND (<AND <L? ,FOOD-TONS 100>
			   <G? ,FOOD-TONS 9>>
		      <TELL " ">)
                     (<L? ,FOOD-TONS 10>
		      <TELL "  ">)>
               <TELL N ,FOOD-TONS>
	       <TELL "            "> 
	       <COND (<G? ,FOOD-TONS 75>
		      <TELL "optimal">)
		     (<G? ,FOOD-TONS 50>
		      <TELL " fair">)
		     (<G? ,FOOD-TONS 25>
		      <TELL " poor">)
		     (T <TELL "critical">)>
	       <CRLF>
	       <FIXED-FONT-OFF>
	       <WEATHER-ROBOTS>
	       <RTRUE>)>>

<ROUTINE FIXED-FONT-ON () <PUT 0 8 <BOR <GET 0 8> 2>>>

<ROUTINE FIXED-FONT-OFF() <PUT 0 8 <BAND <GET 0 8> -3>>>

<ROUTINE NUMBER-PRINT (NUM)
	 <COND (<L? .NUM 10>
		<TELL "  ">)
	       (<L? .NUM 100>
		<TELL " ">)>
	 <TELL N .NUM>
	 <TELL "     ">
	 <RFALSE>>

<ROOM NORTH-ENTRY
      (IN ROOMS)
      (DESC "Hallway T")
      (SYNONYM T)
      (ADJECTIVE HALLWAY)
      (NORTH TO STERILE-AREA)
      (WEST TO DEAD-END-1)
      (EAST TO HALL-STOP1)
      (FLAGS RLANDBIT ONBIT)
      (ROOMDESCS <PLTABLE 0
"I have reached a T intersection in the east/west hallway."
"I can detect a lot of electrical movement to the west from this location. A strong bath of ultraviolet can also be detected."
"A low whirring noise, barely audible, can be detected from the west."
"Intersections, like the choices of life, are metered by the flow."
"Warning: CLC communique indicates approaching Off-Limits area.">)
      (LINE 3)
      (STATION NORTH-ENTRY)
      (CORRIDOR 2)>

<ROOM DEAD-END-1 
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (SYNONYM END)
      (ADJECTIVE DEAD)
      (DESC "Dead End")
      (EAST TO NORTH-ENTRY)
      (ROOMDESCS <PLTABLE
0
"I have reached the end of the western passage."
"I have reached the end of the western passage."
"I have reached the end of the western passage."
"I have reached the end of the western passage."
"I have reached the end of the western passage.">)
      (LINE 3)
      (STATION DEAD-END-1)
      (CORRIDOR 2)>

<ROOM DECON-CHAMBER
      (IN ROOMS)
      (DESC "Decontamination Chamber")
      (SYNONYM CHAMBER)
      (ADJECTIVE DECONT)      
      (WEST TO STERILE-AREA)
      (EAST TO ENTRY-AREA)
      (FLAGS RLANDBIT ONBIT)
      (ROOMDESCS <PLTABLE 0
"I have entered a small room. Overhead a small nozzle extends down from
the ceiling, and doorways can be detected to the west and east."
"A quick analysis of the molecular structure of the air in this area shows the
vestiges of a sterilization compound. In addition, an ultraviolet source can be
detected directly overhead."
"A small hissing can be detected overhead, as if a small port leaked a
semi-liquid compound."
"To be barren in more ways than one is an indication of our lot in life,
such as we know life."
"Warning: CLC communique indicates too close to Off-Limits area.">)
      (LINE 4)
      (STATION DECON-CHAMBER)
      (CORRIDOR 1)>

<ROOM STERILE-AREA
      (IN ROOMS)
      (DESC "Sterilization Chamber")
      (SYNONYM CHAMBER)
      (ADJECTIVE STERIL)      
      (WEST "CLC WARNING!! Further westward movement prohibited to all robots.")
      (SOUTH TO NORTH-ENTRY)
      (EAST TO DECON-CHAMBER)
      (FLAGS RLANDBIT ONBIT)
      (ROOMDESCS <PLTABLE 0
"A thorough scanning of this area indicates I am at some kind of a dead
end. There is some kind of structure, probably a set of benches, extending from the north wall."
"I can detect a lot of electrical movement to the west from this location. A strong bath of ultraviolet can also be detected from the east."
"A loud whirring noise can be detected from the west."
"We all reach the ends of our life lines at some point."
"Warning: CLC communique indicates we are at the Off-Limits area.">)
      (LINE 4)
      (STATION STERILE-AREA)
      (CORRIDOR 1)>
      
<ROOM ENTRY-AREA
      (IN ROOMS)
      (DESC "Entry Area")
      (SYNONYM ENTRY)
      (EAST TO TOOL-AREA)
      (WEST TO DECON-CHAMBER)
      (FLAGS RLANDBIT ONBIT)
      (ROOMDESCS <PLTABLE 0
"I am in a small, square room with no distinguishing features detectable."
"I can detect a lot of electrical movement from the west. A strong bath
of ultraviolet can also be detected."
"A low, whirring noise, barely detectable, can be heard from the west."
"The crux, the mandible mandella of humane existence, is like the
patterns all around me."
"Warning!! CLC communique indicates off-limits area nearby!">)
      (LINE 4)
      (STATION ENTRY-AREA)
      (CORRIDOR 1)>

<ROOM TOOL-AREA
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (DESC "Small Supply Room")
      (SYNONYM SUPPLY)
      (ADJECTIVE SMALL)
      (WEST TO ENTRY-AREA)
      (EAST TO REC-AREA)
      (ROOMDESCS <PLTABLE 0
"I can detect a small area, cluttered with things which extend from the
walls. Doorways lead to the east and the west."
"A strange container exists by the east wall of this room which is being fed electrical vibrations."
"The air here is very still."
"Tools for industry, tools for the dead."
"CLC indicates this area not for robot use.">)
      (LINE 4)
      (STATION TOOL-AREA)
      (CORRIDOR 1)>

<ROOM HALL-STOP1
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (DESC "Hallway")
      (WEST TO NORTH-ENTRY)
      (EAST TO HALL-STOP2)
      (ROOMDESCS <PLTABLE
0 
"I am near the start of a long, straight passageway."
"I can perceive small vibrations emanating from the north. This general
area seems to be chemically active."
"I can hear some slight noise coming from the north and the west, though
it is too distant to accurately describe."
"All things continue given their right place and the correct opportunity."
"I am moving toward an area which the CLC warns is not normally within
the realm of the robot maintenance crew.">)
      (LINE 3)
      (STATION HALL-STOP1)
      (CORRIDOR 2)>

<ROOM HALL-STOP2
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (WEST TO HALL-STOP1)
      (EAST TO HALL-STOP3)
      (DESC "Hallway")
      (ROOMDESCS <PLTABLE 0
"Sonar detects the hallway continuing east and west."
"There are no abnormal disturbances to report within the permanent
environment in this area." 0
"All things must enter, as all things must leave."
"CLC referencing indicates I am not empowered to take actions within
this general area.">)
      (LINE 3)
      (STATION HALL-STOP2)
      (CORRIDOR 2)>

<ROOM HUMAN-ENTRY
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (DESC "Sloping Corridor")
      (SYNONYM CORRID)
      (ADJECTIVE SLOPING)
      (SOUTH PER WEDGE-FCN)
      (NORTH TO HALL-STOP3)
      (GLOBAL STEP)
      (ROOMDESCS <PLTABLE 0 
"Sonar detects the corridor descends to the north in a gentle slope. The
intersection to the south is raised above this level."
"Sensory units detect a strong energy flow in the intersection to the
south."
0
"Oh, the travesty of descent, the joyousness of having one's spirit
lifted beyond measure to another glorious level."
"CLC can be detected to the south. Its signals reach me in a straight line. Signal intensity 5.">)
      (ACTION JUNCTION-FCN)
      (LINE 3)
      (STATION HUMAN-ENTRY)
      (CORRIDOR 4)>

<ROUTINE WEDGE-FCN ()
	 <COND (<EQUAL? ,WEDGE-PLACED 2>
		<COND (<EQUAL? ,WINNER-HERE ,HALLWAY-JUNCTION>
		       ,HUMAN-ENTRY)
		      (<EQUAL? ,WINNER-HERE ,HUMAN-ENTRY>
		       ,HALLWAY-JUNCTION)>)
	       (ELSE
		<ROBOT-TELL "I can't climb the step.">
		<RFALSE>)>>
      
<ROOM HALLWAY-JUNCTION
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (DESC "Hallway Junction")
      (SYNONYM JUNCTION)
      (ADJECTIVE HALLWAY)
      (WEST TO CORRIDOR-2)
      (EAST TO CORRIDOR-3)
      (SOUTH TO OUTSIDE-CLC)
      (NORTH PER WEDGE-FCN)
      (ROOMDESCS <PLTABLE 0 
"Sonar detects an intersection here, with a small dropoff to the north."
"I detect a strong flux of energy here -- transmissions of all types meeting as
if at the hub of some giant wheel."
"I can tell I've reached an intersection by the way sounds bounce off the
walls."
"Life is filled with choice. Decisions always make my eyes moist."
"Request directions which would send me in a southerly direction as linkup
seems imminent.">)
      (GLOBAL STEP)
      (ACTION JUNCTION-FCN)
      (LINE 1)
      (STATION HALLWAY-JUNCTION)
      (CORRIDOR 20)>

<ROUTINE JUNCTION-FCN ("OPTIONAL" (RARG <>))
	 <COND (<EQUAL? .RARG ,M-BEG>
		<COND (<EQUAL? ,WEDGE-PLACED 2>
		       <FSET ,WEDGE ,NDESCBIT>
		       <MOVE ,WEDGE ,WINNER-HERE>)> ;"New Code"
		<RFALSE>)
	       (<EQUAL? .RARG ,M-LOOK>
		<LONG-DESCS>
		<COND (<AND <EQUAL? ,WEDGE-PLACED 2>
			    <NOT <AUDA?>>>
		       <TELL 
			"The " D ,WEDGE " is positioned by the step." CR>
		       <MOVE ,WEDGE ,WINNER-HERE>)
		      (ELSE <FCLEAR ,WEDGE ,NDESCBIT>)>)
	       (<EQUAL? .RARG ,M-ENTER>
		<COND (<EQUAL? ,WEDGE-PLACED 2>
		       <MOVE ,WEDGE ,WINNER-HERE>)
		      (ELSE <FCLEAR ,WEDGE ,NDESCBIT>)>)>>

<ROOM OUTSIDE-CLC
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (DESC "Outer Library Area")
      (SYNONYM LIBRARY)
      (ADJECTIVE OUTER)
      (SOUTH TO PERIPH-1)
      (NORTH TO HALLWAY-JUNCTION)
      (ROOMDESCS <PLTABLE 0 
"Sonar indicates a closed-in area to the south, with small pedestals extending
up from the floor. The hallway goes on to the north."
"I can sense strong data emanations coming from the south, channeling through
this hallway to the northern junction."
"The air to the south is still within a closed chamber, while the air to the
north circulates freely."
"Akin to knowledge is only freedom."
"CLC identifier tagging detected directly to the south.">)
      (LINE 1)
      (STATION OUTSIDE-CLC)>

<ROOM PERIPH-1
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (DESC "Index Peripheral")
      (SYNONYM PERIPH)
      (ADJECTIVE INDEX)
      (SW TO PERIPH-4)
      (SE TO PERIPH-2)
      (SOUTH TO CLC-CORE)
      (NORTH TO OUTSIDE-CLC)
      (ROOMDESCS <PLTABLE 0 
"Before me is a pedestal, rising from the ground."
"The pedestal before me emanates tremendous data flows and transmits a radio homing signal, no doubt aimed toward Whiz."
"I can still detect the air changes to the north, indicating there is an
exit in that direction for me."
"The root of all knowledge, of all existence, lies before us for the taking."
"CLC identifier shows the object before me as the Index pedestal.">)
      (LINE 1)
      (STATION PERIPH-1)>

<ROOM PERIPH-2
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (DESC "Technical Peripheral")
      (SYNONYM PERIPH)
      (ADJECTIVE TECHNI)
      (SW TO PERIPH-3)
      (NW TO PERIPH-1)
      (WEST TO CLC-CORE)
      (ROOMDESCS <PLTABLE 0 
"Before me stands another pedestal."
"This pedestal emits the same kind of data flow as the others."
"I sense I am getting further away from the air currents which are readable
to me."
"Another grasp of the all-knowing Universe stands before me. Ah, to be able to
learn what it holds, the might of the mind is like no other."
"CLC tagged object before me indicates it is the Technical pedestal.">)
      (LINE 1)
      (STATION PERIPH-2)>

<ROOM PERIPH-3
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (DESC "Advisory Peripheral")
      (SYNONYM PERIPH)
      (ADJECTIVE ADVISO)
      (NW TO PERIPH-4)
      (NE TO PERIPH-2)
      (NORTH TO CLC-CORE)
      (ROOMDESCS <PLTABLE 0 
"Before me stands a third unit similar in all outward appearances to the
others."
"This object too emits an incredible homing signal and transmits data."
"I am further away from detectable air currents than I should be."
"Giving advice is easy. Taking advice isn't."
"CLC tagged object indicates it is the Advisory pedestal before me.">)
      (LINE 1)
      (STATION PERIPH-3)>

<ROOM PERIPH-4
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (DESC "Historical Peripheral")
      (SYNONYM PERIPH)
      (ADJECTIVE HISTOR)
      (NE TO PERIPH-1)
      (SE TO PERIPH-3)
      (EAST TO CLC-CORE)
      (ROOMDESCS <PLTABLE 0 
"Another pedestal structure lies before me."
"More data flows detected within this area, especially directly before me."
"The air within this area is still, though the object before me emits a faint
high-frequency tinging."
"Complicated life, like that of the Chinese Mandarin, continues to obscure."
"CLC tagged object before me is the Historical pedestal.">)
      (LINE 1)
      (STATION PERIPH-4)>

<ROOM CLC-CORE
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (DESC "Central Core")
      (SYNONYM CLC CORE)
      (ADJECTIVE CENTRAL)
      (WEST TO PERIPH-4)
      (EAST TO PERIPH-2)
      (NORTH TO PERIPH-1)
      (SOUTH TO PERIPH-3)
      (ROOMDESCS <PLTABLE 0 
"Sonar detects a small railing, most likely for safety purposes, directly
before me. Beyond that railing is a huge cavern."
"I can feel a tremendous flow of energy within this area. It is unlike
anything else in its intensity and scope."
"Small updrafts can be heard as minute air currents directly before me."
"The root of our beings, the truth behind all of our existence, lies before
me."
"Directly before me is the Central Core. There is no available plug-in device within this area.">)
      (LINE 1)
      (STATION CLC-CORE)>

<ROOM CORRIDOR-3
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (WEST TO HALLWAY-JUNCTION)
      (EAST TO CORRIDOR-4)
      (SE TO ROBOT-PASSAGE)
      (DESC "Southeast Junction")
      (SYNONYM JUNCTION)
      (ADJECTIVE SOUTHE)
      (ROOMDESCS <PLTABLE 0
"I perceive another passageway heading off to the southeast from here."
"Friendly vibrations can be detected from the southeast." 0
"To forgive is innocent, but to repair is all mine."
"CLC indicates I've gone too far to the east for an interface.">)
      (LINE 2)
      (STATION CORRIDOR-3)
      (CORRIDOR 16)>

<ROOM ROBOT-PASSAGE
      (IN ROOMS)
      (NW TO CORRIDOR-3)
      (SE TO ROBOT-Z)
      (DESC "Southeast Passage")
      (SYNONYM PASSAGE)
      (ADJECTIVE SOUTHE)
      (ROOMDESCS <PLTABLE 0
"This tubular passageway continues to the southeast. I can detect a bend in it
toward the south."
"My receptors are picking up strong data transmissions to the west of here.
Overhead I can trace an electrical flow that continues to the southeast."
0
"There once was a cowboy named Mix|
Who managed just one shot in six|
    He looked quite surpised|
    When he opened his eyes|
And saw that his gun wasn't fixed."
"CLC tags indicate a robot-oriented area exists to the southeast.">)
      (FLAGS RLANDBIT ONBIT)
      (LINE 2)
      (STATION ROBOT-PASSAGE)>

<ROOM ROBOT-Z
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (DESC "Bending Passage")
      (SYNONYM PASSAGE)
      (ADJECTIVE BENDING)
      (ROOMDESCS <PLTABLE
0
"Sonar detects a large area to the south with many obstacles within the
structure."
"The data transmissions are still detectable from the west. This area is
filled with all kinds of electrical devices and what seems like motors."
0
"Did you ever have the feeling you were running on a treadmill? Sometimes life is like that."
"CLC tagged area indicates robot repair mechanisms close by.">)
      (NW TO ROBOT-PASSAGE)
      (SOUTH TO REPAIR1)
      (LINE 2)
      (STATION ROBOT-Z)>

<ROOM REPAIR1
      (IN ROOMS)
      (DESC "Alpha Repair")
      (SYNONYM REPAIR)
      (ADJECTIVE ALPHA)
      (GLOBAL STEP)
      (FLAGS RLANDBIT ONBIT)
      (NORTH TO ROBOT-Z)
      (SOUTH TO REPAIR2)
      (ROOMDESCS <PLTABLE 0
"Before me is a walkway which has wheels and all sorts of odd protuberances which my sonar has a hard time deciphering. Sonar also detects a small step at the base of it."
"Strong electrical interference can be detected within this environment."
"I can hear the sound of gears and cogs, coming from a noisy walkway."
"Running, running, getting nowhere amid the hustle and bustle of life."
"I am in what the CLC describes as a repair area for robot units.">)
      (ACTION REPAIRX-FCN)
      (LINE 2)
      (STATION REPAIR1)>

<ROOM REPAIR2
      (IN ROOMS)
      (DESC "Beta Repair")
      (SYNONYM REPAIR)
      (ADJECTIVE BETA)
      (FLAGS RLANDBIT ONBIT)
      (NORTH TO REPAIR1)
      (SOUTH TO REPAIR3)
      (ROOMDESCS <PLTABLE 0
"I'm in the center of a large area with a walkway in the center."
"I detect slight vibrational activity from a conveying mechanism."
"I can hear the meshing of gears and cogs, coming from a noisy walkway."
"We're getting nowhere fast, glider, but at least we're not getting there slowly."
"CLC indicators coming from the west.">)
      (ACTION REPAIRX-FCN)
      (LINE 2)
      (STATION REPAIR2)>

<ROOM REPAIR3
      (IN ROOMS)
      (NORTH TO REPAIR2)
      (ROOMDESCS <PLTABLE 0
"I have reached the south end of this area. The walkway ends here."
"Vibrational activity and electrical emanations detected from the north are
stronger than those in the immediate vicinity."
"Noise of machinery can be detected coming from the north."
"Oh, to reach the end of one's previous existence, to travel the roadways of
life when they are most needed, only to end up here, reborn."
"The CLC indicates that this is the end of the Robot Repair area.">)
      (DESC "Gamma Repair")
      (SYNONYM REPAIR)
      (ADJECTIVE GAMMA)
      (FLAGS RLANDBIT ONBIT)
      (ACTION REPAIRX-FCN)
      (GLOBAL WIRING)
      (LINE 2)
      (STATION REPAIR3)>

<ROUTINE REPAIRX-FCN ("OPTIONAL" (RARG <>) "AUX" OBJ)
	 <COND (<EQUAL? .RARG ,M-BEG>
		<COND (<EQUAL? ,WEDGE-PLACED 1>
		       <FSET ,WEDGE ,NDESCBIT>)>
		<RFALSE>)
	       (<EQUAL? .RARG ,M-LOOK>
		<LONG-DESCS>
		<TELL "The " D ,CONVEYERBELTA " is ">
		<COND (<NOT ,BELT-ON>
		       <TELL "not ">)>
		<TELL "in motion">
		<COND (<AND <EQUAL? ,WINNER-HERE ,REPAIR1>
			    <SET OBJ <FIRST? ,CONVEYERBELTA>>>)
		      (<AND <EQUAL? ,WINNER-HERE ,REPAIR2>
			    <SET OBJ <FIRST? ,CONVEYERBELTB>>>)
		      (<AND <EQUAL? ,WINNER-HERE ,REPAIR3>
			    <SET OBJ <FIRST? ,CONVEYERBELTC>>>)>
		<COND (.OBJ
		       <TELL ", moving ">
		       <COND (<NOT <GETP .OBJ ,P?ROBOT>>
			      <TELL "a ">)>
		       <TELL D .OBJ>)>
		<TELL "." CR>
		<COND (<AND <EQUAL? ,WEDGE-PLACED 1>
			    <EQUAL? ,WINNER-HERE ,REPAIR1>>
		       <TELL "The " D ,WEDGE 
			     " is positioned at the base of the " 
			     D ,CONVEYERBELTA "." CR>)
		      (ELSE <FCLEAR ,WEDGE ,NDESCBIT>)>)>>

<ROOM HALL-STOP3
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (SOUTH TO HUMAN-ENTRY)
      (EAST TO HALL-STOP4)
      (WEST TO HALL-STOP2)
      (ROOMDESCS <PLTABLE 0
"I have reached a junction in the hallway. The east/west hallway meets with a southern corridor."
"Photonic sensors detect a shift in reflective activity indicating a corridor
which starts to the south."
0
"East side, west side, all around the south."
"Standard robotic areas can be detected to the south.">)
      (DESC "Access Hallway")
      (SYNONYM HALLWAY)
      (ADJECTIVE ACCESS)
      (LINE 3)
      (STATION HALL-STOP3)
      (CORRIDOR 6)>

<ROOM REC-AREA
      (IN ROOMS)
      (DESC "Activities Area")
      (SYNONYM ACTIVI)
      (FLAGS RLANDBIT ONBIT)
      (ROOMDESCS <PLTABLE 0
"I'm in a small room with exits to the west and east. Sonar detects odd
objects within the room whose purpose eludes my perceptive abilities."
"There is a lot of vibrational and electrical activity within this location,
though none of its purposes seem immediately evident."
0
"Ah. Just what I needed. A spot amid the jungle of worries -- a place to
relax, to call my own, to stretch out and enjoy myself."
"I have determined this area to be for the private use of Human visitors.">)
      (EAST TO SLEEP-CHAMBER)
      (WEST TO TOOL-AREA)
      (SOUTH TO HALL-STOP4)
      (LINE 4)
      (STATION REC-AREA)
      (CORRIDOR 1)>

<ROOM HALL-STOP4
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (NORTH TO REC-AREA)
      (WEST TO HALL-STOP3)
      (EAST TO HALL-STOP5)
      (ROOMDESCS <PLTABLE 0 "I'm in an east/west hallway." "I'm in an east/west hallway." "I'm in an east/west hallway." "I'm in an east/west hallway."
"I'm in an east/west hallway.">)
      (DESC "Hallway")
      (LINE 5)
      (STATION HALL-STOP4)
      (CORRIDOR 2)>

<ROOM SLEEP-CHAMBER
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (DESC "Sleep Chamber")
      (SYNONYM CHAMBER)
      (ADJECTIVE SLEEP)
      (ROOMDESCS <PLTABLE 0
"I'm in a small room which has flat extensions jutting from the walls."
"There seems to be a complete absence of activity in this area."
0
"To sleep, perchance to dream. Ah, what foods these morsels be."
"CLC indicates this is a Human habitation area.">)
      (SOUTH TO HALL-STOP5)
      (WEST TO REC-AREA)
      (ACTION SLEEP-CHAMBER-FCN)
      (LINE 4)
      (STATION SLEEP-CHAMBER)
      (CORRIDOR 33)>

<ROUTINE SLEEP-CHAMBER-FCN ("OPTIONAL" (RARG <>))
	 <COND (<AND <EQUAL? .RARG ,M-END>
		     <EQUAL? ,PRSO ,TOOLBAG>
		     <IN? ,TOOLBAG ,WINNER>
		     <VERB? TAKE>>
		<SETG RTHIEF ,WINNER>
		<DISABLE <INT I-STEAL>>
		<ENABLE <QUEUE I-CHASEAUDA -1>>)>>
		

<ROOM HALL-STOP5
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (DESC "Hallway Corner")
      (SYNONYM CORNER)
      (ADJECTIVE HALLWAY)
      (ROOMDESCS <PLTABLE 0
"The east/west corridor ends here and starts off to the south. To the north
is a small room."
"Sensory mechanisms detect a room to the north, a hallway to the west and to
the south."
0
"Lemme see, which way did I go? Who am I, anyway? What am I doing here, and why am I asking all these questions? Life is so confusing."
"CLC peripheral device detected to the south.">)
      (NORTH TO SLEEP-CHAMBER)
      (SOUTH TO HALL-T)
      (WEST TO HALL-STOP4)
      (LINE 5)
      (STATION HALL-STOP5)
      (CORRIDOR 34)>

<ROOM HALL-T
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (DESC "Hallway Branch")
      (SYNONYM BRANCH)
      (ADJECTIVE HALLWAY)
      (ROOMDESCS <PLTABLE 0
"I've reached a 'T' in the long, north/south hallway."
"Mechanical activity located to the east."
0
"The wheels of fate lie to the east, as all philosophers know."
"CLC peripheral detected to the south.">)
      (NORTH TO HALL-STOP5)
      (EAST TO FCMAINT)
      (SOUTH TO LOWER-CORE)
      (LINE 5)
      (STATION HALL-T)
      (CORRIDOR 32)>
       
<ROOM FCMAINT
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (DESC "Maintenance Access")
      (SYNONYM ACCESS)
      (ADJECTIVE MAINTE)
      (ROOMDESCS <PLTABLE 0
"I've reached the end of the eastern corridor. Before me, high overhead, is a strange combination of circular protuberances."
"Mechanical devices can be detected far out of range."
0
"Round and round she goes, where she stops, nobody knows."
"CLC signals are weaker in this area.">)
      (WEST TO HALL-T)
      (LINE 5)
      (STATION HALL-T)
      (ACTION FCMAINT-FCN)>

<GLOBAL FCWHEEL
	 <PLTABLE
0
"Sonar detects a circular object mounted on the wall high overhead, out of
reach. A small spray is also detected, going upward through the ceiling."
"Sensory mechanisms can detect a low concentration of acid in the air. Its origin is directly overhead. Approximately 99.87 percent of these acid droplets are going up into the room above."
"I can hear hissing coming from high overhead here."
"The turning of the screw, like the delicate machinations of life, goes on
far out of the reach of ordinary mortals."
"CLC tagged device WH located high overhead.">>

<ROUTINE FCMAINT-FCN ("OPTIONAL" (RARG <>))
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<LONG-DESCS>
		<FCLEAR ,WHEEL ,NDESCBIT>
		<COND (<AND <NOT <EQUAL? <GET ,FCWHEEL ,ROFF> 0>>
			    <NOT ,ACID-FIXED>>
		       <TELL <GET ,FCWHEEL ,ROFF> CR>
		       <FSET ,WHEEL ,NDESCBIT>)>
		<RTRUE>)>>

<ROOM LOWER-CORE
      (IN ROOMS)
      (DESC "Library Entrance")
      (SYNONYM ENTRANCE)
      (ADJECTIVE LIBRARY)
      (ROOMDESCS <PLTABLE 0
"Sonar scan indicates the corridor continues to the south, but off to the west
is a small, circular object before a huge, circular object."
"Huge electrical activity has been detected to the west."
0
"The answers to none of our questions awaits, granting the whiz kid can
audience to the west, which he can't, poor air-head."
"Library Core detected directly to the west.">)
      (FLAGS RLANDBIT ONBIT)
      (WEST TO INNER-CORE)
      (NORTH TO HALL-T)
      (SOUTH TO HALL-END)
      (LINE 5)
      (STATION LOWER-CORE)
      (CORRIDOR 32)>

<ROOM INNER-CORE
      (IN ROOMS)
      (DESC "Library Core")
      (SYNONYM CORE)
      (ADJECTIVE LIBRARY)
      (ROOMDESCS <PLTABLE 0
"Before me is a huge cylinder, the CLC, which extends out of my sonar's scanning range."
"An interfacing device sits before me, capable of interacting with the huge
data flow behind it."
0
"Ah, great master, tell all!"
"Standing before the Library Core, the human-interactive peripheral. This
peripheral allows no interaction with robots.">)
      (FLAGS RLANDBIT ONBIT)
      (EAST TO LOWER-CORE)
      (LINE 5)
      (STATION LOWER-CORE)>

<ROOM HALL-END
      (IN ROOMS)
      (DESC "Hallway End")
      (SYNONYM END)
      (ADJECTIVE HALLWAY)
      (ROOMDESCS <PLTABLE 0
"Sonar detects the end of the southern hallway. To the east is a long, narrow
area which travels out of my receiving range."
"Sensory input indicates the end of the southern hallway here, with extremely
violent force fields and electrical disturbances to the east."
"I can hear the crackling of ozone in the air to the east."
"This path through life may be more dangerous than it looks. After all, appearances can be deceiving."
"CLC warns that the area to the east is dangerous.">)
      (NORTH TO LOWER-CORE)
      (EAST "CLC WARNING: Dangerous force fields prevent eastern movement.")
      (FLAGS RLANDBIT ONBIT)
      (LINE 5)
      (STATION HALL-END)
      (CORRIDOR 96)>

<ROOM CORRIDOR-4
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (DESC "Short Corridor")
      (SYNONYM CORRID)
      (ADJECTIVE SHORT)
      (ROOMDESCS <PLTABLE 0
"I have reached a place in the corridor where the floor rises up to the northeast. Sonar can detect a huge open area directly to the east."
"Wiring etched into the walls branches off to the northeast from here, while an incredibly powerful source of energy is easily detectable to the east."
"I can hear a difference in the air currents and air conditioning circuits here
as if another passage started to the northeast."
"The great interpreter of all our daily occurences lies ahead, while a walk in
the sky waits for me to the northeast."
"CLC indicates I have arrived at a northeast branch in the corridor." >)
      (WEST TO CORRIDOR-3)
      (NE TO NE-PASSAGE1)
      (EAST TO ACIDMIST)
      (LINE 2)
      (STATION CORRIDOR-4)
      (CORRIDOR 144)
      (ACTION BEWARE-MIST-FCN)
      (GLOBAL WIRING)>

<ROUTINE BEWARE-MIST-FCN ("OPTIONAL" (RARG <>))
	 <COND (<AND <EQUAL? .RARG ,M-LOOK>
		     <NOT ,ACID-FIXED>
		     <NOT <WHIZ?>>
		     <NOT <WALDO?>>>
		<LONG-DESCS>
		<TELL <GET ,BEWARE-TBL ,ROFF> CR>)>>

<GLOBAL BEWARE-TBL
	<PLTABLE "" ""
"WARNING: Sensors indicate a light mist, analyzed as a penetrating acid, floats in the air to the east."
"I can hear a faint hissing coming through the floor to the east."
"Bathe in luxuriating, though scorching, solvents." "" >>

<ROOM NE-PASSAGE1
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (SW TO CORRIDOR-4)
      (NE TO NE-PASSAGE2)
      (DESC "Rising Passage")
      (SYNONYM PASSAGE)
      (ADJECTIVE RISING)
      (ROOMDESCS <PLTABLE 0
"I am on an inclined surface which continues northeast and southwest. The
slant of the floor here indicates that I am between levels."
"Internal mechanisms indicate this area joins two different levels."
"Far off, near the top of this rising passage, I can hear a loud wind."
"Like levels of the Inferno, I slide into despair and climb to new heights."
"CLC internally informs me I am between the Main level and the Skywalk.">)
      (LINE 0)
      (STATION NE-PASSAGE1)
      (CORRIDOR 128)>



<ROOM NE-PASSAGE2
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (DESC "Top Passage")
      (SYNONYM PASSAGE)
      (ADJECTIVE TOP)
      (SW TO NE-PASSAGE1)
      (NORTH TO SKY1)
      (ROOMDESCS <PLTABLE 0 
"I am at the top of a passage which descends to the southwest. Before me, to
the north, is the entrance to an east/west walkway."
"Internal sensory mechanisms indicate an area of violent motion lies to the
north, while internal mapping indicates a descending passage to the southwest."
"The roar of wind comes from the north and is overwhelming. Turning down my
audio-sensitivity."
"Whisk me away, zip me today.|
Come out far, far far away.|
Mail me home, pop me to stay|
Flung to the north, where I can't say."
"CLC indicates I am directly to the south of the Skywalk. A passage descends
to the southwest." >)
      (LINE 0)
      (STATION NE-PASSAGE2)
      (CORRIDOR 128)>

<ROOM SKY1
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (DESC "Skywalk Alpha")
      (SYNONYM ALPHA)
      (ADJECTIVE SKYWAL)
      (ROOMDESCS <PLTABLE 0
"Sonar detects a long tube directly to the north, while the skywalk continues
to the west from here."
"Sensory receptors detect incredible electrical and ionic disturbances coming
from the north of here."
"I can hear the tremendous roar of wind in a tunnel to the north."
"Pop the message in the tube and out comes the medium massage."
"This area is described by the CLC as a transporter tube.">)
      (SOUTH TO NE-PASSAGE2)
      (WEST TO SKY2)
      (NORTH TO WEATHER)
      (ACTION SKY-FCN)
      (LINE 0)
      (STATION SKY1)
      (CORRIDOR 256)>

<ROOM SKY2
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (DESC "Skywalk Beta")
      (SYNONYM BETA)
      (ADJECTIVE SKYWAL)
      (ROOMDESCS <PLTABLE 0
"Sonar detects a long tube directly to the north, while the skywalk continues
to the east and west of here."
"Sensory receptors detect incredible electrical and ionic disturbances coming
from the north of here. Similar disturbances can be detected from the east and
west."
"I can hear the tremendous roar of wind in a tunnel to the north. An exact
duplication of this sound can be detected from the east and west, though their
intensities are somewhat less."
"Pop the message in the tube and out comes the medium rare."
"This area is described by the CLC as a transporter tube.">)
      (EAST TO SKY1)
      (WEST TO SKY3)
      (NORTH TO HYDRO)
      (ACTION SKY-FCN)
      (LINE 0)
      (STATION SKY2)
      (CORRIDOR 256)>

<ROOM SKY3
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (DESC "Skywalk Gamma")
      (SYNONYM GAMMA)
      (ADJECTIVE SKYWAL)
      (ROOMDESCS <PLTABLE 0
"Sonar detects a long tube directly to the north, while the skywalk continues
to the east from here."
"Sensory receptors detect incredible electrical and ionic disturbances coming
from the north of here."
"I can hear the tremendous roar of wind in a tunnel to the north."
"Pop the message in the tube and out comes the medium massage."
"This area is described by the CLC as a transporter tube.">)
      (NORTH TO RTD)
      (EAST TO SKY2)
      (ACTION SKY-FCN)
      (LINE 0)
      (STATION SKY3)
      (CORRIDOR 256)>

<ROUTINE SKY-FCN ("OPTIONAL" (RARG <>))
	 <COND (<EQUAL? .RARG M-END>
		<COND (<VERB? DROP>
		       <ROBOT-TELL "The " <>>
		       <TELL D ,PRSO " is whisked up by the force of the tube."
			     CR>
		       <COND (<IN? ,PRSO ,SKY1>
			      <MOVE ,PRSO ,WEATHER>)
			     (<IN? ,PRSO ,SKY2>
			      <MOVE ,PRSO ,HYDRO>)
			     (<IN? ,PRSO ,SKY3>
			      <MOVE ,PRSO ,RTD>)>)>)>>

<ROOM WEATHER
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (DESC "Weather Control Area")
      (SYNONYM CONTRO)
      (ADJECTIVE WEATHE)
      (GLOBAL CONTROL-PANELS)
      (ROOMDESCS <PLTABLE 0
"I'm in a small area at the end of the jet tube. Sonar detects a small console within reach of my extensions and mounted on this panel are three dials."
"I'm in a small but electrically intensive area. I can detect three variable potentiometers on a small console."
0
"Slippin' 'n' slidin', turn the dials and we'll be ridin'." 0>)
      (SOUTH TO SKY1)
      (LINE 0)
      (STATION SKY1)
      (ACTION DESCRIBE-CONTROLS-FCN)>

<ROUTINE DESCRIBE-CONTROLS-FCN ("OPTIONAL" (RARG <>) "AUX" D1 D2 D3 (DOFF 0))
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<LONG-DESCS>
		<COND (<AUDA?>
		       <RTRUE>)>
		<COND (<EQUAL? ,WINNER-HERE ,WEATHER>
		       <SET D1 ,WDIAL1>
		       <SET D2 ,WDIAL2>
		       <SET D3 ,WDIAL3>)
		      (T
		       <SET DOFF 3>
		       <SET D1 ,LEVER1>
		       <SET D2 ,LEVER2>
		       <SET D3 ,LEVER3>)>
		<TELL "The " D .D1 " is set to " N <GET ,DIALSETS <+ 1 .DOFF>>
		      ", the " D .D2 " is set to " N <GET ,DIALSETS <+ 2 .DOFF>>
		      ", and the " D .D3 " is set to " N <GET ,DIALSETS <+ 3 .DOFF>>
		      "." CR>)>>

<ROOM HYDRO
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (DESC "Hydroponics Control Area")
      (SYNONYM CONTRO)
      (ADJECTIVE HYDROP)
      (ROOMDESCS <PLTABLE 0
"I have entered a small room. My sonar units and delicate touching extensions
indicate there are a series of three levers on a small panel."
"I am in a small room whose primary purpose is obvious by tracing the flow of
electrons. The three levers before me are linked to the Hydroponics section,
and they control the nutrient levels in the hydroponics tanks."
0
"Push a lever and out pops a food pellet. What a life for a rat."
"I'm in the Hydroponics Control area. CLC indicates that the three levers on
the small panel are for mixing nutrient levels. More data on levers available at the CLC Technical Peripheral.">)
      (SOUTH TO SKY2)
      (LINE 0)
      (STATION SKY2)
      (ACTION DESCRIBE-CONTROLS-FCN)
      (GLOBAL CONTROL-PANELS)>

<ROOM RTD
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (DESC "Transit Control Area")
      (SYNONYM CONTRO)
      (ADJECTIVE TRANSI)
      (ROOMDESCS <PLTABLE 0
"I am in a tiny room. Sonar can detect three bumps on a panel before me."
"I am in a room which has three switching devices. These devices connect directly to the surface."
0
"Hacks and Hackies, drivers all.|
Control the flow and nothing falls|
Except for those up in the air|
But all in all, what's best is fair.|
They roam around in tough young gangs|
and corner those with metal fangs|
They zip along and throw you free|
Like Broncos on the wild prairie."
"CLC indicates there are switching devices for all surface transportation in this room.">)
      (SOUTH TO SKY3)
      (LINE 0)
      (STATION SKY3)
      (GLOBAL CONTROL-PANELS)>

<ROOM ACIDMIST
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (DESC "Cavernous Room")
      (SYNONYM CAVERNOUS)
      (ROOMDESCS <PLTABLE 0
"Sonar detects a large open area, with three huge objects far off to the east."
"Photon receptors indicate this area is extremely large."
"I can hear distant machinery humming from the east." "Twice the size of life, this area makes me feel like a dwarf." 0>)
      (WEST TO CORRIDOR-4)
      (EAST TO MIDMIST)
      (ACTION ACIDMIST-FCN)
      (LINE 2)
      (STATION ACIDMIST)
      (CORRIDOR 16)>

<ROUTINE ACIDMIST-FCN ("OPTIONAL" (RARG <>))
	 <COND (<EQUAL? .RARG ,M-BEG>
		<COND (<NOT ,ACID-FIXED>
		       <COND (<EQUAL? <GET ,DEADBOTS ,ROFF> 0>
			      <PUT ,DEADBOTS ,ROFF 1>
			      <RFALSE>)>)>)
	       (<AND <EQUAL? .RARG ,M-LOOK>
		     <NOT ,ACID-FIXED>>
		<LONG-DESCS>
		<COND (<NOT <WHIZ?>>
		       <TELL <GET ,MISTY-TBL ,ROFF> CR>)>
		<RTRUE>)>>
		
<GLOBAL MISTY-TBL
	  <PLTABLE 0
"I can feel little things dropping onto my outer shell."
"Light is diffracted in this area and an analysis shows it is composed of a
slowly-working acid. The source of the mist comes from below."
"I can hear a hissing coming up from the floor."
"Raindrops keep fallin' on my head|
 And before you know it I'll|
 wake up dead... a puddle of lead.">>

<ROOM MIDMIST
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (DESC "East End")
      (SYNONYM END)
      (ADJECTIVE EAST)
      (ROOMDESCS <PLTABLE 0
"I have reached the east end of the huge open area. Directly before me is the
entrance into the lower reaches of the Beta FC. Access to the other computers is available through the northeast and southeast."
"This is incredible. The amount of energy flowing around me makes it difficult
to keep myself oriented. Directly before me is the entrance into the huge FC."
"I can hear the huge fans which have to be associated with the FCs."
"Ah, Mama! Here I am, your sonny boy, returned after a lifetime of wandering!"
"CLC transmits a welcome signal originating from the Beta FC, directly before me.">)
      (WEST TO ACIDMIST)
      (SE TO FC3)
      (EAST TO FC2)
      (NE TO FC1)
      (LINE 2)
      (STATION MIDMIST)
      (CORRIDOR 16)>

<ROOM FC3
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (DESC "Gamma FC")
      (SYNONYM FC)
      (ADJECTIVE GAMMA)
      (ROOMDESCS <PLTABLE 0
"Sensors detect a small, narrow tube to the north of here, while surrounding me is a huge object, the Gamma FC itself."
"Sensory mechanisms detect a tremendous channeling and flow of electrical and
data energy into an object surrounding me. Sensors detect a similar channeling to an object to the north."
0
"The third stage of our journey begins here, the music goes round and round."
"I stand within the third Filtering Computer, a massive device used to interface us with you and control the surface systems.">)
      (NORTH TO TUBE1)
      (NW TO MIDMIST)
      (LINE 2)
      (STATION FC3)
      (GLOBAL AIRCON)>

<ROOM TUBE1
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (DESC "Secondary Channel")
      (SYNONYM CHANNEL)
      (ADJECTIVE SECOND)
      (ROOMDESCS <PLTABLE 0
"I've entered a narrow tube which rests on a north/south axis. Many cables of small diameter travel within this tube, side by side in a groove. Sonar also detects a small hole in the side of the tube. Above this hole is a recessed sign."
"Sensory mechanisms detect the disquieting flow of electricity within this
tube. The flow is concentrated within the small cables which line a groove in the floor. There is a small hole in the wall of the tube awaiting a plug, while slightly higher up rests a sign."
"I can hear whirring and clicking as if of some hungry beast to the north and
south here."
"Connections are what make life worth living. In each direction we find our
source of disorientation, our metaphysical essence. Linkups are possible,
connecting our distant cousin with our essence, our very presence here. There's a signpost overhead -- the next stop..."
"CLC tagged location indicates I am within a connecting tube. The connecting
cables for the filtering computers line this floor, resting in their grooves. A small plug, PL-1, sits within the wall beneath the ACS.">)
      (NORTH TO FC2)
      (SOUTH TO FC3)
      (GLOBAL CABLES TVHOLE SIGNPOST)
      ;(ACTION TUBE-FCN)
      (LINE 2)
      (STATION TUBE1)>

;<ROUTINE TUBE-FCN ("OPTIONAL" (RARG <>))
	 <COND (<EQUAL? .RARG ,M-BEG>
		<COND (<AND <VERB? WALK WALK-TO FOLLOW MOVE-ROBOT-TO-LOC>
			    <IN? ,TV ,WINNER>
			    ,TV-ON>
		       <ROBOT-TELL "(Unplugging the " <>>
		       <TELL D ,TV " first.)" CR>
		       <CRLF>
		       <SETG TV-ON <>>
		       <RFALSE>)>)>>

<ROOM FC2
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (DESC "Beta FC")
      (SYNONYM FC)
      (ADJECTIVE BETA)
      (ROOMDESCS <PLTABLE 0
"I am standing inside a structure of incredible complexity. A narrow tube runs
to the north, while another one runs to the south. Another tunnel-like tube
leads to the west."
"I am within an immense device which contains immeasurable circuitry and
switching devices. I can detect connections to the north and south of this
device."
"I can hear the tremendous roar of air conditioning here. Air currents flow to
the north, the west, and the south."
"Amid the nervous neurons, the synaptic links make jumps akin to imagination
found only in Wonderland."
"I am within the Beta FC.">)
      (NORTH TO TUBE2)
      (SOUTH TO TUBE1)
      (WEST TO MIDMIST)
      (LINE 2)
      (STATION FC2)
      (GLOBAL WIRING AIRCON)>

<ROOM TUBE2
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (DESC "Primary Channel")
      (SYNONYM CHANNEL)
      (ADJECTIVE PRIMARY)
      (ROOMDESCS <PLTABLE 0
"I've entered a narrow tube which rests on a north/south axis. Many cables travel within this tube, each one resting on the groove in the floor. Sonar also detects a small hole in the side of the tube, right below a recessed sign."
"Sensory mechanisms detect the disquieting flow of electricity within this
tube. The flow is concentrated within the small cables which line the floor.
There is a small hole in the wall of the tube awaiting a plug. Above this hole is a sign."
"I can hear whirring and clicking as if of some hungry beast to the north and
south here."
"Connections are what make life worth living. In each direction we find our
source of disorientation, our metaphysical essence. Linkups are possible,
connecting our distant cousin with our essence. There's a signpost up ahead -- the next stop, the Ozonezone."
"CLC tagged location indicates I am within a connecting tube. The connecting
cables for the filtering computers line this floor, resting in their
individual grooves. A small plug, PL-1, sits within the wall, right below the ACS.">)
      (NORTH TO FC1)
      (SOUTH TO FC2)
      (GLOBAL CABLES TVHOLE SIGNPOST)
      (LINE 2)
      (STATION TUBE2)>

<ROOM FC1
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (DESC "Alpha FC")
      (SYNONYM FC)
      (ADJECTIVE ALPHA)
      (ROOMDESCS <PLTABLE 0
"Sensors detect a small, narrow tube to the south of here, while surrounding me is a huge object, the Alpha FC."
"Sensory mechanisms detect a tremendous channeling and flow of electrical and
data energy into an object surrounding me. Sensors detect a similar channeling to an object to the south."
0
"The first stage of our journey begins here, the music goes round and round."
"I stand within the first Filtering Computer, a massive device used to interface us with you and maintain the surface systems.">)
      (SOUTH TO TUBE2)
      (LINE 2)
      (STATION FC1)
      (GLOBAL AIRCON)>

<ROOM CAR-AREA
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (DESC "Vehicle Debarkation Area")
      (SYNONYM DEBARK)
      (ADJECTIVE VEHICL)
      (ROOMDESCS <PLTABLE 0
"Sonar detects the end of the southern hallway. To the west is a long, narrow
area which travels out of my receiving range."
"Sensory input indicates the end of the southern hallway here, with extremely
violent force fields and electrical disturbances to the west."
"I can hear the crackling of ozone in the air to the west."
"I got my license through the mail, but that never stopped Franklin from chancing my ability."
"CLC warns that the area to the west is dangerous.">)
      (NORTH TO BIO-INT)
      (WEST "CLC WARNING: Dangerous force fields prevent western movement.")
      (LINE 5)
      (STATION CAR-AREA)
      (CORRIDOR 64)>

<ROOM BIO-INT
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (DESC "Biology Corridor")
      (SYNONYM CORRID)
      (ADJECTIVE BIOLOG)
      (ROOMDESCS <PLTABLE 0
"Sonar detects an intersection with a narrow passageway leading off to the
west."
"My sensory apparatus detects some strange vibrational emanations coming from both the north and the west. The area to the south is rife with destructive ionic activity."
0
"We know where we were born, and now we are approaching your area of rebirth."
"CLC tagged area indicates the Biological Section contains materials potentially dangerous to your survival.">)
      (NORTH TO CRYOUNITS)
      (SOUTH TO CAR-AREA)
      (WEST TO BIO-LAB)
      (LINE 5)
      (STATION BIO-INT)>

<ROOM BIO-LAB
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (DESC "Biological Laboratory")
      (SYNONYM LABORA LAB)
      (ADJECTIVE BIOLOG)
      (EAST TO BIO-INT)
      (ROOMDESCS <PLTABLE 0
"Sonar detects a large structure within this room. The large structure sits in
the center of the room."
"Quite a bit of electrical, ionic, and vibrational energy are being generated
in this room.  The walls are lined with miles of wiring and circuitry."
0
"Ashes from gnashes, dust to bust, we all go round the circle."
"This area is identified as the Biological Lab. Equipment here is available
for clone revivification.">)
      (LINE 5)
      (STATION BIO-INT)
      (GLOBAL WIRING)>

<ROOM CRYOUNITS
      (IN ROOMS)
      (FLAGS RLANDBIT ONBIT)
      (DESC "Cryogenic Area")
      (SYNONYM CRYOGE)
      (ROOMDESCS <PLTABLE 0
"Large canisters, similar in appearance to the cylinder in the Central Chamber, fill this area. Sonar can also detect a large straight rod extending from the
wall."
"Detection devices show a channelling of electrical and data information into
the large objects in this area. An electrical switch of some kind is mounted
on the wall."
"I can hear the humming of air conditioning within this room."
"Happy birthday to you,|
Happy birthday to you.|
Happy birthday dear human,|
Happy birthday to you!"
"This area contains human clones, each in a canister, replacements for future generations of controllers.">)
      (SOUTH TO BIO-INT)
      (LINE 5)
      (STATION CRYOUNITS)
      (GLOBAL AIRCON)>

<ROOM UD-TUBE
      (IN ROOMS)
      (DESC "UD Tube")
      (FLAGS RLANDBIT ONBIT)
      (EAST TO STERILE-AREA)
      (SYNONYM DEAD)>

<ROOM HELL
      (IN ROOMS)
      (DESC "Hell")
      (FLAGS RLANDBIT ONBIT)
      (SYNONYM HELL)>