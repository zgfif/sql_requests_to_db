require 'spec_helper'

RSpec.describe Database do
  describe 'who_in_group method' do
    let(:cl) { Database.new(YAML.load_file('./config/config.yml')['db']) }

    it 'should return people for specific group' do
      result = cl.who_in_group('ruby')
      expect(result.first).to include('surname' => 'Bratanov')
      expect(result.count).to eq(2)
    end

    it 'should NOT return people for specific group' do
      expect(cl.who_in_group('invalid').count).to eq(0)
    end
  end

  describe 'group_list method' do
    let(:cl) { Database.new(YAML.load_file('./config/config.yml')['db']) }

    it 'should return the list of all groups' do
      result = cl.group_list
      expect(result).to include('group_name' => 'trading')
        .and include('group_name' => 'ruby')
      expect(result).not_to include('group_name' => 'random value')
    end
  end
end
