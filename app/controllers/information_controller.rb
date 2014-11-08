class InformationController < ApplicationController
  def index
    @title = "在线挂号 | 医院信息维护"
    render 'index'
  end
end
