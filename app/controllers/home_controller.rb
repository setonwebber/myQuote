class HomeController < ApplicationController
  def index
  end

  def uquotes
    @quotes = Quote.where(user_id: session[:user_id])
  end
end
