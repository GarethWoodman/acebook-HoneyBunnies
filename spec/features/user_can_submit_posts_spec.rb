require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view them' do
    User.create(fname: 'Jon', lname: 'Doe', email: 'john.doe@example.com', password: 'password')

    visit '/sessions/new'

    fill_in 'user[email]', with: 'john.doe@example.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Sign in'

    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'

    expect(page).to have_content('Hello, world!')
  end

  scenario 'Can submit posts & image and view them' do
    User.create(fname: 'Jon', lname: 'Doe', email: 'john.doe@example.com', password: 'password')

    visit '/sessions/new'

    fill_in 'user[email]', with: 'john.doe@example.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Sign in'

    fill_in 'Message', with: 'Hello, world!'
    attach_file 'post[images][]', "#{Rails.root}/spec/files/MVC_DataB.png"
    find('[name=commit]').click
    click_button 'Submit'

    expect(page.has_css?('.rounded')).to be
  end
end
