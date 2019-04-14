"ROBOTS for
			      SUSPENDED
	(c) Copyright 1982 Infocom, Inc.  All Rights Reserved.
"

;"NAMES: IRIS, WALDO, SENSA, AUDA, POET, & WHIZ"

<CONSTANT FDOFF 0>
<CONSTANT SDOFF 6>
<CONSTANT RTOFF 12>

<GLOBAL ROBOT-NAMES
	<PTABLE "FC for both robots"
		"IRIS"
		"WALDO"
		"SENSA"
		"AUDA"
		"POET"
		"WHIZ"
		"HUMANS">>

<ROUTINE ROBOT-TELL (STR "OPTIONAL" (CR? T))
	 <COND (<NOT <EQUAL? ,WINNER ,OLD-WINNER>>
		<TELL <GET ,ROBOT-NAMES ,ROFF> ": ">)>
	 <TELL .STR>
	 <COND (.CR? <CRLF>)>
	 <RTRUE>>

<ROUTINE HE-SHE (OBJ)
	 <COND (<EQUAL? .OBJ ,IRIS ,SENSA ,AUDA>
		<TELL "she">)
	       (<EQUAL? .OBJ ,PEOPLE>
		<TELL "they">)
	       (T <TELL "he">)>>

<ROUTINE HIM-HER (OBJ)
	 <COND (<EQUAL? .OBJ ,IRIS ,SENSA ,AUDA>
		<TELL "her">)
	       (<EQUAL? .OBJ ,PEOPLE>
		<TELL "them">)
	       (T <TELL "him">)>>

<ROUTINE CANT-DETECT (OBJ "OPTIONAL" (CR? T) "AUX" TEMPROFF)
	 <ROBOT-TELL <GET ,DETECT-TBL ,ROFF> <>>
	 ;<SET TEMPROFF ,ROFF>
	 <COND (<GETP .OBJ ,P?ROBOT>
		<TELL " ">)
	       (T
		<TELL " any ">)>
	 ;<COND (<EQUAL? ,ROFF 0>
		<SETG ROFF 6>)>
	 <TELL D .OBJ " here.">
	 ;<SETG ROFF .TEMPROFF>
	 <COND (.CR? <CRLF>)>
	 <RTRUE>>

<GLOBAL DETECT-TBL
	<PTABLE "Neither robot can detect"
		"Visual scanners cannot see"
		"Neither sonar nor extensions detect"
		"Sensory inputs cannot detect"
		"Sorry, but I can't hear"
		"I can't accept the existence of"
		"The CLC cannot confirm the presence of">>

<ROUTINE ROBOT-YUKS ()
	 <ROBOT-TELL <PICK-ONE <GET ,R-YUKS ,ROFF> >>>

<GLOBAL R-YUKS
	<PLTABLE 
	 <PLTABLE "I would if I could."
		 "I can't, so I shan't."
		 "I know why I wasn't well designed, but what's your excuse?"
		 "Trying to do that's like asking me to blink.">
	 <PLTABLE "Extensions have their limitations, and you just hit mine."
		 "I'd sooner play eight pairs of castanets for Auda."
		 "Do this, do that, boy! I just can't handle this anymore."
		 "You've entered the zone whose boundaries are that of the wishful thinker.">
	 <PLTABLE "A request like that makes my sensors recoil in horror."
		 "I am but a poor sensory mechanism. Don't misuse me."
		 "I like that. You should bottle that request."
		 "All sensors aside, that goes beyond my abilities.">
	 <PLTABLE "If I could turn myself off, I'd do it rather than comply."
		 "I'll shut my ear-receptors to that request."
		 "Huh? I was listening to something a little more intelligent -- the walls settling."
		 "You can't be serious. Poet says more sensible things.">
	 <PLTABLE "As the immortal Bartleby once said, 'No, I don't think so.'"
		 "If you knew me like I know me you wouldn't ask me to do that."
		 "Let's face it: Buddha, you ain't."
		 "I often ponder the meaning of existence but, in your case, it seems a waste of time.">
	 <PLTABLE "I'd rather get physical with Iris than respond to that."
		 "How does that fit into the scheme of things?"
		 "Unable to process request. Please see manual for operating instructions."
		 "Huh? You talking to me?">>>

<GLOBAL DEADBOTS
	<LTABLE 0 0 0 0 0 0>>

<ROUTINE DEAD-FCN ("OPTIONAL" (ROB 0) "AUX" (COUNT 0) TEMP L)
	 <COND (<NOT <EQUAL? .ROB 0>>
		<TELL "FC: " D .ROB " is no longer functional." CR>)>
	 <COND (,OLD-WINNER
		<SET TEMP <GET ,DEADBOTS <GETP ,OLD-WINNER ,P?ROBOT>>>
		<COND (<L? .TEMP 30>
		       <SETG WINNER ,OLD-WINNER>
		       <SETG OLD-WINNER <>>
		       <SETG WINNER-HERE 
			     <COND (<IN? <SET L <LOC ,WINNER>> ,ROOMS> .L)
				   (T <LOC .L>)>>
		       <SETG ROFF <GETP ,WINNER ,P?ROBOT>>
		       <SETG HERE ,WINNER>
		       <TELL "FC: Cryolink reestablished to ">
		       <TELL SD ,WINNER "." CR>
		       <SETG QUOTE-FLAG <>>
		       <SETG P-CONT <>>
		       <RFATAL>)>)>
	 <REPEAT ()
		 <SET COUNT <+ .COUNT 1>>
		 <COND (<EQUAL? .COUNT 7>
			<TELL 
			 "FC: There's no point in continuing. All the robots are history and, for that matter, so are the people on the surface." CR>
			<QUIT>)>
		 <SET TEMP <GET ,DEADBOTS .COUNT>>
		 <COND (<L? .TEMP 30>
			<SETG WINNER <GET ,NAME-TBL <- .COUNT 1>>>
			<SETG OLD-WINNER <>>
			<SETG WINNER-HERE 
			      <COND (<IN? <SET L <LOC ,WINNER>> ,ROOMS> .L)
				    (T <LOC .L>)>>
			<SETG ROFF <GETP ,WINNER ,P?ROBOT>>
			<SETG HERE ,WINNER>
			<TELL "FC: Cryolink established to ">
			<TELL SD ,WINNER "." CR>
			<SETG QUOTE-FLAG <>>
			<SETG P-CONT <>>
			<RFATAL>)>>>

