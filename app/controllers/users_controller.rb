class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html {
          log_in(@user, true)
          flash[:success] = "#{@user.name}, your profile has been created"
          redirect_to dashboard_path
        }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  private
  def set_user
    @user = current_user
  end

end
