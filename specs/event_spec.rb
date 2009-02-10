# spec/event_spec.rb
require 'Event/event'
require 'time'

describe "Any event" do
  
  before(:each) do
    @event = Event.new("Cake Cookout", Time.new(y=2008,m=3,d=22))
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
    @event = Event.new("weekly cookout", Time.new(y=2008,m=3,d=22))
  end
  
  it "should have a frequency" do
    
  end
end