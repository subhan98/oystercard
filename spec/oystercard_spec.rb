require 'oystercard'

describe Oystercard do
  subject(:oystercard) {Oystercard.new}
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
    deduct = Oystercard.new
    expect {subject.deduct}.to respond_to(:money)
    #it { is_expected.to respond_to(:deduct).with(1).argument }
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
