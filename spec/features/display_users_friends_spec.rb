require 'rails_helper'

RSpec.feature 'Display Users friends', type: :feature do
  scenario 'See list of friends on user profle' do
    jon = User.create(fname: 'Jon', lname: 'Doe', email: 'john.doe@example.com', password: 'password')
    visit '/sessions/new'

    fill_in 'user[email]', with: 'john.doe@example.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Sign in'

    visit "/users/#{jon.id}"

    buggs = User.create(fname: 'Buggs', lname: 'Bunny', email: 'buggs@example.com', password: 'password')
    Friend.create(user_id: jon.id, friend_id: buggs.id)

    expect(page).to have_content('Friends')
    expect(page).to have_content('Buggs')
  end
end
