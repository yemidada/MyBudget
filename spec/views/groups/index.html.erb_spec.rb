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
      visit root_path
    end

    context 'When visiting to group show page' do
      it 'can see the title' do
        expect(page).to have_content('CATEGORIES')
      end

      it 'can see on the body' do
        expect(page).to have_content('Add Category')
      end
    end
  end
end
