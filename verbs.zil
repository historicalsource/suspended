"VERBS for
			      SUSPENSION
	(c) Copyright 1982 Infocom, Inc.  All Rights Reserved.
"

"SUBTITLE DESCRIBE THE UNIVERSE"

"SUBTITLE SETTINGS FOR VARIOUS LEVELS OF DESCRIPTION"

"SUBTITLE DESCRIBERS"

<ROUTINE V-LOOK ("AUX" STR AV)
	 <COND (<IN-MOTION? ,WINNER>
		<ROBOT-TELL "Moving through " <>>)
	       (ELSE
		<ROBOT-TELL "Internal map reference -- " <>>)>
	 <COND (<IN? ,WINNER ,CAR>
		<TELL "Inside the " D ,CAR "." CR>)
	       (ELSE
		<TELL SD ,WINNER-HERE CR>)>
	 <COND (<AND <IRIS?> <NOT ,IRIS-FIXED>>
		<TELL <PICK-ONE ,IRIS-BLIND> CR> <RTRUE>)>
	 <COND (<NOT <APPLY <GETP ,WINNER-HERE ,P?ACTION> ,M-LOOK>>
		<LONG-DESCS>)>
	 <DESCRIBE-OBJECTS>
	 <COND (<AND <EQUAL? ,WINNER-HERE ,HALL-END ,CAR-AREA>
		     <IN? ,CAR ,WINNER-HERE>
		     <NOT <IN? ,WINNER ,CAR>>>
		<PERFORM ,V?LOOK-INSIDE ,CAR>)>
	 <LOOK-CORRIDOR>>

<GLOBAL IRIS-BLIND
	<PLTABLE
"I can't see a thing." "I can't see." "Visual function nonfunctional."
"Everything is dark." "Where's my white cane?" "Get me a seeing-eye robot."
"Get me a seeing-eye cane. Without my visual function, I'm worthless."
"I don't mean to complain, but it would be nice if I got repaired."
"I'm doing the best I can, but without visual circuits, that's next to nothing.">>

<ROUTINE LONG-DESCS ()
	 <COND (<NOT <EQUAL? <GET <GETP ,WINNER-HERE ,P?ROOMDESCS> ,ROFF> 0>>
		       <TELL <GET <GETP ,WINNER-HERE ,P?ROOMDESCS> ,ROFF> CR>)
		      (ELSE
		       <TELL "I am in the " SD ,WINNER-HERE "." CR>)>>

<ROUTINE LOOK-CORRIDOR ()
	 <COND (<AND <GETP ,WINNER-HERE ,P?CORRIDOR>
		     <NOT <EQUAL? ,WINNER ,WHIZ ,WALDO>>>
		<CORRIDOR-LOOK>)>>

<ROUTINE DESCRIBE-ROBOTS ("AUX" (COUNT -1) (OFFS 0) OBJ LEADER RC)
	 <COND (<IN? ,WINNER ,CAR>
		<SET COUNT 0>)>
	 <REPEAT ()
		 <COND (<IN? <GET ,NAME-TBL .OFFS> ,WINNER-HERE>
			<SET COUNT <+ .COUNT 1>>)>
		 <COND (<G? <SET OFFS <+ .OFFS 1>> 6>
			<RETURN>)>>
	 <COND (<EQUAL? .COUNT 0> <RTRUE>)>
	 <COND (<AND <IRIS?>
		     <NOT ,IRIS-FIXED>
		     <RTRUE>>)>
	 <COND (<IN? ,WINNER ,CAR>
		<TELL "Standing outside the " D ,CAR " ">)
	       (ELSE
		<TELL "In the room with me ">)>
	 <COND (<EQUAL? .COUNT 1>
		<COND (<OR <IN? ,PEOPLE <LOC ,WINNER>>
			   <AND <IN? ,WINNER ,CAR>
				<IN? ,PEOPLE <LOC ,CAR>>>>
		       <TELL "are ">)
		      (ELSE
		       <TELL "is ">)>)
	       (T
		<TELL "are ">)>
	 <SET OFFS 0>
	 <REPEAT () 
		 <COND (<AND <IN? <SET OBJ <GET ,NAME-TBL .OFFS>> ,WINNER-HERE>
			     <NOT <EQUAL? ,WINNER .OBJ>>>
			<COND (<EQUAL? .OBJ ,PEOPLE>
			       <TELL "some ">)>
			<COND (<FSET? .OBJ ,CUTBIT>
			       <TELL "non-functional ">)>
			<TELL D .OBJ>
			<COND (<IN-MOTION? .OBJ>
			       <TELL " (in motion)">)>
			<COND (<EQUAL? <GET ,FOLLOW-TBL ,ROFF> .OBJ>
			       <TELL " whom I'm following">)>
			<SET RC 0>
			<REPEAT ()
				<SET RC <+ .RC 1>>
				<COND (<EQUAL? .RC 7>
				       <RETURN>)
				      (T
				       <COND (<EQUAL? <GET ,DRAG-TBL .RC> .OBJ>
					      <TELL " (being dragged)">
					      <RETURN>)>)>>
			<COND (<AND ,PLUGGED-IN
				    <EQUAL? .OBJ ,WHIZ>>
			       <TELL " (plugged in)">)>
			<COND (<EQUAL? .COUNT 1>
			       <TELL "." CR>
			       <RETURN>)
			      (<EQUAL? .COUNT 2>
			       <TELL " and ">)
			      (T <TELL ", ">)>
			<SET COUNT <- .COUNT 1>>)>
		 <SET OFFS <+ .OFFS 1>>>>
	       	 
<ROUTINE DESCRIBE-OBJECTS ("AUX" (OFFS 0) OBJ)
	 <DESCRIBE-ROBOTS>
	 <REPEAT ()
		 <COND (<AND <IN? <SET OBJ <GET ,NAME-TBL .OFFS>> ,WINNER-HERE>
			     <NOT <EQUAL? .OBJ ,WINNER>>>
			<PRINT-CONTENTS .OBJ>)>
		 <COND (<G? <SET OFFS <+ .OFFS 1>> 5>
			<RETURN>)>>
	 <COND (<AND <IRIS?>
		     <NOT ,IRIS-FIXED>
		     <RTRUE>>)>
	 <PRINT-CONT ,WINNER-HERE -1>>

<ROUTINE DESCRIBABLE? (OBJ)
	 <COND (<NOT <EQUAL? <GET <GETP .OBJ ,P?OBJDESCS>
				  <+ ,ROFF ,FDOFF>> 0>>
		<RTRUE>)>>

<ROUTINE PRINT-CONTENTS (OBJ "AUX" F N (1ST? T) NUM)
	 <COND (<SET F <FIRST? .OBJ>>
		<REPEAT ()
			<SET N <NEXT? .F>>
			<COND (<AND <NOT <FSET? .F ,NDESCBIT>>
				    <DESCRIBABLE? .F>>
			       <COND (.1ST?
				      <SET 1ST? <>>
				      <COND (<SET NUM <GETP .OBJ ,P?ROBOT>>
					     <COND (<EQUAL? .NUM 7>
						    <TELL "The " D .OBJ
							  " are carrying ">)
						   (T
						    <TELL D .OBJ
							  " is carrying ">)>)>)
				     (T
				      <TELL ", ">
				      <COND (<NOT .N> <TELL "and ">)>)>
			       <TELL "a " D .F>)>
			<SET F .N>
			<COND (<NOT .F>
			       <COND (<AND <NOT .1ST?> <GETP .OBJ ,P?ROBOT>>
				      <TELL "." CR>)>
			       <RETURN>)>>)>>

<ROUTINE PRINT-CONT (OBJ "OPTIONAL" (LEVEL 0) "AUX" Y (1ST? T))
	 <COND (<NOT <SET Y <FIRST? .OBJ>>> <RTRUE>)>
	 <REPEAT ()
		 <COND (<AND <NOT <FSET? .Y ,INVISIBLE>>
			     <NOT <FSET? .Y ,NDESCBIT>>
			     <NOT <GETP .Y ,P?ROBOT>>
			     <DESCRIBABLE? .Y>
			     <AND <NOT <EQUAL? .OBJ ,CAR>>
				  <NOT <IN? ,WINNER ,CAR>>>>
			<COND (.1ST?
			       <FIRSTER .OBJ .LEVEL>
			       <SET 1ST? <>>)>
			<DESCRIBE-OBJECT .Y <+ .LEVEL 1>>)>
		 <COND (<NOT <SET Y <NEXT? .Y>>>
			<RETURN <NOT .1ST?>>)>>>

<GLOBAL CARRY-TBL
	<PLTABLE "I am carrying..." "I am grasping..." "Sensors indicate I'm holding..." "My ears can hear the following in my extensions..." "My Zen Master says I am grasping..." "CLC feedback indicates I'm holding...">>

<ROUTINE FIRSTER (OBJ LEVEL "AUX" CNT)
	 <COND (<==? .OBJ ,WINNER>
		<ROBOT-TELL <GET ,CARRY-TBL ,ROFF>>)
	       (<NOT <IN? .OBJ ,ROOMS>>
		<COND (<FSET? .OBJ ,SURFACEBIT>
		       <TELL "Sitting ">
		       <COND (<EQUAL? .OBJ ,GROOVE1 ,GROOVE2>
			      <TELL "in">)
			     (T
			      <TELL "on">)>
		       <TELL " the " D .OBJ >
		       <SET CNT <CCOUNT .OBJ>>
		       <COND (<L? .CNT 2>
			      <TELL " is... " CR>)
			     (ELSE
			      <TELL " are... " CR>)>)
		      (ELSE
		       <TELL <GET ,INDENTS .LEVEL>
			     "The " D .OBJ " contains..." CR>)>)>>

<ROUTINE DESCRIBE-OBJECT (OBJ LEVEL "AUX" (STR <>) (WCOUNT 0))
	 <COND (<AND <0? .LEVEL>
		     <APPLY <GETP .OBJ ,P?DESCFCN> ,M-OBJDESC>>
		<RTRUE>)
	       (<AND <0? .LEVEL>
		     <NOT <FSET? .OBJ ,TOUCHBIT>>>		     
		<TELL <GET <GETP .OBJ ,P?OBJDESCS> <+ ,ROFF ,FDOFF>>>)
	       (<0? .LEVEL>
		<TELL "There is a " D .OBJ " here">
		<COND (<AND <EQUAL? .OBJ ,WEDGE>
			    ,ON-WEDGE>
		       <TELL " supporting ">
		       <COND (<EQUAL? ,ON-WEDGE <GETP ,WINNER ,P?ROBOT>>
			      <TELL "me">)
			     (T 
			      <REPEAT ()
				      <COND (<G? <SET WCOUNT <+ .WCOUNT 1>> 6>
					     <RETURN>)
					    (T
					     <COND (<EQUAL? ,ON-WEDGE .WCOUNT>
						    <TELL D 
					  <GET ,NAME-TBL <- .WCOUNT 1>>>)>)>>)>)>
		<TELL ".">)
	       (ELSE
		<TELL <GET ,INDENTS .LEVEL>>
		<TELL "A " D .OBJ>
		<COND (<FSET? .OBJ ,WEARBIT> <TELL " (being worn)">)>)>
	 <CRLF>
	 <COND (<AND <SEE-INSIDE? .OBJ> <FIRST? .OBJ>>
		<PRINT-CONT .OBJ <+ .LEVEL 1>>)>>
		  
<ROUTINE PRE-EXAMINE ()
	 <COND (<IN? ,PRSO ,ROOMS>
		<COND (<IN? ,WINNER ,PRSO>
		       <PERFORM ,V?LOOK>
		       <RTRUE>)
		      (T
		       <ROBOT-TELL "I can't see there from here.">
		       <RTRUE>)>)>>

<ROUTINE V-EXAMINE ("AUX" STR)
	 <COND (<AND ,PRSI
		     <NOT <IN? ,PRSO ,PRSI>>>
		<ROBOT-TELL "Better check the facts, compadre.">
		<RTRUE>)
	       (<OR <EQUAL? ,PRSO ,LEFT ,RIGHT ,INTNUM>
		    <EQUAL? ,PRSO ,LISTENING ,DRAGGING ,LOCATION>>
		<ROBOT-YUKS>
		<RTRUE>)
	       (<AND <EQUAL? ,PRSO ,MONITOR>
		     <IRIS?>
		     ,IRIS-FIXED
		     <EQUAL? <LOC ,IRIS> 
			     ,WEATHER-BANKS ,RTD-BANKS ,SERVO-SYSTEMS>>
		<V-LOOK>
		<RTRUE>)>
	 <SET STR <GET <GETP ,PRSO ,P?OBJDESCS> <+ ,RTOFF ,ROFF >>>
	 <COND (<NOT <EQUAL? .STR 0>>
		<ROBOT-TELL .STR>
		<COND (<GETP ,PRSO ,P?ROBOT> <PRINT-CONTENTS ,PRSO>)>
		<COND (<GETP ,PRSO ,P?DIAL>
		       <TELL "The " D ,PRSO " is set at " 
			     N <GET ,DIALSETS <GETP ,PRSO ,P?DIAL>>
			     "." CR>)>)
	       (<OR <FSET? ,PRSO ,CONTBIT>
		    <FSET? ,PRSO ,DOORBIT>>
		<COND (<NOT <EQUAL? .STR 0>>
		       <TELL .STR " ">)>
		<V-LOOK-INSIDE>)	
	       (ELSE
		<ROBOT-TELL "I perceive nothing special about the " <>>
		<TELL D ,PRSO "." CR>)>>

"SUBTITLE SCORING"

<ROUTINE V-SCORE ("OPTIONAL" (ASK? T))
	 #DECL ((ASK?) <OR ATOM FALSE>)
	 <TELL "There have been ">
	 <BIG-NUM-PRINT ,TOTAL-SCORE>
	 <TELL " casualties (original population: 30,172,000) in ">
	 <TELL N ,MOVES>
	 <COND (<1? ,MOVES> <TELL " cycle.">) (ELSE <TELL " cycles.">)>
	 <CRLF>>
	 
<ROUTINE FINISH ()
	 <V-SCORE>
	 <QUIT>>

<ROUTINE V-QUIT ("OPTIONAL" (ASK? T) "AUX" SCOR)
	 #DECL ((ASK?) <OR ATOM <PRIMTYPE LIST>> (SCOR) FIX)
	 <V-SCORE>
	 <COND (<OR <AND .ASK?
			 <TELL
"Do you wish to leave the game? (Y is affirmative): ">
			 <YES?>>
		    <NOT .ASK?>>
		<QUIT>)
	       (ELSE <TELL "Ok." CR>)>>

