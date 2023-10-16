class HomeController < ApplicationController
  def index
    @philosopher = Philosopher.joins(:quote).merge(Quote.order(:created_at))
  end

  def uquotes
    @quotes = Quote.where(user_id: session[:user_id])
  end

  def uindex 
    user = current_user
  end
end
