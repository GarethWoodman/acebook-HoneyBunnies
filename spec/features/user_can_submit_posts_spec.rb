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

  scenario 'User able to see profile image next to the post' do
    User.create(fname: 'Jon', lname: 'Doe', email: 'john.doe@example.com', password: 'password')

    visit '/'

    fill_in 'user[fname]', with: 'John'
    fill_in 'user[lname]', with: 'Doe'
    fill_in 'user[email]', with: 'john@example.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    attach_file 'user[image]', "#{Rails.root}/spec/files/MVC_DataB.png"
    find('[name=commit]').click

    expect(current_path).to eq '/sessions/new'

    fill_in 'user[email]', with: 'john.doe@example.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Sign in'

    expect(current_path).to eq '/posts'

    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'

    expect(current_path).to eq '/posts'

    expect(page).to have_content('Hello, world!') 
    # expect(page).to have_css(".rounded-circle")
  end
end
