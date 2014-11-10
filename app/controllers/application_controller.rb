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
  end

  def admin?
    session['type'] > 1
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
end