<ROUTINE YES? ()
	 <PRINTI ">">
	 <READ ,P-INBUF ,P-LEXV>
	 <COND (<EQUAL? <GET ,P-LEXV 1> ,W?YES ,W?Y>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE V-VERSION ("AUX" (CNT 17))
	 <TELL
"SUSPENDED|
Infocom interactive fiction - a science-fiction story|
Copyright (c) 1983, 1984 by Infocom, Inc.  All rights reserved.|
SUSPENDED is a registered trademark of Infocom, Inc.|
Release ">
	 <PRINTN <BAND <GET 0 1> *3777*>>
	 <TELL " / Serial number ">
	 <REPEAT ()
		 <COND (<G? <SET CNT <+ .CNT 1>> 23>
			<RETURN>)
		       (T
			<PRINTC <GETB 0 .CNT>>)>>
	 <CRLF>>

;<ROUTINE V-AGAIN ("AUX" OBJ)
	 <COND (<==? ,L-PRSA ,V?WALK>
		<DO-WALK ,L-PRSO>)
	       (T
		<SET OBJ
		     <COND (<AND ,L-PRSO <NOT <LOC ,L-PRSO>>>
			    ,L-PRSO)
			   (<AND ,L-PRSI <NOT <LOC ,L-PRSI>>>
			    ,L-PRSI)>>
		<COND (.OBJ
		       <ROBOT-TELL "I can't see the " <>>
		       <TELL D .OBJ " anymore." CR>
		       <RFATAL>)
		      (T
		       <PERFORM ,L-PRSA ,L-PRSO ,L-PRSI>)>)>>



"SUBTITLE DEATH AND TRANSFIGURATION"

<ROUTINE JIGS-UP (DESC ROBOT)
 	 <TELL .DESC CR>
	 <CRLF>
	 <TELL "FC: So much for that robot. Too bad." CR>
	 <PUT ,DEADBOTS <GETP .ROBOT ,P?ROBOT> 30>
	 <KILL-GOAL .ROBOT T>
	 <FSET .ROBOT ,CUTBIT>
	 <DEAD-FCN>
	 <RFATAL>>

<ROUTINE V-RESTORE ()
	 <COND (<RESTORE>
		<TELL "Ok." CR>
		<V-LOOK>)
	       (T
		<TELL "Failed." CR>)>>

<ROUTINE V-SAVE ()
	 <COND (<SAVE>
	        <TELL "Ok." CR>)
	       (T
		<TELL "Failed." CR>)>>

<ROUTINE V-RESTART ()
	 <V-SCORE T>
	 <TELL "Do you wish to restart? (Y is affirmative): ">
	 <COND (<YES?>
		<TELL "Restarting." CR>
		<RESTART>
		<TELL "Failed." CR>)>>

<CONSTANT REXIT 0>
<CONSTANT UEXIT 1>
<CONSTANT NEXIT 2>
<CONSTANT FEXIT 3>
<CONSTANT CEXIT 4>
<CONSTANT DEXIT 5>

<CONSTANT NEXITSTR 0>
<CONSTANT FEXITFCN 0>
<CONSTANT CEXITFLAG 1>
<CONSTANT CEXITSTR 1>
<CONSTANT DEXITOBJ 1>
<CONSTANT DEXITSTR 1>

<ROUTINE V-WALK-AROUND ()
	 <ROBOT-TELL "Give me a direction for movement or a location to move to.">>

<ROUTINE GO-NEXT (TBL "AUX" VAL)
	 #DECL ((TBL) TABLE (VAL) ANY)
	 <COND (<SET VAL <LKP ,WINNER-HERE .TBL>>
		<GOTO .VAL>)>>

<ROUTINE PRE-LAMP-ON ()
	 <COND (<NOT <OR <EQUAL? ,PRSO ,SWITCH1 ,SWITCH2 ,SWITCH3>
			 <EQUAL? ,PRSO ,MACHINE>>>
		<ROBOT-TELL "I can't do that to " <>>
		<COND (<GETP ,PRSO ,P?ROBOT>
		       <HIM-HER ,PRSO>)
		      (T <TELL "the " D ,PRSO>)>
		<TELL "." CR>
		<RFATAL>)>>

<ROUTINE V-LAMP-ON ()
	 <COND (<NOT <OR <EQUAL? ,PRSO ,SWITCH1 ,SWITCH2 ,SWITCH3>
			 <EQUAL? ,PRSO ,MACHINE>>>
		<ROBOT-YUKS>
		<RTRUE>)
	       (<EQUAL? ,PRSO ,MACHINE>
		<PERFORM ,V?PUSH ,ORANGE-BUTTON>
		<RTRUE>)
	       (<FSET? ,PRSO ,ONBIT>
		<ROBOT-TELL "It's already on.">)
	       (ELSE <ROBOT-TELL "Done.">
		<FSET ,PRSO ,ONBIT>
		<COND (<L? ,MOVES 75>
		       <DO-RTD>)>)>>
		     
<ROUTINE V-LAMP-OFF ()
	 <COND (<NOT <OR <EQUAL? ,PRSO ,SWITCH1 ,SWITCH2 ,SWITCH3>
			 <EQUAL? ,PRSO ,MACHINE>>>
		<ROBOT-YUKS>
		<RTRUE>)
	       (<EQUAL? ,PRSO ,MACHINE>
		<PERFORM ,V?PUSH ,ORANGE-BUTTON>
		<RTRUE>)
	       (<NOT <FSET? ,PRSO ,ONBIT>>
		<ROBOT-TELL "It's not on.">)
	       (ELSE <ROBOT-TELL "Done.">
		<FCLEAR ,PRSO ,ONBIT>
		<COND (<L? ,MOVES 75>
		       <DO-RTD>)>)>>


<ROUTINE LKP (ITM TBL "AUX" (CNT 0) (LEN <GET .TBL 0>))
	 #DECL ((ITM) ANY (TBL) TABLE (CNT LEN) FIX)
	 <REPEAT ()
		 <COND (<G? <SET CNT <+ .CNT 1>> .LEN>
			<RFALSE>)
		       (<==? <GET .TBL .CNT> .ITM>
			<COND (<==? .CNT .LEN> <RFALSE>)
			      (T
			       <RETURN <GET .TBL <+ .CNT 1>>>)>)>>>

<ROUTINE V-WALK ("AUX" PT PTS STR OBJ RM)
	 #DECL ((PT) <OR FALSE TABLE> (PTS) FIX (STR) <OR STRING FALSE>
		(OBJ) OBJECT (RM) <OR FALSE OBJECT>)
	 <DO-THE-TV>
	 <COND (<NOT <EQUAL? <GET ,FOLLOW-TBL ,ROFF> 0>>
		<ROBOT-TELL "Okay, but I have to stop following.">
		<PUT ,FOLLOW-TBL ,ROFF 0>)>
	 <KILL-GOAL ,WINNER>
	 <COND (<NOT ,P-WALK-DIR>
		<PERFORM ,V?WALK-TO ,PRSO>
		<RTRUE>)
	       (<SET PT <GETPT ,WINNER-HERE ,PRSO>>
		<COND (<==? <SET PTS <PTSIZE .PT>> ,UEXIT>
		       <GOTO <GETB .PT ,REXIT>>)
		      (<==? .PTS ,NEXIT>
		       <TELL <GET .PT ,NEXITSTR> CR>
		       <RFATAL>)
		      (<==? .PTS ,FEXIT>
		       <COND (<SET RM <APPLY <GET .PT ,FEXITFCN>>>
			      <GOTO .RM>)
			     (T
			      <RFATAL>)>)
		      (<==? .PTS ,CEXIT>
		       <COND (<VALUE <GETB .PT ,CEXITFLAG>>
			      <GOTO <GETB .PT ,REXIT>>)
			     (<SET STR <GET .PT ,CEXITSTR>>
			      <TELL .STR CR>
			      <RFATAL>)
			     (T
			      <ROBOT-TELL <GET ,CANT-GO ,ROFF>>
			      <RFATAL>)>)
		      (<==? .PTS ,DEXIT>
		       <COND (<FSET? <SET OBJ <GETB .PT ,DEXITOBJ>> ,OPENBIT>
			      <GOTO <GETB .PT ,REXIT>>)
			     (<SET STR <GET .PT ,DEXITSTR>>
			      <TELL .STR CR>
			      <RFATAL>)
			     (T
			      <TELL "The " D .OBJ " is closed." CR>
			      <THIS-IS-IT .OBJ>
			      <RFATAL>)>)>)
	       (T
		<ROBOT-TELL <GET ,CANT-GO ,ROFF>>
		<RFATAL>)>>

<GLOBAL CANT-GO <PLTABLE
"I don't see how."
"Sonar can't detect a passage in that direction."
"Sensors indicate a dead-end that way."
"Echo patterns describe a wall there."
"I haven't the means to justify a dead-end."
"The CLC cannot confirm a passage there.">>

<ROUTINE THIS-IS-IT (OBJ)
	 <SETG P-IT-OBJECT .OBJ>
	 <SETG P-IT-LOC ,WINNER-HERE>>

;<ROUTINE V-INVENTORY ()
	 <COND (<NOT <==? <CCOUNT ,WINNER> 0>>
		<PRINT-CONT ,WINNER>)
	       (T <ROBOT-TELL <GET ,INVEN-QUIPS ,ROFF>>)>>

;"The revise INVEN verb below takes into account the fact that AUDA may be
  GIVEN an object which he cannot normally hear. In doing this, the I command
  will always now print something."

<ROUTINE V-INVENTORY ("AUX" OBJ STR)
	 <COND (<AUDA?>
		<COND (<SET OBJ <FIRST? ,AUDA>>
		       <SET STR <GET <GETP .OBJ ,P?OBJDESCS><+ ,FDOFF ,ROFF >>>
		       <COND (<EQUAL? .STR 0>
			      <ROBOT-TELL <GET ,INVEN-QUIPS ,ROFF>>
			      <RTRUE>)
			     (T <PRINT-CONT ,AUDA>)>)
		      (T <ROBOT-TELL <GET ,INVEN-QUIPS ,ROFF>>)>)
	       (<NOT <==? <CCOUNT ,WINNER> 0>>
		<PRINT-CONT ,WINNER>)
	       (T <ROBOT-TELL <GET ,INVEN-QUIPS ,ROFF>>)>>
		       

<GLOBAL INVEN-QUIPS
	<PLTABLE "I am holding nothing in my dainty extensions."
		"My extensions grasp nothing."
		"I cannot sense a thing in my grasping extensions."
		"I can't hear a thing in my extension."
		"As far as I know, I'm Zen on inventory."
		"CLC feedback indicates I carry nothing.">>

<ROUTINE V-COUNT ("AUX" TEMP)
	 <COND (<EQUAL? ,PRSO ,PEOPLE>
		<ROBOT-TELL "There are two of them. And they're weird things, too.">
		<RTRUE>)
	       (<NOT <EQUAL? ,PRSO ,HANDS ,SURGERY-HAND>>
		<ROBOT-TELL 
	  "I have my counting abilities, and they only extend to extensions.">
		<RTRUE>)>
	 <COND (<AND ,PRSI
		     <NOT <IN? ,PRSI ,WINNER-HERE>>>
		<CANT-DETECT ,PRSI>
		<RTRUE>)
	       (<AND ,PRSI
		     <OR <NOT <GETP ,PRSI ,P?ROBOT>>
			 <EQUAL? <GETP ,PRSI ,P?ROBOT> 7>>>
		<ROBOT-TELL "There aren't any " <>>
		<TELL D ,HANDS " in the " D ,PRSI "." CR>)
	       (<NOT ,PRSI>
		<ROBOT-TELL "I have " <>>
		<TELL N ,NUM-EXT>
		<COND (<EQUAL? ,NUM-EXT 1>
		       <TELL " extension">)
		      (T <TELL " extensions">)>
		<TELL "." CR>)
	       (,PRSI
		<TELL "There ">
		<COND (<EQUAL? ,PRSI ,AUDA>
		       <TELL "is">)
		      (T <TELL "are">)>
		<SET TEMP ,WINNER>
		<CHANGE-WINNER ,PRSI T>
		<TELL " " N ,NUM-EXT " extension">
		<CHANGE-WINNER .TEMP T>
		<COND (<NOT <EQUAL? ,PRSI ,AUDA>>
		       <TELL "s">)>
		<TELL " in " D ,PRSI "." CR>)>>		

<ROUTINE PRE-TAKE ()
	 <COND (<IN? ,PRSO ,WINNER> <ROBOT-TELL "I already have it.">)
	       (<AND <IN? ,PRSO ,TOPSHELF>
		     <NOT <EQUAL? ,ON-WEDGE <GETP ,WINNER ,P?ROBOT>>>>
		<ROBOT-TELL "It's too high up there and I can't reach it.">
		<RTRUE>)
	       (<FSET? ,PRSO ,WEARBIT>
		<ROBOT-TELL "Not while it's attached.">
		<RTRUE>)
	       (<AND <IRIS?>
		     <NOT ,IRIS-FIXED>>
		<ROBOT-TELL "I can't take what I can't see.">
		<RFATAL>)
	       (<AND <FSET? <LOC ,PRSO> ,CONTBIT>
		     <NOT <FSET? <LOC ,PRSO> ,OPENBIT>>>
		<ROBOT-TELL "I can't reach that.">
		<RTRUE>)
	       (<AND ,PRSI
		     <FSET? ,PRSI ,VICBIT>
		     <FSET? ,PRSO ,WEARBIT>>
		<ROBOT-TELL "Not while " <>>
		<TELL D ,PRSI " has it attached." CR>
		<RTRUE>)
	       (<==? ,PRSO <LOC ,WINNER>> <TELL "I'm in it, loser." CR>)>>

<ROUTINE V-TAKEOUT ()
	 <COND (<AND ,PRSI
		     <NOT <IN? ,PRSO ,PRSI>>>
		<ROBOT-TELL "The " <>>
		<TELL D ,PRSO " isn't in ">
		<COND (<NOT <GETP ,PRSI ,P?ROBOT>>
		       <TELL "the ">)>
		<TELL D ,PRSI "." CR>
		<RTRUE>)
	       (T <PERFORM ,V?TAKE ,PRSO>)>>

