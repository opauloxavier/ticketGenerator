class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.welcome_email(@user).deliver_later
      render 'show'
    else
      if User.find_by_email(@user.email)
        UserMailer.welcome_email(@user).deliver_now
        render 'show'
      else
        render 'new'
      end
    end
  end

  private
      def user_params
        params.require(:user).permit(:name, :email, :password,
                                     :password_confirmation,:phone,:preference,:inclusion,:gender,:ticket)
      end
end
