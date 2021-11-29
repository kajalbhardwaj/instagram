class Company < ApplicationRecord
    
    
    validates :security, :format => {:with => /\A[A-Za-z]\w{1,8}\z/ , message: " password between 1 to 8 characters which contain only characters, numeric digits, underscore and first character must be a letter-"}



end
