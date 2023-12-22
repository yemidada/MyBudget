require 'rails_helper'

RSpec.describe 'groups/new.html.erb', type: :feature do
  let(:user) { User.create(name: 'Yemi', email: 'test@test.com', password: 'password') }
  describe 'Testing creaeing new group' do
    before :each do
      sign_in user
      visit new_group_path
    end

    context 'When creating a new group' do
      it 'should see the group name' do
        fill_in 'Name', with: 'Salary'
        attach_file('Icon', Rails.root.join('spec', 'fixtures', 'files', 'example.txt'))
        click_button 'Submit'
        expect(page).to have_text('Add new group')
        expect(current_path).to eq(groups_path)
      end
    end
  end
end
