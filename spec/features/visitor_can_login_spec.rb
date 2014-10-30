require 'spec_helper'

feature 'Visitor can login' do
  scenario 'with valid email and password' do
    login_with 'valid@example.com', 'password'

    expect(page).to have_content('Log out')
  end

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', 'password'

    expect(page).to have_content('Login')
  end

  scenario 'with blank password' do
    sign_up_with 'valid@example.com', ''

    expect(page).to have_content('Login')
  end

  def sign_up_with(email, password)
    visit sign_up_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Sign up'
  end
end
