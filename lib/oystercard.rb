class Oystercard
MAX_BALANCE = 90
MIN_BALANCE = 1
  attr_reader :balance
  attr_reader :full
  attr_accessor :in_journey
  attr_reader :fee

  def initialize(balance = 10)
    @balance = balance
    @full = MAX_BALANCE
    @journey = nil
  end

  def top_up(amount)
    fail "Cannot topup. Limit reached of #{@full}." if @balance > MAX_BALANCE
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
    @journey = true
  end

  def touch_out 
  # deduct
    @journey = false
  end

  def sufficient_funds?
    @balance > 0
  end


end