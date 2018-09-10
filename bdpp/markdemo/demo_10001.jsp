<%@ page import="com.enums.MarkEnum" %>
<%@ page import="com.enums.AccountEnum" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>存管</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../layui/css/layui.css"  media="all">
    <link rel="stylesheet" href="../css/index.css">
	<script src="../js/jquery-3.2.1.min.js"></script>
	  <script src="../js/base.js?v=1.3"></script>
    <script src="../layui/layui.js"></script>
    <script src="../js/base.js"></script>
    <style type="text/css">
        .layui-form-mid{
            margin-top:2px;
        }
    </style>
</head>
<body>

<form class="layui-form" action="http://101.231.114.246:8080/interface/market/perBindCard.do" target= "_blank" method="post">
    <label class="layui-form-label" style="width: 180px;"> </label>

    <div class="layui-form-item isHide" >
        <div class="layui-inline">
            <label class="layui-form-label" style="width: 180px;">业务代码(busiCode)</label>
            <div class="layui-input-inline">
                <input type="hidden" name="busiCode"  autocomplete="off" class="layui-input" value="10001">
                <div class="layui-form-mid layui-word-aux">10001</div>
            </div>
        </div>
    </div>

    <%@include file="demo_1_head.jsp"%>

    <div class="layui-form-item isHide">
        <div class="layui-inline">
            <label class="layui-form-label" style="width: 180px;">市场代码(marketId)</label>
            <div class="layui-input-inline">
                <input type="hidden" name="marketId" value="<%=MarkEnum.MARKCODE.getValue()%>" autocomplete="off" class="layui-input"  >
                <div class="layui-form-mid layui-word-aux"><%=MarkEnum.MARKCODE.getValue()%></div>
            </div>
        </div>
    </div>
    <div class="layui-form-item isHide">
        <div class="layui-inline">
            <label class="layui-form-label" style="width: 180px;">市场存管账号(marAcctNo)</label>
            <div class="layui-input-inline">
                <input type="hidden" name="marAcctNo" value="<%=AccountEnum.ACCOUNT1.getValue()%>" autocomplete="off" class="layui-input" >
                <div class="layui-form-mid layui-word-aux"><%=AccountEnum.ACCOUNT1.getValue()%></div>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label" style="width: 180px;">投资人席位号(seatNo)</label>
            <div class="layui-input-inline">
                <input type="text" name="seatNo"  autocomplete="off" class="layui-input" >
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label" style="width: 180px;">姓名(custName)</label>
            <div class="layui-input-inline">
                <input type="text" name="custName"  autocomplete="off" class="layui-input" >
            </div>
        </div>
    </div>
    <div class="layui-form-item isHide">
        <div class="layui-inline">
            <label class="layui-form-label" style="width: 180px;">证件类型(certificateType)</label>
            <div class="layui-input-inline">
                <input type="hidden" name="certificateType" value="01"  autocomplete="off" class="layui-input" >
            </div>
            <div class="layui-form-mid layui-word-aux">01（身份证）</div>
        </div>
    </div>
    <div class="layui-form-item">
            <label class="layui-form-label" style="width: 180px;">证件号码(certificateNum)</label>
            <div class="layui-input-inline">
                <input type="text" name="certificateNum"  autocomplete="off" class="layui-input" >
            </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label" style="width: 180px;">手机号码(phoneNum)</label>
            <div class="layui-input-inline">
                <input type="text" name="phoneNum"  autocomplete="off" class="layui-input" >
            </div>
        </div>
    </div>
    <%@include file="demo_1_tail.jsp"%>

    <div class="layui-form-item isHide" style="text-align:center;">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="save">发送个人投资人登记绑定银行卡指令</button>
        </div>
    </div>
    <div class="layui-form-item" style="text-align:center;">
		<div class="layui-input-block" style="margin-left:0px;">
			<button class="layui-btn fakesub"   >提交</button>
		</div>
	</div>
</form>

<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['form'], function(){
        var form = layui.form
            ,layer = layui.layer;

        $("input[name='transTime']").val(new Date().pattern("yyyyMMddHHmmss"));
        $("input[name='serialNo']").val(new Date().pattern("yyyyMMddHHmmss")+num());

        $("input[name='seatNo']").val("dj0001");
        $("input[name='custName']").val("杰士塔威");
        $("input[name='certificateNum']").val("330100199005301551");
        $("input[name='phoneNum']").val("18100000003");

        //监听提交
        form.on('submit(save)', function(data){
            data.field.save=true;
            $.ajax({
                url : "signature_servlet.jsp",
                type : "post",
                async : false,
                data : data.field,
                dataType : "json",
                success : function(sig) {
                    $("input[name='signature']").val(sig.signature);
                    $("form").submit();
                },
                error : function(XMLHttpRequest, textStatus, errorThrown) {
                    alert("signature fail: " + XMLHttpRequest.status + " , "
                        + XMLHttpRequest.readyState + " , " + textStatus);
                }
            });
            return false;
        });
    });
</script>

</body>
</html>