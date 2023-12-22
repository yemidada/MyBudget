require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  let(:user) { User.create(name: 'Ola', email: 'test@test.com', password: 'password') }
  let(:group) do
    file = File.open(Rails.root.join('spec', 'fixtures', 'files', 'example.txt'))
    Group.new(name: 'Salary', icon: file)
  end

  describe 'GET /groups/new' do
    before :each do
      sign_in user
      get new_group_path
    end

    it 'returns http success' do
      expect(response.status).to be 200
    end

    it 'should render the correct template' do
      expect(response).to render_template(:new)
    end
  end
end
