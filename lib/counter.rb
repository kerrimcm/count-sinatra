class Counter
  attr_reader :count

  def initialize
    @count = 0
  end

  def increment
    @count += 1
  end

  def decrement
    @count -= 1
  end 

  def time_update
    "The count was last updated at #{Time.now.strftime("%I:%M %p")}"
  end

  def reset
    @count = 0
  end

  def self.instance
    @counter ||= Counter.new
  end
end
