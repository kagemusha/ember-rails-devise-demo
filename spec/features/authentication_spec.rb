require 'spec_helper'

feature "AUTHENTICATION", :js => true do

  let(:user_name)   { "Tester"}
  let(:email)       {"test@test.com"}
  let(:pw)    {"tester"}
  let(:register_fields) { {name: user_name, email: email, password: pw, password_confirmation: pw} }

  scenario 'register,logout,login with valid email and password', :driver => :webkit do
    visit "/#/registration"
    submit_form register_fields, "Register"
    page.should have_content "Hi #{user_name}"
    page.should have_content "Logout"
    click_button "Logout"
    page.should have_content "Login"
    visit "/#/login"
    submit_form({email: email, password: pw}, "Login")
    page.should have_content "Hi #{user_name}"
  end

  #this is failing even though works in above test
  #user seems to be created, screenshot (see submit_form) seems ok
  #so not sure what's amiss
  scenario 'login with valid credentials', :driver => :webkit do
    User.create! register_fields
    User.first.email.should == email
    visit "/#/login"
    submit_form({email: email, password: pw}, "Login")
    page.should have_content "Hi #{user_name}"
  end

  #scenario 'with invalid email' do
  #  sign_up_with 'invalid_email', 'password'
  #
  #  expect(page).to have_content('Sign in')
  #end
  #
  #scenario 'with blank password' do
  #  sign_up_with 'valid@example.com', ''
  #
  #  expect(page).to have_content('Sign in')
  #end

  def submit_form(fields, button)
    fields.each_pair do |field, val|
      fill_in field, with: val
    end
    #screenshot_and_save_page
    click_button button
  end
end