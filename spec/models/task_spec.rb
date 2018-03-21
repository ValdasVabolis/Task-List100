require 'rails_helper'

RSpec.describe Task, type: :model do

  before :each do
    @task = Task.new
  end

  it 'can be saved when valid' do
    @task.description = 'Walk the dogs'
    expect(@task.save).to be true
  end
  # it 'can be deleted' do
  #   expect(@task.save).to be true
  #   expect(@task.destroy).to be true
  # end
  describe '#description' do
    it 'can not be empty' do
      @task.description = ''
      expect(@task.save).to be false
    end
  end
end
