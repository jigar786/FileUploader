class UserFilesController < ApplicationController
  before_action :authenticate_user!

  def create
    @user_files = current_user.user_files.build(userfiles_params)
    if @user_files.save
      redirect_to users_home_path
    else
      redirect_to root_url
    end
  end

  def destroy
    UserFile.find_by(id: params[:id]).destroy

    redirect_to users_home_path
  end

  def download
    user_file = UserFile.find(params[:id])

    if user_file && current_user.user_files.exists?(params[:id])
      send_file user_file.file_name.path
    else
      redirect_to users_home_path
    end
    # send_file(user_file.file_name, :disposition => "attachment", :url_based_filename => true)
  end

  private

  def userfiles_params
    params.require(:user_files).permit(:file_name)
  end
end
