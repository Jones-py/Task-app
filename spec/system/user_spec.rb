require 'rails_helper'
RSpec.describe 'User registration/login/logout function', type: :system do

  describe 'User registration' do
    context 'befor the user is logged in' do
      it 'should sign up new user' do
        visit new_user_path
        fill_in 'name', with: 'job'
        fill_in 'email', with: 'job@gmail.com.com'
        fill_in 'password', with: 'password'
        fill_in 'password_confirmation', with: 'password'
        click_on 'Create account'
        expect(page).to have_content 'job'
        expect(page).to have_content 'job@gmail.com'
      end
      it 'redirect to login screen when not logged in' do
        visit tasks_path
        expect(current_path).to eq new_session_path
        expect(current_path).not_to eq tasks_path
        expect(page).to have_content 'Login'
      end
    end
  end
  describe "Session login" do
    before do
      @user = FactoryBot.create(:user)
      @admin_user = FactoryBot.create(:admin_user)
    end
    context "If the user is logged in" do
      it "should navigate to user details page" do
        visit new_session_path
        fill_in 'session_email', with: 'blex@gmail.com'
        fill_in 'session_password', with: 'password'
        click_button 'Login'
        expect(current_path).to eq user_path(id: @user.id)
      end

      it 'should see your profile page' do
        visit new_session_path
        fill_in 'session_email', with: 'blex@gmail.com'
        fill_in 'session_password', with: 'password'
        click_button 'Login'
        expect(page).to have_content 'blex@gmail.com'
      end

      it 'navigating to other user profile will return you to the tasks list screen' do
        visit new_session_path
        fill_in 'session_email', with: 'blex@gmail.com'
        fill_in 'session_password', with: 'password'
        click_button 'Login'
        visit user_path(id: @admin_user.id)
        expect(current_path).to eq tasks_path
      end

      it 'should not be able to access the management screen' do
        visit new_session_path
        fill_in 'session_email', with: 'blex@gmail.com'
        fill_in 'session_password', with: 'password'
        click_button 'Login'
        visit admin_users_path
        expect(page).to_not have_content 'Users'
      end

      it 'should be able to log out' do
        visit new_session_path
        fill_in 'session_email', with: 'blex@gmail.com'
        fill_in 'session_password', with: 'password'
        click_button 'Login'
        click_on 'Logout'
        expect(page).to have_content 'logged out'
      end
    end
  end

end
