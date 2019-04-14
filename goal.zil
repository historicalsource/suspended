"GOAL for
			    SUSPENDED
	Copyright 1982 Infocom, Inc.  All rights reserved.
"

"This code is the local T system."

<GLOBAL DIR-STRINGS
	<PTABLE  P?NORTH "north" P?SOUTH "south"
		P?EAST "east" P?WEST "west"
		P?NW "northwest" P?NE "northeast"
		P?SW "southwest" P?SE "southeast"
		P?DOWN "downstairs" P?UP "upstairs"
		P?IN "in" P?OUT "out">>

"Rapid Transit Line Definitions and Identifiers"

<CONSTANT A-LINE-C 0>
<CONSTANT B-LINE-C 1>
<CONSTANT C-LINE-C 2>
<CONSTANT D-LINE-C 3>
<CONSTANT E-LINE-C 4>
<CONSTANT F-LINE-C 5>

<GLOBAL A-LINE
	<PTABLE 0 SKY3 P?EAST
	       P?WEST SKY2 P?EAST
	       P?WEST SKY1 P?SOUTH
	       P?NORTH NE-PASSAGE2 P?SW
	       P?NE NE-PASSAGE1 0>>

<GLOBAL B-LINE
	<PTABLE 0 SUPPLIES-MID P?NORTH
	       P?SOUTH SUPPLIES-NORTH P?EAST
	       P?WEST WEATHER-BANKS P?EAST
	       P?WEST CPU-ROOM P?NE
	       P?SW CORRIDOR-1 P?NE
	       P?SW CORRIDOR-2 P?EAST
	       P?WEST HALLWAY-JUNCTION P?SOUTH
	       P?NORTH OUTSIDE-CLC P?SOUTH
	       P?NORTH PERIPH-1 P?SE
	       P?NW PERIPH-2 P?SW
	       P?NE PERIPH-3 P?NW
	       P?SE PERIPH-4 P?EAST
	       P?WEST CLC-CORE 0>>

<GLOBAL C-LINE
	<PTABLE 0 REPAIR3 P?NORTH
	       P?SOUTH REPAIR2 P?NORTH
	       P?SOUTH REPAIR1 P?NORTH
	       P?SOUTH ROBOT-Z P?NW
	       P?SE ROBOT-PASSAGE P?NW
	       P?SE CORRIDOR-3 P?EAST
	       P?WEST CORRIDOR-4 P?EAST
	       P?WEST ACIDMIST P?EAST
	       P?WEST MIDMIST P?NE
	       P?SW FC1 P?SOUTH
	       P?NORTH TUBE2 P?SOUTH
	       P?NORTH FC2 P?SOUTH
	       P?NORTH TUBE1 P?SOUTH
	       P?NORTH FC3 0>>

<GLOBAL D-LINE
	<PTABLE 0 HUMAN-ENTRY P?NORTH
	       P?SOUTH HALL-STOP3 P?WEST
	       P?EAST HALL-STOP2 P?WEST
	       P?EAST HALL-STOP1 P?WEST
	       P?EAST NORTH-ENTRY P?WEST
	       P?EAST DEAD-END-1 0>>

<GLOBAL E-LINE
	<PTABLE 0 STERILE-AREA P?EAST
	       P?WEST DECON-CHAMBER P?EAST
	       P?WEST ENTRY-AREA P?EAST
	       P?WEST TOOL-AREA P?EAST
	       P?WEST REC-AREA P?EAST
	       P?WEST SLEEP-CHAMBER 0>>

<GLOBAL F-LINE
	<PTABLE 0 HALL-STOP4 P?EAST
	       P?WEST HALL-STOP5 P?SOUTH
	       P?NORTH HALL-T P?SOUTH
	       P?NORTH LOWER-CORE P?SOUTH
	       P?NORTH HALL-END P?EAST
	       P?WEST CAR-AREA P?NORTH
	       P?SOUTH BIO-INT P?NORTH
	       P?SOUTH CRYOUNITS 0>>
	       
