"MAIN for
			      SUSPENSION
	(c) Copyright 1983 Infocom, Inc.  All Rights Reserved.
"

<GLOBAL P-WON <>>

<GLOBAL RTD-KILLS 75>

<GLOBAL ACID-KILLS 15>

<GLOBAL PEOPLE-APPEAR 100>

<CONSTANT M-FATAL 2>
 
<CONSTANT M-HANDLED 1>   
 
<CONSTANT M-NOT-HANDLED <>>   
 
<CONSTANT M-BEG 1>  
 
<CONSTANT M-OBJECT <>>

<CONSTANT M-END 6> 
 
<CONSTANT M-ENTER 2>
 
<CONSTANT M-LOOK 3> 
 
<CONSTANT M-FLASH 4>

<CONSTANT M-OBJDESC 5>

<ROUTINE GO () 
	 <PUTB ,P-LEXV 0 59>
;"put interrupts on clock chain"
	 
;"set up and go"
	 
	 <INIT-STATUS-LINE>
	 <SETG HERE ,IRIS>
	 <SETG LIT T>
	 <SETG REDSET ,REDCABLE>
         <SETG ORANGESET ,ORANGECABLE>
	 <ENABLE <QUEUE I-TREMOR1 ,ACID-KILLS>>
	 <ENABLE <QUEUE I-TREMOR2 ,RTD-KILLS>>;"Includes resetting food levers"
	 <ENABLE <QUEUE I-PEOPLE1 ,PEOPLE-APPEAR>>
	 <ENABLE <QUEUE I-AUDA-HINTS ,PEOPLE-APPEAR>>
	 <ENABLE <QUEUE I-FOLLOW -1>>
	 <ENABLE <QUEUE I-WEATHER 4>>
	 <ENABLE <QUEUE I-DECAY 5>>
	 <ENABLE <QUEUE I-FOOD -1>>
	 <ENABLE <QUEUE I-WIRE-MESSAGE -1>>
	 <ENABLE <QUEUE I-ROBOTKILLER -1>>
         <ENABLE <QUEUE I-SCORE -1>>
	 <ENABLE <QUEUE I-IRIS-HINTS -1>>
	 <SETG P-IT-OBJECT <>>
	 <SETG WINNER-HERE ,CPU-ROOM>
	 <COND (<NOT <FSET? ,WINNER-HERE ,TOUCHBIT>>
		<V-VERSION>
		<CRLF>)>
	 <BEGINNING>
	 <CHANGE-WINNER ,IRIS T>
	 <V-ALL-REPORT-LOC>
	 <SET-LAST-ROOM>	
	 <MAIN-LOOP>
	 <AGAIN>>

<ROUTINE CHANGE-WINNER (OBJ "OPTIONAL" (TEMP? <>) "AUX" L)
	 <COND (<AND <==? .OBJ ,WINNER>
		     <NOT .TEMP?>>
		<TELL "FC: Cryolink already established to " SD ,WINNER "." CR>
		<RTRUE>)>
	 <COND (<G? <GET ,DEADBOTS <GETP .OBJ ,P?ROBOT>> 29>
		<DEAD-FCN .OBJ>
		<RFALSE>)>
	 <SETG WINNER .OBJ>
	 <SETG OLD-WINNER <>>
	 <SETG WINNER-HERE <COND (<IN? <SET L <LOC .OBJ>> ,ROOMS> .L)
			  (T <LOC .L>)>>
	 <SETG ROFF <GETP ,WINNER ,P?ROBOT>>
	 <SETG HERE ,WINNER>
	 <COND (<NOT .TEMP?>
		<TELL "FC: Cryolink established to ">
		<TELL SD ,WINNER "." CR>)>
	 <COND (<IRIS?> <SETG NUM-EXT 2>)
	       (<WALDO?> <SETG NUM-EXT 6>
		<COND (<FSET? ,SURGERY-HAND ,WEARBIT> <SETG NUM-EXT 7>)>)
	       (<SENSA?> <SETG NUM-EXT 3>)
	       (<AUDA?> <SETG NUM-EXT 1>)
	       (<POET?> <SETG NUM-EXT 3>)
	       (<WHIZ?> <SETG NUM-EXT 2>)>
	 <RTRUE>>

