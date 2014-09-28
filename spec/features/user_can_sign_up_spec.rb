require 'capybara_spec_helper'
require 'securerandom'

describe 'user signup', :type => :feature do
  before :each do
    visit root_path
  end

  it 'lets the user sign up' do
    expect(page).to have_content 'Welcome'

    click_link 'Sign Up'

    expect(page).to have_content 'Sign up'

    fill_in 'Email', :with => "test+#{SecureRandom.uuid}@foo.com"
    fill_in 'Password', :with => 'biteMe123'
    fill_in 'Password confirmation', :with => 'biteMe123'

    click_button 'Sign up'

    expect(page).to have_content 'Welcome'
  end
end