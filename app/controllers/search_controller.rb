class SearchController < ApplicationController
  def index
    search_query = params[:search_query]
    if search_query.present?
      @quotes = Quote.joins(:philosopher).where("quotetext LIKE ?", "%#{search_query}%")
    end
  end
end