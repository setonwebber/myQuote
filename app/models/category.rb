class Category < ApplicationRecord
    has_many :quote_category, dependent: :destroy
    has_many :quote, through: :quote_category

    validates :category_name, presence: true
end
