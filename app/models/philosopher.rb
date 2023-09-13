class Philosopher < ApplicationRecord
    has_many :quote, dependent: :destroy
end
