class QuoteCategory < ApplicationRecord
    belongs_to :category
    belongs_to :quote

    validates :category_id, presence: true
end
