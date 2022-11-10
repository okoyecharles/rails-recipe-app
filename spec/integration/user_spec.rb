require 'rails_helper'

RSpec.feature User, type: :feature do
  background { visit new_user_session_path }
  scenario 'Page should have users names' do
    @user1 = User.create(name: 'Charles', email: 'charles@gmail.com', password: '123456', confirmed_at: Time.now)
    @user2 = User.create(name: 'Okoye', email: 'okoye@gmail.com', password: '123456', confirmed_at: Time.now)
    @user3 = User.create(name: 'Bright', email: 'bright@gmail.com', password: '123456', confirmed_at: Time.now)
    within 'form' do
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
    end
    click_button 'Log in'
    expect(page).to have_content 'Charles'
    expect(page).to have_content 'Okoye'
    expect(page).to have_content 'Bright'
  end
end
