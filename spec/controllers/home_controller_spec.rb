require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  it { should route(:get, root_path).to(action: :index) }
end
