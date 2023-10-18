class User < ApplicationRecord
    # Bcrypt has_secury_password function.
    has_secure_password
    
    # Defining full_name so i can reference later, just the first and last name of the user.
    def full_name
        "#{fname} #{lname}"
    end
    
    # Users can have many quotes, when the user is destroyed, the quotes are destroyed along side.
    has_many :quote, dependent: :destroy
end
