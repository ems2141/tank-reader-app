require 'rails_helper'

feature 'Station CRUD' do

  before do
    user = create_user
    log_user_in(user)
  end

  scenario 'logged in users can create stations' do
    click_on 'My Stations'
    click_on 'Add a Station'
    fill_in 'Name', with: 'The West'
    click_on 'Create Station'
    expect(page).to have_content 'My Stations'
    expect(page).to have_content 'The West'
  end

  scenario 'user can edit a station' do
    create_station(name: 'The West')

    click_on 'My Stations'
    click_on 'The West'
    click_on 'Edit'
    fill_in 'Name', with: 'Sinclair'
    click_on 'Update'

    expect(page).to have_content 'Sinclair'
    expect(page).to_not have_content 'The West'
  end

  scenario 'user can destroy a station' do
    create_station(name: 'BP')
    create_station(name: 'Sinclair')

    click_on 'My Stations'
    click_on 'BP'
    click_on 'Delete'

    expect(page).to have_no_content 'BP'
    expect(page).to have_content 'Sinclair'
  end
end