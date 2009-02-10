# event.rb
require 'time'

class Event
  attr_reader :name
  attr_reader :start_time
  attr_accessor :end_time
  
  def initialize(name, start_time, end_time=Time.now)
    @name = name
    @start_time = start_time
    @end_time = end_time
  end
end

module Weekly
  attr_accessor :frequency
  
  def next_date
    if(!@previous_time)
      @previous_time = @start_time
      return @previous_time
    end
    
    case @frequency
      when "first"
        @previous_time = @previous_time+7
      when "second"
        @previous_time = @previous_time+14
      when "third"
        @previous_time = @previous_time+21
      when "last"
        @previous_time = @previous_time+28
    end
    
    return @previous_time
  end
end

module Monthly
  attr_accessor :frequency
  
  # right now this won't work.  It will just do the first one of the month and move on
  def next_Date(previous_date, days_of_the_week)
    next_date = previous_date>>1
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