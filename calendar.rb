# calendar.rb
class Calendar
  attr_reader :events
  
  def add_event(date)
    @events << date
  end
end