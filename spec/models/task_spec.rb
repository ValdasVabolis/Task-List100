require 'rails_helper'

RSpec.describe Task, type: :model do
  subject { described_class.new }

  it 'saves when valid' do
    subject.description = 'Walk the dogs'
    expect(subject.save).to be true
  end

  describe '#description' do
    it 'is required' do
      subject.description = ''
      expect(subject.save).to be false
    end

    it 'must consist of at least 5 chars' do
      subject.description = '1234'
      expect(subject.save).to be false
    end

    it 'must be no longer than 50 chars' do
      subject.description = 'thisismoretextthanfiftycharacterswhichwedonotapprove'
      expect(subject.save).to be false
    end
  end

  describe 'complete' do
    it 'defaults to false' do
      subject.description = 'Walk the dogs'
      subject.save
      expect(subject.complete).to be false
    end
  end

  describe '#complete?' do
    it 'returns the complete value' do
      subject.complete = true
      subject.save
      expect(subject.complete?).to be true
    end
  end

  describe '#complete!' do
    it 'completes the task' do
      subject.complete = false
      expect {
        subject.complete!
      }.to change{
        subject.complete?
      }.from(false).to(true)
    end
  end
end