<GLOBAL TRANSFER-TABLE
	<PTABLE 0 0
	       NE-PASSAGE1 CORRIDOR-4
	       NE-PASSAGE1 CORRIDOR-4
	       NE-PASSAGE1 CORRIDOR-4
	       NE-PASSAGE1 CORRIDOR-4
	       NE-PASSAGE1 CORRIDOR-4

	       HALLWAY-JUNCTION CORRIDOR-3
	       0 0
	       HALLWAY-JUNCTION CORRIDOR-3
	       HALLWAY-JUNCTION HUMAN-ENTRY
	       HALLWAY-JUNCTION HUMAN-ENTRY
	       HALLWAY-JUNCTION HUMAN-ENTRY

	       CORRIDOR-4 NE-PASSAGE1
	       CORRIDOR-3 HALLWAY-JUNCTION
	       0 0
	       CORRIDOR-3 HALLWAY-JUNCTION
	       CORRIDOR-3 HALLWAY-JUNCTION
	       CORRIDOR-3 HALLWAY-JUNCTION

	       HUMAN-ENTRY HALLWAY-JUNCTION
	       HUMAN-ENTRY HALLWAY-JUNCTION
	       HUMAN-ENTRY HALLWAY-JUNCTION
	       0 0
	       NORTH-ENTRY STERILE-AREA
	       HALL-STOP3 HALL-STOP4

	       SLEEP-CHAMBER HALL-STOP5
	       SLEEP-CHAMBER HALL-STOP5
	       SLEEP-CHAMBER HALL-STOP5
	       SLEEP-CHAMBER HALL-STOP5
	       0 0
	       SLEEP-CHAMBER HALL-STOP5

	       HALL-STOP4 HALL-STOP3
	       HALL-STOP4 HALL-STOP3
	       HALL-STOP4 HALL-STOP3
	       HALL-STOP4 HALL-STOP3
	       HALL-STOP5 SLEEP-CHAMBER
	       0 0>>

<GLOBAL COR-1
	<PTABLE P?WEST P?EAST
	       STERILE-AREA DECON-CHAMBER ENTRY-AREA TOOL-AREA REC-AREA
	       SLEEP-CHAMBER 0>>

<GLOBAL COR-2
	<PTABLE P?WEST P?EAST
	       DEAD-END-1 NORTH-ENTRY HALL-STOP1 HALL-STOP2 HALL-STOP3
	       HALL-STOP4 HALL-STOP5 0>>

<GLOBAL COR-4
	<PTABLE P?NORTH P?SOUTH
	       HALL-STOP3 HUMAN-ENTRY HALLWAY-JUNCTION 0>>

<GLOBAL COR-8
	<PTABLE P?SW P?NE
	       CPU-ROOM CORRIDOR-1 CORRIDOR-2 0>>

<GLOBAL COR-16
	<PTABLE P?WEST P?EAST
	       CORRIDOR-2 HALLWAY-JUNCTION CORRIDOR-3 CORRIDOR-4 ACIDMIST MIDMIST 0>>

<GLOBAL COR-32
	<PTABLE P?NORTH P?SOUTH
	       SLEEP-CHAMBER HALL-STOP5 HALL-T LOWER-CORE HALL-END 0>>

<GLOBAL COR-64
	<PTABLE P?WEST P?EAST
	       HALL-END CAR-AREA 0>>

<GLOBAL COR-128
	<PTABLE P?SW P?NE
	       CORRIDOR-4 NE-PASSAGE1 NE-PASSAGE2 0>>

<GLOBAL COR-256
	<PTABLE P?WEST P?EAST
	       SKY4 SKY3 SKY2 SKY1 0>>
	       

"CODE"

<ROUTINE KILL-GOAL (RBT "OPTIONAL" (DRAG <>) "AUX" GT OFFSET)
	 <SET OFFSET <GETP .RBT ,P?ROBOT>>
	 <SET GT <GET ,GOAL-TABLES .OFFSET>>
	 <PUT .GT ,GOAL-S <>>
	 <PUT .GT ,GOAL-F <>>
	 <PUT .GT ,GOAL-ENABLE T>
	 <COND (.DRAG
		<PUT ,DRAG-TBL .OFFSET 0>)>
	 <RFALSE>>

