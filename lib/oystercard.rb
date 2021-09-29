class Oystercard
MAX_BALANCE = 90
MIN_BALANCE = 1
  attr_reader :balance
  attr_reader :full
  attr_accessor :in_journey
  attr_reader :fee

  def initialize(balance = 0)
    @balance = balance
    @full = MAX_BALANCE
    @in_journey = nil
  end

  def top_up
    fail "Cannot topup. Limit reached of #{@full}." if limit?
    @balance += 10
  end

  def limit?
    @balance >= @full
  end

  def empty?
    @balance < 1
  end

  def in_journey 
    @in_journey
  end

  def deduct(amount)
    @balance -= amount
  end
  # def touch_in
  #   if sufficient_funds?
  #     @in_journey = true
  #   else
  #     "Insufficient funds. Touch in denied."
  #   end
  # end

  # def touch_out 
  #   deduct
  #   @in_journey = false
  # end

  # def sufficient_funds?
  #   @balance > 0
  # end


end