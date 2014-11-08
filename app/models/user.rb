class User < ActiveRecord::Base
  def check
    if User.exists?(username:self.username)
      @json = {:status => 0, :error => '用户名已存在'}
      return false
    end
    if User.exists? email:self.email
      @json = {:status => 0, :error => '该邮箱被占用'}
      return false
    end
    unless self.email =~ /^\w+@([a-z]+\.)+[a-z]+$/i
      @json = {:status => 0, :error => '邮箱格式错误'}
      return false
    end
    if User.exists? phone:self.phone
      @json = {:status => 0, :error => '电话号码已被占用'}
      return false
    end
    unless self.phone =~ /^\+?\d+$/
      @json = {:status => 0, :error => '电话号码填写错误'}
      return false
    end

    if User.exists? id_card:self.id_card
      @json = {:status => 0, :error => '身份证号被占用'}
      return false
    end

    unless check_id_card
      @json = {:status => 0, :error => '身份证填写错误'}
      return false
    end
    true

  end

private
  def check_id_card
    true
  end

end
