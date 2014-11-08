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
      return '邮箱填写错误'
    end
    if User.exists? phone:self.phone
      return '电话号码被占用'
    end
    unless self.phone =~ /^\+?\d+$/
      return '电话号码填写错误'
    end

    if User.exists? id_card_number:self.id_card_number
      return '身份证号已存在'
    end
    unless check_id_card
      return
    end
    true

  end

end
