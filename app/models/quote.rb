class Quote < ApplicationRecord
    # Quotes belong to the user and philosopher, both have been set so if either is destroyed, this quote will be destroyed.
    belongs_to :user
    belongs_to :philosopher
    
    # Each quote can have multiple categories, as its a many-to-many relation, we control this via the quote_category entity.
    has_many :quote_categories, dependent: :destroy
    has_many :categories, through: :quote_categories

    # Accepting nested attributes for the quote_params in quotes_controller.
    accepts_nested_attributes_for :quote_categories, reject_if: :all_blank, allow_destroy: true
end