<ROUTINE V-TAKE ()
	 <COND (<==? <ITAKE> T>
		<ROBOT-TELL "Taken.">
		<COND (<EQUAL? ,PRSO ,WEDGE>
		       <SETG WEDGE-PLACED 0>
		       <SETG ON-WEDGE <>>)>)>>

<GLOBAL FUMBLE-NUMBER 7>
<GLOBAL FUMBLE-PROB 8>

<ROUTINE TRYTAKE ()
	 <COND (<IN? ,PRSO ,WINNER> <RTRUE>)
	       (<AND <FSET? ,PRSO ,TRYTAKEBIT>
		     <GETP ,PRSO ,P?ACTION>>
		<PERFORM ,V?TAKE ,PRSO>
		<IN? ,PRSO ,WINNER>)
	       (ELSE <ITAKE>)>>

<GLOBAL EXTEN-QUIPS
	<PLTABLE 
"I'm not Waldo, you know. I've only got 2 extensions, and they're full."
"What do you want from me? I can only do 6 things at once!"
"Please don't use me as a pack mule. I have but 3 extensions to give for my complex."
"Did I hear you right? Me, with but 1 measly extension, and full at that?"
"An Army of Arms,|
A farewell to hands|
Without even place|
to strike up the band."
"The CLC limits my load to 2 objects."
"What do you want from me? Even with the extra extension, I can only do 7 things at once!">>

<ROUTINE ITAKE ("OPTIONAL" (VB T) "AUX" CNT OBJ WLOC TBL)
	 #DECL ((VB) <OR ATOM FALSE> (CNT) FIX (OBJ) OBJECT)
	 <COND (<NOT <FSET? ,PRSO ,TAKEBIT>>
		<COND (.VB
		       <ROBOT-YUKS>)>
		<RFALSE>)
	       (<OR <EQUAL? <CCOUNT ,WINNER> ,NUM-EXT>
		    <G? <CCOUNT ,WINNER> ,NUM-EXT>>
		<COND (<AND <WALDO?>
			    <FSET? ,SURGERY-HAND ,WEARBIT>>
		       <ROBOT-TELL <GET ,EXTEN-QUIPS 7>>)
		      (T
		       <ROBOT-TELL <GET ,EXTEN-QUIPS ,ROFF>>)>
		<RFALSE>)
	       (<AND <NOT <IN? <LOC ,PRSO> ,WINNER>>
		     <G? <+ <WEIGHT ,PRSO> <WEIGHT ,WINNER>> ,LOAD-MAX>>
		<COND (<AND .VB
			    <NOT <EQUAL? ,PRSO ,BROKEN-SHELF>>>
		       <ROBOT-TELL "I have a free extension, but I'm not strong enough to carry that" <>>
		       <COND (<NOT <EQUAL? <CCOUNT ,WINNER> 0>>
			      <TELL " and what I'm carrying">)>
		       <TELL "." CR>)
		      (.VB
		       <ROBOT-TELL "It's far too heavy.">)>
		<RFATAL>)
	       (<AND <G? <SET CNT <CCOUNT ,WINNER>> ,FUMBLE-NUMBER>
		     <PROB <* .CNT ,FUMBLE-PROB>>>
		<SET OBJ <FIRST? ,WINNER>>
		<SET OBJ <NEXT? .OBJ>>
		;"This must go!  Chomping compiler strikes again"
		<ROBOT-TELL
"Oh, no. The " <>>
		<TELL D .OBJ " slips from my extenders while taking the "
D ,PRSO " and both tumble to the ground." CR>
		<SET WLOC <LOC ,WINNER>>
		<COND (<FSET? .WLOC ,RMUNGBIT>
		       <PERFORM ,V?DROP .OBJ>
		       <MOVE ,PRSO ,WINNER>
		       <PERFORM ,V?DROP ,PRSO>)
		      (ELSE
		       <MOVE .OBJ .WLOC>
		       <MOVE ,PRSO .WLOC>)>
		<RFATAL>)
	       (T
		<COND (<EQUAL? ,PRSO ,REDSET ,ORANGESET>
		       <COND (<EQUAL? ,WINNER-HERE ,TUBE1>
			      <SETG ORANGESET <>>)
			     (<EQUAL? ,WINNER-HERE ,TUBE2>
			      <SETG REDSET <>>)>)>
		<MOVE ,PRSO ,WINNER>
		<FCLEAR ,PRSO ,NDESCBIT>
		<FSET ,PRSO ,TOUCHBIT>
		<RTRUE>)>>

<ROUTINE PRE-PUT ()
	 <COND (<EQUAL? ,PRSI ,GROUND ,WALLS ,COMPLEX>
		<PERFORM ,V?DROP ,PRSO>
		<RTRUE>)
	       (<OR <IN? ,PRSO ,GLOBAL-OBJECTS>
		    <NOT <FSET? ,PRSO ,TAKEBIT>>>
		<TELL "FC: Nice try." CR>)
	       (,PRSI
		<COND (<AND <EQUAL? ,PRSI ,CONVEYERBELTA 
			       ,CONVEYERBELTB ,CONVEYERBELTC>
			    <GETP ,PRSO ,P?ROBOT>>
		       <PERFORM ,V?PUSH-UP ,PRSO ,PRSI>
		       <RTRUE>)
		      (<AND <EQUAL? ,PRSO ,WEDGE>
			    <EQUAL? ,PRSI ,STEP>>
		       <PERFORM ,V?PUT-AGAINST ,PRSO ,PRSI>
		       <RTRUE>)>
		<RFALSE>)
	       >>

<ROUTINE V-PUT-AGAINST ()
	 <COND (<EQUAL? ,PRSI ,GROUND ,WALLS ,COMPLEX>
		<PERFORM ,V?DROP ,PRSO>
		<RTRUE>)
	       (<IN? ,PRSI ,WINNER-HERE>
		<ROBOT-TELL "Okay.">
		<MOVE ,WEDGE ,WINNER-HERE>
		<RTRUE>)
	       (T
		<CANT-DETECT ,PRSO>)>>

<ROUTINE V-PUT ()
	 <COND (<OR <FSET? ,PRSI ,OPENBIT>
		    <OPENABLE? ,PRSI>
		    <FSET? ,PRSI ,VEHBIT>>)
	       (T
		<ROBOT-TELL "I can't do that.">
		<RTRUE>)>
	 <COND (<NOT <FSET? ,PRSI ,OPENBIT>>
	        <ROBOT-TELL "The " <>>
		<TELL D ,PRSI " isn't open." CR>)
	       (<==? ,PRSI ,PRSO>
		<ROBOT-TELL "How can I do that?">)
	       (<IN? ,PRSO ,PRSI>
		<COND (<AND <WALDO?>
			    <EQUAL? ,PRSO ,SURGERY-HAND>>
		       <PERFORM ,V?WEAR ,PRSO>
		       <RTRUE>)
		      (<GETP ,PRSI ,P?ROBOT>
		       <ROBOT-YUKS>)
		      (T
		       <ROBOT-TELL "The " <>>
		       <TELL D ,PRSO " is already in the " D ,PRSI "." CR>)>)
	       (<G? <- <+ <WEIGHT ,PRSI> <WEIGHT ,PRSO>><GETP ,PRSI ,P?SIZE>>
		    <GETP ,PRSI ,P?CAPACITY>>
		<ROBOT-TELL "There's no room.">)
	       (<AND <NOT <HELD? ,PRSO>>
		     <NOT <TRYTAKE>>>
		<RTRUE>)
	       (T
		<MOVE ,PRSO ,PRSI>
		<FSET ,PRSO ,TOUCHBIT>
		<ROBOT-TELL "Done.">
		<COND (<AND <EQUAL? ,PRSI ,PANEL>
			    <NOT ,IRIS-FIXED>
			    <IN? ,NEWCHIP1 ,PANEL>
			    <IN? ,CHIP2 ,PANEL>
			    <IN? ,CHIPS0 ,PANEL>>
		       <TELL CR <GET ,INTER-TBL 1> 
			     " OOOH! That felt good! Close my panel, big boy."
			     CR>)
		      (<EQUAL? ,PRSI ,GROOVE1>
		       <SETG ORANGESET ,PRSO>)
		      (<EQUAL? ,PRSI ,GROOVE2>
		       <SETG REDSET ,PRSO>)>)>>

<ROUTINE PRE-DROP ()
	 <COND (<==? ,PRSO <LOC ,WINNER>>
		<PERFORM ,V?DISEMBARK ,PRSO>
		<RTRUE>)>>

"SZAP => ZAP who WITH what"

<ROUTINE PRE-SZAP ()
	 <PERFORM ,V?ZAP ,PRSI ,PRSO>
	 <RTRUE>>

"ZAP => ZAP <weapon> <who>"

<ROUTINE PRE-ZAP ()
	 <COND (,PRSI <RFALSE>)
	       (<FSET? ,PRSO ,WEAPONBIT> <RFALSE>)
	       (ELSE <TELL
"You have nothing to shoot the " D ,PRSO " with." CR>)>>

<ROUTINE DONT-HAVE (OBJ)
	 <ROBOT-TELL "I don't have " <>>
	 <COND (<NOT <GETP .OBJ ,P?ROBOT>>
		<TELL "the ">)>
	 <TELL D .OBJ "." CR>>

<ROUTINE V-ZAP ()
	 <COND (<NOT <IN? ,PRSO ,WINNER>>
		<DONT-HAVE ,PRSO>)
	       (<NOT <FSET? ,PRSO ,WEAPONBIT>>
		<TELL "You can't use a " D ,PRSO " as a ray gun!" CR>)
	       (<NOT ,PRSI> <TELL "At what?" CR>)
	       (ELSE <TELL "Nothing happens." CR>)>>

<ROUTINE V-SZAP ()
	 <TELL "ZAPPP!!" CR>>

<GLOBAL GIVEN-BAG <>>

<ROUTINE PRE-GIVE ()
	 <COND (<NOT <HELD? ,PRSO>>
		<ROBOT-TELL 
"That's easy to say since I don't even have it.">)
	       (<NOT <IN? ,PRSO ,WINNER>>
		<ROBOT-TELL "One thing at a time. First tell me where it is.">
		<RTRUE>)
	       (<EQUAL? ,PRSI ,PEOPLE>
		<COND (<EQUAL? ,PRSO ,TOOLBAG>
		       <DISABLE <INT I-CHASEAUDA>>
		       <SETG RTHIEF <>>
		       <SETG CHASING-THIEF <>>
		       <COND (,GIVEN-BAG
			      <ENOUGH-TRADING>
			      <RTRUE>)
			     (ELSE
			      <PEOPLE-GIVEN-BAG>
			      <RTRUE>)>)
		      (ELSE
		       <ROBOT-TELL 
			"They don't seem to be interested in that.">
		       <RTRUE>)>)>>

<ROUTINE PRE-SGIVE ()
	 <PERFORM ,V?GIVE ,PRSI ,PRSO>
	 <RTRUE>>

<ROUTINE V-GIVE ("AUX" OBJ)
	 <COND (<NOT <FSET? ,PRSI ,VICBIT>>
		<ROBOT-TELL "I can't give a " <>>
		<TELL D ,PRSO " to a " D ,PRSI "!" CR>)
	       (<IDROP> <ROBOT-TELL "Given.">
		<SET OBJ ,WINNER>
		<CHANGE-WINNER ,PRSI T>
		<ITAKE>
		<CHANGE-WINNER .OBJ T>)>>

<ROUTINE V-SGIVE ()
	 <TELL "FOOOO!!" CR>>

<ROUTINE V-DROP () <COND (<IDROP>
			  <COND (<FSET? ,PRSO ,WEARBIT>
				 <TELL "(removing it first)" CR>
				 <FCLEAR ,PRSO ,WEARBIT>)>
			  <ROBOT-TELL "Dropped.">)>>

<ROUTINE V-THROW () <COND (<IDROP> <ROBOT-TELL "Thrown.">)>>

<ROUTINE IDROP ()
	 <COND (<NOT <HELD? ,PRSO>>
		<ROBOT-TELL "I'm not carrying the " <>>
		<TELL D ,PRSO "." CR>
		<RFALSE>)
	       (<AND <NOT <IN? ,PRSO ,WINNER>>
		     <NOT <FSET? <LOC ,PRSO> ,OPENBIT>>>
		<ROBOT-TELL "The " <>>
		<TELL D ,PRSO " is closed." CR>
		<RFALSE>)
	       (T
		<COND (<AND <EQUAL? ,PRSO ,SURGERY-HAND>
			    <FSET? ,PRSO ,WEARBIT>>
		       <FCLEAR ,PRSO ,WEARBIT>)>
		<MOVE ,PRSO <LOC ,WINNER>> <RTRUE>)>>

<ROUTINE ALREADY (ON-OFF "OPTIONAL" (OBJ <>))
	 <COND (.OBJ
		<ROBOT-TELL "The " <>>
		<TELL D .OBJ " is ">)
	       (ELSE
		<ROBOT-TELL "It's " <>>)>
	 <TELL "already " .ON-OFF "." CR>>

<ROUTINE V-OPEN ("AUX" F STR)
	 <COND (<FSET? ,PRSO ,VEHBIT>
		<ROBOT-TELL "The " <>>
		<TELL D ,CAR 
		      " opens only when a robot attempts to enter it." CR>
		<RTRUE>)
	       (<NOT <FSET? ,PRSO ,CONTBIT>>
		<ROBOT-TELL
"I'm not sure anyone is clever enough to do that to the " <>>
		<TELL D ,PRSO "." CR>)
	       (<GETP ,PRSO ,P?ROBOT>
		<ROBOT-TELL "What?! " <>>
		<TELL D ,PRSO " is a robot. That's spelled R-O-B-O-T!" CR>)
	       (<FSET? ,PRSO ,SURFACEBIT>
		<ROBOT-TELL "I think you're out of your mind.">)
	       (<OR <FSET? ,PRSO ,DOORBIT>
		    <NOT <==? <GETP ,PRSO ,P?CAPACITY> 0>>>
		<COND (<FSET? ,PRSO ,OPENBIT> <ALREADY "open">)
		      (T
		       <FSET ,PRSO ,OPENBIT>
		       <COND (<OR <NOT <FIRST? ,PRSO>> <FSET? ,PRSO ,TRANSBIT>>
			      <ROBOT-TELL "Opened.">)
			     (T
			      <ROBOT-TELL "When I open the " <>>
			      <TELL D ,PRSO " I detect ">
			      <PRINT-CONTENTS ,PRSO>
			      <TELL "." CR>)>)>)
	       (T <TELL D ,PRSO " cannot be opened." CR>)>>

