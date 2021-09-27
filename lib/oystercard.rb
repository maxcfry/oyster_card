class Oystercard
CARD_LIMIT = 90
  attr_reader :balance
  attr_reader :full

  def initialize(balance = 0, full = CARD_LIMIT)
    @balance = balance
    @full = full
  end

  def top_up
    fail "Cannot topup. Limit reached of #{@full}." if limit?
    @balance += 5
  end

  def limit?
    @balance >= @full
  end

end