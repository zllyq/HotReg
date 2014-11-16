/**
 * Created by wanzy on 14/11/16.
 */
$.ajax({
    url:'/information/hospitals',
    type:'POST',
    dataType:'json',
    data:{
        filter:{
            name:"万家"
        }
    },
    async:true,
    success: function (data) {
        console.log(data)
    },
    error:function(a,b,c){
        console.log(a+b+c)
    }

})