class SearchController < ApplicationController
  def index
    search_query = params[:search_query]
    search_option = params[:search_option]

    if search_query.present?
      if search_option == "category"
        #If the search_option is category, search the search_query inside all quotes categories.
        @quotes = Quote.joins(:philosopher, :quote_categories, :categories).distinct.where("categories.category_name LIKE ?", "%#{search_query}%")
      elsif search_option == "quote"
        #If the search_option is quote, search the search_query inside all quotes text.
        @quotes = Quote.joins(:philosopher, :quote_categories, :categories).distinct.where("quotes.quotetext LIKE ?", "%#{search_query}%")
      else
        #If the search_option is philosopher, search the search_query inside all quotes philosopher.
        # I tried just using philosopher.full_name as I defined that in the philosopher model, but i kept getting an error for that. So i had to do a weird work around.
        @quotes = Quote.joins(:philosopher, :quote_categories, :categories).distinct.where("philosophers.fname || ' ' || philosophers.lname LIKE ?", "%#{search_query}%")
      end
    end
  end
end