<ROUTINE SET-GOAL (RBT GOAL "AUX" (HERE <LOC .RBT>) HL GL GT)
	 #DECL ((RBT GOAL HERE) OBJECT (HL GL) FIX
		(PRIORITY) <OR FALSE ATOM>)
	 <SET GT <GET ,GOAL-TABLES <GETP .RBT ,P?ROBOT>>>
	 <PUT .GT ,GOAL-I <+ <* <GETP .HERE ,P?LINE> 12>
			     <* <GETP .GOAL ,P?LINE> 2>>>
	 <PUT .GT ,GOAL-S <GETP .GOAL ,P?STATION>>
	 <PUT .GT ,GOAL-F .GOAL>
	 <PUT .GT ,GOAL-ENABLE T>
	 <LOC .RBT>>

<ROUTINE FOLLOW-GOAL (RBT "AUX" (HERE <LOC .RBT>) LINE LN RM GT GOAL FLG
		      		   (GOAL-FLAG <>) (IGOAL <>) LOC (CNT 1) DIR)
	 #DECL ((RBT HERE LOC RM) OBJECT (LN CNT) FIX
		(GOAL-FLAG) <OR ATOM FALSE>)
	 <SET GT <GET ,GOAL-TABLES <GETP .RBT ,P?ROBOT>>>
	 <COND (<==? .HERE <GET .GT ,GOAL-F>>
		<ARRIVAL .RBT>
		<COND (<NOT <EQUAL? .RBT ,PEOPLE>>
		       <RTRUE>)
		      (T <RFALSE>)>)
	       (<NOT <GET .GT ,GOAL-ENABLE>> <RFALSE>)>
	 %<COND (<GASSIGNED? PREDGEN>
		 '<COND (<NOT <EQUAL? <SET LOC <GETP .HERE ,P?STATION>>
				      .HERE>>
			 <RETURN <MOVE-RBT .RBT .LOC>>)>)
		(T
		 '<COND (<NOT <EQUAL? <SET LOC ,<GETP .HERE ,P?STATION>>
				      .HERE>>
			 <RETURN <MOVE-RBT .RBT .LOC>>)>)>
	 <COND (<==? <SET GOAL <GET ,TRANSFER-TABLE
				    <SET IGOAL <GET .GT ,GOAL-I>>>> 0>
		<SET IGOAL <>>
		<SET GOAL <GET .GT ,GOAL-S>>)>
	 <COND (<NOT .GOAL> <RFALSE>)
	       (<==? .HERE .GOAL>
		<COND (.IGOAL
		       <COND (<NOT <SET FLG
			           <MOVE-RBT .RBT
				             <GET ,TRANSFER-TABLE
						  <+ .IGOAL 1>>>>>
			      <SET-GOAL .RBT <GET .GT ,GOAL-F>>)>
		       <RETURN .FLG>)
		      (<NOT <==? .HERE <GET .GT ,GOAL-F>>>
		       <MOVE-RBT .RBT <GET .GT ,GOAL-F>>
		       <RETURN <ARRIVAL .RBT>>)
		      (T
		       <RETURN <ARRIVAL .RBT>>)>)>
	 <SET LINE <GET-LINE <GETP .GOAL ,P?LINE>>>
	 <REPEAT ()
		 <COND (<==? <SET RM <GET .LINE .CNT>> .HERE>
		        <COND (.GOAL-FLAG
			       <SET LOC <GET .LINE <- .CNT 3>>>)
			      (T
			       <SET LOC <GET .LINE <+ .CNT 3>>>)>
			<RETURN <MOVE-RBT .RBT .LOC>>)
		       (<==? .RM .GOAL>
			<SET GOAL-FLAG T>)>
		 <SET CNT <+ .CNT 3>>>>

<GLOBAL STUCK-QUIPS
	<PLTABLE "Internal mapping doesn't extend from "
                "Sonar doesn't detect an easy way to get from "
		"Sensory mechanisms indicate it's impossible to get from "
		"Holy earwax. I can't get from "
		"Alas, stuck, stuck, stuck. I can't get from "
		"CLC indicates I cannot relocate going from ">>

<GLOBAL MORE-STUCKS
	<PLTABLE "I'm waiting for alternate instructions."
		"Directions requested."
		"Please advise."
		"I'm listening for additional instructions."
		"Tell me, oh leader, what to do next."
		"Awaiting instructions.">>
		