<ROUTINE V-CLOSE ()
	 <COND (<NOT <FSET? ,PRSO ,CONTBIT>>
		<ROBOT-TELL "You must tell me how to do that to a " <>>
		<TELL D ,PRSO "." CR>)
	       (<FSET? ,PRSO ,SURFACEBIT>
		<ROBOT-TELL "Not a likely occurrence within reality, no?">)
	       (<GETP ,PRSO ,P?ROBOT>
		<ROBOT-TELL "I don't think " <>>
		<HE-SHE ,PRSO>
		<TELL " would like that." CR>
		<RTRUE>)
	       (<AND <NOT <FSET? ,PRSO ,SURFACEBIT>>
		     <OR <NOT <==? <GETP ,PRSO ,P?CAPACITY> 0>>
			 <FSET? ,PRSO ,DOORBIT>>>
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <FCLEAR ,PRSO ,OPENBIT>
		       <ROBOT-TELL "Closed.">)
		      (T <ALREADY "closed">)>)
	       (ELSE
		<ROBOT-TELL "I can't close that.">)>>

<ROUTINE CCOUNT (OBJ "AUX" (CNT 0) X)
	 <COND (<SET X <FIRST? .OBJ>>
		<REPEAT ()
			<COND (<NOT <FSET? .X ,NDESCBIT>>
			       <SET CNT <+ .CNT 1>>)>
			<COND (<NOT <SET X <NEXT? .X>>>
			       <RETURN>)>>)>
	 .CNT>

<ROUTINE CABLECOUNT (OBJ "AUX" (CNT 0) X)
	 <COND (<SET X <FIRST? .OBJ>>
		<REPEAT ()
			<SET CNT <+ .CNT 1>>
			<COND (<NOT <SET X <NEXT? .X>>>
			       <RETURN>)>>)>
	 .CNT>

"WEIGHT:  Get sum of SIZEs of supplied object, recursing to the nth level."

<ROUTINE WEIGHT
	 (OBJ "AUX" CONT (WT 0))
	 #DECL ((OBJ) OBJECT (CONT) <OR FALSE OBJECT> (WT) FIX)
	 <COND (<SET CONT <FIRST? .OBJ>>
		<REPEAT ()
			<SET WT <+ .WT <WEIGHT .CONT>>>
			<COND (<NOT <SET CONT <NEXT? .CONT>>> <RETURN>)>>)>
	 <+ .WT <GETP .OBJ ,P?SIZE>>>

<GLOBAL COPR-NOTICE
" a transcript of interaction with SUSPENDED.
SUSPENDED is a registered trademark of Infocom, Inc.
Copyright (c) 1983 Infocom, Inc.  All rights reserved.">

<ROUTINE V-SCRIPT ()
	<PUT 0 8 <BOR <GET 0 8> 1>>
	<TELL "Here begins" ,COPR-NOTICE CR>>

<ROUTINE V-UNSCRIPT ()
	<TELL "Here ends" ,COPR-NOTICE CR>
	<PUT 0 8 <BAND <GET 0 8> -2>>
	<RTRUE>>

<ROUTINE PRE-MOVE ()
	 <COND (,PRSI
		<COND (<AND <EQUAL? ,PRSI ,RIGHT ,LEFT ,INTNUM>
			    <GETP ,PRSO ,P?DIAL>>
		       <PERFORM ,V?SET ,PRSO ,PRSI>
		       <RTRUE>)>)
	       (<AND ,PRSI
		     <EQUAL? ,PRSI ,CONVEYERBELTA>
		     <GETP ,PRSO ,P?ROBOT>>
		<PERFORM ,V?PUSH-UP ,PRSO ,PRSI>
		<RTRUE>)
	       (<AND ,PRSI
		     <EQUAL? ,PRSI ,CONVEYERBELTB ,CONVEYERBELTC>
		     <GETP ,PRSO ,P?ROBOT>>
		<ROBOT-TELL "There's no way to do that from here.">)
	       (,PRSI
	        <ROBOT-TELL "One step at a time, please.">
		<RTRUE>)
	       (<HELD? ,PRSO> <ROBOT-TELL "I don't juggle objects!">
		<RTRUE>)>>
			      
<ROUTINE V-MOVE ()
	 <COND (<EQUAL? ,PRSO ,BROKEN-SHELF>
		<ROBOT-TELL "Okay. It's been moved." <>>
		<COND (<FSET? ,SMASHED-BOX ,INVISIBLE>
		       <TELL " Moving it has revealed a " D ,SMASHED-BOX ".">
		       <FCLEAR ,SMASHED-BOX ,INVISIBLE>)>
		<CRLF>)
	       (<FSET? ,PRSO ,TAKEBIT>
		<ROBOT-TELL "Moving the " <>>
		<TELL D ,PRSO " reveals nothing." CR>)
	       (<AND <NOT ,PRSI>
		     <GETP ,PRSO ,P?ROBOT>
		     <FSET ,PRSO ,CUTBIT>
		     <NOT <EQUAL? ,WINNER-HERE ,REPAIR1>>>
		<ROBOT-TELL "If you want " <>>
		<TELL D ,PRSO
		      " to be dragged, you should supply a location, too." CR>
		<RTRUE>)
	       (<GETP ,PRSO ,P?ROBOT>
		<PERFORM ,V?PUSH-UP ,PRSO ,PRSI>
		<RTRUE>)
	       (T <ROBOT-TELL "I can't move " <>>
		<COND (<NOT <GETP ,PRSO ,P?ROBOT>>
		       <TELL "the ">)>
		<TELL D ,PRSO "." CR>)>>

<ROUTINE V-MOVE-ROBOT-TO-LOC ()
	 <COND (<EQUAL? ,PRSO ,IRIS>
		<ROBOT-TELL "There's no place for me to get a grip on her.">)
	       (<EQUAL? ,PRSO ,DEADBOT>
		<ROBOT-TELL "There's nothing to be gained by doing that. Franklin destroyed this robot beyond all hopes of repairing.">)
	       (<NOT <GETP ,PRSO ,P?ROBOT>>
		<PERFORM ,V?MOVE ,PRSO>
		<RTRUE>)
	       (<EQUAL? ,PRSO ,WINNER>
		<ROBOT-TELL "I suppose you'll have me chasing my tail, next.">)
	       (<NOT <EQUAL? <GET ,DRAG-TBL ,ROFF> 0>>
		<ROBOT-TELL "Give me a break, would you? One at a time!">)
	       (<NOT <IN? ,PRSI ,ROOMS>>
		<ROBOT-TELL "You'll have to tell me where the " <>>
		<TELL D ,PRSI " is.">)
	       (<NOT <GET ,DEADBOTS <GETP ,PRSO ,P?ROBOT>>>
		<ROBOT-TELL "Let " <>>
		<TELL D ,PRSO " get there alone." CR>)
	       (T
		<PUT ,DRAG-TBL ,ROFF ,PRSO>
		
		<PERFORM ,V?WALK-TO ,PRSI>
		<RFATAL>)>>
	         
<ROUTINE V-WAIT ("OPTIONAL" (NUM 3))
	 #DECL ((NUM) FIX)
	 <TELL "FC: Time passes..." CR>
	 <REPEAT ()
		 <COND (<L? <SET NUM <- .NUM 1>> 0> <RETURN>)
		       (T 
		        <COND (<CLOCKER> <RETURN>)>)>>
	 <SETG CLOCK-WAIT T>>

<ROUTINE PRE-BOARD ("AUX" AV)
	 <SET AV <LOC ,WINNER>>
	 <COND (<FSET? ,PRSO ,VEHBIT>
		<COND (<FSET? .AV ,VEHBIT>
		       <ROBOT-TELL "I'm already in it!">)
		      (T <RFALSE>)>)
	       (T
		<ROBOT-TELL "I suppose you have a theory on boarding a " <>>
		<TELL D ,PRSO "." CR>)>
	 <RFATAL>>

<ROUTINE V-BOARD ("AUX" AV)
	 #DECL ((AV) OBJECT)
	 <COND (<NOT <EQUAL? ,CAR-FULL 0>>
		<ROBOT-TELL "There's no room in there for me, too.">
		<RTRUE>)>
	 <COND (<AND <EQUAL? ,WINNER ,RTHIEF>
		     <IN? ,TOOLBAG ,WINNER>>
		<MOVE ,PEOPLE ,WINNER-HERE>
		<I-CHASEAUDA>
		<CRLF>)>
	 <ROBOT-TELL "I am now in the " <>>
	 <TELL D ,PRSO "." CR>
	 <MOVE ,WINNER ,PRSO>
	 <SETG CAR-FULL ,WINNER>
	 <COND (<NOT <EQUAL? <GET ,FOLLOW-TBL ,ROFF> 0>>
	        <PUT ,FOLLOW-TBL 0 ,ROFF>)>
	 <KILL-GOAL ,WINNER T>
	 <COND (<EQUAL? ,WINNER-HERE ,HALL-END>
		<SETG WINNER-HERE ,CAR-AREA>)
	       (<EQUAL? ,WINNER-HERE ,CAR-AREA>
		<SETG WINNER-HERE ,HALL-END>)>
	 <MOVE ,CAR ,WINNER-HERE>
	 <ROBOT-TELL "My gyroscopic stabilizers detect motion.">
	 <CRLF>
	 <V-LOOK>
	 <CRLF>
	 <ROBOT-TELL "External map reference -- " <>>
	 <TELL SD ,WINNER-HERE CR>
	 <RTRUE>
	 ;<APPLY <GETP ,PRSO ,P?ACTION> ,M-ENTER>
	 ;<RTRUE>>

<ROUTINE V-THROUGH ("OPTIONAL" (OBJ <>) "AUX" M TBL)
	#DECL ((OBJ) <OR OBJECT FALSE> (M) <PRIMTYPE VECTOR>)
	<COND (<AND <NOT .OBJ> <FSET? ,PRSO ,VEHBIT>>
	       <PERFORM ,V?BOARD ,PRSO>
	       <RTRUE>)
	      (<AND <NOT .OBJ> <NOT <FSET? ,PRSO ,TAKEBIT>>>
	       <ROBOT-YUKS>)
	      (.OBJ <ROBOT-TELL "I can't do that!">)
	      (<IN? ,PRSO ,WINNER>
	       <ROBOT-TELL "That would involve quite a contortion!">)
	      (ELSE
	       <ROBOT-YUKS>)>>

<ROUTINE V-DISEMBARK ()
	 <COND (<NOT <==? <LOC ,WINNER> ,PRSO>>
		<ROBOT-TELL "I'm not in that!">
		<RFATAL>)
	       (T
		<ROBOT-TELL "I am on my mobile extensions again.">
		<MOVE ,WINNER ,WINNER-HERE>
		<SETG CAR-FULL 0>)>>

<ROUTINE GOTO (RM "OPTIONAL" (V? T) "AUX" (WLOC <LOC ,WINNER>) OLIT 
	       (COUNT 0) L F)
	 #DECL ((RM WLOC) OBJECT)
	 <SET OLIT ,LIT>
	 <MOVE ,WINNER .RM>
	 <SETG WINNER-HERE .RM>
	 <REPEAT ()
		 <COND (<G? <SET COUNT <+ .COUNT 1>> 6>
			<RETURN>)
		       (ELSE
			<COND (<EQUAL? <GET ,FOLLOW-TBL .COUNT> ,WINNER>
			       <SET F <GET ,NAME-TBL <- .COUNT 1>>>
			       <COND (<MOVE-RBT? .F <LOC .F> ,WINNER-HERE>
				      <RETURN>)>)>)>>
	 <SETG LIT <LIT? ,WINNER-HERE>>
	 <COND (<==? <APPLY <GETP ,WINNER-HERE ,P?ACTION> ,M-ENTER> 2>
		<RTRUE>)>
	 <COND (.V? <V-LOOK>)>
	 <RTRUE>>

<ROUTINE V-DRINK ()
	 <V-EAT>>

<ROUTINE V-EAT ()
	 <ROBOT-TELL <GET ,EAT-QUIPS ,ROFF>>>

<GLOBAL EAT-QUIPS
	  <PLTABLE
"Really, now. A robot? Eating?"
"Get serious, amigo." 
"With whose orifice? Yours?" 
"I'll shut my ears and pretend you didn't say that." 
"Never. I'm a starving artist." 
"The CLC wouldn't approve.">>

<ROUTINE V-CURSES ()
	 <COND (,PRSO
		<COND (<FSET? ,PRSO ,VILLAIN>
		       <TELL "Insults of this nature won't help you." CR>)
		      (T
		       <TELL "What a loony!" CR>)>)
	       (T
		<TELL
"Such language in a high-class establishment like this!" CR>)>>

<ROUTINE PRE-LISTEN ()
	 <COND (<NOT <AUDA?>>
		<ROBOT-TELL "I can't hear.">)>>

<ROUTINE V-LISTEN ()
	 <COND (<AND ,PRSO
		     <NOT <EQUAL? ,PRSO ,PEOPLE>>>
		<ROBOT-TELL "I hear nothing special.">)
	       (,AUDA-LISTENS
		<ROBOT-TELL "Okay, okay already. I'm listening.">)
	       (T
		<ROBOT-TELL "Okay. Auditory circuits activated.">
		<SETG AUDA-LISTENS T>)>>

<GLOBAL FOLLOW-TBL
	<LTABLE 0 0 0 0 0 0>>

<ROUTINE V-FOLLOW ()
	 <COND (<NOT <GETP ,PRSO ,P?ROBOT>>
		<ROBOT-TELL "I can't follow the " <>>
		<TELL D ,PRSO "." CR>
		<RFATAL>)>
	 <COND (<AND <NOT <IN? ,WINNER <LOC ,PRSO>>>
		     <NOT <EQUAL? 
			  <GET ,LAST-ROOM <GETP ,PRSO ,P?ROBOT>> 
			  ,WINNER-HERE>>>
		<ROBOT-TELL "Sure. Tell me where " <>>
		<COND (<EQUAL? <GETP ,PRSO ,P?ROBOT> 7>
		       <TELL "the " D ,PRSO " are." CR>)
		      (ELSE
		       <TELL D ,PRSO " is." CR>)>
		<RFATAL>)>
	 <COND (<EQUAL? ,PRSO ,WINNER>
		<ROBOT-TELL "Be serious. I can't do that.">
		<RTRUE>)>
	 <DO-THE-TV>
	 <ROBOT-TELL "Okay. I'll follow " <>>
	 <COND (<EQUAL? <GETP ,PRSO ,P?ROBOT> 7>
		<TELL "the ">)>
	 <TELL D ,PRSO "." CR>
	 <PUT ,FOLLOW-TBL ,ROFF ,PRSO>
	 <KILL-GOAL ,WINNER>>

