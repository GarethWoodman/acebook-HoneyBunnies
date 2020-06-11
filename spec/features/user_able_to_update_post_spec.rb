require 'rails_helper'

RSpec.feature 'Update Post', type: :feature do
  scenario 'User able to update post' do
    User.create(fname: 'Jon', lname: 'Doe', email: 'john.doe@example.com', password: 'password')

    visit '/sessions/new'

    fill_in 'user[email]', with: 'john.doe@example.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Sign in'

    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'

    all(:link, 'Update Post').last.click

    fill_in 'Message', with: 'New Message!'
    click_button 'Submit'

    expect(current_path).to eq '/posts'
    expect(page).to_not have_content('Hello, world!')
    expect(page).to have_content('New Message!')
  end


  # scenario 'user is able to delete a picture' do
  #   user = User.create(fname: 'Jon', lname: 'Doe', email: 'john.doe@example.com', password: 'password')

  #   visit '/sessions/new'

  #   fill_in 'user[email]', with: 'john.doe@example.com'
  #   fill_in 'user[password]', with: 'password'
  #   click_button 'Sign in'

  #   # p '**********'
  #   # p post.images.record.id
  #   # p '***********'

  #   fill_in 'Message', with: 'Hello, world!'
  #   attach_file 'post[images][]', "#{Rails.root}/spec/files/MVC_DataB.png"
  #   click_button 'Submit'

  #   all(:link, 'Update Post').last.click

  #   click_button 'Delete'
  #   # attach_file 'post[images][]', "#{Rails.root}/spec/files/Matterhorn.jpg"
  #   click_button 'Submit'

  #   expect(current_path).to eq '/posts'
  #   expect(page).to have_content('Hello, world!')
  #   expect(page).to_not have_css(".rounded")
  # end
end
