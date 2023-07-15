
require 'rspec'

RSpec.describe 'User', type: :model do
  subject { User.new(name: 'John', photo: '', bio: 'user bio text') }
  before { subject.save }

  it 'Name should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  after { subject.save }
  it 'user_recent_posts should be length one' do
    expect(subject.user_recent_posts.length).to eq(1)
  end
end