<ROUTINE V-LEAP ("AUX" TX S)
	 #DECL ((T) <OR FALSE TABLE>)
	 <COND (,PRSO
		<COND (<IN? ,PRSO ,WINNER-HERE>
		       <COND (<FSET? ,PRSO ,VILLAIN>
			      <ROBOT-TELL "The " <>>
			      <TELL D ,PRSO " is too big to jump over." CR>)
			     (T <V-SKIP>)>)
		      (T <ROBOT-TELL "That would be a good trick.">)>)
	       (<SET TX <GETPT ,WINNER-HERE ,P?DOWN>>
		<SET S <PTSIZE .TX>>
		<COND (<OR <==? .S 2>					 ;NEXIT
			   <AND <==? .S 4>				 ;CEXIT
				<NOT <VALUE <GETB .TX 1>>>>>
		       <TELL
"FC: This was not a very safe place to try jumping." CR>
		       <JIGS-UP "You should have looked before you leaped."
				,WINNER>)
		      (T <V-SKIP>)>)
	       (ELSE <V-SKIP>)>>

<ROUTINE V-SKIP ()
	 <ROBOT-YUKS>>

<ROUTINE V-LEAVE () <DO-WALK ,P?OUT>>

<GLOBAL HS 0>

<ROUTINE V-HELLO ()
	 <COND (,PRSO
		<ROBOT-TELL
"I think that only schizophrenics say \"Hello\" to a "<>>
		<TELL D ,PRSO "." CR>)
	       (ELSE <ROBOT-TELL <PICK-ONE ,HELLOS>>)>>

<GLOBAL HELLOS
	<PLTABLE "Hello."
	        "Nice weather we've been having lately."
		"You talking to me, man?"
		"Are you trying to accomplish something?"
		"Hello dere."
	        "Goodbye.">>

<ROUTINE V-HINT ("AUX" TEMP)
	 <COND (<G? <GET ,DEADBOTS 6> 29>
		<TELL "FC: Whiz is no longer operational, and there's nothing I can do to help you without him." CR>
		<RTRUE>)
	       (<AND <IN? ,WHIZ ,PERIPH-3>
		     ,PLUGGED-IN>
		<TELL "FC: Whiz is plugged in to the Advisory Pedestal and ready to ask about things for you." CR>
		<RTRUE>)
	       (<IN? ,WHIZ ,PERIPH-3>
		<SETG PLUGGED-IN 3> 
		<TELL "FC: I've taken the liberty of directing Whiz to plug in to the Advisory Pedestal. You may now direct him to ask about things for you." CR>
		<CHANGE-WINNER ,WHIZ>)
	       (T
		<TELL "FC: I'm taking the liberty of directing Whiz to the Advisory Peripheral so you may later have him ask about things." CR>
		<SET TEMP ,WINNER>
		<CHANGE-WINNER ,WHIZ T>
		<CRLF>
		<PERFORM ,V?WALK-TO ,PERIPH-3>
		<RTRUE>)>>
		

<GLOBAL WHEEEEE
	<PLTABLE "This kind of action can just kill my knee-joints."
		"I wasn't built for this kind of abuse, you know."
		"I'd say this was fun, but I'm only a robot. Without a sense of humor.">>

<ROUTINE V-READ ()
	 <COND (<AND <EQUAL? ,PRSO ,MONITOR>
		     <IRIS?>
		     ,IRIS-FIXED
		     <EQUAL? <LOC ,IRIS> 
			     ,WEATHER-BANKS ,RTD-BANKS ,SERVO-SYSTEMS>>
		<V-LOOK>
		<RTRUE>)
	       (<OR <EQUAL? ,PRSO ,CIRCLE1 ,CIRCLE2 ,CIRCLE3>
		    <EQUAL? ,PRSO ,CIRCLE4 ,CIRCLE5 ,CIRCLE6>
		    <EQUAL? ,PRSO ,CIRCLE7 ,CIRCLE8>>
		<PERFORM ,V?EXAMINE ,PRSO>
		<RTRUE>)
	       (<AND <EQUAL? ,PRSO ,SIGNPOST>
		     <NOT <IRIS?>>>
		<ROBOT-TELL 
		 "I'm not equipped with the necessary visual sensors.">
		<RTRUE>)
	       (T
		<ROBOT-TELL "How can I read a " <>>
		<TELL D ,PRSO "?" CR>)>>

<ROUTINE V-LOOK-UNDER ()
	 <COND (<AND <EQUAL? ,PRSO ,BROKEN-SHELF>
		     <FSET? ,SMASHED-BOX ,INVISIBLE>
		     <NOT <AUDA?>>>
		<ROBOT-TELL "There is something under there.">)
	       (T <ROBOT-TELL "There is nothing but dust there.">)>>

<ROUTINE V-LOOK-BEHIND () <V-LOOK-UNDER>>

<ROUTINE V-LOOK-INSIDE ()
	 <COND (<FSET? ,PRSO ,CONTBIT>
		<COND (<FSET? ,PRSO ,VICBIT>
		       <ROBOT-TELL "There is nothing special to be seen.">)
		      (<SEE-INSIDE? ,PRSO>
		       <COND (<AND <FIRST? ,PRSO> <PRINT-CONT ,PRSO>>
			      <RTRUE>)
			     (<FSET? ,PRSO ,SURFACEBIT>
			      <ROBOT-TELL "There is nothing on the " <>>
			      <TELL D ,PRSO "." CR>)
			     (T
			      <ROBOT-TELL "The " <>>
			      <TELL D ,PRSO " is empty." CR>)>)
		      (ELSE <ROBOT-TELL "The " <>>
		       <TELL D ,PRSO " is closed." CR>)>)
	       (ELSE <ROBOT-TELL "I don't know how to look inside a " <>>
		<TELL D ,PRSO "." CR>)>>

<ROUTINE SEE-INSIDE? (OBJ)
	 <AND <NOT <FSET? .OBJ ,INVISIBLE>>
	      <OR <FSET? .OBJ ,TRANSBIT> <FSET? .OBJ ,OPENBIT>>>>

<ROUTINE PRE-TURN ()
	 <COND (<NOT <FSET? ,PRSO ,TURNBIT>> <ROBOT-TELL "I can't turn that!">)
	       (<NOT <FSET? ,PRSI ,TOOLBIT>>
		<ROBOT-TELL "I certainly can't turn it with a " <>>
		<TELL D ,PRSI "." CR>)>>

<ROUTINE V-TURN () <ROBOT-TELL "You must be more specific.">>

<ROUTINE V-PICK () <V-TURN>>

<ROUTINE V-KILL ()
	 <IKILL "kill">>

<ROUTINE IKILL (STR)
	 #DECL ((STR) STRING)
	 <COND (<NOT ,PRSO> <TELL "There is nothing here to " .STR "." CR>)
	       (<AND <NOT <FSET? ,PRSO ,VILLAIN>>
		     <NOT <FSET? ,PRSO ,VICBIT>>>
		<ROBOT-TELL "I've known strange people, but fighting a " <>>
		<TELL D ,PRSO "?" CR>)
	       (<OR <NOT ,PRSI> <==? ,PRSI ,HANDS>>
		<FUTILE .STR>)
	       (<NOT <FSET? ,PRSI ,WEAPONBIT>>
		<ROBOT-TELL "Trying to " <>>
		<TELL .STR>
		<COND (<NOT <GETP ,PRSO ,P?ROBOT>>
		       <TELL " the">)>
		<TELL " " D ,PRSO " with a " D ,PRSI <GET ,HO-HUMS ,ROFF> CR>)
	       (ELSE <TELL "I can't." CR>)>>

<ROUTINE V-ATTACK () <IKILL "attack">>

<ROUTINE V-KICK () <HACK-HACK "Kicking ">>

<ROUTINE V-WAVE () <HACK-HACK "Waving ">>

<ROUTINE V-RAISE ()
	 <COND (<AND <GETP ,PRSO ,P?ROBOT>
		     <IN? ,WINNER ,REPAIR1>>
		<PERFORM ,V?PUSH-UP ,PRSO ,WEDGE>
		<RTRUE>)
	       (T
		<HACK-HACK "Playing in this way with ">)>>

<ROUTINE V-LOWER () <HACK-HACK "Playing in this way with ">>

<ROUTINE V-RUB () <HACK-HACK "Fiddling with ">>

<ROUTINE V-PUSH () <HACK-HACK "Pushing ">>

<ROUTINE PRE-MUNG ()
	 <COND (<NOT <FSET? ,PRSO ,VICBIT>>
		<HACK-HACK "Trying to destroy ">)
	       (<NOT ,PRSI>
		<FUTILE "destroy">)>>

<ROUTINE FUTILE (STR)
	 <ROBOT-TELL "Trying to " <>>
	 <TELL .STR>
	 <COND (<NOT <GETP ,PRSO ,P?ROBOT>>
		<TELL " a">)>
	 <TELL " " D ,PRSO <GET ,HO-HUMS ,ROFF> CR>>

<ROUTINE V-MUNG ()
	 <ROBOT-TELL "I can't do that.">>

<ROUTINE HACK-HACK
	 (STR)
	 #DECL ((STR) STRING)
	 <TELL .STR>
	 <COND (<NOT <GETP ,PRSO ,P?ROBOT>>
		<TELL "the ">)>
	 <TELL D ,PRSO <GET ,HO-HUMS ,ROFF> CR>>

<GLOBAL HO-HUMS
	<PLTABLE " is not what I was designed for."
		" would hurt my extensions."
		" offends my sensibilities."
		" is the worst thing I've ever heard."
		" goes against my Zen training."
		" contradicts the CLC directives.">>

<ROUTINE WORD-TYPE
	 (OBJ WORD "AUX" SYNS)
	 #DECL ((OBJ) OBJECT (WORD SYNS) TABLE)
	 <ZMEMQ .WORD
		<SET SYNS <GETPT .OBJ ,P?SYNONYM>>
		<- </ <PTSIZE .SYNS> 2> 1>>>

<ROUTINE V-KNOCK ()
	 <ROBOT-TELL "Why knock on a " <>>
	 <TELL D ,PRSO "?" CR>>

<ROUTINE V-YELL () <ROBOT-TELL <GET ,YELL-QUIPS ,ROFF>>>

<GLOBAL YELL-QUIPS
	<PLTABLE "Well shut my eyes, I never heard of such a thing!"
		"With whose external organs, yours? Cut me some slack."
		"Sensory mechanisms are one-way, dummy."
		"I'll pretend I didn't hear that insanity."
		"If only I could, I could release some of this built-up tension."
		"The CLC is the only one who'd listen if I did.">>

<ROUTINE V-PLUGIN ("AUX" TBL) 
	 <COND (<NOT <WHIZ?>>
		<ROBOT-YUKS>)
	       (,PLUGGED-IN
		<ROBOT-TELL "I'm already plugged in to the " <>>
		<TELL <GET ,PLUG-LOCS ,PLUGGED-IN> CR>)
	       (<AND <NOT <EQUAL? ,PRSO ,PERIPH1-OBJ ,PERIPH2-OBJ
				  ,PERIPH3-OBJ>>
		     <NOT <EQUAL? ,PRSO ,PERIPH4-OBJ ,ROOMS>>>
		<ROBOT-TELL "I can't plug in to the "<>>
		<TELL D ,PRSO "." CR>)
	       (<OR <EQUAL? ,WINNER-HERE ,PERIPH-1 ,PERIPH-2>
		    <EQUAL? ,WINNER-HERE ,PERIPH-3 ,PERIPH-4>>
		<COND (<EQUAL? ,WINNER-HERE ,PERIPH-1> <SETG PLUGGED-IN 1>)
		      (<EQUAL? ,WINNER-HERE ,PERIPH-2> <SETG PLUGGED-IN 2>)
		      (<EQUAL? ,WINNER-HERE ,PERIPH-3> <SETG PLUGGED-IN 3>)
		      (<EQUAL? ,WINNER-HERE ,PERIPH-4> <SETG PLUGGED-IN 4>)>
		<ROBOT-TELL "It's great to be home. Plugged in to the " <>>
		<TELL <GET ,PLUG-LOCS ,PLUGGED-IN>
		      " Ready to process queries." CR>)
	       (T
		<ROBOT-TELL "There's nothing to plug in to here.">)>>
	 
<GLOBAL PLUG-LOCS
	<PLTABLE  "Index Pedestal."
		 "Technical Pedestal."
		 "Advisory Pedestal."
		 "Historical Pedestal.">>

<ROUTINE V-UNPLUG ()
	 <COND (<NOT <WHIZ?>>
		<ROBOT-TELL "Who do you think I am, Whiz? Gimme a break!">)
	       (<NOT ,PLUGGED-IN>
		<ROBOT-TELL
"That's not possible. I'm not plugged in.">)
	       (ELSE
		<SETG PLUGGED-IN <>>
		<ROBOT-TELL "Unplugged.">)>>

<ROUTINE V-QUERY ()
	 <COND (<AND <NOT <WHIZ?>>
		     <NOT ,PRSO>>
		<ROBOT-TELL "Get real, joker!">)
	       (<NOT <WHIZ?>>
		<TELL "FC: I'm translating that command into a request for a description of the " D ,PRSO "." CR>
		<PERFORM ,V?EXAMINE ,PRSO>
		<RTRUE>)
	       (<NOT ,PLUGGED-IN>
		<ROBOT-TELL "I can't until a CLC link is established.">
		<RFATAL>)
	       (<NOT ,PRSI>
		<DO-QUERY>
		<RTRUE>)
	       (<OR <EQUAL? ,PRSO ,PERIPH1-OBJ ,PERIPH2-OBJ>
		    <EQUAL? ,PRSO ,PERIPH3-OBJ ,PERIPH4-OBJ>
		    <IN? ,WHIZ ,PERIPH-1> <IN? ,WHIZ ,PERIPH-2>
		    <IN? ,WHIZ ,PERIPH-3> <IN? ,WHIZ ,PERIPH-4>>
		<SETG PRSO ,PRSI>
		<DO-QUERY>
		<RTRUE>)
	       (ELSE
		<ROBOT-TELL "I don't know how to query a " <>>
		<TELL D ,PRSO "." CR>)>>

