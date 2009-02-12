# spec/event_spec.rb
require 'event'
require 'time'

describe "All Events", :shared => true do
  
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
  
  it "should be able to return the start date as the first date" do
    @event.next_date.should == @start_date
  end
  
end

describe "A Daily Event" do
  before(:each) do
    setup_test
    @event.extend Daily
    @expected_offset = 1
  end
  
  it_should_behave_like "All Events"
  
  it "should be able to return the next dates" do
    @event.next_date
    @event.next_date.should == @start_date+1
    @event.next_date.should == @start_date+2
  end
  
  it "should stop returning dates when the end date is reached" do
    @event.end_date = @start_date+1
    @event.next_date
    @event.next_date
    @event.next_date.should be nil
  end
  
  it "should return the end date as a valid date" do
    @event.end_date = @start_date+1
    @event.next_date
    @event.next_date.should == @start_date+1
  end
  
  it "should repeat every day until the end is reached" do
    pending
  end
end
    
describe "A Weekly Event" do  
  before(:each) do
    setup_test
    @event.extend Weekly
    @event.week_days = [Date::DAYNAMES[@start_date.wday], Date::DAYNAMES[(@start_date+2).wday]]
  end
  
  it_should_behave_like "All Events"
  
  it "should have a frequency" do
    @event.should respond_to(:frequency)
  end
  
  it "should be able to return the start date as the first date" do
    @event.next_date.should eql(@start_date)
  end
  
  it "should be able to return the next dates" do
    @event.frequency = 1
    @event.next_date.should eql(@start_date)
    @event.next_date.should eql(@start_date+2)
    @event.next_date.should eql(@start_date+7)
    @event.next_date.should eql(@start_date+9)
  end
  
  it "should be able to skip weeks" do
    @event.frequency = 2
    @event.next_date.should eql(@start_date)
    @event.next_date.should eql(@start_date+2)
    @event.next_date.should eql(@start_date+14)
    @event.next_date.should eql(@start_date+16)
    @event.next_date.should eql(@start_date+28)
    @event.next_date.should eql(@start_date+30)
  end
end

describe "A Monthly Event" do

  before(:each) do
    setup_test
    @event.extend Monthly
  end

  it_should_behave_like "All Events"

  it "should have a frequency" do
    @event.should respond_to(:frequency)
  end
  
  it "should be able to return the the start date as the first date" do
    @event.next_date.should eql(@start_date)
  end
  
  it "should be able to return the next few dates" do 
    @event.next_date.should eql(@start_date)
  end
end

describe "A Yearly Event" do
  before(:each) do
    setup_test
    @event.extend Yearly
  end
  it_should_behave_like "All Events"
  
  it "should repeat once a year until the end date is reached" do
    
  end
end

def setup_test
  @start_date = Date.new(y=2008,m=3,d=22)
  @event = Event.new("Cake Cookout", @start_date)
end