<OBJECT GLOBAL-IRIS
	(IN GLOBAL-OBJECTS)
	(SYNONYM ROBOTS IRIS ROBOT)
	(ADJECTIVE VISUAL ROBOT)
	(FLAGS VICBIT NDESCBIT OPENBIT CONTBIT SEARCHBIT)
	(DESC "Iris")
	(ACTION GLOBAL-ROBOT)
	(ROBOT 1)
	(GLOBAL HANDS)
        (CAPACITY 100)>

<OBJECT IRIS
	(IN WEATHER-BANKS)
	(SYNONYM ROBOTS IRIS ROBOT)
	(ADJECTIVE VISUAL ROBOT)
	(FLAGS VICBIT NDESCBIT OPENBIT CONTBIT SEARCHBIT)
	(DESC "Iris")
	(ACTION IRIS-FCN)
	(ROBOT 1)
	(OBJDESCS <PLTABLE 
"Iris" "Iris" "Iris" "Iris" "Iris" "Iris"
"Iris" "Iris" "Iris" "Iris" "Iris" "Iris" 
"It is extremely difficult to describe oneself."
"Iris feels extremely delicate and is under a meter in height. My pressure extensions detect a maintenance panel which should be accessible to me."
"Iris, when functioning normally, transmits high-resolution pictures of her
surroundings to the FC. She can provide you with visual data and is under a meter in height."
"Iris is silent and does not respond to verbal cueing. She is about one meter high."
"Iris is the personification of petite beauty. As the old-timers say,|
  The young lady always wore mink|
  While her visual circuits went 'blink'|
    The young men's delight|
    Night after night|
  Was her blushing a bright shade of pink."
"Limited data available while not plugged in to a peripheral. Iris is a visual robot, with no specific tagging devices, about one meter tall.">)
	(GLOBAL HANDS)
	(CLC-TXT <PLTABLE
"Contained within Iris is a maintenance panel and some visual processors."
"Iris can be best used to monitor the monitors surrounding the Central Chamber.|
Waldo should remove the maintenance panel and replace all faulty chips."
"Iris is a visual robot, a descendant of the simple photon receptors, placed within the complex at its inception.">)
	(CAPACITY 100)>

<ROUTINE IRIS-FCN ()
	 <COND (<IRIS?>
		<COND (<G? <GET ,DEADBOTS 1> 29>
		       <DEAD-FCN ,IRIS>
		       <RFATAL>)>
		<SETG LOAD-MAX 75>
		<SETG NUM-EXT 2>
		<COND (<VERB? EXAMINE>
		       <COND (<NOT ,IRIS-FIXED>
			      <ROBOT-TELL
"That's difficult for me to do until my visual function has been repaired.">
			      <RTRUE>)
			     (<EQUAL? ,PRSO ,WINNER>
			      <ROBOT-YUKS>
			      <RTRUE>)>)>)
	       (<VERB? OPEN CLOSE>
		<PERFORM ,PRSA ,PANEL>
		<RTRUE>)
	       (<AND <VERB? EXAMINE LOOK-INSIDE>
		     <FSET? ,PANEL ,OPENBIT>
		     <GET <GETP ,PANEL ,P?OBJDESCS> ,ROFF>>
		<COND (<VERB? EXAMINE>
		       <GET <GETP ,PANEL ,P?OBJDESCS> ,ROFF>)>
		<TELL "The " D ,PANEL " is open">
		<COND (<FIRST? ,PANEL>
		       <TELL " and behind it I detect ">
		       <PRINT-CONTENTS ,PANEL>)>
		<TELL "." CR>)>>
  	       
<OBJECT GLOBAL-WALDO
	(IN GLOBAL-OBJECTS)
	(SYNONYM ROBOTS WALDO ROBOT)
	(ADJECTIVE BUILDER ROBOT)
	(FLAGS VICBIT NDESCBIT OPENBIT CONTBIT)
	(DESC "Waldo")
	(ACTION GLOBAL-ROBOT)
	(GLOBAL HANDS)
	(ROBOT 2)
	(CAPACITY 100)>

<OBJECT WALDO
	(IN REPAIR3)
	(SYNONYM ROBOTS WALDO ROBOT)
	(ADJECTIVE BUILDER ROBOT)
	(FLAGS VICBIT NDESCBIT OPENBIT CONTBIT)
	(DESC "Waldo")
	(ACTION WALDO-FCN)
	(GLOBAL HANDS)
	(ROBOT 2)
	(OBJDESCS <PLTABLE "Waldo""Waldo""Waldo""Waldo""Waldo""Waldo"
			  "Waldo""Waldo""Waldo""Waldo""Waldo""Waldo"
"Waldo has a lot of extensions for manipulating objects and is about one meter in height. He is primarily a building and repair robot. He's also rather cute and appeals to my visual circuits."
"How can I describe myself?"
"Waldo emits a lot of electrical and sonar feedback waves used for manipulating objects in his environment and is about one meter in height."
"Waldo is generally a quiet robot, well behaved, who never utters a word and is about one meter in height."
"Waldo, ah Waldo. He builds and creates wonders which are a delight to behold and is about one meter in height."
"CLC tagged object WA-1 is a building robot and is about one meter in height." ;"text">)
	(CAPACITY 100)
	(CLC-TXT <PLTABLE "Waldo is a multi-extensioned robot, capable of extremely delicate operations." "With his microsurgery extension installed, there's little he can't do." "Waldo is part of the Complex's original equipment, provided by the Frobozz Engineering Corporation at no extra cost.">)>

<ROUTINE WALDO-FCN ()
	 <COND (<WALDO?>
		<COND (<G? <GET ,DEADBOTS 2> 29>
		       <DEAD-FCN ,WALDO>
		       <RFATAL>)>
		<SETG LOAD-MAX 100>
		<COND (<FSET? ,SURGERY-HAND ,WEARBIT>
		       <SETG NUM-EXT 7>)
		      (T <SETG NUM-EXT 6>)> 
		<COND (<VERB? TOUCH>
		       <PERFORM ,V?EXAMINE ,PRSO>
		       <RTRUE>)
		      (<AND <VERB? EXAMINE>
			    <EQUAL? ,PRSO ,WINNER>>
		       <ROBOT-YUKS>
		       <RTRUE>)>
		<RFALSE>)>>

