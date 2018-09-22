require 'rails_helper'

RSpec.feature "Welcomes", type: :feature do
  scenario 'Show welcome message' do
    visit(root_path)
    expect(page).to have_content('Welcome!')
  end

  scenario 'Verify link to create customers' do
    visit(root_path)
    # expect(page).to have_selector('ul li a')
    # expect(page).to have_link('Create a customer')
    expect(find('ul li')).to have_link('Create a customer')
  end
end
