"PEOPLE for
			      SUSPENDED
	(c) Copyright 1982 Infocom, Inc.  All Rights Reserved.
"

;"People for Suspended.  Interrupts, Routines & Globals
  associated with PEOPLE within game."

<GLOBAL PR-NUMBER 0>

<GLOBAL CHASING-THIEF <>>

<ROUTINE AUDA-HEARS? ()
	 <COND (<AND <IN? ,AUDA <LOC ,PEOPLE>>
		     <OR ,AUDA-LISTENS
			 <AUDA?>>
		     <L? <GET ,DEADBOTS 4> 30>>)>>

<ROUTINE AUDA-SPEAKS ()
	 <COND (<NOT <AUDA?>>
		<TELL CR <GET ,INTER-TBL 4> " Listening..." CR>)
	       (T
		<CRLF>)>>

<ROUTINE ROBOT-THERE? (RBT)
	 <COND (<AND <IN? .RBT <LOC ,PEOPLE>>
		     <NOT <FSET? .RBT ,CUTBIT>>>)>>

<ROUTINE I-PEOPLE1 ()
	 <SETG PR-NUMBER 1>
	 <MOVE ,PEOPLE ,STERILE-AREA>
	 <SET-GOAL ,PEOPLE ,TOOL-AREA>
	 <TELL CR 
	       "FC INTERRUPT: ALERT! ALERT!|
Intruders detected in Sterilization Chamber!" CR>
	 <RFATAL>>

<ROUTINE PARRIVE1 ("AUX" TEMP)
	 <MOVE ,TOOLBAG ,PEOPLE>
	 <COND (<AUDA-HEARS?>
		<AUDA-SPEAKS>
		<TELL
"I can hear the sound of metal against metal, followed by the sound of a creaking door opening.|
|
\"I've got the toolbag. Everything in it seems intact.\"|
\"Well, don't lose it, man. We're lost without it. We'll never pull the switch on him if we lose it.\"|
\"Don't worry. I won't let it out of my sight.\"|
\"I'm getting sleepy. It was a long ride down here. What do you say we catch some sleep?\"|
\"You really think we should? With all the devastation taking place?\"|
\"I don't have much choice. I'm not thinking clearly, and I really need to sleep. More casualties will occur if we don't take care of ourselves.\"|
\"Good point. Let's go.\"" CR>)>
	 <COND (<ROBOT-THERE? ,WALDO>
		<SET TEMP ,WINNER> <CHANGE-WINNER ,WALDO T>
		<TELL CR <GET ,INTER-TBL 2>
" The mobile objects have stopped for a moment. I also detect the " D 
,PEOPLE-CABINET " opening then shutting. The " D ,PEOPLE " have removed a "
D ,TOOLBAG " and are grasping it." CR>
		<CHANGE-WINNER .TEMP T>)
	       (<ROBOT-THERE? ,SENSA>
		<SET TEMP ,WINNER> <CHANGE-WINNER ,SENSA T>
		<TELL CR <GET ,INTER-TBL 3>
" I can detect the cycling of a mechanism attached to the " D 
,PEOPLE-CABINET " and the " D ,PEOPLE " removing a " D ,TOOLBAG " from it." CR>
		<CHANGE-WINNER .TEMP T>)
	       (<ROBOT-THERE? ,POET>
		<SET TEMP ,WINNER> <CHANGE-WINNER ,POET T>
		<TELL CR <GET ,INTER-TBL 5>
" As the amazing " D ,PEOPLE " check in, they casually remove something from a " D ,PEOPLE-CABINET ". It appears to be a " D ,TOOLBAG "." CR>
		<CHANGE-WINNER .TEMP T>)>
	 <SET-GOAL ,PEOPLE ,SLEEP-CHAMBER>
	 <SETG PR-NUMBER 2>>
	 