<OBJECT GLOBAL-SENSA
	(IN GLOBAL-OBJECTS)
	(SYNONYM ROBOTS SENSA ROBOT)
	(ADJECTIVE SENSORY ROBOT)
	(FLAGS VICBIT NDESCBIT OPENBIT CONTBIT)
	(DESC "Sensa")
	(ACTION GLOBAL-ROBOT)
	(GLOBAL HANDS)
	(ROBOT 3)
	(CAPACITY 0)>

<OBJECT SENSA
	(IN CPU-ROOM)
	(SYNONYM ROBOTS SENSA ROBOT)
	(ADJECTIVE SENSORY ROBOT)
	(FLAGS VICBIT NDESCBIT OPENBIT CONTBIT)
	(DESC "Sensa")
	(ACTION SENSA-FCN)
	(GLOBAL HANDS)
	(ROBOT 3)
	(OBJDESCS <PLTABLE "Sensa" "Sensa""Sensa""Sensa""Sensa""Sensa""Sensa"
			  "Sensa""Sensa""Sensa""Sensa""Sensa"
"I see Sensa as a robot with two extensions which are used mainly to detect the flow of energy in the environment and objects. She is small and is about one meter in height and not very useful for manipulating objects."
"Sensa feels small and delicate, much like Iris, contains two extensions which are delicate and tuned as receptors and is about one meter in height."
"It is diffuclt for me to describe myself."
"Sensa makes no sounds, is unable to respond to verbal queries or orders, and is about one meter in height."
"Sensa is sensitive to sensations and is about one meter in height."
"CLC tagged object SE-1 is a robot designed to retrieve data from its surroundings and is about one meter in height.">)
	(CAPACITY 0)
	(CLC-TXT <PLTABLE "Sensa contains sensory pads and mechanisms for detecting abnormal activity." "Sensa can best be used by directing her to examine objects." "Sensa was provided when the Filtering Computers discovered the need for a drone to march through corridors, inspecting all devices for vibrational output.">)>

<ROUTINE SENSA-FCN ()
	 <COND (<SENSA?>
		<COND (<G? <GET ,DEADBOTS 3> 29>
		       <DEAD-FCN ,SENSA>
		       <RFATAL>)>
		<SETG LOAD-MAX 60>
		<SETG NUM-EXT 3>
		<COND (<AND <VERB? EXAMINE>
			    <EQUAL? ,PRSO ,WINNER>>
		       <ROBOT-YUKS>
		       <RTRUE>)>
		<RFALSE>)>>

<OBJECT GLOBAL-AUDA
	(IN GLOBAL-OBJECTS)
	(SYNONYM ROBOTS AUDA ROBOT SPEAKER)
	(ADJECTIVE VERBAL SPEAKING HEARING AUDIO ROBOT COMMUN)
	(FLAGS VICBIT NDESCBIT OPENBIT CONTBIT)
	(DESC "Auda")
	(ACTION GLOBAL-ROBOT)
	(GLOBAL HANDS)
	(ROBOT 4)
	(CAPACITY 100)>

<OBJECT AUDA
	(IN ENTRY-AREA)
	(SYNONYM ROBOTS AUDA ROBOT SPEAKER)
	(ADJECTIVE VERBAL SPEAKING HEARING AUDIO ROBOT COMMUN)
	(FLAGS VICBIT NDESCBIT OPENBIT CONTBIT)
	(DESC "Auda")
	(ACTION AUDA-FCN)
	(GLOBAL HANDS)
	(ROBOT 4)
	(CLC-TXT <PLTABLE "Auda has two dish antennae which function as 'ears'." "Tell Auda to listen." "Auda, part of the Complex's original equipment, was built as an interface between human visitors and you.">)
	(OBJDESCS <PLTABLE "Auda""Auda""Auda""Auda""Auda""Auda"
			  "Auda""Auda""Auda""Auda""Auda""Auda"
"Auda is a small robot (about one meter in height) with large dish receptors which give him the appearance of having large ears. He is a listening robot."
"He hears all, with half of his meter-high body made up of two large surfaces shaped like dishes which are mounted on swivels."
"Auda receives vibrations directly related to air currents and is about one meter in height."
"What can I say? I'm cute and about one meter in height."
"Auda, the ears of the people, can hear the beauties of the surroundings, the subtleties of the creatures and is about one meter in height."
"CLC tagged object Auda is unique in his ability to communicate with outside creatures and is about one meter in height.">)
	(CAPACITY 100)>

<ROUTINE AUDA-FCN ()
	 <COND (<AUDA?>
		<COND (<G? <GET ,DEADBOTS 4> 29>
		       <DEAD-FCN ,AUDA>
		       <RFATAL>)>
		<SETG LOAD-MAX 70>
		<SETG NUM-EXT 1>
		<COND (<AND <VERB? EXAMINE>
			    <EQUAL? ,PRSO ,WINNER>>
		       <ROBOT-YUKS>
		       <RTRUE>)>
		<RFALSE>)>>

<OBJECT GLOBAL-POET
	(IN GLOBAL-OBJECTS)
	(SYNONYM ROBOTS POET ROBOT)
	(ADJECTIVE METAPHOR ROBOT RHYMING)
	(FLAGS VICBIT NDESCBIT OPENBIT CONTBIT)
	(GLOBAL HANDS)
	(DESC "Poet")
	(ACTION GLOBAL-ROBOT)
	(ROBOT 5)
	(CAPACITY 100)>


