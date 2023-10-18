class Category < ApplicationRecord
    # Each category can have multiple quotes, as its a many-to-many relation, we control this via the quote_category entity.
    has_many :quote_category, dependent: :destroy
    has_many :quote, through: :quote_category

    validates :category_name, presence: true
end
