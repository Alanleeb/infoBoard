require 'rails_helper'
require 'simplecov'

RSpec.describe User, type: :model do
  describe 'attributes' do
    it 'has a make' do
      name
      car = Car.create(make: make)
      expect(car.make).to eq(make)
    end
  end
end
