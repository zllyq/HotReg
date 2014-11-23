class Hospital < ActiveRecord::Base
  belongs_to :grade
  belongs_to :province
  belongs_to :city
  has_many :departments

  def compare para
    begin
      if (para[:name] != self.name) && !(para[:name].blank?)
        self.name = para[:name]
      end
      if (para[:address] != self.address) && !(para[:address].blank?)
        self.address = para[:address]
      end
      if (para[:phone] != self) && !(para[:phone].blank?)
        self.phone = para[:phone]
      end
      if (para[:introduction] != self) && !(para[:introduction].blank?)
        self.introduction = para[:introduction]
      end
      true
    rescue
      false
    end
  end
end
