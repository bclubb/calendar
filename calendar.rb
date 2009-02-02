# calendar.rb
class Calendar
  attr_reader :events
  
  def initialize
    @events = {}
  end  
  
  def add_event(date, name)
    if(@events[date])
      @events[date] << name
    else
      @events.merge!(date => Array[name])
    end
  end
  
  def get_events(date)
    @events[date]
  end
end