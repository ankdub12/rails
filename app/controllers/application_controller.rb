class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    User.find(session[:id]) if session[:id]
  end

def current_borrower
	Borrower.find(session[:borrow_id]) if session[:borrow_id]
	
end

  helper_method :current_user
  helper_method :current_borrower

end
