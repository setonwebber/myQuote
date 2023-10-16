class HomeController < ApplicationController
  def index
    @quotes = Quote.joins(:philosopher).take(5)
  end

  def uquotes
    @quotes = Quote.joins(:philosopher).merge(Quote.where(user_id: current_user.id))
  end

  def uindex 
    user = current_user
  end
end
