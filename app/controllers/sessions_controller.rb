class SessionsController < ApplicationController
  def new
  	redirect_to '/users/index'
  end

  def login
  	@user = User.find_by_email(params[:email])
    @borrower = Borrower.find_by_email(params[:email])
  		if @user && @user.authenticate(params[:password])
  			session[:id] = @user.id
  			redirect_to "/users/#{@user.id}"
      elsif @borrower && @borrower.authenticate(params[:password])
        session[:borrow_id] = @borrower.id
        redirect_to "/borrowers/#{@borrower.id}"
      else
  			flash[:errors] = ["Invalid"]
  			redirect_to "/sessions/new"
  		end
  end
    
end




