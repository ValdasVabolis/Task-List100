require 'rails_helper'

RSpec.describe Task, type: :model do

  before :each do
    @task = Task.new
  end

  it 'can be saved when valid' do
    @task.description = 'Walk the dogs'
    expect(@task.save).to be true
  end
  it 'can be deleted' do
    @task.description = 'Walk the dogs'
    @task.save!
    expect { @task.destroy }.to change { Task.count }.by(-1)
  end
  describe '#description' do
    it 'can not be empty' do
      @task.description = ''
      expect(@task.save).to be false
    end
    it 'must consist of at least 5 chars' do
      @task.description = '12345'
      expect(@task.save).to be true
      @task.description = '1234'
      expect(@task.save).to be false
    end
    it 'must be no longer than 50 chars' do
      @task.description = 'abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwx'
      expect(@task.save).to be true
      @task.description = 'thisismoretextthanfiftycharacterswhichwedonotapprove'
      expect(@task.save).to be false
    end
  end
end
