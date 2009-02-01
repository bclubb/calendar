# spec/calendar_spec.rb
require 'calendar'

describe Calendar do
  
  before(:each) do
    @calendar = MyCalendar.new
  end
  
  it "should be able to add an event" do
    @calendar.add_event "2009-02-01"
    @calendar.events.count.should == 1
  end
end
