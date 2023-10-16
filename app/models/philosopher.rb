class Philosopher < ApplicationRecord
    has_many :quote, dependent: :destroy

    def full_name
        "#{fname} #{lname}"
    end
end
