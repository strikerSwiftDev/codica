require 'rails_helper'

RSpec.describe HomeController, type: :request do
  include Devise::Test::IntegrationHelpers
  describe '#index' do
    let(:user) { Admin.create!(phone: Faker::PhoneNumber.cell_phone_in_e164, password: 'password', name: Faker::Name.name) }

    before { sign_in user }

    it '#index' do
      get '/'
      expect(response).to render_template(:index)
      expect(response).to have_http_status(:ok)
    end
  end
end
