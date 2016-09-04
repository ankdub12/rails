class UsersController < ApplicationController
  def index
  end

  def logout
    session[:id] = nil
    session.clear()
    redirect_to '/users/index'
  end

  def create
  	@user = User.create(user_params)
    if @user.valid?
      session[:id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
    end

  end

  def new
  end

  def show
  	@user = User.find(params[:id])
    @allborrower = Borrower.all
    @transaction = Transaction.all
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :money)
  end
end
