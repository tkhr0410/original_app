class Contact < ActiveRecord::Base
    validates :content, :name, :email, :age, presence: true
end