<ROUTINE STUCK (RBT WHERE "AUX" GT TEMP OFFSET)
	 <SET OFFSET <GETP .RBT ,P?ROBOT>>
	 <SET GT <GET ,GOAL-TABLES .OFFSET>>
	 <SET TEMP ,WINNER>
	 <CHANGE-WINNER .RBT T>
	 <COND (<EQUAL? ,WINNER .TEMP>
		<ROBOT-TELL <GET ,STUCK-QUIPS ,ROFF> <>>)
	       (T 
		<TELL <GET ,INTER-TBL ,ROFF> " " <GET ,STUCK-QUIPS ,ROFF>>)> 
	 <TELL SD <LOC .RBT> " to ">
	 <COND (<IRIS?>
		<TELL "Angling Corridor">)
	       (T
		<TELL SD .WHERE>)>
	 <TELL ". " <GET ,MORE-STUCKS ,ROFF> CR>
	 <KILL-GOAL .RBT>
	 <PUT ,ROBOT-FOLLOW .OFFSET 0>
	 <PUT ,FOLLOW-TBL ,ROFF 0>
	 <CHANGE-WINNER .TEMP T>
	 <RTRUE>>

<ROUTINE MOVE-RBT (RBT WHERE "AUX" (L <LOC .RBT>) (COUNT 0) FLOC FROB)
	 #DECL ((RBT WHERE) OBJECT)
	 <COND (<MOVE-RBT? .RBT .L .WHERE>
		<RTRUE> ;"Prints something")>
	 <REPEAT ()
		 <SET COUNT <+ .COUNT 1>>
		 <COND (<EQUAL? .COUNT 7>
			<RETURN>)>
		 <COND (<EQUAL? <GET ,FOLLOW-TBL .COUNT> .RBT>
			<SET FROB <GET ,NAME-TBL <- .COUNT 1>>>
			<SET FLOC <LOC .FROB>>
			<COND (<AND <EQUAL? .FROB ,IRIS>
				    <EQUAL? ,CORRIDOR-1 .WHERE>>
			       <STUCK ,IRIS ,CPU-ROOM>)
			      (T
			       <MOVE-RBT? .FROB .FLOC .WHERE>)>)>>
	 <RFALSE>>

<ROUTINE MOVE-RBT? (RBT L WHERE)
	 <COND (<AND <EQUAL? .L ,HUMAN-ENTRY ,HALLWAY-JUNCTION>
		     <EQUAL? .WHERE ,HUMAN-ENTRY ,HALLWAY-JUNCTION>
		     <NOT <EQUAL? ,WEDGE-PLACED 2>>
		     ;<NOT <EQUAL? <LOC ,WEDGE> ,HUMAN-ENTRY ,HALLWAY-JUNCTION>>
		     <NOT <EQUAL? .RBT ,PEOPLE>>>
		<STUCK .RBT .WHERE>
		<RTRUE>)
	       (<AND <EQUAL? .L ,CORRIDOR-4>
		     <EQUAL? .WHERE ACIDMIST>
		     <NOT ,ACID-FIXED>
		     <NOT <EQUAL? ,PEOPLE .RBT>>>
		<COND (<EQUAL? <GET ,DEADBOTS <GETP .RBT ,P?ROBOT>> 0>
		       <PUT ,DEADBOTS <GETP .RBT ,P?ROBOT> 1>
		       <DO-THE-MOVE .RBT .L .WHERE>
		       <RFALSE>)
		      (T
		       <DO-THE-MOVE .RBT .L .WHERE>
		       <RFALSE>)>)
	       (<AND <EQUAL? .L ,HALL-END ,CAR-AREA>
		     <EQUAL? .WHERE ,HALL-END ,CAR-AREA>>
		<STUCK .RBT .WHERE>
		<RTRUE>)
	       (<AND <EQUAL? .RBT ,IRIS>
		     <EQUAL? .L ,CPU-ROOM ,CORRIDOR-1>
		     <EQUAL? .WHERE ,CORRIDOR-1 ,CORRIDOR-2>>
		<MOVE ,IRIS ,CPU-ROOM>
		<SET .WHERE ,CORRIDOR-1>
		<SET .L ,CPU-ROOM>
		<STUCK .RBT .WHERE>
		<RTRUE>)
	       (ELSE
		<DO-THE-MOVE .RBT .L .WHERE>
		<RFALSE>)>>

