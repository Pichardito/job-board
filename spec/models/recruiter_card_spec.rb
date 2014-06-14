require 'spec_helper'

describe RecruiterCard do

  describe '#to_s' do
    it 'returns formatted name' do
      RCard = RecruiterCard.new({name: 'Oracle', title: 'CEO', looking_for: 'Developers', description: '...' })
      actual = RCard.to_s
      expected = "CEO from Oracle"
      expect(actual).to eq(expected)
    end
  end
end #describe RecruiterCard
