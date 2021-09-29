require 'oystercard'

describe Oystercard do

  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  it 'adds money to balance' do
    expect(subject.top_up).to eq(10)
  end

  it 'test that limit cannot be breached' do
    oyster = Oystercard.new
    card_limit = Oystercard::MAX_BALANCE
    9.times { oyster.top_up }
    expect { oyster.top_up }.to raise_error("Cannot topup. Limit reached of #{Oystercard::MAX_BALANCE}.")
  end

  it { is_expected.to respond_to(:deduct).with(1).argument }
  
  it 'deducts an amount from the balance' do
    oyster = Oystercard.new(80)
    expect{ subject.deduct(5)}.to change{ subject.balance }.by -5
  end

  # it 'deducts money from card' do
  #   oyster = Oystercard.new(80)
  #   expect(oyster.touch_out).to eq(79)
  # end

  # it 'is initially not in journey' do 
  #   expect(subject.in_journey).to eq(false)
  # end

  # it 'is in journey when touched in' do
  #   oyster = Oystercard.new
  #   oyster.top_up
  #   oyster.touch_in
  #   expect(oyster.in_journey).to eq(true)
  # end

  # it 'is not in journey when touched out' do 
  #   oyster = Oystercard.new
  #   oyster.top_up
  #   oyster.touch_in
  #   oyster.touch_out
  #   expect(oyster.in_journey).to eq(false)
  # end

  # it 'does not touch in if balance if less than 1' do
  #   expect(subject.touch_in).to eq("Insufficient funds. Touch in denied.")
  # end 

  # it 'deducts fee from card on touch out' do
  #   oyster = Oystercard.new
  #   oyster.top_up
  #   oyster.touch_in 
  #   expect{ oyster.touch_out}.to change{ oyster.balance }.by(-Oystercard::MINIMUM_CHARGE)
  # end

end

