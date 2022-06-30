require 'rails_helper'

RSpec.describe HandsController, type: :controller do
  describe 'Given a hand' do
    describe 'with no other combination' do
      hands = [['10S', '6H', '5H', 'AC', 'QC'], ['QD', '3S', '9C', '7D', 'AS'], ['3C', 'AD', '9C', '7D', 'AH']]
      hands.each do |hand|
        it 'should score High Card Ace' do
          post 'score', params: { hand: hand }

          expect(response.body).to eq '{"score":"high ace"}'
        end
      end
    end

    describe 'with two cards of the same value repeating' do
      hands = [["KS", "KC", "7S", "10H", "3H"], ['2C', '4C', '9S', 'AD','9H']]
      hands.each do |hand|
        it 'should score as a Pair of Kings' do
          post 'score', params: { hand: hand }

          expect(response.body).to eq '{"score":"pair of kings"}'
        end
      end
    end
  end
end