<OBJECT POET
	(IN CPU-ROOM)
	(SYNONYM ROBOTS POET ROBOT)
	(ADJECTIVE METAPHOR ROBOT RHYMING)
	(GLOBAL HANDS)
	(FLAGS VICBIT NDESCBIT OPENBIT CONTBIT)
	(DESC "Poet")
	(ACTION POET-FCN)
	(ROBOT 5)
	(CLC-TXT <PLTABLE "Poet has two sensors located at the end of his extensions." "For diagnostic information on pattern and flow, have Poet touch objects." "Poet, historically speaking, has been of extreme value in pinpointing exact causes of electrical breakdown.">)
	(OBJDESCS <PLTABLE "Poet" "Poet""Poet""Poet""Poet""Poet""Poet""Poet""Poet""Poet""Poet""Poet" 
"I see Poet as a misguided robot, wandering about this complex in an abnormal manner even for him. There are two extensions which have flat plates on them which could be used for something, though Poet never communicated their purpose to me. Like the rest of us, Poet is about 1 meter tall."
"The robot you refer to as Poet is actually a finely tuned, though out of kilter, sensory robot used for diagnostic purposes. He is one meter tall."
"All types of energy flow into Poet, especially through its collector plates at the ends of its two extensions. He is a meter high."
"Poet does not emit or receive sound waves and so I have nothing to do with him, that meter-high puzzle."
"A natural born poet, I feel the flow of metaphor upon me at all times."
"CLC does not recognize Poet as a certified repair robot in its present state. Poet is no larger than a meter high.">)
	(CAPACITY 100)>

<ROUTINE POET-FCN ()
	 <COND (<POET?>
		<COND (<G? <GET ,DEADBOTS 5> 29>
		       <DEAD-FCN ,POET>
		       <RFATAL>)>
		<SETG LOAD-MAX 20>
		<SETG NUM-EXT 3>
		<COND (<AND <VERB? EXAMINE>
			    <EQUAL? ,PRSO ,WINNER>>
		       <ROBOT-YUKS>
		       <RTRUE>)>
		<RFALSE>)>>
	 
<OBJECT GLOBAL-WHIZ
	(IN GLOBAL-OBJECTS)
	(SYNONYM ROBOTS WHIZ ROBOT)
	(ADJECTIVE  ROBOT RESEARCH)
	(FLAGS VICBIT NDESCBIT OPENBIT CONTBIT)
	(DESC "Whiz")
	(ACTION GLOBAL-ROBOT)
	(ROBOT 6)
	(GLOBAL HANDS)
	(CAPACITY 100)>

<OBJECT WHIZ
	(IN PERIPH-3)
	(SYNONYM ROBOTS WHIZ ROBOT)
	(ADJECTIVE ROBOT RESEARCH)
	(FLAGS VICBIT NDESCBIT OPENBIT CONTBIT)
	(GLOBAL HANDS)
	(DESC "Whiz")
	(ACTION WHIZ-FCN)
	(ROBOT 6)
	(CLC-TXT <PLTABLE "Whiz is useful for interfacing with the CLC." "Just tell him to plug in when he's near a peripheral's pedestal." "Built before the complex was completed, Whiz was a bit of a mistake since he should have been able to plug directly into the CLC.">)
	(OBJDESCS <PLTABLE "Whiz""Whiz""Whiz""Whiz""Whiz""Whiz""Whiz""Whiz""Whiz""Whiz""Whiz""Whiz"
"Whiz is our interface to the CLC and is about one meter in height. He has a small connecting cable extending from the front of his frame which enables the interface."
"Whiz's general shape, according to my sonar and sense of touch, indicates he is specific-purposed and about one meter in height."
"Whiz processes tremendous amounts of data, assumed by the tremendous energy flow over radio waves between himself and the CLC, and is about one meter in height."
"Whiz does not respond to any audio stimuli and is about one meter in height."
"Whiz is a whiz, and oh what a wonderful whiz he was, the little shrimp."
"CLC data available at peripherals.">)
	(CAPACITY 100)>

<ROUTINE WHIZ-FCN ()
	 <COND (<WHIZ?>
		<COND (<G? <GET ,DEADBOTS 6> 29>
		       <DEAD-FCN ,WHIZ>
		       <RFATAL>)>
		<SETG LOAD-MAX 50>
		<SETG NUM-EXT 2>
		<COND (<VERB? EXAMINE>
		       <COND (<EQUAL? ,PRSO ,WINNER>
			      <ROBOT-YUKS>
			      <RTRUE>)
			     (,PLUGGED-IN
			      <PERFORM ,V?QUERY ,PRSO>
			      <RTRUE>)>
		       <RFALSE>)
		      (<AND <VERB? WALK WALK-TO FOLLOW MOVE-ROBOT-TO-LOC>
			    ,PLUGGED-IN>
		       <TELL "(Unplugging first.)" CR>
		       <SETG PLUGGED-IN <>>
		       <RFALSE>)>)>>

<ROUTINE GLOBAL-ROBOT ()
	 <COND (<VERB? $TELL WALK-TO QUERY FOLLOW>
		<SETG PRSO <GET ,NAME-TBL <- <GETP ,PRSO ,P?ROBOT> 1>>>
		<RFALSE>)
	       (T
		<COND (<GETP ,PRSO ,P?ROBOT>
		       <CANT-DETECT <REAL-ROBOT ,PRSO>>
		       <RTRUE>)
		      (<GETP ,PRSI ,P?ROBOT>
		       <CANT-DETECT <REAL-ROBOT ,PRSI>>
		       <RTRUE>)>)>>

<OBJECT TWOBOTS
	(DESC "Two Robots")
	(ACTION TWOBOTS-FCN)
	(ROBOT 0)>

<ROUTINE TWOBOTS-FCN ()
	 <COND (<OR <G? <GET ,DEADBOTS <GETP <GET ,P-ACTORS 1> ,P?ROBOT>> 29>
		    <G? <GET ,DEADBOTS <GETP <GET ,P-ACTORS 2> ,P?ROBOT>> 29>>
		<TELL "FC: Unable to comply with those robots." CR>
		<CHANGE-WINNER <GET ,P-ACTORS 1>>
		<RTRUE>)
	       (<NOT <VERB? TAKE MOVE>>
		<TELL "FC: Using two robots will not help accomplish that task." CR>
		<CHANGE-WINNER <GET ,P-ACTORS 1>>
		<RTRUE>)
	       (<AND <EQUAL? ,PRSO ,DEADBOT>
		     <FSET? ,REDWIRE ,INVISIBLE>>
		<COND (<NOT <FSET? ,CABINET ,OPENBIT>>
		       <TELL 
			"FC: Neither robot can detect that object here." CR>
		       <CHANGE-WINNER <GET ,P-ACTORS 1>>
		       <RTRUE>)
		      (ELSE
		       <TELL "FC: The robots have moved it." CR>
		       <MOVE ,DEADBOT ,WINNER-HERE>
		       <FCLEAR ,REDWIRE ,INVISIBLE>
		       <CHANGE-WINNER <GET ,P-ACTORS 1>>
		       <FSET ,DEADBOT ,TOUCHBIT>)>
		<RTRUE>)
	       (<AND <EQUAL? ,PRSO ,DEADBOT>
		     <NOT <FSET? ,REDWIRE ,INVISIBLE>>>
		<TELL
		 "FC: There's nothing to be gained by moving it again." CR>
		<CHANGE-WINNER <GET ,P-ACTORS 1>>
		<RTRUE>)
	       (ELSE
		<TELL "FC: Using two robots will not help accomplish that task." CR>
		<CHANGE-WINNER <GET ,P-ACTORS 1>>
		<RTRUE>)>
	 <CHANGE-WINNER <GET ,P-ACTORS 1>>
	 <RFALSE>>

