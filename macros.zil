"MACROS for
			      SUSPENSION
	(c) Copyright 1982 Infocom, Inc.  All Rights Reserved.
"
<SETG C-ENABLED? 0>
<SETG C-ENABLED 1>
<SETG C-DISABLED 0>

<DEFMAC TELL ("ARGS" A)
	<FORM PROG ()
	      !<MAPF ,LIST
		     <FUNCTION ("AUX" E P O)
			  <COND (<EMPTY? .A> <MAPSTOP>)
				(<SET E <NTH .A 1>>
				 <SET A <REST .A>>)>
			  <COND (<TYPE? .E ATOM>
				 <COND (<OR <=? <SET P <SPNAME .E>>
						"CRLF">
					    <=? .P "CR">>
					<MAPRET '<CRLF>>)
				       (<=? .P "V">
					<MAPRET '<VPRINT>>)
				       (<EMPTY? .A>
					<ERROR INDICATOR-AT-END? .E>)
				       (ELSE
					<SET O <NTH .A 1>>
					<SET A <REST .A>>
					<COND (<OR <=? <SET P <SPNAME .E>>
						       "DESC">
						   <=? .P "D">
						   <=? .P "OBJ">
						   <=? .P "O">>
					       <MAPRET <FORM NDESC .O>>)
					      (<OR <=? .P "SD">
						   <=? .P "SDESC">>
					       <MAPRET <FORM PRINTD .O>>)
					      (<OR <=? .P "NUM">
						   <=? .P "N">>
					       <MAPRET <FORM PRINTN .O>>)
					      (<OR <=? .P "CHAR">
						   <=? .P "CHR">
						   <=? .P "C">>
					       <MAPRET <FORM PRINTC .O>>)
					      (ELSE
					       <MAPRET
						 <FORM PRINT
						       <FORM GETP .O .E>>>)>)>)
				(<TYPE? .E STRING>
				 <MAPRET <FORM PRINTI .E>>)
				(<TYPE? .E FORM>
				 <MAPRET <FORM PRINT .E>>)
				(ELSE <ERROR UNKNOWN-?qTYPE .E>)>>>>>

<DEFMAC VERB? ("TUPLE" ATMS "AUX" (O ()) (L ())) 
	<REPEAT ()
		<COND (<EMPTY? .ATMS>
		       <RETURN!- <COND (<LENGTH? .O 1> <NTH .O 1>)
				     (ELSE <FORM OR !.O>)>>)>
		<REPEAT ()
			<COND (<EMPTY? .ATMS> <RETURN!->)>
			<SET ATM <NTH .ATMS 1>>
			<SET L
			     (<FORM GVAL <PARSE <STRING "V?" <SPNAME .ATM>>>>
			      !.L)>
			<SET ATMS <REST .ATMS>>
			<COND (<==? <LENGTH .L> 3> <RETURN!->)>>
		<SET O (<FORM EQUAL? ',PRSA !.L> !.O)>
		<SET L ()>>>

<DEFMAC RFATAL ()
	'<PROG () <PUSH 2> <RSTACK>>>

<DEFMAC PROB ('BASE?)
	<FORM G? .BASE? '<RANDOM 100>>>

<ROUTINE NDESC (OBJ "AUX" S TEMPROFF)
	 <SET TEMPROFF ,ROFF>
	 <COND (<EQUAL? ,ROFF 0>
		<SETG ROFF 6>)>
	 <COND (<SET S <GET <GETP .OBJ ,P?OBJDESCS> <+ ,ROFF ,SDOFF>>>
		<PRINT .S>)
	       (T <PRINTD .OBJ>)>
	 <SETG ROFF .TEMPROFF>>

<ROUTINE VPRINT ("AUX" TMP)
	 <SET TMP <GET ,P-OTBL ,P-VERBN>>
	 <COND (<==? .TMP 0> <TELL "tell">)
	       (<0? <GETB ,P-VTBL 2>>
		<PRINTB <GET .TMP 0>>)
	       (T
		<WORD-PRINT <GETB .TMP 2> <GETB .TMP 3>>)>>

<ROUTINE ZPROB (BASE)
	 <G? .BASE <RANDOM 100>>>

<ROUTINE PICK-ONE (FROB)
	 <GET .FROB <RANDOM <GET .FROB 0>>>>

<DEFMAC ENABLE ('INT) <FORM PUT .INT ,C-ENABLED? 1>>

<DEFMAC DISABLE ('INT) <FORM PUT .INT ,C-ENABLED? 0>>

<DEFMAC OPENABLE? ('OBJ)
	<FORM OR <FORM FSET? .OBJ ',DOORBIT>
	         <FORM FSET? .OBJ ',CONTBIT>>> 

<DEFMAC ABS ('NUM)
	<FORM COND (<FORM L? .NUM 0> <FORM - 0 .NUM>)
	           (T .NUM)>>


<DEFMAC IRIS? ()
	'<EQUAL? ,WINNER ,IRIS>>
<DEFMAC WALDO? ()
	'<EQUAL? ,WINNER ,WALDO>>
<DEFMAC SENSA? ()
	'<EQUAL? ,WINNER ,SENSA>>
<DEFMAC AUDA? ()
	'<EQUAL? ,WINNER ,AUDA>>
<DEFMAC POET? ()
	'<EQUAL? ,WINNER ,POET>>
<DEFMAC WHIZ? ()
	'<EQUAL? ,WINNER ,WHIZ>>