<ROUTINE DO-THE-MOVE (RBT L WHERE "AUX" DRAGEE)
	 <MOVE .RBT .WHERE>
	 <COND (<==? .RBT ,WINNER>
		<SETG WINNER-HERE .WHERE>)>
	 <PUT ,LAST-ROOM <GETP .RBT ,P?ROBOT> .L>
	 <COND (<NOT <EQUAL? .RBT ,PEOPLE>>
		<COND (<NOT <EQUAL? 
			     <SET DRAGEE 
				  <GET ,DRAG-TBL 
				       <GETP .RBT ,P?ROBOT>>> 0>>
		       <MOVE .DRAGEE .WHERE>
		       <PUT ,LAST-ROOM <GETP .DRAGEE ,P?ROBOT> .L>)>)>
	 <RFALSE>>

<ROUTINE COR-DIR (HERE THERE "AUX" COR RM (PAST 0) (CNT 2))
	 <SET COR <GET-COR <BAND <GETP .THERE ,P?CORRIDOR>
				 <GETP .HERE ,P?CORRIDOR>>>>
	 <REPEAT ()
		 <COND (<==? <SET RM <GET .COR .CNT>> .HERE>
			<SET PAST 1>
			<RETURN>)
		       (<==? .RM .THERE>
			<RETURN>)>
		 <SET CNT <+ .CNT 1>>>
	 <GET .COR .PAST>>

<ROUTINE GET-LINE (LN)
	 <COND (<==? .LN 0> ,A-LINE)
	       (<==? .LN 1> ,B-LINE)
	       (<==? .LN 2> ,C-LINE)
	       (<==? .LN 3> ,D-LINE)
	       (<==? .LN 4> ,E-LINE)
	       (T ,F-LINE)>>

<ROUTINE GET-COR (NUM)
	 #DECL ((NUM) FIX)
	 <COND (<==? .NUM 1> ,COR-1)
	       (<==? .NUM 2> ,COR-2)
	       (<==? .NUM 4> ,COR-4)
	       (<==? .NUM 8> ,COR-8)
	       (<==? .NUM 16> ,COR-16)
	       (<==? .NUM 32> ,COR-32)
	       (<==? .NUM 64> ,COR-64)
	       (<==? .NUM 128> ,COR-128)
	       (T ,COR-256)>>

<ROUTINE DIR-PRINT (DIR "AUX" (CNT 0))
	 #DECL ((DIR CNT) FIX)
	 <REPEAT ()
		 <COND (<==? <GET ,DIR-STRINGS .CNT> .DIR>
			<COND (<NOT <EQUAL? .DIR ,P?UP ,P?DOWN>>
			       <TELL "the ">)>
			<PRINT <GET ,DIR-STRINGS <+ .CNT 1>>>
			<RTRUE>)>
		 <SET CNT <+ .CNT 1>>>>

"Goal tables for the 6 characters, offset by a constant, which,
for a given robot, is the P?ROBOT property of the object."

<GLOBAL GOAL-TABLES
	<TABLE <TABLE <> <> <> <> 1 <> <> I-FOLLOW>
	       <TABLE <> <> <> <> 1 <> <> G-ROBOT>
	       <TABLE <> <> <> <> 1 <> <> G-ROBOT>
	       <TABLE <> <> <> <> 1 <> <> G-ROBOT>
	       <TABLE <> <> <> <> 1 <> <> G-ROBOT>
	       <TABLE <> <> <> <> 1 <> <> G-ROBOT>
	       <TABLE <> <> <> <> 1 <> <> G-ROBOT>
	       <TABLE <> <> <> <> 1 <> <> G-PEOPLE>>>

<CONSTANT CHARACTER-MAX 7>

"Offsets into GOAL-TABLEs"

<CONSTANT GOAL-F 0>
<CONSTANT GOAL-S 1>
<CONSTANT GOAL-I 2>
<CONSTANT GOAL-LDIR 3>
<CONSTANT GOAL-ENABLE 4>
<CONSTANT GOAL-PRIORITY 5>
<CONSTANT GOAL-QUEUED 6>
<CONSTANT GOAL-FUNCTION 7>
 
"Goal-function constants, similar to M-xxx in MAIN"

<CONSTANT G-REACHED 1>
<CONSTANT G-ENROUTE 2>

<ROUTINE GOAL? (RBT)
	 <GET <GET ,GOAL-TABLES <GETP .RBT ,P?ROBOT>> ,GOAL-F>>