<ROUTINE MAIN-LOOP ("AUX" ICNT OCNT NUM CNT OBJ TBL V PTBL OBJ1 TMP) 
   #DECL ((CNT OCNT ICNT NUM) FIX (V) ANY (OBJ) <OR FALSE OBJECT>
	  (OBJ1) OBJECT (TBL) TABLE (PTBL) <OR FALSE ATOM>)
   <REPEAT ()
     <SET CNT 0>
     <SET OBJ <>>
     <SET PTBL T>
     <COND (<SETG P-WON <PARSER>>
	    <SET ICNT <GET ,P-PRSI ,P-MATCHLEN>>
	    <SET NUM
		 <COND (<0? <SET OCNT <GET ,P-PRSO ,P-MATCHLEN>>> .OCNT)
		       (<G? .OCNT 1>
			<SET TBL ,P-PRSO>
			<COND (<0? .ICNT> <SET OBJ <>>)
			      (T <SET OBJ <GET ,P-PRSI 1>>)>
			.OCNT)
		       (<G? .ICNT 1>
			<SET PTBL <>>
			<SET TBL ,P-PRSI>
			<SET OBJ <GET ,P-PRSO 1>>
			.ICNT)
		       (T 1)>>
	    <COND (<AND <NOT .OBJ> <1? .ICNT>> <SET OBJ <GET ,P-PRSI 1>>)>
	    <COND (<==? ,PRSA ,V?WALK> <SET V <PERFORM ,PRSA ,PRSO>>)
		  (<0? .NUM>
		   <COND (<0? <BAND <GETB ,P-SYNTAX ,P-SBITS> ,P-SONUMS>>
			  <SET V <PERFORM ,PRSA>>
			  <SETG PRSO <>>)
			 (<VERB? $TELL>
			  <TELL
"FC: I don't understand with which robot you wish to form a cryolink." CR>
			  <SET V <>>)
			 (T
			  <TELL <GET ,ROBOT-NAMES ,ROFF> ": "
				<GET ,NOT-CLEAR ,ROFF> " ">
			  <SET TMP <GET ,P-ITBL ,P-VERBN>>
			  <COND (,P-OFLAG
				 <PRINTB <GET .TMP 0>>)
				(T
				 <WORD-PRINT <GETB .TMP 2> <GETB .TMP 3>>)>
			  <TELL "!" CR>
			  <SET V <>>)>)
		  (<AND <G? .NUM 1> <==? ,PRSA ,V?$TELL>>
		   <SETG P-CACTOR 1>
		   <SETG P-OPLEN <GETB ,P-LEXV ,P-LEXWORDS>>
		   <SETG P-OPCONT ,P-CONT>
		   <SET CNT 1>
		   <PUT ,P-ACTORS 0 .NUM>
		   <REPEAT ()
			   <COND (<G? .CNT .NUM> <RETURN>)
				 (T
				  <PUT ,P-ACTORS
				       .CNT
				       <COND (<IN? <SET OBJ <GET ,P-PRSO .CNT>>
						   ,GLOBAL-OBJECTS>
					      <REAL-ROBOT .OBJ>)
					     (T .OBJ)>>)>
			   <SET CNT <+ .CNT 1>>>
		   <COND (,P-TWOBOTS
			  <SETG P-NACTORS 1>
			  <COND (<ALL-THERE?>
				 ;<CLOCKER>
				 <COND (<OR <NOT <GETP <1 ,P-ACTORS> ,P?ROBOT>>
					    <NOT
					     <GETP <2 ,P-ACTORS> ,P?ROBOT>>
					    <==? <GETP <2 ,P-ACTORS> ,P?ROBOT>
						 7>
					    <==? <GETP <1 ,P-ACTORS> ,P?ROBOT>
						 7>>
					<TELL "FC: That's absurd!" CR>
					<CHANGE-WINNER ,OLD-WINNER>
					<AGAIN>)
				       (ELSE
					<TELL
					 "FC: Dual-Cryolink established to ">
					<TELL SD <1 ,P-ACTORS> " and "
					      SD <2 ,P-ACTORS> "." CR>
					<SETG WINNER ,TWOBOTS>
					<SETG ROFF 0>
					<SETG WINNER-HERE
					      <LOC <1 ,P-ACTORS>>>)>)
				(T
				 <TELL
				  "FC: The robots are in different places." CR>
				 <CHANGE-WINNER ,OLD-WINNER>
				 <AGAIN>)>)
			 (T
			  <SETG P-NACTORS .NUM>
			  <SET V <PERFORM ,PRSA <GET ,P-PRSO 1>>>
			  <SETG OLD-WINNER <>>)>)
		  (T
		   <REPEAT ()
			   <COND (<G? <SET CNT <+ .CNT 1>> .NUM> <RETURN>)
				 (T
				  <COND (.PTBL <SET OBJ1 <GET ,P-PRSO .CNT>>)
					(T <SET OBJ1 <GET ,P-PRSI .CNT>>)>
				  <COND (<G? .NUM 1>
					 <TELL "(" D .OBJ1 ") ">)>
				  <SETG PRSO <COND (.PTBL .OBJ1) (T .OBJ)>>
				  <SETG PRSI <COND (.PTBL .OBJ) (T .OBJ1)>>
				  <SET V <PERFORM ,PRSA ,PRSO ,PRSI>>
				  <COND (<==? .V ,M-FATAL> <RETURN>)>)>>)>
	    <SETG L-PRSA ,PRSA>
	    <SETG L-PRSO ,PRSO>
	    <SETG L-PRSI ,PRSI>
	    <COND (<==? .V ,M-FATAL>
		   <SETG P-CONT <>>
		   <SETG P-NACTORS 0>)>)
	   (<G? ,P-NACTORS 1> T)
	   (T
	    <SETG P-NACTORS 0>
	    <SETG P-CONT <>>)>
     <COND (,P-WON
	    <COND (<VERB? SAVE RESTORE $TELL VERSION SCORE ADVANCED CONFIGURE IMPOSSIBLE QUIT RESTART SCRIPT UNSCRIPT> T)
		  (T
		   <SET V <CLOCKER>>)>)>>>
 