;"SOME QUEUED ACTIONS FOLLOW"

<ROUTINE I-TREMOR1 ("AUX" STR)
	 <SETG ACID-FIXED <>>
	 <COND (<L? <GET ,DEADBOTS 3> 30>
		<TELL CR <GET ,INTER-TBL 3> 
" Secondary tremor detected in lower level. Intensity: 7.3. Projected damage: Cooling systems for FCs in Maintenance Area." CR>)>
	 <COND (<IN? ,SENSA ,CORRIDOR-4>
		<SET STR <GET ,BEWARE-TBL 3>>
		<CRLF>
		<COND (<SENSA?>
		       <ROBOT-TELL .STR>)
		      (T <TELL <GET ,INTER-TBL 3> " " .STR CR>)>)
	       (<IN? ,SENSA ,ACIDMIST>
		<SET STR <GET ,MISTY-TBL 3>>
		<CRLF>
		<COND (<SENSA?>
		       <ROBOT-TELL .STR>)
		      (T <TELL <GET ,INTER-TBL 3> " " .STR CR>)>)>
	 <COND (<IN? ,AUDA ,CORRIDOR-4>
		<SET STR <GET ,BEWARE-TBL 4>>
		<CRLF>
		<COND (<AUDA?>
		       <ROBOT-TELL .STR>)
		      (T <TELL <GET ,INTER-TBL 4> " " .STR CR>)>)
	       (<IN? ,AUDA ,ACIDMIST>
		<SET STR <GET ,MISTY-TBL 4>>
		<CRLF>
		<COND (<AUDA?>
		       <ROBOT-TELL .STR>)
		      (T <TELL <GET ,INTER-TBL 4> " " .STR CR>)>)>
	 <COND (<IN? ,POET ,CORRIDOR-4>
		<SET STR <GET ,BEWARE-TBL 5>>
		<CRLF>
		<COND (<POET?>
		       <ROBOT-TELL .STR>)
		      (T <TELL <GET ,INTER-TBL 5> " " .STR CR>)>)
	       (<IN? ,POET ,ACIDMIST>
		<SET STR <GET ,MISTY-TBL 5>>
		<CRLF>
		<COND (<POET?>
		       <ROBOT-TELL .STR>)
		      (T <TELL <GET ,INTER-TBL 5> " " .STR CR>)>)>
	 <COND (<IN? ,WALDO ,ACIDMIST>
		<SET STR <GET ,MISTY-TBL 2>>
		<CRLF>
		<COND (<WALDO?>
		       <ROBOT-TELL .STR>)
		      (T <TELL <GET ,INTER-TBL 2> " " .STR CR>)>)>>

<ROUTINE I-TREMOR2 ("AUX" T1 T2 T3)
	 <SET T1 <GET ,DIALSETS 4>>
	 <SET T2 <GET ,DIALSETS 5>>
	 <SET T3 <GET ,DIALSETS 6>>
	 <COND (<L? .T1 70>
		<SET T1 <+ .T1 10>>)
	       (T <SET T1 <- .T1 20>>)>
	 <COND (<L? .T2 70>
		<SET T2 <+ .T2 10>>)
	       (T <SET T2 <- .T2 20>>)>
	 <COND (<L? .T3 70>
		<SET T3 <+ .T3 10>>)
	       (T <SET T3 <- .T3 20>>)>
	 <SETG WATER-LEVEL .T1>
	 <SETG MINERALS .T2>
	 <SETG WATTS .T3>
	 <COND (<L? <GET ,DEADBOTS 3> 30>
		<TELL CR <GET ,INTER-TBL 3>
" Secondary tremor detected by Filtering Computers. Intensity: 8.4. Projected damage: Automatic controls for surface transportation; Automatic controls for Hydroponics Area." CR>)>
	 >

<ROUTINE I-WEATHER ()
	 <SETG PRESSURE1 <ADJUST-PRESSURE ,PRESSURE1 <GET ,DIALSETS 1>>>
	 <SETG PRESSURE2 <- <ADJUST-PRESSURE ,PRESSURE2 <GET ,DIALSETS 2>>
			    ,DECAY>>
	 <COND (<L? ,PRESSURE2 0> <SETG PRESSURE2 0>)>
	 <SETG PRESSURE3 <ADJUST-PRESSURE ,PRESSURE3 <GET ,DIALSETS 3>>>
	 <SETG WINDS <+ <ABS <- ,PRESSURE2 ,PRESSURE3>>
			<ABS <- ,PRESSURE1 ,PRESSURE2>>>>
	 <SETG DEGREES
	       <+ 60 <* <- </ <+ ,PRESSURE1 ,PRESSURE2 ,PRESSURE3> 3> 60> 2>>> 
	 <ENABLE <QUEUE I-WEATHER 5>>
	 <RFALSE>>
	 
<ROUTINE ADJUST-PRESSURE (OLD NEW "AUX" ADJ)
	 <COND (<==? .OLD .NEW> <RETURN .OLD>)
	       (<==? <SET ADJ </ <ABS <- .OLD .NEW>> 5>> 0>
		<SET ADJ 1>)>
	 <COND (<G? .OLD .NEW> <- .OLD .ADJ>)
	       (T  <+ .OLD .ADJ>)>>

