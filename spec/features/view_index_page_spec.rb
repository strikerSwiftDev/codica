require 'rails_helper'

RSpec.describe 'Home Page', type: :feature do
  let!(:user) { Admin.create!(phone: Faker::PhoneNumber.cell_phone_in_e164, password: 'password', name: Faker::Name.name) }
  before do
    Category.create!(name: 'Hematology')
    Patient.create!(phone: Faker::PhoneNumber.cell_phone_in_e164, password: 'password', name: Faker::Name.name)
    Doctor.create!(phone: Faker::PhoneNumber.cell_phone_in_e164,
                   password: 'password',
                   category: Category.all.sample,
                   name: Faker::Name.name)

  end

  context 'user not login' do
    scenario 'i see title' do
      visit root_path
      expect(page).to have_content('Log in')
      expect(page).to have_content('Sample Users:')
    end
  end

  context 'user login' do
    before(:each) do
      visit root_path
      fill_in 'user_phone', with: user.phone
      fill_in 'user_password', with: 'password'
      click_on 'commit'
    end

    scenario 'See email instead of sign in' do
      visit root_path
      expect(page).to have_content("Hello, #{user.name}")
      expect(page).to have_content('Log out')
    end
  end
end
