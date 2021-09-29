class Oystercard
CARD_LIMIT = 90
MINIMUM_BALANCE = 1
  attr_reader :balance
  attr_reader :full
  attr_accessor :in_journey
  attr_reader :fee

  def initialize(balance = 0, full = CARD_LIMIT, in_journey = false, fee = MINIMUM_BALANCE
    @balance = balance
    @full = full
    @in_journey = in_journey
    @fee = fee
  end

  def top_up
    fail "Cannot topup. Limit reached of #{@full}." if limit?
    @balance += 10
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
    fail "Insufficient funds. Touch in denied." if sufficient_funds? 
    @in_journey = true
  end

  def touch_out 
    deduct
    @in_journey = false
  end

  def sufficient_funds?
    @balance >= 1
  end

end