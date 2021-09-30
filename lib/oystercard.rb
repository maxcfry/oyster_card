class OysterCard
MAX_BALANCE = 90
MIN_BALANCE = 1
  attr_reader :balance
  attr_reader :full
  # attr_accessor :in_journey
  attr_reader :fee
  attr_reader :entry_station
  attr_reader :exit_station
  attr_reader :journeys

  def initialize(balance = 10)
    @balance = balance
    @entry_station = nil
    @exit_station = nil
    @journeys = []
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
    @entry_station = station
   
  end

  def touch_out(station)
    deduct(MIN_BALANCE)
    @entry_station
    @exit_station = station 
    create_journeys(@entry_station, @exit_station)
    @entry_station = nil
    @exit_station
    
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

  def create_journeys(entry_station, exit_station)
   @journeys << {entry: @entry_station, exit: @exit_station}
  end
end