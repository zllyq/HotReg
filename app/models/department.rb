class Department < ActiveRecord::Base
  belongs_to :hospital
  has_many :doctors

  def init (para)
    self.ids = para[:ids]
    self.name = para[:name]
    self.Hospital_id = para[:hospitals_id]
    self.introduction = para[:introduction]
  end

  def compare(para)
    begin
      if (para[:name] != self.name) && !(para[:name].blank?)
        self.name = para[:name]
      end
      if (para[:ids] != self.ids) && !(para[:ids].blank?)
        self.ids = para[:ids]
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
