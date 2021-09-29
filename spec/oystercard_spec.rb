require 'oystercard'

describe Oystercard do

  it 'has a balance of ten' do
    expect(subject.balance).to eq(10)
  end

  it { is_expected.to respond_to(:top_up).with(1).argument }

  it 'adds money to balance' do
    expect(subject.top_up(10)).to eq(20)
  end

  it 'test that limit cannot be breached' do
    card = Oystercard.new
    card.top_up(80)
    expect { card.top_up(5) }.to raise_error("Cannot topup. Limit reached of #{Oystercard::MAX_BALANCE}.")
  end

  it { is_expected.to respond_to(:deduct).with(1).argument }
  
  it 'deducts an amount from the balance' do
    oyster = Oystercard.new(80)
    expect{ subject.deduct(5)}.to change{ subject.balance }.by -5
  end

  describe "#journey" do 
   it {is_expected.to respond_to :touch_in} 
   it {is_expected.to respond_to :touch_out} 
   it {is_expected.to respond_to :in_journey} 

   it 'is initially not in a journey' do
    expect(subject).not_to be_in_journey
   end
  
    it 'when touch_in is called in journey is true' do
      subject.touch_in
      expect(subject).to be_in_journey
    end

    it 'when touch_out is called in journey is false' do
      subject.touch_out
      expect(subject).not_to be_in_journey
    end

    it 'does not touch in if balance to too low' do 
      card = Oystercard.new
      card.deduct(10)
      expect{ card.touch_in }.to raise_error("Insufficient funds to travel")
    end

    it 'deducts money from card upon touch_in' do
      expect { subject.touch_out }.to change { subject.balance }.by(-1)
    end

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

