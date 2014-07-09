require 'rails_helper'

feature 'Tanks' do

  before do
    @user = create_user
    log_user_in(@user)
  end

  scenario 'user can create a tank associated with a station' do
    create_station(user_id: @user.id,
                   name: 'Sinclair')

    visit '/stations'
    click_on 'Sinclair'
    click_on 'Add Tank'

    fill_in 'Name', with: 'Tank 1'
    click_on 'Create Tank'

    expect(page).to have_content 'Sinclair'
    expect(page).to have_content 'Tank 1'
  end
end