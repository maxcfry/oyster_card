require 'oystercard'

describe OysterCard do
  let(:station) { double :station }
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }

  it 'has a balance of ten' do
    expect(subject.balance).to eq(10)
  end

  it { is_expected.to respond_to(:top_up).with(1).argument }

  it 'adds money to balance' do
    expect(subject.top_up(10)).to eq(20)
  end

  it 'test that limit cannot be breached' do
    card = OysterCard.new
    card.top_up(80)
    expect { card.top_up(5) }.to raise_error("Cannot topup. Limit reached of #{OysterCard::MAX_BALANCE}.")
  end

  it { is_expected.to respond_to(:deduct).with(1).argument }
  
  it 'deducts an amount from the balance' do
    oyster = OysterCard.new(80)
    expect{ subject.deduct(5)}.to change{ subject.balance }.by -5
  end

  describe "#journey" do 
   it {is_expected.to respond_to :touch_in} 
   it {is_expected.to respond_to :touch_out} 

   it 'is initially not in a journey' do
    expect(subject).not_to be_in_journey
   end
  
    it 'when touch_in is called in journey is true' do
      subject.touch_in(station)
      expect(subject).to be_in_journey
    end

    it 'when touch_out is called in journey is false' do
      subject.touch_out(station)
      expect(subject).not_to be_in_journey
    end

    it 'does not touch in if balance to too low' do 
      card = OysterCard.new
      card.deduct(10)
      expect{ card.touch_in(station) }.to raise_error("Insufficient funds to travel")
    end

    it 'deducts money from card upon touch_in' do
      expect { subject.touch_out(station) }.to change { subject.balance }.by(-1)
    end

    it 'store an entry station when touch_in' do
      card = OysterCard.new
      card.touch_in(station)
      expect { subject.entry_station.to eq station }
    end

    it 'store an exit station when touch_out' do
      card = OysterCard.new
      card.touch_in(entry_station)
      card.touch_out(exit_station)
      expect { subject.exit_station.to eq exit_station }
    end

    it 'has an empty list of completed journeys' do
      expect(subject.journeys).to be_empty
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

