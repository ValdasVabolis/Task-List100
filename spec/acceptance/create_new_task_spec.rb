require 'rails_helper'

RSpec.feature 'new task creation', type: :feature, js: true do
  scenario 'input task description and click add new task button' do
    visit root_path
    fill_in('Task Field', with: 'Walk the dogs')
  end
end
