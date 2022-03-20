class UsersController < ApplicationController
  def index
    @user = current_user
    @book = Book.new
    @users = User.find(current_user.id)
    @books = @users.books
  end

  def show
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if  @user.update(user_params)
      redirect_to users_path, notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
