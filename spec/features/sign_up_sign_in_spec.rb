require File.dirname(__FILE__) + '/acceptance_helper'


feature 'signing up' do

  scenario 'as an anonymous user, I can register the service filling up a form, and be logged in immediately' do
    visit '/'
    click_sign_up_link
    fill_sign_up_form_with user_credentials

    expect(current_path).to eq dashboard_path(User.last)
  end
end

feature 'signing in' do
  let!(:user) { create(:user, user_credentials.merge(password_confirmation: 'secr3tp4ssword')) }

  scenario 'as an already registered user, I can sign in an access my own page' do
    visit '/'
    click_sign_in_link
    fill_sign_in_form_with user_credentials
    expect(current_path).to eq dashboard_path(user)
  end
end

private

def user_credentials
  { email: 'johndoe@example.org', password: 'secr3tp4ssword' }
end

def click_sign_up_link
  click_link I18n.t('user.sign_up'), match: :first
end

def click_sign_in_link
  click_link I18n.t('user.sign_in'), match: :first
end

def fill_sign_up_form_with credentials
  within '#new_user' do
    fill_in 'user[email]', with: credentials[:email]
    fill_in 'user[password]', with: credentials[:password]
    fill_in 'user[password_confirmation]', with: credentials[:password]
    find('input[type=submit]').click
  end
end

def fill_sign_in_form_with credentials
  within '#new_user' do
    fill_in 'user[email]', with: credentials[:email]
    fill_in 'user[password]', with: credentials[:password]
    find('input[type=submit]').click
  end
end
