class Oystercard
    attr_reader :balance
    Limit = 90
    def initialize
      @balance = 0
    end

  def top_up(money)
    @balance += money
     if @balance  > Limit
      raise "maximum limit reached"
    end
 end
  def deduct(money)
    @balance -= money
    deduct.money
  end
end
