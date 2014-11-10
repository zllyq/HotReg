class InformationController < ApplicationController
  def show
    @title = "在线挂号 | 医院信息维护"
    if login?
      render 'index'
    else
      redirect_to '/users/login'
    end
  end

  def provinces
    unless token?
      render json: {:status => 0,:error => 'token验证失败'}
      return false
    end

    provinces = Province.take(10)
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


  def create_hospital

    unless admin?
      render json: {:status => 0,:error => '该用户没有创建权限'}
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

end
