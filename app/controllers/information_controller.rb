class InformationController < ApplicationController

  def show
    @title = "在线挂号 | 医院信息维护"
    if login?
      redirect_to '/hospital/'
    else
      redirect_to '/users/login'
    end
  end

  def edit

  end

  def provinces
    unless token?
      render json: {:status => 0,:error => 'token验证失败'}
      return false
    end

    provinces = Province.select('id','name')
    if provinces
      render json: {:status => 1,:data => provinces}
      return true
    end

    render json: {:status => 0,:error => '省份还没有呢'}
    false
  end

  def majors
    unless token?
      render json: {:status => 0,:error => 'token验证失败'}
      return false
    end

    majors = Major.select('id','name')
    if majors
      render json: {:status => 1,:data => majors}
      return true
    end

    render json: {:status => 0,:error => '还没有专业呢'}
    false
  end

  def cities
    unless token?
      render json: {:status => 0,:error => 'token验证失败'}
      return false
    end

    #cities = City.find_by :provinces_id,params[:provinces_id]
    cities = City.where("provinces_id=?", params[:provinces_id])
    if cities
      render json: {:status => 1,:data => cities}
      return true
    end

    render json: {:status => 0,:error => '还没有城市呢'}
    false
  end

  def grades
    unless token?
      render json: {:status => 0,:error => 'token验证失败'}
      return false
    end

    grades = Grade.select('id','name')
    if grades
      render json: {:status => 1,:data => grades}
      return true
    end

    render json: {:status => 0,:error => '还没有等级呢'}
    false
  end

  #@param:filter
  # name:医院名
  # provinces_id:省份id
  # cities_id:城市id
  # major_id:专业id
  # page:页数
  def hospitals(ajax = true)
    unless token?
      render json: {:status => 0,:error => 'token验证失败'}
      return false
    end

    para = params[:filter]
    _filter = conditioner(para)
    filters = _filter[0]
    condition = _filter[1]


    begin
      sql =  Hospital.where(condition,filters).limit(filters[:limit]).offset(filters[:offset]).to_sql
      hospitals = Hospital.where(condition,filters).limit(filters[:limit]).offset(filters[:offset])

      unless hospitals.empty?
        @json = {:status => 1,:data => hospitals}
        return true
      end
        @json = {:status => 0,:error => '还没有这种医院呢'}
    rescue
      @json = {:status => 0,:error => $!}
    ensure
      if ajax
        render json: @json
      end
      return hospitals
    end


  end


  #@param:filter
  # hospitals_id:所属医院
  # name:科室名称
  # page:页数
  #
  def departments
    unless token?
      render json:  {:status => 0, :error => 'token验证失败'}
      return false
    end

    para = params[:filter]
    _filer = conditioner(para)
    filters = _filer[0]
    condition = _filer[1]
    data = Department.where(condition,filters).limit(filters[:limit]).offset(filters[:offset])

    if data.empty?
      @json = {status:0,error:'没有这样的科室'}
    else
      @json = {status:1,data:data}
    end

    render json: @json
    true

  end


  #@param:filter
  # departments_id: 所属科室
  # majors_id: 所属专业
  # name: 姓名
  # grades: 等级
  # page: 页数
  def doctors
    unless token?
      render json:  {:status => 0, :error => 'token验证失败'}
      return false
    end
    para = params[:filter]
    _filter = conditioner(para)
    filters = _filter[0]
    condition = _filter[1]

    data = Doctor.where(condition,filters).limit(filters[:limit]).offset(filters[:offset])

    if data.empty?
      @json = {status:0,error:'没有这样的医生'}
    else
      @json = {status:1,data:data}
    end

    render :json => @json
  end

  def create_hospital

    unless admin?
      render json: {:status => 0,:error => '该用户没有创建权限'}
      return false
    end

    param = params[:hospitals]
    hospital = Hospital.new do |h|
      h.name = param[:name]
      h.provinces_id = param[:provinces_id]
      h.provinces_name = param[:provinces_name]
      h.cities_id = param[:cities_id]
      h.cities_name = param[:cities_name]
      h.address = param[:address]
      h.grades_id = param[:grades_id]
      h.grades_name = param[:grades_name]
      h.majors_id = param[:majors_id]
      h.majors_name = param[:majors_name]
      h.phone = param[:phone]
      h.introduction = param[:introduction]
    end

    if hospital.save
      render :json => {status:1}
    else
      render :json => {status:0,error => '保存失败'}
    end

  end

  def create_department
    unless admin?
      render json: {:status => 0,:error => '该用户没有创建权限'}
      return false
    end

    department = Department.create
    department.init(params[:departments])

    if department.save
      render :json => {:status => 1}
      return true
    end

    render :json => {:status => 0, :error => '保存失败'}
    false
  end


=begin
 @param:doctor
 doctor.ids:医生编号
 doctor.name:医生姓名
 doctor.department_id:科室id
 doctor.calendar_id:日历id
 doctor.major_id:专业id
 doctor.grade:医生等级
 doctor.introduction:医生介绍
=end
  def create_doctor
    unless admin?
      render json: {:status => 0,:error => '该用户没有创建权限'}
      return false
    end

    para = params[:doctor]

    begin
      doctor = Doctor.new
      doctor.init(para)
      @json = {:status => 1, :data => {:doctor_id => doctor.id}}
    rescue
      @json = {:status => 0, :error => '保存失败'}
    ensure
      render json: @json
    end

  end

  def edit_hospital

  end

  def edit_department

  end

  def edit_doctor

  end

  def delete_hospital

  end

  def delete_department

  end

  def delete_doctor

  end

end
