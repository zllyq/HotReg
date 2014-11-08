###ajax请求###
ajax_post = (url = '#', data = null, success = null, error = null, debug = false) ->
  success_function = (data) ->
    if debug
      console.log(data)

    success()

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
get_form_data = (form) ->
  inputs = form.find 'input'
  result = {}
  for i in inputs
    result[i.attr 'name'] = i.val()
  result

###提交表单数据###
submit_form = (form,url = form.attr 'action', success = null, error) ->
  ajax_post url, get_form_data(form), success, error





