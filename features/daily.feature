Feature: Daily_Events
  In order to schedule future daily events
  As a calendar
  I want be able to ask for the next day that an event occurs

Scenario: return the start date
  Given I have created a daily event starting today without a completion date
  When I ask for the next date 1 time
  Then the result should be the today

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



  