<GLOBAL PLUGOUTS
	<PLTABLE "IP: " "TP: " "AP: " "HP: ">>

<ROUTINE DO-QUERY ("AUX" STR OUTSTR (COUNT 0))
	 <SET STR <GETP ,PRSO ,P?CLC-TXT>>
	 <SET OUTSTR <GET ,PLUGOUTS ,PLUGGED-IN>>
	 <COND (<NOT .STR>
		<COND (<EQUAL? ,PLUGGED-IN 1>
		       <TELL .OUTSTR "Index search indicates no data stored on that subject." CR>)
		      (T
		       <TELL .OUTSTR 
			     "No data available on that subject from the "
		       <GET ,PLUG-LOCS ,PLUGGED-IN> CR>)>
		<RTRUE>) 
	       (<EQUAL? ,PLUGGED-IN 1>
		<REPEAT ()
			<SET COUNT <+ .COUNT 1>>
			<COND (<EQUAL? .COUNT 4>
			       <RTRUE>)>
			<COND (<NOT <EQUAL? <GET .STR .COUNT> 0>>
			       <TELL .OUTSTR "Data available from the "
				     <GET ,PLUG-LOCS <+ .COUNT 1>> CR>)>>)
	       (ELSE
		<COND (<NOT <EQUAL? <SET STR <GET .STR <- ,PLUGGED-IN 1>>> 0>>
		       <TELL .OUTSTR .STR CR>)
		      (T
		       <TELL .OUTSTR 
"No data available on that subject at this peripheral." CR>)>)>>

<ROUTINE V-SHAKE ("AUX" X)
	 <COND (<FSET? ,PRSO ,VILLAIN>
		<ROBOT-TELL "This seems to have no effect.">)
	       (<AND <NOT <FSET? ,PRSO ,OPENBIT>>
		     <FIRST? ,PRSO>>
		<ROBOT-TELL "It sounds as if there is something inside the " <>>
		<TELL D ,PRSO "." CR>)
	       (<AND <FSET? ,PRSO ,OPENBIT> <FIRST? ,PRSO>>
		<REPEAT ()
			<COND (<SET X <FIRST? ,PRSO>> <MOVE .X ,WINNER-HERE>)
			      (ELSE <RETURN>)>>
		<ROBOT-TELL "All of the objects spill onto the floor.">)
	       (T <ROBOT-TELL "Why bother?">)>>

<ROUTINE V-DIG () <ROBOT-TELL "What a silly idea!">>

<ROUTINE V-SMELL ()
	 <ROBOT-TELL "I can't do that.">>

<ROUTINE GLOBAL-IN? (OBJ1 OBJ2 "AUX" TX)
	 #DECL ((OBJ1 OBJ2) OBJECT (TX) <OR FALSE TABLE>)
	 <COND (<SET TX <GETPT .OBJ2 ,P?GLOBAL>>
		<ZMEMQB .OBJ1 .TX <- <PTSIZE .TX> 1>>)>>

<ROUTINE HERE?? (OBJ)
	 <OR <IN? .OBJ ,WINNER-HERE> <GLOBAL-IN? .OBJ ,WINNER-HERE>>>

<ROUTINE V-SWIM ()
	 <ROBOT-TELL "You can't swim here!">>

<ROUTINE V-ALARM ()
	 <COND (<NOT <EQUAL? ,PRSO ,PEOPLE>>
		<ROBOT-TELL "Be serious, would you?">
		<RFATAL>)
	       (<AND <G? ,SLEEPERS 0>
		     <IN? ,PEOPLE ,SLEEP-CHAMBER>
		     <IN? ,WINNER ,SLEEP-CHAMBER>>
		<ROBOT-TELL "I'm shaking them.">
		<COND (<AUDA-HEARS?>
		       <AUDA-SPEAKS>
		       <TELL CR
"\"Beat it, you stupid robot! Can't you see we're trying to sleep?!\"" CR>)>
	        <COND (<ROBOT-THERE? ,WALDO>
		       <TELL CR
"WALDO: The " D ,PEOPLE " are motioning violently and then resuming their reclining positions." CR>)
	              (<ROBOT-THERE? ,SENSA>
		       <TELL CR
"SENSA: The air is becoming charged with ionic activity as the " D ,PEOPLE 
" stir from quiescence. They then return to a quiet state." CR>)
	              (<ROBOT-THERE? ,POET>
		       <TELL CR
"POET: Like loaves of bread sitting on a warm oven, the " D ,PEOPLE 
							  " rise then fall." CR>)>)
	       (T
	        <ROBOT-TELL "They're not asleep.">)>>

<ROUTINE V-ZORK () <TELL "I see no Zork here." CR>>

<ROUTINE V-COMMAND ()
	 <COND (<FSET? ,PRSO ,VICBIT>
		<TELL "The " D ,PRSO " pays no attention." CR>)
	       (ELSE
		<TELL "You cannot talk to that!" CR>)>>

<ROUTINE V-CLIMB-ON ()
	 <COND (<AND <FSET? ,PRSO ,FURNITURE>
		     <FSET? ,PRSO ,VEHBIT>>
		<PERFORM ,V?BOARD ,PRSO>
		<RTRUE>)
	       (<FSET? ,PRSO ,CLIMBBIT>
		<PERFORM ,V-CLIMB-ON ,PRSO>)
	       (<FSET? ,PRSO ,VEHBIT>
		<V-CLIMB-UP ,P?UP T>)
	       (T
		<TELL "I can't climb onto the " D ,PRSO "." CR>)>>

<ROUTINE V-GET-OFF ()
	 <COND (<NOT <EQUAL? <GETP ,WINNER ,P?ROBOT> ,ON-WEDGE>>
		<ROBOT-TELL "I can't. I'm not on it.">)
	       (ELSE
		<SETG ON-WEDGE <>>
		<ROBOT-TELL "Okay. I'm off of it now.">)>>


<ROUTINE V-CLIMB-FOO () <V-CLIMB-UP ,P?UP T>>

<ROUTINE V-CLIMB-UP ("OPTIONAL" (DIR ,P?UP) (OBJ <>) "AUX" X)
	 #DECL ((DIR) FIX (OBJ) <OR ATOM FALSE> (X) TABLE)
	 <COND (<GETPT ,WINNER-HERE .DIR>
		<DO-WALK .DIR>
		<RTRUE>)
	       (<NOT .OBJ>
		<TELL <GET ,CANT-GO ,ROFF> CR>)
	       (<EQUAL? ,PRSO ,WEDGE>
		<PERFORM ,V?CLIMB-ON ,PRSO>
		<RTRUE>)
	       (ELSE <TELL "Bizarre!" CR>)>>

<ROUTINE V-CLIMB-DOWN ()
	 <COND (<AND <FSET? ,PRSO ,FURNITURE>
		     <FSET? ,PRSO ,VEHBIT>>
		<V-CLIMB-ON>
		<RTRUE>)
	       (<EQUAL? ,PRSO ,WEDGE>
		<PERFORM ,V?GET-OFF ,PRSO>
		<RTRUE>)
	       (T <V-CLIMB-UP ,P?DOWN>)>>

<ROUTINE V-PUT-UNDER ()
	 <COND (<EQUAL? ,PRSI ,TOPSHELF ,WHEEL ,CLONESWITCH>
		<PERFORM ,V?DROP ,PRSO>
		<RTRUE>)>
	 <TELL "I can't do that." CR>>

<ROUTINE V-ENTER ()
	 <DO-WALK ,P?IN>>

<ROUTINE V-EXIT ()
	 <DO-WALK ,P?OUT>>

<ROUTINE V-SEARCH ()
	 <COND (<FSET? ,PRSO ,CONTBIT>
		<PERFORM ,V?LOOK-INSIDE ,PRSO>
		<RTRUE>)
	       (T <ROBOT-TELL "I found nothing unusual.">)>>

<ROUTINE V-FIND ("AUX" (L <LOC ,PRSO>))
	 <COND (<AND <GETP ,PRSO ,P?ROBOT>
		     <NOT <IN? ,PRSO ,WINNER-HERE>>>
		<PERFORM ,V?WALK-TO ,PRSO>
		<RTRUE>)
	       (<EQUAL? .L ,GLOBAL-OBJECTS>
		<ROBOT-TELL "You find it.">)
	       (<IN? ,PRSO ,WINNER>
		<ROBOT-TELL "I have it.">)
	       (<OR <IN? ,PRSO ,WINNER-HERE>
		    <==? ,PRSO ,PSEUDO-OBJECT>>
		<COND (<GETP ,PRSO ,P?ROBOT>
		       <TELL D ,PRSO " is">)
		      (T <TELL "It's">)>
		<TELL " right here." CR>)
	       (<FSET? .L ,VILLAIN>
		<ROBOT-TELL "The " <>>
		<TELL D .L " have it." CR>)
	       (<FSET? .L ,CONTBIT>
		<ROBOT-TELL "It's in the " <>>
		<TELL D .L "." CR>)
	       (ELSE
		<ROBOT-TELL "Beats me.">)>>


<GLOBAL TELL-QUIPS
	<PLTABLE "I can't do that. I only have eyes for you."
		"I wouldn't be very handy if I did."
		"Unable to articulate speech patterns."
		"I hear you but I can't believe you."
		"Sure. Mairzy dotes & dozey dotes."
		"My connecting cable won't reach.">>

<GLOBAL OLD-WINNER <>>

<ROUTINE REAL-ROBOT (OBJ)
	 <COND (<==? .OBJ ,GLOBAL-IRIS>
		,IRIS)
	       (<==? .OBJ ,GLOBAL-WALDO>
		,WALDO)
	       (<==? .OBJ ,GLOBAL-AUDA>
		,AUDA)
	       (<==? .OBJ ,GLOBAL-SENSA>
		,SENSA)
	       (<==? .OBJ ,GLOBAL-POET>
		,POET)
	       (<==? .OBJ ,GLOBAL-WHIZ>
		,WHIZ)
	       (T ,PEOPLE)>>

<GLOBAL ROFF <>>

<ROUTINE V-$TELL ()
	 <COND (<AND <GETP ,PRSO ,P?ROBOT>
		     <NOT <EQUAL? ,PRSO ,PEOPLE>>>
		<COND (<IN? ,PRSO ,GLOBAL-OBJECTS>
		       <SETG PRSO <REAL-ROBOT ,PRSO>>)>
		<SETG OLD-WINNER ,WINNER>
		<CHANGE-WINNER ,PRSO>)
	       (T
		<TELL "FC: You can't talk to the " D ,PRSO "!" CR>
		<SETG QUOTE-FLAG <>>
		<SETG P-CONT <>>
		<RFATAL>)>>

<ROUTINE V-ANSWER ()
	 <TELL "Nobody is awaiting your answer." CR>
	 <RFATAL>>

<ROUTINE V-REPLY ()
	 <TELL "It is hardly likely that the " D ,PRSO " is interested." CR>
	 <RFATAL>>

<ROUTINE V-IS-IN ()
	 <COND (<IN? ,PRSO ,PRSI>
		<TELL "Yes, it is ">
		<COND (<FSET? ,PRSI ,SURFACEBIT>
		       <TELL "on">)
		      (T <TELL "in">)>
		<TELL " the " D ,PRSI "." CR>)
	       (T <TELL "No, it isn't." CR>)>>

<ROUTINE V-KISS ()
	 <COND (<IRIS?> <ROBOT-TELL "Without lips, that's quite a trick.">)
	       (<WALDO?> <ROBOT-TELL "With what, my hands?">)
	       (<SENSA?> <ROBOT-TELL "I can't do that.">)
	       (<AUDA?> <ROBOT-TELL "No, I don't think so.">)
	       (<POET?> <ROBOT-TELL "Loose lips sink slips.">)
	       (<WHIZ?> <ROBOT-TELL "I'd sooner kiss the CLC.">)>>

<ROUTINE V-RAPE ()
	 <ROBOT-TELL "What a BIZARRE concept!">>

<ROUTINE FIND-IN (WHERE WHAT "AUX" W)
	 <SET W <FIRST? .WHERE>>
	 <COND (<NOT .W> <RFALSE>)>
	 <REPEAT ()
		 <COND (<FSET? .W .WHAT> <RETURN .W>)
		       (<NOT <SET W <NEXT? .W>>> <RETURN <>>)>>>

<ROUTINE V-WEAR ()
	 <COND (<NOT <FSET? ,PRSO ,WEARABLEBIT>>
		<ROBOT-TELL "An interesting but highly unlikely thought.">)
	       (ELSE
		<ROBOT-TELL "It's now being worn.">
	        <FSET ,PRSO ,WEARBIT>)>>	 

<ROUTINE V-REMOVE ()
	 <COND (<FSET? ,PRSO ,WEARBIT> <PERFORM ,V?TAKE-OFF ,PRSO> <RTRUE>)
	       (ELSE <PERFORM ,V?TAKE ,PRSO> <RTRUE>)>>

<ROUTINE V-TAKE-OFF ()
	 <COND (<FSET? ,PRSO ,VEHBIT> 
		<V-DISEMBARK>)
	       (<FSET? ,PRSO ,WEARBIT>
		<FCLEAR ,PRSO ,WEARBIT>
		<ROBOT-TELL "It's been removed.">
		<RTRUE>)
	       (T <ROBOT-TELL "I'm not wearing that.">)>>

<ROUTINE V-STEP-ON ()
	 <COND (<EQUAL? ,PRSO ,WEDGE>
		<PERFORM ,V?CLIMB-ON ,PRSO>
		<RTRUE>)
	       (<EQUAL? ,PRSO ,CONVEYERBELTA ,CONVEYERBELTB ,CONVEYERBELTC>
		<ROBOT-TELL "There's no need for that since I'm working fine.">)
	       (ELSE
	 <TELL "That's a silly thing to do." CR>)>>

<ROUTINE V-PUT-ON ()
	 <COND (<AND <EQUAL? ,PRSI ,TOPSHELF>
		     <NOT <EQUAL? <GETP ,WINNER ,P?ROBOT> ,ON-WEDGE>>>
		<ROBOT-TELL "I can't reach up that far.">)
	       (ELSE
		<PERFORM ,V?PUT ,PRSO ,PRSI>)>>

<ROUTINE ROB (WHO "OPTIONAL" (WHERE <>) (HIDE? <>) "AUX" N X (ROBBED? <>))
	 <SET X <FIRST? .WHO>>
	 <REPEAT ()
		 <COND (<NOT .X> <RETURN .ROBBED?>)>
		 <SET N <NEXT? .X>>
		 <COND (<RIPOFF .X .WHERE>
			<COND (.HIDE? <FSET .X ,NDESCBIT>)>
			<SET ROBBED? .X>)>
		 <SET X .N>>>

