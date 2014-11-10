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
    unless login?
      render json: {:status => 0,:error => '用户未登录'}
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

  def create_hospital

    unless admin?
      render json: {:status => 0,:error => '该用户没有创建权限'}
    end

    param = params[:hospital]
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
