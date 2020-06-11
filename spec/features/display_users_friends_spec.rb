require 'rails_helper'

RSpec.feature 'Display Users friends', type: :feature do
  scenario 'See list of friends on user profle' do
    User.create(fname: 'Jon', lname: 'Doe', email: 'john.doe@example.com', password: 'password')
    visit '/sessions/new'

    fill_in 'user[email]', with: 'john.doe@example.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Sign in'

    buggs = User.create(fname: 'Buggs', lname: 'Bunny', email: 'buggs@example.com', password: 'password')

    visit "/users/#{buggs.id}"

    expect(page).to have_content('Friends')

    click_button 'Add Friend'
    expect(page).to have_content('Jon')

    click_button 'Remove Friend'
    expect(page).to_not have_content('Jon')
  end
end
