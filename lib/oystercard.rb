class Oystercard
MAX_BALANCE = 90
MIN_BALANCE = 1
  attr_reader :balance
  attr_reader :full
  attr_accessor :in_journey
  attr_reader :fee

  def initialize(balance = 10)
    @balance = balance
    @journey = nil
  end

  def top_up(amount)
    fail "Cannot topup. Limit reached of #{MAX_BALANCE}." if limit?
    @balance += amount
  end

  def empty?
    @balance < 1
  end

  def in_journey?
    @journey == true
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    fail "Insufficient funds to travel" if no_funds?
    @journey = true
  end

  def touch_out 
  # deduct
    @journey = false
  end

  # def sufficient_funds?
  #   @balance > 0
  # end

  def limit?
    @balance >= MAX_BALANCE
  end

  def no_funds?
    @balance < MIN_BALANCE
  end

end