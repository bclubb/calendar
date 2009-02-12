# event.rb
require 'time'

class Event
  attr_reader :name
  attr_reader :start_date
  attr_accessor :end_date
  
  def initialize(name, start_date, end_date=Date.today<<24)
    @name = name
    @start_date = start_date
    @end_date = end_date
  end
end

module Daily
  def next_date
    if(!@previous_date)
      @previous_date = @start_date
      return @previous_date
    end
    @previous_date = @previous_date+1
    if(!@end_date and @previous_date <= @end_date)
      return @previous_date
    end
    return nil
  end
end

module Weekly
  attr_accessor :frequency
  attr_accessor :week_days
  
  def next_date
    if(!@previous_date)
      @previous_date = @start_date
      return @previous_date
    end
    
    #box in the week, if out of a valid week the progress to the next valid week
    
    
    case @frequency
      when 1
        @previous_date = @previous_date+7
      when 2
        @previous_date = @previous_date+14
      when 3
        @previous_date = @previous_date+21
      when 4
        @previous_date = @previous_date+28
    end
    
    return @previous_date
  end
end

module Monthly
  attr_accessor :frequency
  attr_accessor :days_of_the_week
  
  # right now this won't work.  It will just do the first one of the month and move on
  def next_date
    if(!@previous_date)
      @previous_date = @start_date
      return @previous_date
    end
    
    previous = @previous_date>>1
    last_week_start = Time::CommonYearMonthDays[next_date.month] - 7
    case @frequency
      when "first"
        next_date = Date.new(d=1, y=next_date.year, m=next_date.month)
      when "second"
        next_date = Date.new(d=7, y=next_date.year, m=next_date.month)
      when "third"
        next_date = Date.new(d=14, y=next_date.year, m=next_date.month)
      when "last"
        next_date = Date.new(d=last_week_start, y=next_date.year, m=next_date.month)
      else
        return (previous_date>>1)
    end
    
    next_date.step(next_date+7, 1) do |date|
        return date if days_of_the_week.any(date.day)
    end
  end
end

module Yearly
  def next_date(previous_date)
    return previous_date<<12
  end
end