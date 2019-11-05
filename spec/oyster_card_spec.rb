
require 'oyster.rb'

describe Oyster do
  it 'can create an instance of a variable' do
     oyster_card = Oyster.new
     expect(oyster_card).to be_kind_of(Oyster)
   end
   it 'can create an instance of a variable' do
   oyster_card = Oyster.new
   expect(oyster_card).to respond_to(:balance)
 end
 end
