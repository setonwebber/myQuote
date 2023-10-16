class QuoteCategory < ApplicationRecord
  belongs_to :category
  belongs_to :quote
end
