class User < ActiveRecord::Base

  def json
    @json
  end

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
    @json = {:status => 1}
    true

  end

private
  #校验身份证
  def check_id_card(inp)
    unless inp.length == 18
      return false
    end
    model = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2]
    last = ['1','0','x','9','8','7','6','5','4','3','2']
    num = 0

    0.upto(16) do |u|
      i = inp[u].to_i
      num += model[u] * i
    end
    num %= 11

    inp[17] == last[num]
=begin
    num = i[0] * i[6] + i[1] * i[8] + i[2] * i[9] + i[3] * i[4] + i[4] * i[7] + i[5] * i[3] +
          i[6] * i[1] + i[7] * i[0] + i[8] * i[5] + i[9] * i[2] + i[10] * i[6] + i[11] * i[8] +
          i[12] * i[9] + i[13] * i[4] + i[14] * i[7] + i[15] * i[3] + i[16] * i[1]
    i[17] == last[num % 11]
=end
  end

end
