require 'oystercard'

describe Oystercard do
  #subject(:oystercard) {Oystercard.new}
  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  it 'I want to add money to my card' do
    expect(subject).to respond_to(:top_up)
  end

  it 'I want to limit my card to maximum £90' do
    limit = Oystercard::Limit
    subject.top_up(limit)
    expect{ subject.top_up 1 }.to raise_error "maximum limit reached"
  end

  it 'can deduct fare from the card' do
    #minimum = Oystercard::Minimum
    # #oyster = Oystercard.new
    # subject.balance = 10
    # subject.deduct(5)
    # expect(subject.balance).to eq_to(5)
    #expect {subject.deduct}.to respond_to(:money)
  end
  it ' respond to in journey' do
    expect(subject.injourney?).to eq (false)#(true) or
  end
  it 'should check if touchin works' do
       subject.balance = 1
       subject.touchin("oldstreet")
    expect(subject.injourney?).to eq (true)
  end
  it 'should check if touchout works' do
    subject.injourney = true
     subject.touchout
     expect(subject.injourney?).to eq (false)
  end
  it 'should raise error if it is <£1' do
   subject.balance = Oystercard::MINIMUM_BALANCE - 0.01
   expect{ subject.touchin("oldstreet") }.to raise_error("insufficient money")
  end
  it 'should deduct the mimimum balance' do
    subject.balance = Oystercard::MINIMUM_BALANCE
    expect{subject.touchout}.to change{subject.balance}.by(-Oystercard::MINIMUM_BALANCE)
  end
  it 'should store the entry_station when touchin' do
    subject.balance = Oystercard::MINIMUM_BALANCE
     station1 = Station.new
    subject.touchin(station1)
    expect(subject.entry_station).to eq(station1)
end
end








=begin
require './lib/money'
describe Oystercard do

let (:oyster_card) {Oystercard.new}
it 'creates an instance of a variable' do
#expect(oyster_card).to be_kind_of(Oyster)
end

#  it 'can respond to balance' do
#    expect(subject).to respond_to(:balance)
# end
#
#  it 'adds money to the oyster card' do
#  expect(subject).to respond_to(:add)
#   end
# end










require './lib/money.rb'
describe Money do
it 'can add money to the oyster card' do
top_up = Money.new
expect(subject.top_up).to respond_to(:add)
end

it 'can add money to the oyster card' do
top_up = Money.new
expect(subject.top_up).to respond_to(:add)
end
=end
