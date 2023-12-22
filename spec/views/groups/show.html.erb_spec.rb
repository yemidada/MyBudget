require 'rails_helper'

RSpec.describe 'groups/show.html.erb', type: :feature do
  let(:user) { User.create(name: 'Ola', email: 'test@test.com', password: 'password') }
  let(:group) do
    file = File.open(Rails.root.join('spec', 'fixtures', 'files', 'example.txt'))
    Group.new(name: 'Salary', icon: file)
  end

  before { user.save! }
  before { group.save! }

  describe 'Testing integration specs for groups show page' do
    before :each do
      login_as(user, scope: :user)
      visit group_path(group)
    end

    context 'When visiting to group show page' do
      it 'can see the title' do
        expect(page).to have_content(group.name)
      end

      it 'can see on the body' do
        expect(page).to have_content('Add Transaction')
      end
    end
  end
end
