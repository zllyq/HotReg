/**
 * Created by wanzy on 14/11/14.
 */
data = {"department_id":"1",
    "major_id":"1",
    "ids":"001",
    "name":"万昭祎",
    "access":"1",
    "calendar_type":"1",
    "grade":"专家",
    "introduction":"厉害呢"
};

$.ajax({
    url:'/information/create_doctor',
    type:'POST',
    async:false,
    dataType:'json',
    success:function(){alert(1)},
    data:{'doctor':data}
})
