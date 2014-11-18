
  ###ajax请求###
  @ajax_post = (url = '#', data = null, success = submit_success, error = null, debug = true) ->
    success_function = success

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
  @get_form_data = (form,name) ->
    inputs = form.find('input,textarea')
    result = {}

    for i in inputs
      result[i.name] = i.value

    selects = form.find('select')
    selects.each () ->
      result[$(this).attr('name')+ '_name'] = $(this).val()
      result[$(this).attr('name') + '_id'] = $(this).data('id')

    for_re = {}
    for_re[name] = result
    for_re

  ###提交表单数据###
  @submit_form = (form,names, success = null, error = null,url = form.attr 'action') ->
    ajax_post url, get_form_data(form,names), success, error

  ###提交成功###
  @submit_success = (data) ->
    console.log(data)
    unless data.status
      $('#alert-info').html data.error
      $('#error-alerter').show()
    else
      #$('#success-alerter').show()
      setTimeout(() ->
                  $('#success-alerter').hide(500)
      ,3000 )

  @test = () ->
    alert('cak')