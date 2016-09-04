class TransactionsController < ApplicationController
  def index
  	    @user = User.find(session[:id])
	  	    if @user.money == 0
	  	    	flash[:bad] = ["Account balance is 0, cannot lend money"]
				redirect_to :back
			else
		  	    amount = params[:transaction_amount]
		  	    borrower_id = params[:borrower_id]

				@trans = Transaction.create(user_id: params[:user_id] , borrower_id: borrower_id, transaction_amount: amount)

			
				@newbalance = @user.money - amount.to_i
		        User.update(session[:id], money: @newbalance.to_i)

		        @borrower = Borrower.find(@trans.borrower_id)
				@newbalanceof = @borrower.amount_raised + amount.to_i
		        Borrower.update(@trans.borrower_id, amount_raised: @newbalanceof.to_i)
				redirect_to :back
				
			end

  	end	

end
