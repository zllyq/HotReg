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
public
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
  def conditioner(para,table_name = '')
    filters = {:limit => 20,offset:0}
    condition = '1 = 1 '

    if para.nil?
      return [filters,condition]
    end

    unless para[:id].blank?
      filters[:id] = para[:id]
      if table_name.blank?
        condition += 'AND id = :id'
      else
        condition += ('AND ' + table_name + '.id = :id')
      end
      return [filters,condition]
    end

    unless para[:name].blank?
      filters[:name] = '%' + para[:name] + '%'
      if table_name.blank?
        condition += 'AND name LIKE :name '
      else
        condition += ('AND ' + table_name + '.name LIKE :name ')
      end
    end

    unless para[:provinces_id].blank?
      condition += ' AND provinces_id = :provinces_id'
      filters[:provinces_id] = para[:provinces_id].to_i
    end

    unless para[:cities_id].blank?
      condition += ' AND cities_id = :cities_id'
      filters[:cities_id] = para[:cities_id].to_i
    end

    unless para[:majors_id].blank?
      condition += ' AND majors_id = :majors_id'
      filters[:majors_id] = para[:majors_id]
    end
    unless para[:grades_id].blank?
      condition += ' AND grades_id = :grades_id'
      filters[:grades_id] = para[:grades_id]
    end

    #科室专属
    unless para[:hospitals_id].blank?
      condition += ' AND hospital_id = :hospital_id'
      filters[:hospital_id] = para[:hospitals_id]
    end
    unless para[:ids].blank?
      filters[:ids] = '%' + para[:ids] + '%'
      if table_name.blank?
        condition += 'AND ids LIKE :ids'
      else
        condition += 'AND ' + table_name + '.ids LIKE :ids'
      end
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
