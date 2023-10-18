class HomeController < ApplicationController
  before_action :require_login, except: [:index]

  def index
    # Creating a variable @quote that contains all the details that we will be referencing on the index page referencing quotes, including their categories and the author. Only taking 5 (of the most recently created.)
    @quotes = Quote.joins(:philosopher, :quote_categories, :categories).distinct.take(5)
  end

  def uquotes
        # Creating a variable @quote that contains all the details that we will be referencing on the your quotes page, only merging quotes that contain the current user's user_id, as only their quotes will be shown.
    @quotes = Quote.joins(:philosopher, :quote_categories, :categories).distinct.merge(Quote.where(user_id: current_user.id))
  end
end