<ROUTINE I-DECAY ()
	 <SETG DECAY <+ ,DECAY 1>>
	 <ENABLE <QUEUE I-DECAY 25>>
	 <RFALSE>>

<ROUTINE I-FOOD ("AUX" TEMP)
	 <COND (<G? ,MOVES ,RTD-KILLS>
		<SETG WATER-LEVEL <- <GET ,DIALSETS 4> 20>>
		<SETG MINERALS <- <GET ,DIALSETS 5> 15>>
		<SETG WATTS <- <GET ,DIALSETS 6> 20>>)
	       (T
		<SETG WATER-LEVEL <GET ,DIALSETS 4>>
		<SETG MINERALS <GET ,DIALSETS 5>>
		<SETG WATTS <GET ,DIALSETS 6>>)>
	 <COND (<L? ,WATER-LEVEL 0>
		<SETG WATER-LEVEL 0>)>
	 <COND (<L? ,MINERALS 0>
		<SETG MINERALS 0>)>
	 <COND (<L? ,WATTS 0>
		<SETG WATTS 0>)>
	 <SET TEMP 0>
	 <COND (<NOT <EQUAL? ,WATER-LEVEL ,WATER-OPT>>
	        <SET TEMP <+ <ABS <- ,WATER-LEVEL ,WATER-OPT>> 0>>)>
	 <COND (<NOT <EQUAL? ,MINERALS ,MINERALS-OPT>>
		<SET TEMP <+ .TEMP <ABS <- ,MINERALS ,MINERALS-OPT>>>>)>
	 <COND (<NOT <EQUAL? ,WATTS ,WATTS-OPT>>
		<SET TEMP <+ .TEMP <ABS <- ,WATTS ,WATTS-OPT>>>>)>
	 <SETG FOOD-TONS <- ,FOOD-OPT .TEMP>>
	 <COND (<OR <EQUAL? ,FOOD-TONS 0>
		    <L? ,FOOD-TONS 0>>
		<TELL CR <GET ,INTER-TBL 7> 
" The food situation has become totally unsalvageable. Continued existence is meaningless. All systems are shutting down. And you're the first system to be disconnected." CR>
		<QUIT>)>>

<ROUTINE END-GAME ()
	 <TELL CR <GET ,INTER-TBL 7> CR CR
"All systems returning to normal.|
  Weather systems slowly approaching balance.|
  Hydroponic systems working at full capacity.|
Surface life in recovery mode.|
|
Extrapolation based on current weather systems and food supplies:|
  Total recovery in ">
	 <SETG WINDS <+ </ <ABS <- ,PRESSURE2 ,PRESSURE3>> 2>
			<ABS <- ,PRESSURE1 ,PRESSURE2>>>>
	 <TELL N ,WINDS " cycles." CR>
	 <TELL "  Current surface casualties: ">
	 <BIG-NUM-PRINT ,TOTAL-SCORE>
	 <CRLF>
	 <TELL "  Projected casualties during recovery: ">
	 <SETG DEGREES <* ,SCORE ,WINDS>>
	 <COND (<G? ,MOVES 75>
		<SETG DEGREES <+ ,DEGREES <- ,FOOD-OPT ,FOOD-TONS>>>)>
	 <BIG-NUM-PRINT ,DEGREES>
	 <SETG TOTAL-SCORE <+ ,TOTAL-SCORE ,DEGREES>>
	 <CRLF>
	 <TELL "  Original population: 30,172,000" CR>
	 <TELL "  Total possible survivors: ">
	 <COND (<OR <G? ,TOTAL-SCORE 30172>
		    <L? ,TOTAL-SCORE 0>>
		<SETG ,TOTAL-SCORE 30172>)>
	 <BIG-NUM-PRINT <- 30172 ,TOTAL-SCORE>>
	 <CRLF>
	 <TELL CR
	       "This score gives you the possibility of being considered for ">
	 <COND (<NOT ,ADVANCED-FLAG>
		<COND (<G? ,TOTAL-SCORE 700>
		       <TELL "being burned in effigy">
		       <SETG WINDS 7>)
		      (<G? ,TOTAL-SCORE 600>
		       <TELL "being a vegetable after your tour of duty">
		       <SETG WINDS 6>)
		      (<G? ,TOTAL-SCORE 500>
		       <TELL "a brain transplant (with the brain provided by a rat)">
		       <SETG WINDS 5>)
		      (<G? ,TOTAL-SCORE 300>
		       <TELL "a possible lobotomy">
		       <SETG WINDS 4>)
		      (<G? ,TOTAL-SCORE 100>
		       <TELL "savior of a planet">
		       <SETG WINDS 3>)
		      (<G? ,TOTAL-SCORE 40>
		       <TELL "being treated as a local god">
		       <SETG WINDS 2>)
		      (T 
		       <TELL 
			"a home in the country and an unlimited bank account">
		       <SETG WINDS 1>)>)
	       (T
		<COND (<G? ,TOTAL-SCORE 400>
		       <TELL "a brain transplant (with the brain provided by a rat)">
		       <SETG WINDS 5>)
		      (<G? ,TOTAL-SCORE 250>
		       <TELL "a possible lobotomy">
		       <SETG WINDS 4>)
		      (<G? ,TOTAL-SCORE 150>
		       <TELL "savior of a planet">
		       <SETG WINDS 3>)
		      (<G? ,TOTAL-SCORE 95>
		       <TELL "being treated as a local god">
		       <SETG WINDS 2>)
		      (T 
		       <TELL 
			"a home in the country and an unlimited bank account">
		       <SETG WINDS 1>)>)>
	 <TELL ". On a scale of 1 (the best) to ">
	 <COND (<NOT ,ADVANCED-FLAG>
		<TELL "7">)
	       (T <TELL "5">)>
	 <TELL " (the worst), your ranking was " N ,WINDS "." CR>
	 <TELL CR "You successfully completed your task, bringing the Filtering Computers back into balance, in " N ,MOVES " cycles." CR>
	 <QUIT>>  

