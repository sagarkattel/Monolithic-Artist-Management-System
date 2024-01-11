# app/controllers/user_controller.rb
class UserController < ApplicationController
  before_action :require_login, only: [:index, :edit, :update, :destroy]
  def new
    @user = User.new
  end

  def index
    @user=User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Signup successful"
      redirect_to login_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]="User is successfully updated"
      redirect_to user_index_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user=User.find(params[:id])
    if @user.destroy
      flash[:notice] = "User Deleted Successfully"
      redirect_to user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :dob, :phone, :gender, :address)
  end

end
