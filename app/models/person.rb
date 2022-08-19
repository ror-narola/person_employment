class Person < ApplicationRecord
  #validations
  validates_presence_of :firstname, :lastname, :email, :phone

  #associations
  has_one :employment
end
