class OysterCard
MAX_BALANCE = 90
MIN_BALANCE = 1
  attr_reader :balance
  attr_reader :full
  attr_accessor :in_journey
  attr_reader :fee
  attr_reader :entry_station

  def initialize(balance = 10)
    @balance = balance
    @entry_station = nil
  end

  def top_up(amount)
    fail "Cannot topup. Limit reached of #{MAX_BALANCE}." if limit?
    @balance += amount
  end

  def empty?
    @balance < 1
  end

  def in_journey?
    !!entry_station   

  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in(station)
    fail "Insufficient funds to travel" if no_funds?
    entry_station = station
  end

  def touch_out 
    deduct(MIN_BALANCE)
    @entry_station = nil
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