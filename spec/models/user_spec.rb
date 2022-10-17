require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    subject(:user) { described_class.new }
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:phone) }
    it { should allow_value('+1234567890').for(:phone) }
    # it { should allow_value('+abc67890').for(:phone) }
  end
end
