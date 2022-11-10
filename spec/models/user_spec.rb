require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'Test user', email: 'test@example.com', confirmed_at: Time.now, password: '123456')
  end

  before { subject.save }

  it 'should be valid' do
    expect(subject).to be_valid
  end

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
