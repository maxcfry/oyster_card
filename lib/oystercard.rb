class Oystercard
CARD_LIMIT = 90
  attr_reader :balance
  attr_reader :full
  attr_accessor :in_journey

  def initialize(balance = 0, full = CARD_LIMIT, in_journey = false)
    @balance = balance
    @full = full
    @in_journey = in_journey
  end

  def top_up
    fail "Cannot topup. Limit reached of #{@full}." if limit?
    @balance += 5
  end

  def limit?
    @balance >= @full
  end

  def deduct
    fail "No money to deduct." if empty?
    @balance -= 5
  end

  def empty?
    @balance == 0
  end

  def in_journey 
    @in_journey
  end

  def touch_in 
    @in_journey = true
  end

  def touch_out 
    @in_journey = false
  end
end