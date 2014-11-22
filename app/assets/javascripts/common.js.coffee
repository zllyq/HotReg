
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
      $('#success-alerter').show()
      setTimeout(() ->
                  $('#success-alerter').hide(500)
      ,3000 )

  ###用id初始化表单###
  @init_form_with_id = (form,map,url,id,container = 'filter') ->
    data = {}
    data[container] = {id:id}
    ajax_post(url,data,(data) -> init_form_with_object(form,map,data.data[0]))

  ###用对象初始化表单####
  @init_form_with_object = (form,map,object) ->
    for k,v of object
      if k in map
        form.find('input[name='+ map[k] +'] ' + ', textarea[name='+ map[k] +']').val(v)
      else
        form.find('input[name=' + k + ']' + ', textarea[name=' + k + ']').val(v)


  ###默认用对象###
  @init_form = (form,map,object) ->
    init_form_with_object(form,map,object)

  @test = () ->
    alert('cak')