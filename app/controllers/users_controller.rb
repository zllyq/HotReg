class UsersController < ApplicationController
  protect_from_forgery with: :null_session

  def create_show
    @title = '在线挂号|注册'
    render 'new'
  end

  def login_show
    @title = '在线挂号|登录'
    render 'login'
  end


  def create
    para = params[:users]


    user = User.new do |u|
      u.username = para[:username]
      u.passwd = Digest::MD5.hexdigest(para[:passwd])
      u.name = para[:name]
      u.email = para[:email]
      u.id_card = para[:id_card]
      u.phone = para[:phone]

    end

    if user.check
      user.save
    end

    render json: user.json

  end


  def login
    param = params[:users]

    unless User.exists? username: param[:username]
      render :json => {:status => 0,:error => '用户不存在'}
      return false
    end
    user = User.find_by_username param[:username]
    unless user.passwd == Digest::MD5.hexdigest(param[:passwd])
      render :json => {:status => 0,:error => '用户名或密码输入错误'}
      return false
    end

    unless 1 == user.status
      render :json => {:status => 0,:username => '该用户尚不能登录，请联系管理员'}
      return false
    end

    session[:login?] = true
    session[:user_id] = user.id
    session[:username] = user.username
    session[:name] = user.name
    session[:types] = user.types

    render json: {:status => 1,:username => [user.username]}
    true
  end


  def current_user
    if session[:login]
      render json: {:status => 1,:data => session}
    else
      render json: {:status => 0, :error => '用户未登录'}
    end
  end

  def redirect_user

  end
end
