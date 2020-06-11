require 'rails_helper'

RSpec.feature 'Delete Post', type: :feature do
  scenario 'User able to delete post' do
    User.create(fname: 'Jon', lname: 'Doe', email: 'john.doe@example.com', password: 'password')
    visit '/sessions/new'

    fill_in 'user[email]', with: 'john.doe@example.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Sign in'

    fill_in 'Message', with: 'Hello, world!'
    attach_file 'post[images][]', "#{Rails.root}/spec/files/MVC_DataB.png"
    click_button 'Submit'

    all(:button, 'Delete Post').last.click

    expect(page).to_not have_content('Hello, world!')
  end
end
