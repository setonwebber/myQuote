class Quote < ApplicationRecord
  has_many :quote_category, dependent: :destroy
  has_many :category, through: :quote_category
  belongs_to :user
  belongs_to :philosopher
end
