require 'rails_helper'
RSpec.describe 'Entity', type: :request do
  let(:user) { User.create(name: 'Ola', email: 'test@test.com', password: 'password') }
  let(:group) do
    file = File.open(Rails.root.join('spec', 'fixtures', 'files', 'example.txt'))
    Group.create(name: 'Salary', icon: file)
  end
  let(:entity) do
    Entity.create(author_id: user.id, name: 'Indomine', amount: 10, group_id: group.id)
  end

  describe 'GET /entities/new' do
    before :each do
      sign_in user
      get new_entity_path
    end
    it 'should returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'should render New' do
      expect(response).to render_template(:new)
    end
  end
end
