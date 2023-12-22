require 'rails_helper'

RSpec.describe 'entities/new.html.erb', type: :feature do
  let(:user) { User.create(name: 'Yemi', email: 'test@test.com', password: 'password') }
  describe 'Testing createing new entity' do
    before :each do
      sign_in user
      visit new_entity_path
    end

    context 'When creating a new entity' do
      it 'should see the entity name' do
        fill_in 'Name', with: 'Execise'
        fill_in 'Amount', with: 20
        find_field(id: 'group_id', type: :hidden).set('5')
        click_button 'Submit'
        expect(page).to have_text('Add new transaction')
        expect(current_path).to eq(group_path(5))
      end
    end
  end
end
