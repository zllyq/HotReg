class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def login?
    session['login?']
  end

  def token?
    token = params[:token]
    true
  end

  def admin?
    return false unless true == login?
    session['types'] > 1
  end

  def auto_home
    unless session['login?']
      redirect_to '/users/login_show'
      return false
    end

    case session['types']
      when 1
        redirect_to '/index'
      when 2
        redirect_to '/information'
      when 3
        redirect_to '/information'
      else
        redirect_to '/index'
    end

  end

protected
  def conditioner(para)
    filters = {:limit => 5,offset:0}
    condition = '1 = 1 '

    if para.nil?
      return [filters,condition]
    end

    unless para[:name].blank?
      filters[:name] = '%' + para[:name] + '%'
      condition += 'AND name LIKE :name '
    end

    unless para[:provinces_id].blank?
      condition += ' AND provinces_id = :province_id'
      filters[:provinces_id] = para[:provinces_id]
    end

    unless para[:cities_id].blank?
      condition += ' AND cities_id = :cities_id'
      filters[:cities_id] = para[:cities_id]
    end

    unless para[:majors_id].blank?
      condition += ' AND majors_id = :majors_id'
      filters[:majors_id] = para[:majors_id]
    end

    #科室专属
    unless para[:hospitals_id].blank?
      condition += ' AND hospital_id = :hospital_id'
      filters[:hospital_id] = para[:hospitals_id]
    end

    #医院专属
    unless para[:departments_id].blank?
      condition += ' AND department_id = :majors_id'
      filters[:department_id] = para[:departments_id]
    end

    filters[:limit] = 5
    if para[:page].blank?
      filters[:offset] = 0
    else
      filters[:offset] = (para[:page].to_i - 1) * filters[:limit]
    end

    [filters,condition]
  end
end