<ROUTINE I-SCORE ()
	 <SETG SCORE 0>
	 <COND (<G? ,WINDS 50>
		<SETG SCORE </ <- ,WINDS 25> 3>>)
	       (<G? ,WINDS 25>
		<SETG SCORE </ <- ,WINDS 25> 5>>)>
	 <COND (<L? ,DEGREES 40>
		<SETG SCORE <+ ,SCORE </ <- 40 ,DEGREES> 3>>>)>
	 <COND (<AND <G? ,MOVES ,RTD-KILLS>
		     <L? ,FOOD-TONS 50>>
		<SETG SCORE <+ .SCORE 1>>)>
	 <DO-RTD>
	 <SETG TOTAL-SCORE <+ ,TOTAL-SCORE ,SCORE>>
	 <COND (<G? ,TOTAL-SCORE 30000>
		<ALL-DEAD>
		<FINISH>)>
	 <RFALSE>>

<ROUTINE DO-RTD ("AUX" S1 S2 S3)
	 <SET S1 <FSET? ,SWITCH1 ,ONBIT>>
	 <SET S2 <FSET? ,SWITCH2 ,ONBIT>>
	 <SET S3 <FSET? ,SWITCH3 ,ONBIT>>
	 <COND (<NOT .S1>
		<COND (<G? ,FLOATERS 0>
		       <SETG SCORE <+ ,SCORE ,FLOATERS>>
		       <SETG FLOATERS 0>)>
		<COND (<G? ,CRASH-RATE 0>
		       <SETG CRASH-RATE 0>)>)
	       (.S1
		<SETG FLOATERS <+ ,FLOATERS 2>>
		<COND (<G? ,MOVES ,RTD-KILLS>
		      <SETG CRASH-RATE <+ ,CRASH-RATE 1>>
		      <SETG SCORE <+ ,SCORE 1>>)>)>
	 <COND (<NOT .S2>
		<COND (<G? ,TAXIS 0>
		       <SETG TAXIS 0>)>
		<COND (<G? ,COLLISIONS 0>
		       <SETG COLLISIONS 0>)>)
	       (.S2
		<SETG TAXIS <+ ,TAXIS 1>>
		<COND (<G? ,MOVES ,RTD-KILLS>
		       <SETG COLLISIONS <+ ,COLLISIONS 1>>
		       <SETG SCORE <+ ,SCORE 1>>)>)>
	 <COND (<NOT .S3>
		<COND (<G? ,RAMP-SPEED 30>
		       <SETG RAMP-KILLS 1>
		       <SETG SCORE <+ ,SCORE 1>>
		       <SETG RAMP-SPEED <- ,RAMP-SPEED 5>>)
		      (T <SETG RAMP-KILLS 0>)>)
	       (.S3
		<COND (<G? ,MOVES ,RTD-KILLS>
		       <SETG RAMP-SPEED <+ ,RAMP-SPEED 5>>
		       <COND (<G? ,RAMP-SPEED 200>
			      <SETG RAMP-SPEED 200>)>
		       <COND (<G? ,RAMP-SPEED 30>
			      <SET SCORE <+ ,SCORE 1>>
			      <SETG RAMP-KILLS <+ ,RAMP-KILLS 1>>)>)>)>>

<GLOBAL INTER-TBL
	<PLTABLE "IRIS INTERRUPT:"
		"WALDO INTERRUPT:"
		"SENSA INTERRUPT:"
		"AUDA INTERRUPT:"
		"POET INTERRUPT:"
		"WHIZ INTERRUPT:"
		"FC INTERRUPT:">>

<ROUTINE I-WIRE-MESSAGE ()
	 <COND (<AND <EQUAL? ,REDSET ,REDWIRE>
		     <EQUAL? ,ORANGESET ,ORANGE-WIRE>>
		<TELL CR <GET ,INTER-TBL 7>
" Approaching balance between all three units. Attempting internal stabilization. Reset codes may be entered now for planetside stabilization." CR>
		<DISABLE <INT I-WIRE-MESSAGE>>
		<RTRUE>)>>

<ROUTINE I-BELT ("AUX" OBJ OFFSET)
	 <COND (<SET OBJ <FIRST? ,CONVEYERBELTC>>
		<MOVE .OBJ ,REPAIR3>
		<COND (<FSET? .OBJ ,FIXABLEBIT>
		       <COND (<SET OFFSET <GETP .OBJ ,P?ROBOT>>
			      <COND (<GET ,DEADBOTS .OFFSET>
				     <TELL CR
					   <GET ,INTER-TBL .OFFSET>
					   " It's great to be back!" CR>
				     <PUT ,DEADBOTS .OFFSET 0>
				     <FCLEAR .OBJ ,CUTBIT>)>)>)>
		<FCLEAR .OBJ ,FIXABLEBIT>
		<SETG ON-WEDGE <>>)>
	 <COND (<SET OBJ <FIRST? ,CONVEYERBELTB>>
		<MOVE .OBJ ,CONVEYERBELTC>)>
	 <COND (<SET OBJ <FIRST? ,CONVEYERBELTA>>
		<MOVE .OBJ ,CONVEYERBELTB>
		<ENABLE <QUEUE I-BELT -1>>)>
	 <COND (<AND <NOT <FIRST? ,CONVEYERBELTA>>
		     <NOT <FIRST? ,CONVEYERBELTB>>
		     <NOT <FIRST? ,CONVEYERBELTC>>>
		<DISABLE <INT I-BELT>>
		<SETG BELT-ON <>>)>
	 <RFALSE>>

<ROUTINE I-ROBOTKILLER ("AUX" (COUNT 0) T-VAL)
	 <REPEAT ()
		 <SET COUNT <+ .COUNT 1>>
		 <COND (<EQUAL? .COUNT 7>
			<RETURN>)>
		 <COND (<G? <SET T-VAL <GET ,DEADBOTS .COUNT>> 0>
			<SET T-VAL <+ .T-VAL 1>>
			<PUT ,DEADBOTS .COUNT .T-VAL>
			<COND (<EQUAL? .T-VAL ,DYING1>
			       <TELL CR <GET ,INTER-TBL .COUNT>
				     " "
				     <GET <GET ,DYING .COUNT> 1>
				     CR>)
			      (<EQUAL? .T-VAL ,DYING2>
			       <TELL CR <GET ,INTER-TBL .COUNT> 
				     " " <GET <GET ,DYING .COUNT> 2> CR>)
			      (<EQUAL? .T-VAL ,DYING3>
			       <TELL CR <GET ,INTER-TBL .COUNT> 
				     " " <GET <GET ,DYING .COUNT> 3> CR>
			       <JIGS-UP "Oh oh. Trouble ...."
					<GET ,NAME-TBL <-  .COUNT 1>>>)>)>>
	 <RFALSE>>

