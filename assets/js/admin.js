$(function(){
    $('.left').css('height', $('.right').innerHeight());
   
    var strUrl=window.location.href;
    var arrUrl=strUrl.split("/");
    var page=arrUrl[arrUrl.length-1];
   
    var a = $(".am-panel .am-list").find("a")
    
    for (var i=0;i<a.length;i++){
        
        var arrUrl=a[i].href.split("/");
        href = arrUrl[arrUrl.length-1];
        if(href==page){
            a[i].parentNode.className='active'
             a[i].parentNode.parentNode.classList.add("am-list","am-collapse","admin-sidebar-sub","am-in")
        }
    }
})