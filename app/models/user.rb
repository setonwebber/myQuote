class User < ApplicationRecord
    has_secure_password
    
    def full_name
        "#{fname} #{lname}"
    end
    
    has_many :quote, dependent: :destroy
end
