require 'rails_helper'

feature 'Station CRUD' do
  scenario 'logged in users can create stations' do
    log_user_in(create_user)
    click_on 'My Stations'
    click_on 'Add a Station'
    fill_in 'Name', with: 'The West'
    click_on 'Create Station'
    expect(page).to have_content 'My Stations'
    expect(page).to have_content 'The West'
  end
end