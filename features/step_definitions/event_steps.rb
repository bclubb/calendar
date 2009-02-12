require 'spec/expectations'
#require 'cucumber/formatters/unicode'
require 'event'
 
Given /I have created a daily event starting today without a completion date/ do
  @event = Event.new("Test", Date.today)
  @event.extend Daily
end

Given /I have created a daily event starting today with a completion date of tomorrow/ do
  @event = Event.new("Test", Date.today, Date.today+1)
  @event.extend Daily
end

When /I ask for the next date (\d+) time[s]?/ do |number_of_days|
  i = 0
  while i < number_of_days.to_i
    @result = @event.next_date
    i += 1
  end
end
 
Then /the result should be (\w+)/ do |day|
  case day
    when "today"
      @result.should == Date.today
    when "tomorrow"
      @result.should == Date.today+1
    when "nil"
      @result.should == nil
  end
end