class UserController < ApplicationController
  def create
    user = User.new(params[:user])

    if user.check
      user.save
    end

    render :json => user.json

  end

  def login
    param = params[:user]

    unless user = User.find_by username: param[:username]
      render :json => {:status => 0,:error => '用户不存在'}
      return false
    end
    unless user.passwd == Digest::MD5.hexdigest(param[:passwd])
      render :json => {:status => 0,:error => '用户名或密码输入错误'}
      #render :json => {:status => 1,:username => user.username}
      return false
    end
    unless 1 == user.status
      render :json => {:status => 0,:username => '该用户尚不能登录，请联系管理员'}
      return false
    end

    session[:user_id] = user.id
    session[:username] = user.username
    session[:name] = user.name
    session[:type] = user.type

    render :json => {:status => 1,:username => user.username}
    true
  end
end
