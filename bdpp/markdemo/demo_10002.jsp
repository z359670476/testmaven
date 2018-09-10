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

<form class="layui-form" action="http://101.231.114.246:8080/interface/market/comBindCard.do" target= "_blank" method="post">
            <label class="layui-form-label" style="width: 180px;"> </label>

    <div class="layui-form-item isHide">
        <div class="layui-inline">
            <label class="layui-form-label" style="width: 180px;">业务代码(busiCode)</label>
            <div class="layui-input-inline">
                <input type="hidden" name="busiCode"  autocomplete="off" class="layui-input" value="10002">
                <div class="layui-form-mid layui-word-aux">10002</div>
            </div>
        </div>
    </div>
    <%@include file="demo_1_head.jsp"%>


    <div class="layui-form-item isHide">
        <div class="layui-inline">
            <label class="layui-form-label" style="width: 180px;">市场代码(marketId)</label>
            <div class="layui-input-inline">
                <input type="hidden" name="marketId" value="<%=MarkEnum.MARKCODE.getValue()%>" autocomplete="off" class="layui-input clear" style="width: 300px;" >
                <div class="layui-form-mid layui-word-aux"><%=MarkEnum.MARKCODE.getValue()%></div>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label" style="width: 180px;">投资人席位号(seatNo)</label>
            <div class="layui-input-inline">
                <input type="text" name="seatNo"  autocomplete="off" class="layui-input clear" style="width: 300px;">
            </div>
        </div>
    </div>
    <div class="layui-form-item isHide">
        <div class="layui-inline">
            <label class="layui-form-label" style="width: 180px;">市场存管账号(marAcctNo)</label>
            <div class="layui-input-inline">
                <input type="hidden" name="marAcctNo" value="<%=AccountEnum.ACCOUNT1.getValue()%>" autocomplete="off" class="layui-input clear" style="width: 300px;">
                <div class="layui-form-mid layui-word-aux"><%=AccountEnum.ACCOUNT1.getValue()%></div>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label" style="width: 180px;">企业名称(entName)</label>
            <div class="layui-input-inline">
                <input type="text" name="entName"  autocomplete="off" class="layui-input clear" style="width: 300px;">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label" style="width: 180px;">营业执照号(busiLiceNo)</label>
            <div class="layui-input-inline">
                <input type="text" name="busiLiceNo"  autocomplete="off" class="layui-input clear" style="width: 300px;">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label" style="width: 180px;">税务登记证号(taxRegCertNo)</label>
            <div class="layui-input-inline">
                <input type="text" name="taxRegCertNo"  autocomplete="off" class="layui-input clear" style="width: 300px;">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label" style="width: 180px;">组织机构代码(organCode)</label>
            <div class="layui-input-inline">
                <input type="text" name="organCode"  autocomplete="off" class="layui-input clear" style="width: 300px;">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label" style="width: 180px;">电子邮箱(email)</label>
            <div class="layui-input-inline">
                <input type="text" name="email"  autocomplete="off" class="layui-input clear" style="width: 300px;">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label" style="width: 180px;">法人姓名(legalName)</label>
            <div class="layui-input-inline">
                <input type="text" name="legalName"  autocomplete="off" class="layui-input clear" style="width: 300px;">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label" style="width: 180px;">法人身份证号(legalCardId)</label>
            <div class="layui-input-inline">
                <input type="text" name="legalCardId"  autocomplete="off" class="layui-input clear" style="width: 300px;">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label" style="width: 180px;">企业注册地址(regAddr)</label>
            <div class="layui-input-inline">
                <input type="text" name="regAddr"  autocomplete="off" class="layui-input clear" style="width: 300px;">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label" style="width: 180px;">联系人姓名(contactName)</label>
            <div class="layui-input-inline">
                <input type="text" name="contactName"  autocomplete="off" class="layui-input clear" style="width: 300px;">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label" style="width: 180px;">联系人电话(contactPhone)</label>
            <div class="layui-input-inline">
                <input type="text" name="contactPhone"  autocomplete="off" class="layui-input clear">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label" style="width: 180px;">联系人手机号(telephone)</label>
            <div class="layui-input-inline">
                <input type="text" name="telephone"  autocomplete="off" class="layui-input clear">
            </div>
        </div>
    </div>

    <%@include file="demo_1_tail.jsp"%>




    <div class="layui-form-item isHide" style="text-align:center;">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="save">发送企业投资人登记绑卡指令</button>
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

        $("input[name='seatNo']").val("dj0045");
        $("input[name='entName']").val("北京中景筑业装饰装潢设计有限公司 ACR( 脱敏 )");
        $("input[name='busiLiceNo']").val("11110000000");
        $("input[name='taxRegCertNo']").val("22220000000");
        $("input[name='organCode']").val("33330000000");
        $("input[name='email']").val("nxd00000@163.com");
        $("input[name='legalName']").val("张一");
        $("input[name='legalCardId']").val("341126197709218462");
        $("input[name='regAddr']").val("北京丹棱街13号");
        $("input[name='contactName']").val("张一");
        $("input[name='contactPhone']").val("13100000015");
        $("input[name='telephone']").val("13100000015");

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