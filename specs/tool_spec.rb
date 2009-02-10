require 'tool'
require 'date'

describe "Tools available" do
  
  it "should contain a set of the days of the week" do
    Date::DAYNAMES.length.should == 7
  end
  
  
  it "should contain a set describing which week a day falls within" do
    Tool::DaysOfTheMonth.length.should == 4
  end
  
end