class City < ActiveRecord::Base
  has_one :province
end