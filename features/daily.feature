Feature: Daily_Events
  In order to schedule future daily events
  As a calendar
  I want be able to ask for the next day that an event occurs

Scenario: return the start date
  Given I have created a daily event starting <start_date> with a completion date of <completion>
  When I ask for the next date <repeat> time
  Then the result should be <result>

More Examples:
    | start_date | completion | repeat 	| result	|
    | today	 	| nil 		| 1 		| today		|
    | today 	| nil 		| 2			| tomorrow	|
    | today 	| tomorrow	| 3 		| nil 		|
	| today 	| tomorrow 	| 2			| tomorrow	|


 
	Scenario: return one day later
	  Given I have created a daily event starting today without a completion date
	  When I ask for the next date 2 times
	  Then the result should be tomorrow

	Scenario: return nil after the end date
	  Given I have created a daily event starting today with a completion date of tomorrow
	  When I ask for the next date 3 times
	  Then the result should be nil

	Scenario: return the end date when asked
	  Given I have created a daily event starting today with a completion date of tomorrow
	  When I ask for the next date 2 times
	  Then the result should be tomorrow