<ROUTINE I-FOLLOW ("AUX" (FLG <>) (CNT 0) GT)
	 <REPEAT ()
		 <COND (<G? <SET CNT <+ .CNT 1>> ,CHARACTER-MAX>
			<RETURN>)
		       (<AND <GET <SET GT <GET ,GOAL-TABLES .CNT>> ,GOAL-S>
			     <GET .GT ,GOAL-ENABLE>>
			<PUT .GT ,GOAL-ENABLE T>
			<COND (<FOLLOW-GOAL <GET ,CHARACTER-TBL .CNT>>
			       <SET FLG T>)>)>>
	 .FLG>

<ROUTINE ARRIVAL (RBT "AUX" GT)
	 <SET GT <GET ,GOAL-TABLES <GETP .RBT ,P?ROBOT>>>
	 <PUT .GT ,GOAL-S <>>
	 <PUT .GT ,GOAL-F <>>
	 <APPLY <GET .GT ,GOAL-FUNCTION> .RBT ,G-REACHED>
	 <RTRUE>>

<GLOBAL ARRIVAL-QUIPS
	<PLTABLE "I've reached my destination, the "
		"Internal mapping indicates arrival at the "
		"Sensory mechanisms match goal directive. I am at the "
		"From what I can hear, I've arrived at the "
		"As much as I can be anyplace, I'm here at the "
		"CLC indicates matched arrival coordinates at the ">>

<ROUTINE G-ROBOT (RBT GARG "AUX" TEMP COUNT CHASED)
	 <COND (<==? .GARG ,G-REACHED>
		<SET TEMP ,WINNER>
		<CHANGE-WINNER .RBT T>
		<CRLF>
		<COND (<EQUAL? ,WINNER .TEMP>
		       <ROBOT-TELL <GET ,ARRIVAL-QUIPS ,ROFF> <>>)
		      (T 
		       <TELL <GET ,INTER-TBL ,ROFF> " " 
			     <GET ,ARRIVAL-QUIPS ,ROFF>>)>
		<KILL-GOAL ,WINNER T>
		<TELL SD <LOC ,WINNER> ".">
		<COND (<NOT <EQUAL? <SET CHASED <GET ,ROBOT-FOLLOW ,ROFF>> 0>>
		       <COND (<NOT <EQUAL? <LOC .CHASED> <LOC .RBT>>>
			      <TELL " Looks like I missed "
				    D .CHASED " though." CR>)>)>
		<PUT ,ROBOT-FOLLOW <GETP .RBT ,P?ROBOT> 0>
		<APPLY <GETP ,WINNER-HERE ,P?ACTION> ,M-ENTER>
		<CRLF>
		<CHANGE-WINNER .TEMP T>
		<RFATAL>)>>

;"NOTE: Follow-tbl, found in VERBS, puts the person to be followed into the 
        table.
  NOTE: ROBOT-FOLLOW is used to indicate the robot expected to be found on 
        arrival, set by GO TO a ROBOT.
  NOTE: LAST-ROOM is a table used by the verb FOLLOW to determine whether or  
        the robot to be followed was just here."

<GLOBAL ROBOT-FOLLOW
	<LTABLE 0 0 0 0 0 0>>

<GLOBAL DRAG-TBL
	<LTABLE 0 0 0 0 0 0 0>>

<GLOBAL LAST-ROOM
	<LTABLE 0 0 0 0 0 0 0>>

<ROUTINE G-PEOPLE (RBT GARG "AUX" COUNT)
	 <COND (<==? .GARG ,G-REACHED>
		<COND (<EQUAL? ,PR-NUMBER 1>
		       <PARRIVE1>)
		      (<EQUAL? ,PR-NUMBER 2>
		       <PARRIVE2>)
		      (<EQUAL? ,PR-NUMBER 3>
		       <PARRIVE3>)
		      (<EQUAL? ,PR-NUMBER 4>
		       <PARRIVE4>)
		      (<EQUAL? ,PR-NUMBER 5>
		       <PARRIVE5>)
		      (<EQUAL? ,PR-NUMBER 6>
		       <PARRIVE6>)
		      (<EQUAL? ,PR-NUMBER 7>
		       <PARRIVE7>)
		      (<EQUAL? ,PR-NUMBER 8>
		       <PARRIVE8>)
		      (<EQUAL? ,PR-NUMBER 9>
		       <PARRIVE9>)>)>>