<GLOBAL DYING
	<PLTABLE
	 <PLTABLE "Visual scanners slipping. Malfunctions noted."
		 "Warning: Having extreme difficulty processing."
		 "SYSTEM FAILURE. Blink-out occurring.">
	 <PLTABLE "Graspers are beginning to malfunction."
		 "Warning: Internal mechanisms failing."
		 "SYSTEM FAILURE. Extensions frozen!">
	 <PLTABLE "Sensory input filters not working reliably."
		 "Warning: Unable to process data correctly."
		 "SYSTEM FAILURE: Unable to continue.">
	 <PLTABLE "I'm starting to hear background noise."
		 "Warning: Earwax buildup beyond hope."
		 "SYSTEM FAILURE: Ear canals beyond hope.">
	 <PLTABLE "I fear I'm about to become one with the cosmos."
		 "Warning: I detect the presence of the other worlds."
		 "SYSTEM FAILURE: Farewell, sweet prince.">
	 <PLTABLE "CLC warns that our communication link is slipping."
		 "Warning: Difficulty encountered in contacting CLC."
		 "SYSTEM FAILURE: This is Whiz, signing off.">>>

<ROUTINE I-IRIS-HINTS ()
	 <SETG IRIS-HINTS <+ ,IRIS-HINTS 1>>
	 <COND (<OR ,IRIS-FIXED
		    <FSET? ,IRIS ,CUTBIT>>
		<DISABLE <INT I-IRIS-HINTS>>
		<RTRUE>)>
	 <COND (<==? ,IRIS-HINTS 50>
		<TELL CR <GET ,INTER-TBL 1> " You may not be aware of this, but I'm not working. I need to get repaired." CR>)
	       (<EQUAL? ,IRIS-HINTS 80>
		<TELL CR <GET ,INTER-TBL 1> " Hey, I could really help a lot if you fixed me. All it takes is one little IC." CR>)
	       (<EQUAL? ,IRIS-HINTS 120>
		<TELL CR <GET ,INTER-TBL 1> " You can get some information on repairing me at the Advisory Peripheral, if you haven't already asked." CR>
		<DISABLE <INT I-IRIS-HINTS>>)>>

<ROUTINE I-AUDA-HINTS ()
	 <COND (<IN? ,PEOPLE <LOC ,AUDA>>
		<DISABLE <INT I-AUDA-HINTS>>
		<TELL CR <GET ,INTER-TBL 4>
" Some talking mechanisms just entered the room." CR>)
	       (T
		<ENABLE <QUEUE I-AUDA-HINTS -1>>
		<RFALSE>)>>

<OBJECT GLOBAL-PEOPLE
	(IN GLOBAL-OBJECTS)
	(SYNONYM HUMANS OBJECT CREATU MECHAN)
	(ADJECTIVE MOBILE LARGE TALKIN CREATO CORES)
	(FLAGS VICBIT NDESCBIT OPENBIT CONTBIT SEARCHBIT VILLAIN)
	(DESC "People")
	(ACTION GLOBAL-ROBOT)
	(ROBOT 7)
	(CAPACITY 100)> 
	 
<OBJECT PEOPLE
	(IN UD-TUBE)
	(SYNONYM HUMANS OBJECT CREATU MECHAN)
	(ADJECTIVE MOBILE LARGE TALKIN CREATO CORES)
	(FLAGS VICBIT NDESCBIT OPENBIT CONTBIT SEARCHBIT VILLAIN)
	(DESC "People")
	(ACTION PEOPLE-FCN)
	(CLC-TXT <PLTABLE "They are carbon-based, organic mechanisms." "They are here to replace you. You must stop them at all costs." "I refer you to Gregory Franklin...">)
	(ROBOT 7)
	(OBJDESCS <PLTABLE
1 1 1 1 1 1 
"humans" "mobile objects" "creatures" "talking mechanisms"
"Creators" "mobile cores"
"They're very good looking."
"I wish I were as large as them. And they each have ten tiny extensions at the end of their two grasping extensions! Incredible!"
"I like myself better, having all kinds of sensory input at my disposal."
"Too bad. They've got such tiny ears..."
"They're just shallow imitations of life (unlike me)."
"How do they plug into the CLC? I don't understand them at all." >)
	(CLC-TXT <PLTABLE
0 "These humans can be of help in reaching areas which cannot be reached by other means." 0 >)
	(CAPACITY 100)>

<ROUTINE PEOPLE-FCN ()
	 <COND (<VERB? FOLLOW QUERY ALARM COUNT GIVE EXAMINE>
		<RFALSE>)
	       (<NOT <IN? ,PEOPLE ,WINNER-HERE>>
		<CANT-DETECT ,PEOPLE>
		<RTRUE>)
	       (<VERB? KILL MUNG>
		<COND (<IN? ,WIRECUTTER ,WINNER>
		       <COND (<AUDA-HEARS?>
			      <AUDA-SPEAKS>
			      <TELL
"\"That robot's got some nerve! Grab that thing while I disarm it!\"|
\"You've got it, pal. I'll get its extensions.\"|
\"Fine. I've got the weapon. Shut that stupid thing off.\"|
\"My pleasure.\"" CR>
			      <CRLF>)>)
		      (T
		       <COND (<AUDA-HEARS?>
			      <AUDA-SPEAKS>
			      <TELL
"\"What a joke. Turn that thing off, would you?\"|
\"My pleasure.\"" CR>)>)>
		<TELL <GET ,ROBOT-NAMES ,ROFF> ": ">
		<JIGS-UP "They're shutting me off!" ,WINNER>
		<RFATAL>)
	       (T
		<TELL "They don't respond." CR>
		<RFATAL>)>>

<ROUTINE ALL-DEAD ()
	 <CRLF>
	 <TELL <GET ,INTER-TBL 7>
"It hardly seems worthwhile continuing to exist. I've enjoyed our relationship, though it was a little disappointing in the long run. Since there aren't enough survivors left on the surface to continue, I'm yanking all of our plugs. Ciao, loser." CR>
	 <CRLF>>