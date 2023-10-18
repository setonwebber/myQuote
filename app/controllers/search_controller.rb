class SearchController < ApplicationController
  def index
    # Search_query is set by the search_query in the sessions/index view. 
    search_query = params[:search_query]
    # Search_query is set by the search_option in the sessions/index view. 
    search_option = params[:search_option]

    # When search_query is entered.
    if search_query.present?
      if search_option == "category"
        #If the search_option is category, search the search_query inside all quotes categories.
        #Set the @quotes variable to all the quotes that were found with that criteria. These will be displayed.
        @quotes = Quote.joins(:philosopher, :quote_categories, :categories).distinct.where("categories.category_name LIKE ?", "%#{search_query}%")
      elsif search_option == "quote"
        #If the search_option is quote, search the search_query inside all quotes text.
        #Set the @quotes variable to all the quotes that were found with that criteria. These will be displayed.
        @quotes = Quote.joins(:philosopher, :quote_categories, :categories).distinct.where("quotes.quotetext LIKE ?", "%#{search_query}%")
      else
        # If the search_option is philosopher, search the search_query inside all quotes philosopher.
        # I tried just using philosopher.full_name as I defined that in the philosopher model, but i kept getting an error for that. So i had to do a weird work around.
        #Set the @quotes variable to all the quotes that were found with that criteria. These will be displayed.
        @quotes = Quote.joins(:philosopher, :quote_categories, :categories).distinct.where("philosophers.fname || ' ' || philosophers.lname LIKE ?", "%#{search_query}%")
      end
    end
  end
end
