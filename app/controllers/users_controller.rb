class UsersController < ApplicationController
  before_action :authenticate_user!, except: %i[home]

  def home
    if current_user
      @files = current_user.user_files
    else
      redirect_to new_user_registration_path
    end
  end

  def create
  end

  def show
  end

  # def destroy
  #   sign_out(:user)
  # end
end
