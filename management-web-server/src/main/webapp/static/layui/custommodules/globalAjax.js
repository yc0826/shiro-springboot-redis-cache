layui.define(['layer'], function (exports) {
    var layer = layui.layer, $ = layui.jquery;
    function checkURLShowLoading(ajaxUrl){
        var index=ajaxUrl.indexOf("?");
        if(index!==-1) {
            var urlParam=ajaxUrl.substring(index+1);
            if (loadRegExp.test(urlParam)) {
                return false
            }
        }
        return true;
    }
    var loadRegExp=/^.*(showLoading)\s*=\s*false.*$/;
    $.ajaxSetup({
        cache: false,
        beforeSend: function () {
            var ajaxUrl=this.url;
            if(checkURLShowLoading(ajaxUrl)){
                this.layerIndex = layer.load(0, 1);
            }
        },
        complete: function (xhr) {
            layer.close(this.layerIndex);
            if(xhr && xhr.responseJSON && xhr.responseJSON.code === 555) {
                layer.alert(xhr.responseJSON.msg, {
                    skin: 'layui-layer-molv'
                    , closeBtn: 0
                    , shift: 4 //动画类型
                });
            }

        },
        error: function (xhr,data) {
            var sessionstatus = xhr.getResponseHeader('sessionstatus');
            if(sessionstatus === '300') {
                layer.alert("会话过期请重新登录",{
                    skin: 'layui-layer-molv'
                    , closeBtn: 0
                    , shift: 4 //动画类型
                },function(){
                    location.href = ctx;
                })
            } else if(sessionstatus === '330') {
                layer.alert("帐号被踢出请重新登录",{
                    skin: 'layui-layer-molv'
                    , closeBtn: 0
                    , shift: 4 //动画类型
                },function(){
                    location.href = ctx;
                })
            } else {
                if(xhr.status === 401) {
                    layer.alert('当前账号无法进行改操作，请联系管理员', {
                        skin: 'layui-layer-molv'
                        , closeBtn: 0
                        , shift: 4 //动画类型
                    });

                } else if(xhr.status === 400) {
                    layer.alert('提交参数有误，请联系管理员', {
                        skin: 'layui-layer-molv'
                        , closeBtn: 0
                        , shift: 4 //动画类型
                    });
                } else {
                    layer.alert('部分数据加载失败，可能会导致页面显示异常，请刷新后重试', {
                        skin: 'layui-layer-molv'
                        , closeBtn: 0
                        , shift: 4 //动画类型
                    });
                }

            }

        }
    });
    exports('globalAjax', {}); //注意，这里是模块输出的核心，模块名必须和use时的模块名一致
});