"Routines to do looking down corridors"

<ROUTINE CORRIDOR-LOOK ("OPTIONAL" (ITM <>) "AUX" C Z COR VAL (FOUND <>))
	 <COND (<SET C <GETP ,WINNER-HERE ,P?CORRIDOR>>
		<REPEAT ()
			<COND (<NOT <L? <SET Z <- .C 256>> 0>>
			       <SET COR ,COR-256>)
			      (<NOT <L? <SET Z <- .C 128>> 0>>
			       <SET COR ,COR-128>)
			      (<NOT <L? <SET Z <- .C 64>> 0>>
			       <SET COR ,COR-64>)
			      (<NOT <L? <SET Z <- .C 32>> 0>>
			       <SET COR ,COR-32>)
			      (<NOT <L? <SET Z <- .C 16>> 0>>
			       <SET COR ,COR-16>)
			      (<NOT <L? <SET Z <- .C 8>> 0>>
			       <SET COR ,COR-8>)
			      (<NOT <L? <SET Z <- .C 4>> 0>>
			       <SET COR ,COR-4>)
			      (<NOT <L? <SET Z <- .C 2>> 0>>
			       <SET COR ,COR-2>)
			      (<NOT <L? <SET Z <- .C 1>> 0>>
			       <SET COR ,COR-1>)
			      (T <RETURN>)>
			<SET VAL <CORRIDOR-CHECK .COR .ITM>>
			<COND (<NOT .FOUND> <SET FOUND .VAL>)>
			<SET C .Z>>
		.FOUND)>>

<ROUTINE CORRIDOR-CHECK (COR ITM "AUX" (CNT 2) (PAST 0) (FOUND <>) RM OBJ)
	 <REPEAT ()
		 <COND (<==? <SET RM <GET .COR .CNT>> 0>
			<RFALSE>)
		       (<==? .RM ,WINNER-HERE> <SET PAST 1>)
		       (<SET OBJ <FIRST? .RM>>
			<REPEAT ()
				<COND (.ITM
				       <COND (<==? .OBJ .ITM>
					      <SET FOUND <GET .COR .PAST>>
					      <RETURN>)>)
				      (<GETP .OBJ ,P?ROBOT>
				       <COND (<EQUAL? <GETP .OBJ ,P?ROBOT> 7>
					      <TELL "Some " D .OBJ " are ">)
					     (ELSE
					      <TELL D .OBJ " is ">)>
				       <COND (<IN-MOTION? .OBJ>
					      <TELL "in motion ">)>
				       <TELL "off to ">
				       <DIR-PRINT <GET .COR .PAST>>
				       <DRAGGING? .OBJ>
				       <TELL ".">
				       <COND (<AND <EQUAL? .OBJ ,PEOPLE>
						   ,CHASING-THIEF
						   <EQUAL? ,WINNER ,RTHIEF>>
					      <TELL
" They appear to be in hot pursuit.">)>
				       <CRLF>)>
				<SET OBJ <NEXT? .OBJ>>
				<COND (<NOT .OBJ> <RETURN>)>>
			<COND (.FOUND <RETURN .FOUND>)>)>
		 <SET CNT <+ .CNT 1>>>>

<ROUTINE DRAGGING? (RBT "AUX" DRAGEE)
	 <COND (<EQUAL? .RBT ,PEOPLE>
		<RFALSE>)
	       (<NOT 
		<EQUAL? <SET DRAGEE <GET ,DRAG-TBL <GETP .RBT ,P?ROBOT>>> 0>>
		<TELL ", dragging " D .DRAGEE>
		<RFALSE>)>>

<ROUTINE IN-MOTION? (RBT "AUX" GT)
	 <SET GT <GET ,GOAL-TABLES <GETP .RBT ,P?ROBOT>>>
	 <COND (<AND <GET .GT ,GOAL-ENABLE>
		     <GET .GT ,GOAL-S>
		     <NOT <==? <LOC .RBT> <GET .GT ,GOAL-F>>>>
		<RTRUE>)
	       (T <RFALSE>)>>

<GLOBAL CHARACTER-TBL <PLTABLE IRIS WALDO SENSA AUDA POET WHIZ PEOPLE>>