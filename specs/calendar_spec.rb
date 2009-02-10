# spec/calendar_spec.rb
require 'calendar'
require 'time'

describe "Calendar with one event" do
  
  before(:each) do
    @calendar = Calendar.new
    @calendar.add_event("Test", Time.local(y=2008,m=3,d=22,h=12,min=34,s=43))
  end
  
  it "should be able to add an event" do
    @calendar.events.size.should == 1
  end
  
  it "should be able to list events for a date" do
    @events = @calendar.get_events(Date.new(y=2008,m=3,d=22))
    @events.size.should == 1
  end
  
end

describe "Calendar with multiple events" do
  before(:each) do
    @calendar = Calendar.new
    @calendar.add_event("Test", Time.new(y=2008,m=3,d=22,h=12,min=34,s=43))
    @calendar.add_event("Test2", Time.new(y=2008,m=3,d=22,h=12,min=34,s=43))
  end
  
  it "should be able to hold multiple events" do
    @calendar.events.size.should  == 2
  end
  
  it "should not be able to have another date added with the same name" do
    @calendar.add_event("Test", Time.new(y=2008,m=3,d=12,h=12,min=32,s=41))
    @calendar.events.size.should == 2
  end
  
end