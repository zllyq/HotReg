class UserController < ApplicationController
  def create
    user = User.new(params[:user])

    if user.check
      user.save
    end

    render :json => user.json

  end
end
