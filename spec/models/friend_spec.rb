require 'rails_helper'

RSpec.describe Friend, type: :model do
  it "Friendship of jon and buggs" do
    jon = User.create(fname: 'jon', lname: 'doe', email: 'john.doe@example.com', password: 'password')
    buggs = User.create(fname: 'buggs', lname: 'bunny', email: 'buggs@example.com', password: 'password')

    # Friendship is a two way street so we need to establish the link twice
    Friend.create(user_id: jon.id, friend_id: buggs.id)
    Friend.create(user_id: buggs.id, friend_id: jon.id)

    expect(jon.friends.first.friend).to eq buggs
    expect(buggs.friends.first.friend).to eq jon
  end
end