<GLOBAL NOT-CLEAR <PLTABLE
"I don't see what you mean to"
"I can't tell which object to"
"I have no good sense of what to"
"I don't hear what you mean to"
"I can't imagine what you intend to"
"The CLC doesn't understand what to">>

<ROUTINE TICK ()
	 <CLOCKER>>

<ROUTINE ALL-THERE? ("AUX" (CNT 1) MAX RM)
	 <SET MAX <GET ,P-PRSO ,P-MATCHLEN>>
	 <SET RM <LOC <GET ,P-PRSO 1>>>
	 <REPEAT ()
		 <COND (<G? <SET CNT <+ .CNT 1>> .MAX> <RTRUE>)
		       (<NOT <EQUAL? <LOC <GET ,P-PRSO .CNT>> .RM>>
			<RFALSE>)>>>

<GLOBAL L-PRSA <>>  
 
<GLOBAL L-PRSO <>>  
 
<GLOBAL L-PRSI <>>  

<ROUTINE PERFORM (A "OPTIONAL" (O <>) (I <>) "AUX" V OA OO OI) 
	#DECL ((A) FIX (O) <OR FALSE OBJECT FIX> (I) <OR FALSE OBJECT> (V) ANY)
	<SET OA ,PRSA>
	<SET OO ,PRSO>
	<SET OI ,PRSI>
	<COND (<AND <EQUAL? ,IT .I .O>
		    <NOT <EQUAL? ,P-IT-LOC ,WINNER-HERE>>>
	       <TELL "FC: I don't see what you are referring to." CR>
	       <RFATAL>)>
	<COND (<==? .O ,IT> <SET O ,P-IT-OBJECT>)>
	<COND (<==? .I ,IT> <SET I ,P-IT-OBJECT>)>
	<SETG PRSA .A>
	<SETG PRSO .O>
	<COND (<AND ,PRSO <NOT <VERB? WALK>>>
	       <SETG P-IT-OBJECT ,PRSO>
	       <SETG P-IT-LOC ,WINNER-HERE>)>
	<SETG PRSI .I>
	<COND (<GAME-COMMAND? .A>
	       <SET V <APPLY <GET ,ACTIONS .A>>>)
	      (<SET V <APPLY <GETP ,WINNER ,P?ACTION>>> .V)
	      (<SET V <APPLY <GETP <LOC ,WINNER> ,P?ACTION> ,M-BEG>> .V)
	      (<SET V <APPLY <GET ,PREACTIONS .A>>> .V)
	      (<AND .I <SET V <APPLY <GETP .I ,P?ACTION>>>> .V)
	      (<AND .O
		    <NOT <==? .A ,V?WALK>>
		    <LOC .O>
		    <SET V <APPLY <GETP <LOC .O> ,P?CONTFCN>>>>
	       .V)
	      (<AND .O
		    <NOT <==? .A ,V?WALK>>
		    <SET V <APPLY <GETP .O ,P?ACTION>>>>
	       .V)
	      (<SET V <APPLY <GET ,ACTIONS .A>>> .V)>
	<COND (<NOT <==? .V ,M-FATAL>>
	       <SET V <APPLY <GETP <LOC ,WINNER> ,P?ACTION> ,M-END>>)>
	<SETG PRSA .OA>
	<SETG PRSO .OO>
	<SETG PRSI .OI>
	.V>  
 
<ROUTINE GAME-COMMAND? (ACT)
	 <COND (<OR <EQUAL? .ACT ,V?SCORE ,V?SAVE ,V?RESTORE>
		    <EQUAL? .ACT ,V?QUIT ,V?VERSION ,V?$VERIFY>
		    <EQUAL? .ACT ,V?ADVANCED>>
		<RTRUE>)>>

<ROUTINE BEGINNING ()
	 <TELL
"FC ALERT! Planetside systems are deteriorating. FC imbalance detected. Emergency reviving systems completed. You are now in control of the complex.|
|
SENSA INTERRUPT: Seismic aftershock detected ten meters north of Beta FC. Tremor intensity 9.7. Projected damage: connecting cables in Primary and Secondary Channels.|
|
FC INTERRUPT: All Robots, report locations.|
|">>

<ROUTINE SET-LAST-ROOM ("AUX" (COUNT 0))
	 <REPEAT ()
		 <SET COUNT <+ .COUNT 1>>
		 <COND (<EQUAL? .COUNT 8>
			<RETURN>)>
		 <PUT ,LAST-ROOM .COUNT <LOC <GET ,NAME-TBL <- .COUNT 1>>>>>>