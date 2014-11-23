class DepartmentsController < ApplicationController

  def show
    @active = 2
    render 'index', :layout => 'information'
  end

  def destroy
    unless admin?
      render json: {status:0,error:'没有删除权限'}
    end
    begin
      id = params['id']
      Department.destroy(id)
      @json = {status:1}
    rescue
      @json = {status:0,error:'删除失败'}
    ensure
      render json: @json
      return id
    end
  end

  def edit
    unless admin?
      render json: {status:0, error:'没有修改权限'}
      return false
    end

    para = params[:departments]
    begin
      current = Department.find(para['id'])
      current.compare(para)
      if current.save
        @json = {status:1}
      else
        @json = {status:0,error:'保存失败'}
      end

    rescue
      @json = {status:0,error:'保存失败'}
    ensure
      render json: @json
      current
    end

  end
end
