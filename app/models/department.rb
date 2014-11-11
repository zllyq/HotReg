class Department < ActiveRecord::Base
  belongs_to :hospital

  def init (para)
    self.ids = para[:ids]
    self.name = para[:name]
    self.Hospital_id = para[:hospitals_id]
    self.introduction = para[:introduction]
  end
end
