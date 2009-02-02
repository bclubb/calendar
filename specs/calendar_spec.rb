# spec/calendar_spec.rb
require 'calendar'
require 'date'

describe "Calendar with one event" do
  
  before(:each) do
    @calendar = Calendar.new
    @calendar.add_event(Date.new(y=2008,m=3,d=22), "Test")
  end
  
  it "should be able to add an event" do
    @calendar.events.size.should == 1
  end
  
  it "should be able to list events for a date" do
    @dates = @calendar.get_events(Date.new(y=2008,m=3,d=22))
    @dates.size.should == 1
  end
end

describe "Calendar with multiple events" do
  before(:each) do
    @calendar = Calendar.new
    @calendar.add_event(Date.new(y=2008,m=3,d=22), "Test")
    @calendar.add_event(Date.new(y=2008,m=3,d=22), "Test2")
  end
  it "should be able to hold multiple events" do
    @calendar.events.size.should  == 2    
  end
end