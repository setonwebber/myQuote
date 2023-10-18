class Philosopher < ApplicationRecord
    # Philosophers can have many quotes, when the philosopher is destroyed, the quotes are destroyed along side.
    has_many :quote, dependent: :destroy

    # Defining full_name so i can reference later, just the first and last name of the philosopher.
    def full_name
        "#{fname} #{lname}"
    end
end
