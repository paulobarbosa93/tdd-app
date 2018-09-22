require 'rails_helper'

RSpec.feature "Customers", type: :feature do
  scenario 'Verify link Create a customer' do
    visit(root_path)
    expect(page).to have_link('Create a customer')
  end

  scenario 'Verify click in link Create a customer' do
    visit(root_path)
    click_on('Create a customer')
    expect(page).to have_content('List of customers')
    expect(page).to have_link('New customer')
  end

  scenario 'Verify form of new customer' do
    visit(customers_path)
    click_on('New customer')
    expect(page).to have_content('New customer')
  end

  scenario 'Create a valid customer' do
    visit(new_customer_path)
    fill_in('Name', with: Faker::Name.name)
    fill_in('Email', with: Faker::Internet.email)
    fill_in('Phone', with: Faker::PhoneNumber.phone_number)
    choose(option: ['S', 'N'].sample)
    click_on('Create customer')

    expect(page).to have_content('Customer successfully created')
  end

  scenario 'Show a customer' do
    customer = Customer.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      smoker: ['S', 'N'].sample
    )

    visit(customer_path(customer))

    expect(page).to have_content(customer.name)
  end
end
