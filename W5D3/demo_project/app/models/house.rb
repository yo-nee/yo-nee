class House < ApplicationRecord
    validates :address, presence: true
    
#  first argument is # the name of association,
# second argument is an option # hash.

  has_many :residents,   
  primary_key: :id,   
  foreign_key: :house_id,
  class_name: :Person
end