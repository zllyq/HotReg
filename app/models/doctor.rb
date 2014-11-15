class Doctor < ActiveRecord::Base
  belongs_to :department
  belongs_to :major
  has_one :calendar

  validates :name, presence: true, message:'请输入医生名字'
  validates :ids, uniqueness: true, message:'医生编号已存在'


  def init(para)
    department = Department.find (para[:department_id])
    major = Major.find para[:major_id]

    self.ids = para[:ids]
    self.name = para[:name]
    self.department = department

    self.grade = para[:grade]
    self.introduction = para[:introduction]
    self.major = major
    self.save
    self.create_calendar(access:para[:access], types:para[:calendar_type])
  end

end
