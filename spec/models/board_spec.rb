require 'rails_helper'
require 'simplecov'

RSpec.describe Board, type: :model do
  describe 'attributes' do
   it 'has a name' do
     name = 'dpl'
     board = Board.create(name: name)
     expect(board.name).to eq(name)
   end
 end
end
