class HomeController < ApplicationController
  def index
    @quotes = Philosopher.joins(:quote).merge(Quote.order(:created_at))
  end

  def uquotes
    @quotes = Philosopher.joins(:quote).merge(Quote.where(user_id: current_user.id))
  end

  def uindex 
    user = current_user
  end
end
