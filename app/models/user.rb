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

    unless check_id_card(self.id_card)
      @json = {:status => 0, :error => '身份证填写错误'}
      return false
    end
    true

  end

private
  #校验身份证
  def check_id_card(i)
    unless i.length == 18
      return false
    end

    last = ['1','0','x','9','8','7','6','5','4','3','2']
    num = i[0] * i[6] + i[1] * i[8] + i[2] * i[9] + i[3] * i[4] + i[4] * i[7] + i[5] * i[3] +
          i[6] * i[1] + i[7] * i[0] + i[8] * i[5] + i[9] * i[2] + i[10] * i[6] + i[11] * i[8] +
          i[12] * i[9] + i[13] * i[4] + i[14] * i[7] + i[15] * i[3] + i[16] * i[1]
    i[17] == last[num % 11]
  end

end
