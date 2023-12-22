require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:group) do
    file = File.open(Rails.root.join('spec', 'fixtures', 'files', 'example.txt'))
    Group.new(name: 'Salary', icon: file)
  end

  before { group.save! }

  it 'Name should be present' do
    group.name = nil
    expect(group).to_not be_valid
  end

  it 'uploads a file' do
    expect(group.icon).to be_present
  end
end