<ROUTINE PARRIVE2 ("AUX" TEMP)
	 <COND (,CHASING-THIEF
		<RFALSE>)>
	 <SETG SLEEPERS 0>
	 <ENABLE <QUEUE I-STEAL -1>>
	 <MOVE ,TOOLBAG ,SLEEP-CHAMBER>
	 <COND (<AND <AUDA-HEARS?>
		     <NOT ,GIVEN-BAG>>
		<AUDA-SPEAKS>
		<TELL
"\"Well, this is some sleep chamber. No frills.\"|
\"Don't complain. At least there's bunks for us.\"|
\"I suppose. I'm going to put the toolbag on the floor while I grab some shuteye.\"|
\"What about the robot?\"|
\"What, that ear thing? Gimme a break!\"|
|
AUDA: I hear the sound of metal being placed on the floor." CR>)>
	 <COND (<AND <ROBOT-THERE? ,WALDO> <NOT ,GIVEN-BAG>>
		<TELL CR <GET ,INTER-TBL 2>
" The mobile objects are moving over to the platforms and are reclining." CR>)
	       (<AND <ROBOT-THERE? ,SENSA> <NOT ,GIVEN-BAG>>
		<SET TEMP ,WINNER> <CHANGE-WINNER ,SENSA T>
		<TELL CR <GET ,INTER-TBL 3>
" I detect an extreme drop in electrical and ionic activity in this area as the " D ,PEOPLE " become immobile." CR>
		<CHANGE-WINNER .TEMP T>)
	       (<AND <ROBOT-THERE? ,POET> <NOT ,GIVEN-BAG>>
		<TELL CR <GET ,INTER-TBL 5>
" Ah, yawn. Ho hum. These people are boring." CR>)>
	 <RTRUE>>

<GLOBAL SNORES-TBL
	  <PTABLE
"I can hear slow breathing and the occasional rustling of cloth."
"One of the mechanisms tosses and turns."
"One of the mechanisms has begun snoring. It is irritating."
"The breathing of the mechanisms has become irregular and they begin to stir.">>

<ROUTINE I-STEAL ()
	 <SETG SLEEPERS <+ ,SLEEPERS 1>>
	 <COND (<G? ,SLEEPERS 20>
		<DISABLE <INT I-STEAL>>
		<ENABLE <QUEUE I-PEOPLE2 1>>)>
	 <COND (<EQUAL? ,SLEEPERS 1>
		<COND (<AUDA-HEARS?>
		       <AUDA-SPEAKS>
		       <TELL <GET ,SNORES-TBL 0>  CR>
		       <RTRUE>)>)
	       (<EQUAL? ,SLEEPERS 5>
		<COND (<AUDA-HEARS?>
		       <AUDA-SPEAKS>
		       <TELL <GET ,SNORES-TBL 1> CR>
		       <RTRUE>)>)
	       (<EQUAL? ,SLEEPERS 10>
		<COND (<AUDA-HEARS?>
		       <AUDA-SPEAKS>
		       <TELL <GET ,SNORES-TBL 2> CR>
		       <RTRUE>)>)
	       (<EQUAL? ,SLEEPERS 15>
		<COND (<AUDA-HEARS?>
		       <AUDA-SPEAKS>
		       <TELL <GET ,SNORES-TBL 3> CR>
		       <RTRUE>)>)>
	 <RFALSE>>

<GLOBAL FED-UP <>>

<ROUTINE ENOUGH-TRADING ()
	 <ROBOT-TELL "Given.">
	 <COND (<AUDA-HEARS?>
		<AUDA-SPEAKS>
		<TELL
"\"Enough is enough! We'll never get anywhere with this little thing pestering us.\"|
\"Tell me about it. Let's just get on with this.\"|
\"Fine with me. Grab the bag.\"|
\"Okay.\"" CR>)>
	 <MOVE ,TOOLBAG ,PEOPLE>
	 <SETG FED-UP T>
	 <SETG CHASING-THIEF <>>
	 <DISABLE <INT I-STEAL>>
	 <I-PEOPLE2>
	 <SETG PR-NUMBER 3>
	 <SET-GOAL ,PEOPLE ,INNER-CORE>>>

<ROUTINE PEOPLE-GIVEN-BAG ()
	 <ROBOT-TELL "Given.">
	 <SETG GIVEN-BAG T>
	 ;<COND (<G? ,TAKE-BACK 3>
		<RFALSE>)>
	 <MOVE ,TOOLBAG ,PEOPLE>
	 <DISABLE <INT I-CHASEAUDA>>
	 <SETG RTHIEF <>>
	 <SETG CHASING-THIEF <>>
	 <SETG TAKE-BACK 0>
	 <SETG PR-NUMBER 9>
	 <COND (<L? ,SLEEPERS 20>
		<SETG SLEEPERS 0>
		<ENABLE <QUEUE I-STEAL -1>>
		<MOVE ,TOOLBAG ,SLEEP-CHAMBER>
		<COND (<AUDA-HEARS?>
		       <AUDA-SPEAKS>
		       <TELL
"\"It's a good thing that little thief gave the bag back.\"|
\"I'll say. Let's get some more sleep.\"|
\"Okay.\"|
\"You're not worried about leaving the bag on the floor, now, are you?\"|
\"Nah. I'm not worried.\"" CR>)>)
	       (ELSE ;"THEY WERE ABOUT TO AWAKEN"
		<DISABLE <INT I-STEAL>>
		<I-PEOPLE2>
		<SETG PR-NUMBER 3>
		<SET-GOAL ,PEOPLE ,INNER-CORE>
		<MOVE ,TOOLBAG ,PEOPLE>
		<RFALSE>)>>
		 

<ROUTINE I-PEOPLE2 ("AUX" (FLG <>))
	 <SETG PR-NUMBER 3>
	 <SET-GOAL ,PEOPLE ,INNER-CORE>
	 <MOVE ,TOOLBAG ,PEOPLE>
	 <COND (<AND <AUDA-HEARS?>
		     <NOT ,FED-UP>>
		<AUDA-SPEAKS>
		<SET FLG T>
		<TELL 
"\"I really needed more rest than that, but it'll have to do. Let's get on with what this.\"|
\"Okay. Just give me a second. Where to now?\"|
\"The Central Library. We've got to get a little info before we can pull the switch.\"|
\"Oops. Almost forgot the tool bag!\"" CR>)>
	 <COND (<ROBOT-THERE? ,WALDO>
		<SET FLG T>
		<TELL CR <GET ,INTER-TBL 2>
" The mobile objects are resuming their normal positions and are becoming active." CR>)
	       (<ROBOT-THERE? ,SENSA>
		<SET FLG T>
		<TELL CR <GET ,INTER-TBL 3>
" The air is becoming charged with ionic activity as the creatures stir from quiescence." CR>)
	       (<ROBOT-THERE? ,POET>
		<SET FLG T>
		<TELL CR <GET ,INTER-TBL 5>
" Like loaves of bread sitting on a warm oven, the Creators rise." CR>)>
	 .FLG>

<ROUTINE PARRIVE3 ()
	 <ENABLE <QUEUE I-PEOPLE4 3>>
	 <COND (<AUDA-HEARS?>
		<AUDA-SPEAKS>
		<TELL 
"I can hear them talking, but I can't make out what's being said." CR>)>
	 <COND (,PLUGGED-IN
		<TELL CR <GET ,INTER-TBL 6>
" Humans querying the CLC regarding proper replacement procedure for you. CLC is responding with the human access code for reviving one of your clones."
CR>)>>

<ROUTINE I-PEOPLE4 ()
	 <SETG PR-NUMBER 4>
	 <SET-GOAL ,PEOPLE ,HALL-END>
	 <COND (<AUDA-HEARS?>
		<AUDA-SPEAKS>
		<TELL
"\"That information should do the trick. Let's get the replacement.\"|
\"Yeah. Sounds good to me. I guess that person really went over the deep end, poor thing. Sitting in that capsule can't be a lot of fun.\"|
\"Well, that's the way it goes.\"" CR>)>>

<ROUTINE PARRIVE4 ("AUX" (FLG <>))
	 <COND (<AND <IN? ,CAR ,HALL-END>
		     <EQUAL? ,CAR-FULL 0>>
		<ENABLE <QUEUE I-KILL 15>>
		<COND (<AUDA-HEARS?>
		       <SET FLG T>
		       <AUDA-SPEAKS>
		       <TELL
"\"Let's get into the car and get this thing over with. The clones are near the end of this tube.\"|
\"Sounds good to me. This place gives me the creeps.\"|
|
AUDA: I hear the sounds of the people entering the car, then the whoosh as the car takes off to the east." CR>)>
		<MOVE ,PEOPLE ,CRYOUNITS>
		<MOVE ,CAR ,CAR-AREA>
		.FLG)
	       (ELSE
		<ENABLE <QUEUE I-CAR-WAIT -1>>
		<COND (<NOT ,WAITING-QUIP>
		       <SETG WAITING-QUIP T>
		       <COND (<AUDA-HEARS?>
			      <AUDA-SPEAKS>
			      <TELL
"\"We'll have to wait for the car. We can't negotiate this tube on foot.\"|
\"Fine. I've got nothing but time.\"" CR>)>)>)>>

<ROUTINE I-CAR-WAIT ()
	 <COND (<AND <IN? ,CAR ,HALL-END>
		     <EQUAL? ,CAR-FULL 0>>
		<DISABLE <INT I-CAR-WAIT>>
		<PARRIVE4>)
	       (ELSE
		<SETG CAR-GONE <+ ,CAR-GONE 1>>
		<COND (<AND <EQUAL? ,CAR-GONE 10>
			    <AUDA-HEARS?>>
		       <AUDA-SPEAKS>
		       <TELL
"\"Man, I just hate the way this car was designed.\"|
\"Yeah, well, join the club. We'll just have to wait. We can't go back to the surface until we've pulled the switch, anyway.\"" CR>)
		      (<AND <EQUAL? ,CAR-GONE 30>
			    <AUDA-HEARS?>>
		       <AUDA-SPEAKS>
		       <TELL
"\"I'm getting real angry. How long are you gonna wait?\"" CR>)
		      (<AND <EQUAL? ,CAR-GONE 45>
			    <AUDA-HEARS?>>
		       <AUDA-SPEAKS>
		       <TELL
"\"When that robot gets out of that car, I'm going to dismantle the little bugger.\"|
\"You'll have to stand in line. My boredom factor is real low.\"" CR>)
		      (<EQUAL? ,CAR-GONE 75>
		       <COND (<AUDA-HEARS?>
			      <AUDA-SPEAKS>
			      <TELL
"\"I'm tired of waiting around, man. Let's go pull the plug and get this thing over with.\"|
\"But what about the clone?\"|
\"Forget it. We'll put everything on manual override and take care of this later. Too many people are at stake here. Okay?\"|
\"Okay. Lead on.\"" CR>)>
		       <SETG PR-NUMBER 7>
		       <SET-GOAL ,PEOPLE ,CPU-ROOM>
		       <DISABLE <INT I-CAR-WAIT>>)>)>>
						       
<ROUTINE I-KILL ("AUX" TEMP)
	 <MOVE ,PEOPLE ,HALL-END>
	 <MOVE ,CAR ,HALL-END>
	 <COND (<AUDA-HEARS?>
		<AUDA-SPEAKS>
		<ROBOT-TELL
"I hear the whoosh of the car returning and the noisy talking mechanisms getting out of it.">)>
	 <COND (<ROBOT-THERE? ,WALDO>
		<SET TEMP ,WINNER> <CHANGE-WINNER ,WALDO T>
		<ROBOT-TELL "Sonar detects the " <>>
		<TELL D ,PEOPLE
" are holding another thing like themselves between them." CR>
		<CHANGE-WINNER .TEMP T>)
	       (<ROBOT-THERE? ,SENSA>
		<TELL "SENSA: Sensory inputs detect a third life form." CR>)
	       (<ROBOT-THERE? ,POET>
		<TELL "POET: Here come da clone, here come da clone." CR>)>
	 <SETG PR-NUMBER 5>
	 <SET-GOAL ,PEOPLE ,CPU-ROOM>>

<ROUTINE PARRIVE5 ()
	 <TELL CR
"As the door swings open you are blinded by intense light and incredible
pain. Just before everything overloads and you fade from existence, you can
make out the shapes of three humans, one of them holding onto the door of the
cylinder, another of them looking exactly like you, and then everything goes
dark." CR>
	 <QUIT>>
	 
<ROUTINE I-CHASEAUDA ("AUX" TEMP TWINNER)
	 <SETG TAKE-BACK <+ ,TAKE-BACK 1>>
	 <COND (<EQUAL? ,TAKE-BACK 1>
		<COND (<AUDA-HEARS?>
		       <AUDA-SPEAKS>
		       <TELL
"\"Give me that, you little devil!\"|
\"That robot's a thief! Let's get it!\"" CR>)>
		<COND (<ROBOT-THERE? ,WALDO>
		       <TELL CR
"WALDO: The mobile devices are waving their extensions madly. I think I'm in trouble." CR>)
		      (<ROBOT-THERE? ,SENSA>
		       <TELL CR
"SENSA: The air in this area has become highly electrified, charged by the creatures." CR>)
		      (<ROBOT-THERE? ,POET>
		       <TELL CR
"POET: I believe the Creators have caught an extension in the cookie jar. Better take it on the lam, and pronto." CR>)>
		<RFALSE>)
	       (<EQUAL? ,TAKE-BACK 2>
		<RFALSE>)
	       (<EQUAL? ,TAKE-BACK 3>
		<COND (<SET TEMP <GOAL? ,RTHIEF>>
		       <SET-GOAL ,PEOPLE .TEMP>)
		      (T
		       <SET-GOAL ,PEOPLE <LOC ,RTHIEF>>)>
		<SETG PR-NUMBER 9>
		<SETG CHASING-THIEF T>
		<RFALSE>)
	       (<NOT <IN? ,TOOLBAG ,RTHIEF>>
		<COND (<IN? ,PEOPLE <LOC ,TOOLBAG>>
		       <MOVE ,TOOLBAG ,PEOPLE>
		       <SETG PR-NUMBER 3>
		       <SET-GOAL ,PEOPLE ,INNER-CORE>
		       <DISABLE <INT I-CHASEAUDA>>
		       <COND (<AUDA-HEARS?>
			      <AUDA-SPEAKS>
			      <TELL
"\"Here's the toolbag. Looks like the little 'bot dropped it.\"|
\"Just as well. Let's get on with this.\"" CR>)>
		       <SETG CHASING-THIEF <>>)
		      (<IN? ,TOOLBAG ,IRIS>
		       <SETG RTHIEF ,IRIS> <RFALSE>)
		      (<IN? ,TOOLBAG ,WALDO>
		       <SETG RTHIEF ,WALDO> <RFALSE>)
		      (<IN? ,TOOLBAG ,SENSA>
		       <SETG RTHIEF ,SENSA> <RFALSE>)
		      (<IN? ,TOOLBAG ,AUDA>
		       <SETG RTHIEF ,AUDA> <RFALSE>)
		      (<IN? ,TOOLBAG ,POET>
		       <SETG RTHIEF ,POET> <RFALSE>)
		      (<IN? ,TOOLBAG ,WHIZ>
		       <SETG RTHIEF ,WHIZ> <RFALSE>)
		      (T
		       <COND (<IN? <LOC ,TOOLBAG> ,ROOMS>
			      <SET-GOAL ,PEOPLE <LOC ,TOOLBAG>>
			      <SETG PR-NUMBER 9>)
			     (T
			      <SETG PR-NUMBER 9>
			      <SET-GOAL ,PEOPLE <META-LOC ,TOOLBAG>>)>
		       <RFALSE>)>)
	       (<IN? ,PEOPLE ,CORRIDOR-4>
		<COND (<AUDA-HEARS?>
		       <AUDA-SPEAKS>
		       <TELL 
"\"Oh, wow, look at that! The mist is coming up through the grating!\"|
\"Yeah. What's below this room? The Maintenance Area?\"|
\"Yes. The cooling system for the Filtering Computers has a regulatory valve there.... Maybe that's what's wrong here.\"|
\"What are you talking about?\"|
\"This acid mist -- it could be what's causing all the trouble. Let's get back down there and turn the wheel, get the cooling system rerouted.\"|
\"It's worth a try. If you're right, we won't have to pull this person's plug.\"|
\"Well, let's go. We're wasting time.\"" CR>)>
		<DISABLE <INT I-CHASEAUDA>>
		<CRLF>
		<COND (<IN? ,RTHIEF ,CORRIDOR-4>
		       <MOVE ,TOOLBAG ,PEOPLE>
		       <TELL <GET ,INTER-TBL <GETP ,RTHIEF ,P?ROBOT>>
" They've taken something from my extensions!" CR>)
		      (ELSE
		       <TELL <GET ,INTER-TBL <GETP ,RTHIEF ,P?ROBOT>>
" The bag is melting!" CR>
		       <REMOVE ,TOOLBAG>)>
		<SET-GOAL ,PEOPLE ,FCMAINT>
		<SETG PR-NUMBER 8>
		<SETG CHASING-THIEF <>>)
	       (<IN? ,PEOPLE <LOC ,RTHIEF>>
		<SETG CHASING-THIEF <>>
		<COND (<IN? ,PEOPLE ,FCMAINT>
		       <DISABLE <INT I-CHASEAUDA>>
		       <MOVE ,TOOLBAG ,PEOPLE>
		       <STU-1-F T>)
		      (ELSE
		       <COND (<AUDA-HEARS?>
			      <AUDA-SPEAKS>
			      <TELL
"\"We've got him now. He's cornered. Let's grab that tool bag and get on with this fiasco.\"" CR>)>
		       <CRLF>
		       <COND (<IN? ,TOOLBAG ,RTHIEF>
			      <SET TWINNER ,WINNER>
			      <CHANGE-WINNER ,RTHIEF T>
			      <ROBOT-TELL
			        "Oh oh. I feel something wrenching the " <>>
			      <TELL D ,TOOLBAG " from my extensions." CR>
			      <CHANGE-WINNER .TWINNER T>)>
		       <MOVE ,TOOLBAG ,PEOPLE>
		       <SETG PR-NUMBER 3>
		       <SET-GOAL ,PEOPLE ,INNER-CORE>
		       <DISABLE <INT I-CHASEAUDA>>)>)
	       (ELSE
		<SET-GOAL ,PEOPLE <LOC ,RTHIEF>>
		<SETG PR-NUMBER 9>
		<RFALSE>)>>

<ROUTINE PARRIVE6 ()
	 <ENABLE <QUEUE I-STARCROSS -1>>
	 <COND (<AUDA-HEARS?>
		<AUDA-SPEAKS>
		<TELL 
"\"Let's play this game while we wait to see what's happening.\"|
\"What's it called?\"|
\"Starcross. Looks really good.\"|
\"Okay.\"" CR>)>>

<ROUTINE I-STARCROSS ()
	 <SETG PLAY-STARCROSS <+ ,PLAY-STARCROSS 1>>
	 <COND (<L? ,PLAY-STARCROSS 200>
		<RFALSE>)
	       (T
		<DISABLE <INT I-STARCROSS>>
		<SET-GOAL ,PEOPLE ,INNER-CORE>
		<SETG PR-NUMBER 3>
		<COND (<AUDA-HEARS?>
		       <AUDA-SPEAKS>
		       <TELL
"\"I think we've waited long enough. This person in the cylinder isn't all together upstairs, if
you know what I mean.\"|
\"I do, and I agree. There's been more than enough time. Let's yank the fool out of there immediately, then get the replacement clone.\"|
\"No way. Procedure requires we get the replacement first, and that's what
we're going to do. Now let's move.\"" CR>)>)>>

<ROUTINE PARRIVE7 ()
	 <TELL CR
"As the door swings open you are blinded by intense light and incredible
pain. Just before everything overloads and you fade from existence, you can
make out the shape of two figures outside, one of them holding onto the door of the cylinder, and then everything goes dark." CR>
	 <QUIT>>

<ROUTINE PARRIVE8 ()
	 <STU-1-F>>

<ROUTINE PARRIVE9 ()
	 <RFALSE>>

<ROUTINE STU-1-F ("OPTIONAL" (LONG? <>))
	 <SETG ACID-FIXED T>
	 <SET-GOAL ,PEOPLE ,REC-AREA>
	 <SETG PR-NUMBER 6>
	 <COND (<AUDA-HEARS?>
		<AUDA-SPEAKS>
		<TELL
"\"Hey -- Look at that! The pipes going up to the Filtering Computers have burst.\"|
\"Yeah. Maybe the person in the cylinder isn't at fault....\"|
\"Hmm. You could be right. Let's fix this and then see if things return to normal.\"|
|
AUDA: I can hear the sound of metal, like a wheel turning, and the hissing
stop.|
|
\"That should take care of that leak. Let's go up to the Rec Area and wait for awhile.\"|
\"Fine.">
		<COND (.LONG?
		       <TELL " Meanwhile, I'll get our toolbag back.">)>
		<TELL "\"|
|
AUDA: I hear footsteps as the talking mechanisms walk away." CR>)>
	 <COND (<ROBOT-THERE? ,WALDO>
		<TELL CR
"WALDO: I can detect the large, circular object high overhead turning." CR>)
	       (<ROBOT-THERE? ,SENSA>
		<TELL CR
"SENSA: I detect the flow within the pipes overhead stopping and the acid leak stopping, too." CR>)
	       (<ROBOT-THERE? ,POET>
		<TELL CR
"POET: Here they come to save the day..." CR>)>>