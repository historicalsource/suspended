"SETUP for
			      SUSPENDED
	(c) Copyright 1982 Infocom, Inc.  All Rights Reserved.
"

;"Routine for doing SETUP"

<ROUTINE V-CONFIGURE ("AUX" (COUNT 0) RBT RM)
	 <COND (<G? ,MOVES 1>
		<TELL
"You may only configure the game on the first move.  Consult the
manual for details." CR>
		<RFALSE>)>
	 <SETG SETUP-MODE T>
	 <TELL
"Pick your poison.|
Specify the name of a location for each of the following robots or DEAD if you
would like to have the robot start out non-functional." CR>
	 <REPEAT ()
		 <COND (<G? <SET COUNT <+ .COUNT 1>> 6>
			<RETURN>)
		       (T
			<SET RBT <GET ,NAME-TBL <- .COUNT 1>>>
			<REPEAT ()
				<TELL <GET ,ROBOT-NAMES .COUNT> " ">
				<COND (<PARSER>
				       <SET RM <GET ,P-TABLE 1>>
				       <COND 
					     (<EQUAL? .RM ,UD-TUBE>
					      <PUT ,DEADBOTS .COUNT 30>
					      <FSET .RBT ,CUTBIT>
					      <RETURN>)
					     (<IN? .RM ,ROOMS>
					      <COND (<AND <EQUAL? .RBT ,IRIS>
							  <NOT
							   <IRIS-ALLOWED?
							    .RM>>>
						     <TELL
"IRIS cannot leave the Monitor and Supply Area." CR>)
						    (<OR <EQUAL? .RM ,CAR-AREA
								 ,BIO-INT>
							 <EQUAL? .RM ,BIO-LAB
								 ,CRYOUNITS>>
						     <TELL
"No robot is allowed to start in the Biological Areas." CR>)
						    (<EQUAL? .RM ,HELL>
						     <TELL 
"Come on. Get serious." CR>)
						    (T
						     <MOVE .RBT .RM>
						     <RETURN>)>)
					     (T
					      <TELL
"Specify the name of a location or the word DEAD." CR>)>)
				      (T
				       <TELL
"Specify the name of a location or the word DEAD." CR>)>>)>>
	 <REPEAT ()
		 <TELL
"Surface-side systems tremor at which cycle? (1-100) >">
		 <COND (<READ-NUMBER 1 100>
		        <SETG RTD-KILLS ,P-NUMBER>
			<QUEUE I-TREMOR2 ,RTD-KILLS>
			<RETURN>)>>
	 <REPEAT ()
		 <TELL
"Cooling systems tremor at which cycle? (1-100) >">
		 <COND (<READ-NUMBER 1 100>
			<SETG ACID-KILLS ,P-NUMBER>
			<QUEUE I-TREMOR1 ,ACID-KILLS>
			<RETURN>)>>
	 <REPEAT ()
		 <TELL
"Humans arrive at which cycle? (" N ,ACID-KILLS "-150) >">
		 <COND (<READ-NUMBER ,ACID-KILLS 150>
			<SETG PEOPLE-APPEAR ,P-NUMBER>
			<QUEUE I-PEOPLE1 ,PEOPLE-APPEAR>
			<RETURN>)>>
	 <SETG SETUP-MODE <>>
	 <TELL
"Configuration completed." CR CR>
	 <V-ALL-REPORT-LOC>
	 <DISABLE <INT I-IRIS-HINTS>>
	 <DISABLE <INT I-AUDA-HINTS>>
	 <RTRUE>>

<ROUTINE READ-NUMBER (MN MX)
	 <READ ,P-INBUF ,P-LEXV>
	 <COND (<NUMBER? ,P-LEXSTART>
		<COND (<AND <NOT <L? ,P-NUMBER .MN>>
			    <NOT <G? ,P-NUMBER .MX>>>
		       <RTRUE>)
		      (T
		       <TELL
"Enter a number between " N .MN " and " N .MX "." CR>
		       <RFALSE>)>)
	       (T
		<TELL
"Enter a number between " N .MN " and " N .MX "." CR>
		<RFALSE>)>>

<ROUTINE IRIS-ALLOWED? (RM)
	 <COND (<OR <EQUAL? .RM ,CPU-ROOM ,SERVO-SYSTEMS ,RTD-BANKS>
		    <EQUAL? .RM ,WEATHER-BANKS ,SUPPLIES-SOUTH ,SUPPLIES-MID>
		    <EQUAL? .RM ,SUPPLIES-NORTH>>
		<RTRUE>)
	       (T <RFALSE>)>>