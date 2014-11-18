
  check_new_info = () ->
    submit_form($('#new-form'),'users',(data)->submit_success(data))

  before_login = () ->
    submit_form($('#login-form'),'users',(data) -> window.location.href = '/information/auto_home' if data.status,)

  binds = () ->
    $('#new_submit').click(check_new_info)
    $('#login-submit').click(before_login)

  $(document).ready(binds)



