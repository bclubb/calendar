# calendar.rb
require 'event'
require 'set'

class Calendar
  attr_reader :events
  
  def initialize
    @events = {}
    @event_names = Set.new
  end  
  
  def add_daily_event(start_date, name, end_date=start_date>>24)
    if(@event_names.add?(name) == nil)
      return
    end
    event = Event.new(name, start_date, end_date)
    event.extend Daily
    add_event(event)
  end
  
  def add_weekly_event(start_date, name, end_date=start_date>>24)
    # loop through all of the dates from start to end, if no end then til 2 years from now and add them to
    # the calendar
    event_date = start_date
    while event_date < end_date
      add_event(event_date, name)
      event_date = event.next_date(event_date)
    end
  end
  
  def add_weekly_event(start_date, name, days_of_the_week, end_date=start_date<<24)
    event = Event.new(name, start_date, end_date)
    event.extend Weekly
    add_event(event, days_of_the_week)
  end
  
  def add_yearly_event(start_date, name, end_date=start_date<<24)
    event = Event.new(name, start_date, end_date)
    event.extend Yearly
    add_event(event)
  end
  
  def get_events(date)
    @events[date]
  end
  
  private
  def add_event(event)
    while date = event.next_date
      add_event_to_date(date, event.name)
    end
  end

  def add_event_with_weeks(event, days_of_the_week)
    
    event_date = event.start_date
    while event_date < event.end_date
      add_event_to_date(event_date, event.name)
      event_date = event.next_date(event_date, days_of_the_week)
    end
  end
  
  def add_event_to_date(event_date, name)
    if(@events[event_date])
      @events[event_date] << name
    else
      @events.merge!(event_date => [name])
    end
  end
end