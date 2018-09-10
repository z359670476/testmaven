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

<form class="layui-form" action="http://101.231.114.246:8080/interface/market/comB2B.do" target= "_blank" method="post">
    <label class="layui-form-label" style="width: 180px;"> </label>
    <div class="layui-form-item isHide">
            <label class="layui-form-label" style="width: 180px;">业务代码(busiCode)</label>
            <div class="layui-input-inline">
                <input type="hidden" name="busiCode"  autocomplete="off" class="layui-input" value="10006">
                <div class="layui-form-mid layui-word-aux">10006</div>
            </div>
    </div>
    <%@include file="demo_1_head.jsp"%>

    <div class="layui-form-item ">
            <label class="layui-form-label" style="width: 180px;">交易金额(transAmt)</label>
            <div class="layui-input-inline">
                <input type="text" name="transAmt" value="100"  autocomplete="off" class="layui-input clear">

            </div>
            <div class="layui-form-mid layui-word-aux">单位：分</div>
    </div>
    <div class="layui-form-item isHide">
            <label class="layui-form-label" style="width: 180px;">市场代码(marketId)</label>
            <div class="layui-input-inline">
                <input type="hidden" name="marketId"  autocomplete="off" class="layui-input clear" style="width: 300px;" >
                <div id="marketId_text" class="layui-form-mid layui-word-aux">01</div>
            </div>
    </div>
    <div class="layui-form-item isHide">
            <label class="layui-form-label" style="width: 180px;">资金账号 (acctNo)</label>
            <div class="layui-input-inline">
                <input type="hidden" name="acctNo"  autocomplete="off" class="layui-input clear" style="width: 300px;" >
                <div id="acctNo_text" class="layui-form-mid layui-word-aux">01</div>
            </div>
    </div>
    <%@include file="demo_1_tail.jsp"%>

    <div class="layui-form-item isHide" style="text-align:center;">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="save">发送企业B2B入金指令</button>
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


        $("input[name='marketId']").val(parent.editData.MARKET_CD);
        $("#marketId_text").text(parent.editData.MARKET_CD);

        $("input[name='acctNo']").val(parent.editData.SYS_ACCT_NO);
        $("#acctNo_text").text(parent.editData.SYS_ACCT_NO);

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