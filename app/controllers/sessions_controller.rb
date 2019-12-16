class SessionsController < ApplicationController
  before_action :dev_env_only, only: [:dev_login]

  def dev_login
    cookies.permanent[:auth_token] = User.first.auth_token
    redirect_to User.first
  end


  def new
  end

  def create
    @user = User.authenticate(params[:login], params[:password])
    if @user
      @user.update_token if @user.auth_token.nil? # stay logged in on multiple devices/browsers
      if params[:remember_me]
        cookies.permanent[:auth_token] = @user.auth_token
      else
        cookies[:auth_token] = @user.auth_token
      end
      cookies.permanent[:logged_in_before] = true
      cookies.permanent[:human] = true
      # records current time for last visit
      record_last_visit
      # redirects to home with notice
      redirect_to root_url, notice: notice
    else
      redirect_to :back, notice: "Invalid username, email, or password"
    end
  end

  def destroy
    if current_user
      # destroys all sessions
      current_user.update_token
      cookies.delete(:auth_token)
    end

    redirect_to sessions_new_path
  end

  def destroy_all_other_sessions
    if current_user
      current_user.update_token
      # destroys all other sessions but this one
      cookies[:auth_token] = current_user.auth_token
    end
    redirect_to :back
  end

  private

  def dev_env_only
    unless Rails.env.development?
      redirect_to '/404'
    end
  end
end
