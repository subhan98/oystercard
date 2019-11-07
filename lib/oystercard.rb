require_relative 'station.rb'
class Oystercard
  attr_accessor :balance
  attr_accessor :injourney
  attr_accessor :entry_station
  MINIMUM_BALANCE = 1

  Limit = 90
  def initialize
    @balance = 0
    @injourney = false
    @entry_station = nil
    # @touch
  end

  def top_up(money)
    @balance += money
    if @balance  > Limit
      raise "maximum limit reached"
    end
  end
  # def deduct(money)
  #   @balance -= money
  #   #deduct.money
  # end
  def injourney?
    @injourney
  end
  def touchin(station)
    if @balance < MINIMUM_BALANCE
     raise "insufficient money"
   else
    @injourney = true
    @entry_station = station
end
  end
  def touchout
    @injourney = false
    deduct(MINIMUM_BALANCE)
  end
  private
  def deduct(amount)
      @balance -= amount
  end
end
