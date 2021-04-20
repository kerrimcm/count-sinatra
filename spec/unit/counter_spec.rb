require 'counter'

describe Counter do
  describe '#new' do
    it 'starts with a count of 0' do
      counter = Counter.new
      expect(counter.count).to eq 0
    end
  end

  describe '#increment' do
    it 'adds 1 to the count' do
      counter = Counter.new
      counter.increment
      expect(counter.count).to eq 1
    end
  end

  describe '#decrement' do
    it 'takes 1 away from the count' do
      counter = Counter.new
      counter.decrement
      expect(counter.count).to eq -1
    end 
  end 

  describe '#time_update' do
    it 'updates the time when the counter is changed' do
      counter = Counter.new
      counter.increment
      expect(counter.time_update).to eq "The count was last updated at #{Time.now.strftime("%I:%M %p")}"
    end 
  end

  describe '#reset' do
    it 'resets the counter to 0' do
      counter = Counter.new
      counter.increment
      counter.reset
      expect(counter.count).to eq 0
    end 
  end 
end