# spec/event_spec.rb
require 'Event/event'
require 'time'

describe "Any event" do
  
  before(:each) do
    @event = Event.new("Cake Cookout", Time.local(y=2008,m=3,d=22,h=12,min=34,s=43))
  end
  
  it "should have a name" do
    @event.should respond_to(:name)    
  end
  
  it "should have a start time" do
    @event.should respond_to(:start_time)
  end
  
  it "should have an end time" do
    @event.should respond_to(:end_time)
  end
  
  it "should not have to have an end time" do
    pending
  end
end
    
    
describe "A Weekly Event" do
  before(:each) do
    @start_time = Time.local(y=2008,m=3,d=22,h=12,min=34,s=43)
    @start_date = Date.new(y=2008,m=3,d=22)
    @event = Event.new("weekly cookout", @start_time)
    @event.extend Weekly
    @event.frequency = "first"
  end
  
  it "should have a frequency" do
    @event.should respond_to(:frequency)
  end
  
  it "should be able to return the next date" do
    @event.next_date.should eql @start_date+7
  end
  
  it "should be able to return the next date" do
    @event.next_date.should eql @start_date+7
  end
end