<ROUTINE RIPOFF (X WHERE)
	 <COND (<AND <NOT <IN? .X .WHERE>>
		     <NOT <FSET? .X ,INVISIBLE>>
		     <FSET? .X ,TOUCHBIT>
		     <FSET? .X ,TAKEBIT>>
		<COND (.WHERE <MOVE .X .WHERE>)
		      (ELSE <REMOVE .X>)>
		<RTRUE>)>>

<ROUTINE V-STAND ()
	 <COND (<FSET? <LOC ,WINNER> ,VEHBIT>
		<PERFORM ,V?DISEMBARK <LOC ,WINNER>>
		<RTRUE>)
	       (ELSE
		<TELL "I'm already standing, I think." CR>)>>

<ROUTINE V-NO ()
	 <TELL "FC: You sound rather negative." CR>>

<ROUTINE V-YES ()
	 <TELL "FC: You sound rather positive." CR>>

<ROUTINE V-POINT ("AUX" W)
	 <COND (<GETP ,PRSO ,P?ROBOT>
		<ROBOT-TELL "Let " <>>
		<HIM-HER ,PRSO> <TELL " do it ">
		<HIM-HER ,PRSO>
		<COND (<EQUAL? ,PRSO ,PEOPLE>
		       <TELL "selves." CR>)
		      (T
		       <TELL "self." CR>)>)
	       (<NOT <EQUAL? ,PRSO ,TV>>
		<ROBOT-TELL "Okay, but it's impolite.">)
	       (<EQUAL? ,PRSO ,PRSI>
		<ROBOT-TELL "That would be a neat trick.">)
	       (<AND <IN? ,PRSI ,GLOBAL-OBJECTS>
		     <NOT <EQUAL? ,PRSI ,GLOBAL-IRIS 
				  ,GLOBAL-WALDO ,GLOBAL-SENSA>>
		     <NOT <EQUAL? ,PRSI ,GLOBAL-AUDA ,GLOBAL-POET
				  ,GLOBAL-WHIZ>>>
		<TELL "FC: There's no need to do that." CR>)
	       (<OR <NOT ,TV-ON>
		    <NOT ,IRIS-FIXED>
		    <FSET? ,IRIS ,CUTBIT>>
		<ROBOT-TELL "Okay.">)
	       (T
		<ROBOT-TELL "The " <>>
		<TELL D ,TV " has been pointed at ">
		<COND (<NOT <GETP ,PRSI ,P?ROBOT>>
		       <TELL "the ">)>
		<TELL D ,PRSI "." CR>
		<CRLF>
		<COND (<EQUAL? ,PRSI ,GROOVE1 ,GROOVE2 ,CABLES>
		       <SET W ,WINNER>
		       <CHANGE-WINNER ,IRIS T>
		       <TELL <GET ,INTER-TBL 1>
" Transmission indicates the cables rest in the grooves in the following order: ">
		       <COND (<IN? .W ,TUBE2>
			      <COND (,REDSET
				     <TELL D ,REDSET>)
				    (ELSE
				     <TELL "empty">)>
			      <TELL "; " D ,YELLOWCABLE  "; "
				     D ,GREENCABLE "; and " D ,PINKCABLE ". ">)
			     (T
			      <TELL  D ,WHITECABLE "; " D ,BLUECABLE "; "
				    D ,BLACKCABLE "; and ">
			      <COND (,ORANGESET
				     <TELL D ,ORANGESET ". ">)
				    (ELSE
				     <TELL "empty. ">)>)>
		       <TELL <GET ,CABLE-TBL ,ROFF> CR>
		       <CHANGE-WINNER .W T>
		       <RTRUE>)
		      (<EQUAL? ,PRSI ,SIGNPOST>
		       <SET W ,WINNER>
		       <CHANGE-WINNER ,IRIS T>
		       <TELL <GET ,INTER-TBL 1>
" The little sign presents me with the access code the machine in the Main Supply Room needs to reset the Filtering Computers. It says " SD ,CODE1 SD ,CODE2 "." CR>
		       <CHANGE-WINNER .W T>
		       <RTRUE>)>
		<TELL <GET ,INTER-TBL 1> " " <PICK-ONE ,IRIS-TV-QUIPS>>
		<COND (<NOT <GETP ,PRSI ,P?ROBOT>>
		       <TELL "a ">)>
		<SET W ,WINNER>
		<CHANGE-WINNER ,IRIS T>
		<TELL D ,PRSI "." CR>
		<CHANGE-WINNER .W T>)>>

<GLOBAL IRIS-TV-QUIPS
	<PLTABLE
"The image is rather fuzzy, but it looks like "
"I can't make it out too clearly, but it seems like "
"You call this clear reception? All I can make out is the shape of "
"The image is broken up, but it looks as if it could be "
"Now I know why cable-tv was invented. All I can make out is the shape of ">>

<ROUTINE V-SET ("AUX" DIALOFF OLDNUM)
	 <SET DIALOFF <GETP ,PRSO ,P?DIAL>>
	 <COND (<NOT .DIALOFF>
		<ROBOT-TELL "I don't know how to do that to " <>>
		<COND (<NOT <GETP ,PRSO ,P?ROBOT>>
		       <TELL "a ">)>
		<TELL D ,PRSO "." CR> <RTRUE>)>
	 <COND (<NOT <EQUAL? ,PRSI ,INTNUM ,RIGHT ,LEFT>>
		<ROBOT-TELL "How am I supposed to accomplish that?"><RTRUE>)>
	 <SET OLDNUM <GET ,DIALSETS .DIALOFF>>
	 <COND (<EQUAL? ,PRSI ,RIGHT>
		<SETG P-NUMBER <+ .OLDNUM 10>>
		<COND (<G? ,P-NUMBER 100>
		       <ROBOT-TELL "It can't go " <>>
		       <COND (<EQUAL? ,PRSO ,LEVER1 ,LEVER2 ,LEVER3>
			      <TELL "forward">)
			     (T
			      <TELL "right">)>
		       <TELL " any more." CR>)>)
	       (<EQUAL? ,PRSI ,LEFT>
		<COND (<EQUAL? .OLDNUM 0>
		       <ROBOT-TELL "It can't go " <>>
		       <COND (<EQUAL? ,PRSO ,LEVER1 ,LEVER2 ,LEVER3>
			      <TELL "back">)
			     (T
			      <TELL "left">)>
		       <TELL " any more." CR> <RTRUE>)
		      (<L? .OLDNUM 10>
		       <SETG P-NUMBER 0>)
		      (ELSE
		       <SETG P-NUMBER <- .OLDNUM 10>>)>)>
	 <COND (<G? ,P-NUMBER 100>
		<ROBOT-TELL "That setting is out of range."> <RTRUE>)>
	 <COND (<EQUAL? ,P-NUMBER .OLDNUM>
		<ROBOT-TELL "That's where it was already set."> <RTRUE>)>
	 <PUT ,DIALSETS .DIALOFF ,P-NUMBER>
	 <ROBOT-TELL "The " <>>
	 <TELL D ,PRSO " has been set to " N ,P-NUMBER "." CR>>
	 

<ROUTINE V-PLAY ()
	 <TELL "Playing a " D ,PRSO "?" CR>>

<ROUTINE V-$VERIFY ()
	 <TELL "Verifying game..." CR>
	 <COND (<VERIFY> <TELL "Game correct." CR>)
	       (T <TELL CR "** Game File Failure **" CR>)>>

<ROUTINE V-STAND-ON ()
	 <COND (<EQUAL? ,WEDGE ,PRSO>
		<PERFORM ,V?CLIMB-ON ,PRSO>
		<RTRUE>)
	       (ELSE
		<ROBOT-TELL "I can't manage that.">)>>

<ROUTINE V-ALL-REPORT ("AUX" TEMP (COUNT -1) ROB)
	 <SET TEMP ,WINNER>
         <REPEAT ()
		 <SET COUNT <+ .COUNT 1>>
		 <COND (<EQUAL? .COUNT 6>
			<RETURN>)>
		 <SET ROB <GET ,NAME-TBL .COUNT>>
		 <COND (<FSET? .ROB ,CUTBIT>
			<TELL "FC: " SD .ROB " is no longer functional." CR>
			<CLOCKER>
			<COND (<L? .COUNT 5>
			       <CRLF>)>)
		       (T
			<CHANGE-WINNER .ROB T>
			<CLOCKER>
			<PERFORM ,V?REPORT>
			<COND (<L? .COUNT 5>
			       <CRLF>)>)>>
	 <CHANGE-WINNER .TEMP T>>

<ROUTINE V-ALL-REPORT-LOC ("AUX" TEMP (COUNT -1) ROB)
	 <SET TEMP ,WINNER>
         <REPEAT ()
		 <SET COUNT <+ .COUNT 1>>
		 <COND (<EQUAL? .COUNT 6>
			<RETURN>)>
		 <SET ROB <GET ,NAME-TBL .COUNT>>
		 <COND (<FSET? .ROB ,CUTBIT>
			<TELL "FC: " SD .ROB 
			      " is no longer in communication." CR>)
		       (T
			<CHANGE-WINNER .ROB T>
			<PERFORM ,V?REPORT-LOC>)>>
	 <CHANGE-WINNER .TEMP T>>
	 
<ROUTINE V-REPORT ()
	 <TELL "FC: Full report from ">
	 <TELL <GET ,ROBOT-NAMES ,ROFF> CR>
	 <V-LOOK>
	 <V-INVENTORY>
	 <COND (<AUDA?>
		<COND (,AUDA-LISTENS
		       <TELL "Auditory circuits active." CR>)
		      (T
		       <TELL "Auditory circuits inactive." CR>)>)>
	 <COND (<POET?>
		<PERFORM ,V?TOUCH ,WINNER-HERE>
		<RTRUE>)>
	 <COND (<WHIZ?>
		<COND (,PLUGGED-IN
		       <TELL "Plugged in at " <GET ,PLUG-LOCS ,PLUGGED-IN> CR>)
		      (T <TELL "Unable to process queries at this time." CR>)>)>>

		
<ROUTINE V-REPORT-LOC ()
	 <COND (<AND ,PRSO
		     <NOT <EQUAL? ,PRSO ,LOCATION>>>
		<PERFORM ,V?EXAMINE ,PRSO>
		<RTRUE>)
	       (T
		<COND (<IN-MOTION? ,WINNER>
		       <ROBOT-TELL "Entering the " <>>)
		      (T
		       <ROBOT-TELL "In the " <>>)>
		<COND (<IN? ,WINNER ,CAR>
		       <TELL D ,CAR>)
		      (T <TELL SD <LOC ,WINNER>>)>
		<TELL "." CR>)>>

