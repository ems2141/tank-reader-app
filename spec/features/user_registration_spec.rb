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

  scenario 'a user that already has an account can login' do
    User.create!(
        name: 'Jay',
        email: 'jay@example.com',
        password: 'password'
    )

    visit '/'
    click_on 'Login'
    fill_in 'Email', with: 'jay@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Login'

    expect(page).to have_content 'Welcome Jay!'
  end
end