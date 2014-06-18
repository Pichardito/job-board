require 'spec_helper'

describe ProspectCard do

  describe '#to_s' do
    it 'returns formatted name' do
      PCard = ProspectCard.new({name: 'Google', title: 'CEO', looking_for: 'teamates', description: '...stuff' })
      actual = PCard.to_s
      expected = "CEO from Google"
      expect(actual).to eq(expected)
    end
  end

end #describe ProspectCard
