class Employment < ApplicationRecord
  # validations
  validates_presence_of :start_date, :end_date
  #associations
  belongs_to :person
end
