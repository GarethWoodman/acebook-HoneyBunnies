require 'rails_helper'

feature 'User can like posts', type: :feature do
  scenario 'liking a post' do
    # signs the user in
    User.create(fname: 'Jon', lname: 'Doe', email: 'john.doe@example.com', password: 'password')

    visit '/sessions/new'

    expect(page).to have_content 'Log in'

    fill_in 'user[email]', with: 'john.doe@example.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Sign in'

    visit '/posts'

    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'

    expect(page).to have_content 'Likes: 0'

    all(:button, 'Like Post').last.click
    expect(page).to have_content 'Likes: 1'

    all(:button, 'Unlike Post').last.click
    expect(page).to have_content 'Likes: 0'
  end
end
