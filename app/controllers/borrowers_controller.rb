class BorrowersController < ApplicationController
  
  def logout
    session[:borrow_id] = nil
    session.clear()
    redirect_to '/users/index'
  end

def create
  	@borrower = Borrower.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password], money_need: params[:money_need], description: params[:description], money: params[:money], amount_raised: 0 )
    if @borrower.valid?
      session[:borrow_id] = @borrower.id
      redirect_to "/borrowers/#{@borrower.id}"
    else
      flash[:errors] = @borrower.errors.full_messages
      redirect_to :back
    end

  end

  def show
  	@borrower = Borrower.find(params[:id])
  	@b = Borrower.all
  	@t = Transaction.where(borrower_id: @borrower.id )
  end


end
