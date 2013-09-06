require 'spec_helper'

feature "AUTHENTICATION", :js => true do

  let(:user_name)   { "Tester"}
  let(:email)       {"test1@test.com"}
  let(:pw)    {"tester"}
  let(:register_fields) { {name: user_name, email: email, password: pw, password_confirmation: pw} }
  let(:fail_msg) { "That email/password combo didn't work" }
  before(:all) do
    User.destroy_all
  end

  scenario 'register,logout,login with valid email and password' do
    User.destroy_all
    visit "/#/registration"
    submit_form register_fields, "Register"
    page.should have_content "Hi #{user_name}"
    page.should have_content "Logout"
    click_button "Logout"
    page.should have_content "Login"
    visit "/#/login"
    login email, pw
    page.should have_content "Hi #{user_name}"
  end

  scenario 'login with valid credentials' do
    #User.create! register_fields
    User.first.email.should == email
    visit "/#/login"
    login email, pw
    page.should have_content "Hi #{user_name}"
  end

  scenario 'register with invalid email and password' do
    visit "/#/registration"
    register_fields[:email] = "xxeeegmail.com"
    submit_form register_fields, "Register"
    page.should have_content fail_msg
  end

  scenario 'login with invalid email or password' do
    visit "/#/login"
    login "guma@bearz.com", pw
    page.should have_content fail_msg
    login email, "happyburz"
    page.should have_content fail_msg
  end


  after(:all) do
    User.destroy_all
  end

  def login(email, pw)
    submit_form({email: email, password: pw}, "Login")
  end
  def submit_form(fields, button)
    fields.each_pair do |field, val|
      fill_in field, with: val
    end
    #screenshot_and_save_page
    click_button button
  end
end