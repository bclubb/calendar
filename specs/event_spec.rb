# spec/event_spec.rb
require 'Event/event'
require 'time'

describe "Any event" do
  
  before(:each) do
    @event = Event.new("Cake Cookout", Date.new(y=2008,m=3,d=22))
  end
  
  it "should have a name" do
    @event.should respond_to(:name)    
  end
  
  it "should have a start date" do
    @event.should respond_to(:start_date)
  end
  
  it "should have an end date" do
    @event.should respond_to(:end_date)
  end
  
  it "should not have to have an end time" do
    pending
  end
end
    
    
describe "A Weekly Event" do
  before(:each) do
    @start_date = Date.new(y=2008,m=3,d=22)
    @event = Event.new("weekly cookout", @start_date)
    @event.extend Weekly
  end
  
  it "should have a frequency" do
    @event.should respond_to(:frequency)
  end
  
  it "should be able to return the start date as the first date" do
    @event.next_date.should eql(@start_date)
  end
  
  it "should be able to return the next dates" do
    @event.frequency = "first"
    @event.next_date.should eql(@start_date)
    @event.next_date.should eql(@start_date+7)
    @event.next_date.should eql(@start_date+14)
  end
  
  it "should be able to skip weeks" do
    @event.frequency = "second"
    @event.next_date.should eql(@start_date)
    @event.next_date.should eql(@start_date+14)
    @event.next_date.should eql(@start_date+28)
  end
end