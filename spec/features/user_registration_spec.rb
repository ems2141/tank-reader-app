require 'rails_helper'

feature 'user registration' do
  scenario 'user can register with name, email, and password' do
    visit '/'
    click_on 'Create an Account'
    fill_in 'Name', with: 'Jay'
    fill_in 'Email', with: 'jay@test.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Create Account'

    expect(page).to have_content 'Welcome Jay!'
  end
end