require 'spec_helper'

describe User do

  describe '#test_to_s' do
    it 'returns name and email statement' do
      new_user = User.new({ name: 'Johnny', email: "johnny@house_of_pancakes.com" })
      actual = new_user.test_to_s
      expected =  "Hi my name is Johnny and my email is johnny@house_of_pancakes.com"
      expect(actual).to eq(expected)
    end
  end
end