<ROUTINE V-LOOK-SAFELY ()
	 <COND (<FSET? ,PRSI ,TRANSBIT>
		<TELL "The " D ,PRSO " looks as before, only tinged by the
color of the " D ,PRSI "." CR>)
	       (ELSE <TELL "The " D ,PRSI " isn't transparent." CR>)>>

<ROUTINE V-REACH ()
	 <COND (<FIRST? ,PRSO>
		<TELL "There is something">)
	       (ELSE <TELL "There is nothing">)>
	 <COND (<FSET? ,PRSO ,SURFACEBIT>
		<TELL " sitting on the ">)
	       (ELSE <TELL " inside the ">)>
	 <TELL D ,PRSO "." CR>>

<ROUTINE V-REACH-FOR ()
	 <COND (<FSET? ,PRSO ,TAKEBIT>
		<PERFORM ,V?TAKE ,PRSO>
		<RTRUE>)
	       (<IN? ,PRSO ,WINNER-HERE>
		<TELL "It's here! Now what?" CR>)
	       (ELSE <TELL "It is out of reach." CR>)>>

<ROUTINE DO-WALK (DIR)
	 <SETG P-WALK-DIR .DIR>
	 <PERFORM ,V?WALK .DIR>>

<GLOBAL WALK-INSULTS
	<PLTABLE "I have enough trouble seeing where I am without being told to go to where I already am."
		"That's easy. Poof. Sonar indicates that's where I was and still am."
		"Sensory mechanisms detect that I am where you want me to be already."
		"From what I hear, I am where you want me to be."
		"How can you be two places at once when you're not anywhere at all?"
		"I'm confused. That's where I am.">>
		
<GLOBAL ORDER-RCD
	<PLTABLE "Got it, good looking. I'll let you know when I get there."
		"I'm on my way. Expect a report on arrival."
		"Order input acknowledged. Output on arrival."
		"I hear you loud and clear. Talk to you when I get there."
		"All life's a stage, so just consider me a player. See you."
		"CLC setting coordinates. Will report in on arrival.">>

<ROUTINE V-WALK-TO ()
	 <COND (<EQUAL? ,PRSO ,CAR>
		<SETG ,PRSO <LOC ,CAR>>)>
	 <COND (<EQUAL? ,PRSO ,HELL>
		<TELL "FC: What makes you think you're not already there?" CR>
		<RTRUE>)
	       (<EQUAL? ,PRSO ,WINNER-HERE ,WINNER>
		<ROBOT-TELL <GET ,WALK-INSULTS ,ROFF>>)
	       (<IN? ,PRSO ,ROOMS>
		<COND (<NOT <EQUAL? <GET ,FOLLOW-TBL ,ROFF> 0>>
		       <PUT ,FOLLOW-TBL ,ROFF 0>)>
		<KILL-GOAL ,WINNER>
		<SET-GOAL ,WINNER ,PRSO>
		<DO-THE-TV>
		<ROBOT-TELL <GET ,ORDER-RCD ,ROFF>>
		<CHECK-MORE?>)
	       (<GETP ,PRSO ,P?ROBOT>
		<SET-GOAL ,WINNER <LOC ,PRSO>>
		<DO-THE-TV>
		<COND (<NOT <FSET? ,PRSO ,CUTBIT>>
		       <TELL "FC: " D ,PRSO "'s location: ">)
		      (T
		       <TELL "FC: " D ,PRSO " is non-functional. Last known location: ">)>
		<TELL SD <LOC ,PRSO> ". Establishing path..." CR>
		<ROBOT-TELL <GET ,ORDER-RCD ,ROFF>>
		<COND (<NOT <EQUAL? <GET ,FOLLOW-TBL ,ROFF> 0>>
		       <PUT ,FOLLOW-TBL ,ROFF 0>)>
		<PUT ,ROBOT-FOLLOW ,ROFF ,PRSO>
		<CHECK-MORE?>)
	       (<IN? ,PRSO ,WINNER-HERE>
		<ROBOT-TELL "It's right here.">)
	       (T
		<ROBOT-TELL "You'll have to tell me where it is first.">)>>

<ROUTINE CHECK-MORE? ()
	 <COND (,P-CONT
		<TELL CR "FC: When " D ,WINNER
		      " arrives, you'll have to tell ">
		<HIM-HER ,WINNER>
		<TELL " what to do then. I have too much to keep track of already." CR>
		<RFATAL>)>>

<ROUTINE DO-THE-TV ()
	 <COND (<AND <EQUAL? <LOC ,WINNER> ,TUBE1 ,TUBE2>
			    <IN? ,TV ,WINNER>
			    ,TV-ON>
		       <SETG TV-ON <>>
		       <TELL "(Unplugging " D ,TV " first.)" CR>)
	       (<EQUAL? ,ON-WEDGE <GETP ,WINNER ,P?ROBOT>>
		<TELL "(getting off the " D ,WEDGE " first.)" CR>
		<SETG ON-WEDGE <>>)>>

<ROUTINE V-STOP ()
	 <COND (<AND ,PRSO
		     <NOT <EQUAL? ,PRSO ,LISTENING ,DRAGGING>>>
		<ROBOT-TELL "I can't do that to " <>>
		<COND (<EQUAL? ,PRSO ,PEOPLE>
		       <TELL "the ">)>
		<TELL D ,PRSO "." CR>
		<RTRUE>)>
	 <COND (<AND ,PRSO
		     <EQUAL? ,PRSO ,LISTENING>
		     <AUDA?>>
		<ROBOT-TELL "Okay. Auditory sensors deactivated.">
		<SETG AUDA-LISTENS <>>
		<RTRUE>)
	       (<AND ,PRSO
		     <EQUAL? ,PRSO ,DRAGGING>
		     <NOT <EQUAL? <GET ,DRAG-TBL ,ROFF> 0>>>
		<ROBOT-TELL "Okay. I'll stop dragging " <>>
		<HIM-HER ,PRSO>
		<TELL "." CR>
		<PUT ,DRAG-TBL ,ROFF 0>)
	       (,PRSO
		<ROBOT-YUKS>)
	       (<NOT <IN-MOTION? ,WINNER>>
		<ROBOT-TELL "I wasn't going anywhere special anyway.">
		<PUT ,FOLLOW-TBL ,ROFF 0>
		<RTRUE>)
	       (T <KILL-GOAL ,WINNER>
		<ROBOT-TELL "I have stopped at the " <>>
		<TELL SD ,WINNER-HERE "." CR>
		<PUT ,FOLLOW-TBL ,ROFF 0>)>>

<ROUTINE V-FLY ()
	 <ROBOT-TELL "Robots are not usually equipped for flying.">>

<ROUTINE V-SMILE ()
	 <ROBOT-TELL "If only I could!">>


%<COND (<GASSIGNED? ZILCH> T)
       (T '<ROUTINE V-ESCAPE ()
		    <QUITTER <ASCII 7> ,INCHAN>>)>

<ROUTINE GRASPING? (OBJ)
	 <REPEAT ()
		 <COND (<NOT .OBJ>
			<RFALSE>)>
		 <COND (<IN? .OBJ ,WINNER>
			<RTRUE>)
		       (ELSE
			<SET OBJ <LOC .OBJ>>)>>>

<ROUTINE PRE-REPLACE ("AUX" OBJ)
	 <COND (<EQUAL? ,NUM-EXT <CCOUNT ,WINNER>>
		<ROBOT-TELL "I can't. My extensions are full.">
		<RTRUE>)
	       (<AND <NOT <GRASPING? ,PRSI>>
		     <NOT <GRASPING? ,PRSO>>>
		<ROBOT-TELL "I'd better grasp one of them first.">
		<RFATAL>)
	       (<EQUAL? ,PRSO ,PRSI>
		<ROBOT-TELL 
"You've asked me to replace something with itself.">
		<RFATAL>)
	       (<GRASPING? ,PRSO>
		<SET OBJ ,PRSO>
		<SETG PRSO ,PRSI>
		<SETG PRSI .OBJ>
		<RFALSE>)>>

<ROUTINE V-REPLACE ("AUX" LOC)
         <COND (<NOT <FSET? ,PRSO ,TAKEBIT>>
		<ROBOT-TELL "You'd better rethink that.">)
	       (<NOT <EQUAL? <GETP ,PRSI ,P?SIZE> <GETP ,PRSO ,P?SIZE>>>
		<ROBOT-TELL "That's tough to do since the " <>>
		<TELL D ,PRSO " and the " D ,PRSI " aren't the same size."CR>
		<RTRUE>)
	       (T
		<SET LOC <LOC ,PRSO>>
		<FSET ,PRSO ,TOUCHBIT>
		<MOVE ,PRSO ,WINNER>
		<MOVE ,PRSI .LOC>
		<ROBOT-TELL "Okay. It's done.">
		<COND (<AND <EQUAL? .LOC ,PANEL>
			    <NOT ,IRIS-FIXED>
			    <IN? ,NEWCHIP1 ,PANEL>
			    <IN? ,CHIP2 ,PANEL>
			    <IN? ,CHIPS0 ,PANEL>>
		       <TELL CR <GET ,INTER-TBL 1> 
			     " OOOH! That felt good! Close my panel, big boy."
			     CR>)
		      (<EQUAL? .LOC ,GROOVE2>
		       <SETG REDSET ,PRSI>)
		      (<EQUAL? .LOC ,GROOVE1>
		       <SETG ORANGESET ,PRSI>)>)>>

<ROUTINE V-CUT ()
	 <COND (<NOT ,PRSI>
		<ROBOT-TELL "With what?">
		<RTRUE>)
	       (<NOT <FSET? ,PRSO ,CUTABLEBIT>>
		<ROBOT-TELL "It won't cut.">
		<RTRUE>)
	       (<FSET? ,PRSO ,CUTBIT>
		<ROBOT-TELL "It's already been cut.">
		<RTRUE>)
	       (<AND ,PRSI
		     <NOT <EQUAL? ,PRSI ,WIRECUTTER>>>
		<ROBOT-TELL "I don't think " <>>
		<COND (<NOT <GETP ,PRSI ,P?ROBOT>>
		       <TELL "the ">)>
		<TELL D ,PRSI " will work very well for this job." CR>)
	       (ELSE
		<FSET ,PRSO ,CUTBIT>
		<FSET ,PRSO ,TOUCHBIT>
		<ROBOT-TELL "Done.">)>>
		
<ROUTINE V-TOUCH ("AUX" (NUM 0) TBL)
	 <COND (<POET?>
		<COND (<IN? ,PRSO ,ROOMS>
		       <SET NUM 
			   <GET <SET TBL <GETP ,WINNER-HERE ,P?ROOMDESCS>> 0>>)
		      (<EQUAL? ,WINNER-HERE <META-LOC ,PRSO>>
		       <SET NUM <GET <SET TBL <GETP ,PRSO ,P?OBJDESCS>>0>>)>
		<COND (<G? .NUM 18>
		       <ROBOT-TELL <GET .TBL 19>>)
		      (ELSE
		       <ROBOT-TELL "Sensory pads detect no abnormal flow.">)>)
	       (<WALDO?>
		<PERFORM ,V?EXAMINE ,PRSO>
		<RTRUE>)
	       (ELSE
		<ROBOT-TELL "Not me, man. Better ask someone else.">)>>

<ROUTINE META-LOC (OBJ)
	 <REPEAT ()
		 <COND (<IN? .OBJ ,GLOBAL-OBJECTS>
			<RFALSE>)>
		 <COND (<IN? .OBJ ,ROOMS>
			<RETURN .OBJ>)
		       (ELSE
			<SET OBJ <LOC .OBJ>>)>>>

<ROUTINE V-PUSH-UP ()
	 <COND (<NOT <IN? ,PRSO <LOC ,WINNER>>>
		<CANT-DETECT ,PRSO>
		<RTRUE>)
	       (<NOT <GETP ,PRSO ,P?ROBOT>>
		<PERFORM ,V?PUSH ,PRSO>)
	       (<EQUAL? ,PRSO ,WINNER>
		<TELL 
		 "FC: I think you're following the path of Franklin." CR>
		<RTRUE>)
	       (<L? <GET ,DEADBOTS <GETP ,PRSO ,P?ROBOT>> 30>
		<ROBOT-TELL "I try, but " <>>
		<HE-SHE ,PRSO>
		<TELL " keeps moving away." CR>
		<RTRUE>)
	       (<AND <IN? ,WINNER ,REPAIR1>
		     <EQUAL? ,WEDGE-PLACED 1>>
		<ROBOT-TELL "Umph! Hard work, but consider it done!">
		<MOVE ,PRSO ,CONVEYERBELTA> <SETG ON-WEDGE ,WINNER>
		<SETG BELT-ON T>
		<COND (<EQUAL? <GET <INT I-BELT> ,C-ENABLED?> 0>
		       <ENABLE <QUEUE I-BELT 2>>)>
		<FSET ,PRSO ,FIXABLEBIT>)
	       (T
		<ROBOT-TELL "I'd like to, but there's no way to get " <>>
		<HIM-HER ,PRSO>
		<TELL " up that high from where I am." CR>)>>
		
<ROUTINE V-REPAIR ()
	 <COND (<OR <EQUAL? ,PRSO ,DEADBOT ,REDCABLE ,PINKCABLE>
		    <EQUAL? ,PRSO ,WHITECABLE ,BLUECABLE ,BLACKCABLE>
		    <EQUAL? ,PRSO ,ORANGECABLE ,YELLOWCABLE ,GREENCABLE>
		    <EQUAL? ,PRSO ,MACHINE ,IRIS ,FCS>>
		<ROBOT-TELL "Things aren't that simple.">)
	       (T
		<ROBOT-TELL "It doesn't seem to be in need of repairs.">)>>

;"OLD V-PUSH-UP FOLLOWS. REPLACED ABOVE WITH REWRITTEN VERB."
  
;<ROUTINE V-PUSH-UP ()
	 <COND (<NOT <GETP ,PRSO ,P?ROBOT>>
		<ROBOT-TELL "Why bother? It hardly seems worthwhile.">)
	       (<NOT <IN? ,PRSO <LOC ,WINNER>>>
		<CANT-DETECT ,PRSO>
		<RFATAL>)
	       
	       (<AND <IN? ,WINNER ,REPAIR1>
		     <EQUAL? ,WEDGE-PLACED 1>
		     <G? <GET ,DEADBOTS <GETP ,PRSO ,P?ROBOT>> 29>>
		<ROBOT-TELL "Umph! Hard work, but consider it done!">
		<MOVE ,PRSO ,CONVEYERBELTA>
		<SETG ON-WEDGE ,WINNER>
		<SETG BELT-ON T>
		<COND (<EQUAL? <GET <INT I-BELT> ,C-ENABLED?> 0>
		       <ENABLE <QUEUE I-BELT 2>>)>
		<FSET ,PRSO ,FIXABLEBIT>)
	       (T
		<PERFORM ,V?PUSH ,PRSO>)>>

<ROUTINE BIG-NUM-PRINT (NUM "AUX" TEMP)
	 <COND (<EQUAL? .NUM 0>
		<TELL "0">
		<RTRUE>)
	       (<G? .NUM 999>
		<SET TEMP </ .NUM 1000>>
		<SET NUM <MOD .NUM 1000>>
		<TELL N .TEMP ",">
		<COND (<EQUAL? .NUM 0>
		       <TELL "000">)
		      (<L? .NUM 10>
		       <TELL "00" N .NUM>)
		      (<L? .NUM 100>
		       <TELL "0" N .NUM>)
		      (T <TELL N .NUM>)>)
	       (T
		<TELL N .NUM>)>
	 <TELL ",000">>

<ROUTINE V-ADVANCED ()
	 <COND (,ADVANCED-FLAG
		<TELL
"FC: You are already in the advanced situation." CR>)
	       (<G? ,MOVES 1>
		<TELL <GET ,INTER-TBL 7>
" Your request for the advanced game has been rejected since " N ,MOVES " cycles have already transpired. Please consult your indoctrination manual for the proper procedure." CR>)
	       (T
		<TELL
"FC: Request for advanced game acknowledged." CR>
		<QUEUE I-TREMOR1 3>
		<I-TREMOR2>
		<CRLF>
		<DISABLE <INT I-TREMOR2>>
		<SETG PEOPLE-APPEAR 80>
		<ENABLE <QUEUE I-PEOPLE1 ,PEOPLE-APPEAR>>
		<SETG RTD-KILLS 2>
		<SETG ACID-KILLS 2>
		<SETG DYING1 1>
		<SETG DYING2 2>
		<SETG DYING3 3>
		<DISABLE <INT I-AUDA-HINTS>>
		<DISABLE <INT I-IRIS-HINTS>>
		<PUT ,DEADBOTS 6 30>
		<FSET ,WHIZ ,CUTBIT>
		<V-ALL-REPORT-LOC>
		<SETG ADVANCED-FLAG T>)>>
		     
<ROUTINE V-IMPOSSIBLE ()
	 <COND (<G? ,MOVES 1>
		<TELL
"FC: It is impossible to do that now. Please refer to your indoctrination manual for the proper way to initiate the impossible game." CR>
		<RTRUE>)
	       (T
		<ENABLE <QUEUE I-IMP 2>>
		<TELL "FC: Okay, you asked for it..." CR CR>
		<TELL 
"FC INTERRUPT: External sensors detect huge radiation abnormalities in the star which provides Contra with all light and heat.|
|
WARNING! TIME CRITICAL!!|
|
External sensors detect significant instability in the star." CR>)>>
	       

<ROUTINE I-IMP ()
	 <TELL CR
"FC INTERRUPT: Oh oh. Abnormalities in star approaching critical level.
	       NOVA IMMINENT!|
|
So long from all the gang -- Iris, Waldo, Sensa, Auda, Poet, Whiz, FRED, and last but not least, we three FCs." CR>
	 <QUIT>>

<ROUTINE V-WHY ()
	 <COND (<NOT <WHIZ?>>
		<ROBOT-TELL "Sure beats me. You might ask Whiz...">)
	       (T
		<ROBOT-TELL
	"Please refer to your manual for proper querying procedures.">)>> 
		     