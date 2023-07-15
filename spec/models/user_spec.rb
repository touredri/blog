require 'rails_helper'

describe User, type: :model do
  subject { User.new(name: 'Kalan', photo: 'photo.url', bio: 'Professor', posts_counter: 0) }

  before { subject.save }

  it 'should be valid' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'check if posts_counter is greater than or equal to 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'expects posts_counter to be an integer' do
    subject.posts_counter = 'one'
    expect(subject).to_not be_valid
  end

  it 'check user_recent_posts method does not return more than 3 recent posts' do
    expect(User.user_recent_posts(subject).length).to be <= 3
  end
end