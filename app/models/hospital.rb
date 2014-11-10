class Hospital < ActiveRecord::Base
  has_one :grade
  has_one :province
  has_one :city
end
