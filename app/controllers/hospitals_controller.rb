class HospitalsController < InformationController
  def show
    @hospitals = hospitals(false)
    @active = 1
    #here = @hospitals[1].province
    render 'index' ,:layout => 'information'
  end
=begin
  @param hospitals
  hospitals.id 医院id
  hospitals.name 名称
  hospitals.address 医院地址
  hospitals.phone 医院电话
  hospitals.introduction 医院简介
=end
  def edit
    unless admin?
      render json: {status:0,error: '没有修改权限'}
    end
    para = params[:hospitals]

    current = Hospital.find(para[:id])
    current.compare(para)

    begin
      current.save!
      @json = {status:1}
    rescue
      @json = {status: 0,error: '保存失败'}
    ensure
      render json: @json
      current
    end
  end

  def destroy
    unless admin?
      render json: {status:0, error:'没有删除权限'}
    end
    begin
      id = params[:id]
      hospital = Hospital.find(id)
      hospital.destroy!
      @json = {status:1}
    rescue
      @json = {status:0, error:'删除失败'}
    ensure
      render json: @json
      return id
    end
  end
end
