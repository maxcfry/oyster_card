require 'oystercard'

describe Oystercard do

  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  it 'adds money to balance' do
    expect(subject.top_up).to eq(5)
  end

  it 'test that limit cannot be breached' do
    oyster = Oystercard.new
    card_limit = Oystercard::CARD_LIMIT
    18.times { oyster.top_up }
    expect { oyster.top_up }.to raise_error("Cannot topup. Limit reached of #{card_limit}.")
  end


end

