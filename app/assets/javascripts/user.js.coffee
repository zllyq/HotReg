###ajax请求###
ajax_post = (url = '#', data = null, success = null, error = null, debug = true) ->
  success_function = (data) ->
    if debug
      console.log(data)

    success(data)

  $.ajax(
    {
      url:url
      data:data
      async:true
      type:'POST'
      dataType:'json'
      success: (data) -> success_function(data)
      error: (a,b,c) -> console.log a+b+c
    }
  )

###获取表单数据###
get_form_data = (form,name) ->
  inputs = form.find('input')
  result = {}

  for i in inputs
    result[i.name] = i.value
  for_re = {}
  for_re[name] = result
  for_re

###提交表单数据###
submit_form = (form,names, success = null, error = null,url = form.attr 'action') ->
  ajax_post url, get_form_data(form,names), success, error

###提交成功###
submit_success = (data) ->
  console.log(data)
  unless data.status
    $('#alert-info').html data.error
    $('#error-alerter').show()

check_new_info = () ->
  submit_form($('#new-form'),'users',(data)->submit_success(data))

before_login = () ->
  submit_form($('#login-form'),'users',(data)->submit_success(data))

$('#new_submit').click(check_new_info)
$('#login-submit').click(before_login)

