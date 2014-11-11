class Doctor < ActiveRecord::Base
  belongs_to :Department
  has_one :major
end
