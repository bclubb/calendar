# spec/calendar_spec.rb
require 'calendar'
require 'time'

describe "Calendar with one event" do
  
  before(:each) do
    @calendar = Calendar.new
    @calendar.add_daily_event(Date.new(y=2008,m=3,d=22), "Test", Date.new(y=2008,m=3,d=23))
  end
  
  it "should be able to add an event" do
    @calendar.events.size.should == 2
  end
  
  it "should be able to list events for a date" do
    @events = @calendar.get_events(Date.new(y=2008,m=3,d=22))
    @events.size.should == 1
  end
  it "should be able to return the names of the event" do
    @events = @calendar.get_events(Date.new(y=2008,m=3,d=22))
    @events.join(",").should == "Test"    
  end
end

describe "Calendar with multiple events" do
  before(:each) do
    @calendar = Calendar.new
    @calendar.add_daily_event(Date.new(y=2008,m=3,d=22), "Test", Date.new(y=2008,m=3,d=23))
    @calendar.add_daily_event(Date.new(y=2008,m=3,d=22), "Test2", Date.new(y=2008,m=3,d=23))
  end
  
  it "should be able to hold multiple events" do
    @calendar.events.size.should  == 2
  end
  
  it "should not be able to have another date added with the same name" do
    @calendar.add_daily_event(Date.new(y=2008,m=3,d=12), "Test", Date.new(y=2008,m=3,d=13))
    @calendar.events.size.should == 2
  end
  
  it "should be able to return the names of the event" do
    @events = @calendar.get_events(Date.new(y=2008,m=3,d=22))
    @events.join(",").should == "Test,Test2"    
  end
  
end