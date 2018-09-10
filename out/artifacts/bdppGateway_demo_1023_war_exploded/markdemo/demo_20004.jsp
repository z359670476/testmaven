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
  <style type="text/css">
    .layui-form-mid{
      margin-top:2px;
    }
  </style>
</head>
<body>

<form class="layui-form"  method="post">
    <label class="layui-form-label" style="width: 180px;"> </label>
  <div class="layui-form-item isHide">
    <label class="layui-form-label" style="width: 180px;">版本号(Version)</label>

    <div class="layui-input-inline">
      <input type="hidden" name="Version" autocomplete="off" class="layui-input" value="1.0.0">
    </div>
    <div class="layui-form-mid layui-word-aux">1.0.0</div>
  </div>
  <div class="layui-form-item isHide" >
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">业务代码(BusCd)</label>
      <div class="layui-input-inline">
        <input type="hidden" name="BusCd"  autocomplete="off" class="layui-input" value="20004">
        <div class="layui-form-mid layui-word-aux">20004</div>
      </div>
    </div>
  </div>
  <div class="layui-form-item isHide">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">交易日期(Date)</label>
      <div class="layui-input-inline">
        <input type="text" name="Date"  autocomplete="off" class="layui-input input-disabled" readonly style="color:#999999; border: 0px;">
      </div>
    </div>
  </div>
  <div class="layui-form-item isHide">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">交易时间(Time)</label>
      <div class="layui-input-inline">
        <input type="text" name="Time"  autocomplete="off" class="layui-input input-disabled" readonly style="color:#999999; border: 0px;">
      </div>
    </div>
  </div>
  <div class="layui-form-item isHide">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">流水号(FtSeq)</label>
      <div class="layui-input-inline">
        <input type="text" name="FtSeq"  autocomplete="off" class="layui-input input-disabled" readonly style="color:#999999; border: 0px;">
      </div>
      <div class="layui-form-mid layui-word-aux"><i class="layui-icon" id="fresh2" style="font-size: 26px; color: #1E9FFF;margin-left: 10px;">&#x1002;</i>   </div>
    </div>
  </div>
  <div class="layui-form-item isHide">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">市场代码(MarketId)</label>
      <div class="layui-input-inline">
        <input type="hidden" name="MarketId"  autocomplete="off" class="layui-input">
        <div id="MarketId_text" class="layui-form-mid layui-word-aux"></div>
      </div>
    </div>
  </div>
  <div class="layui-form-item isHide">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">投资人席位号(SeatNo)</label>
      <div class="layui-input-inline">
        <input type="hidden" name="SeatNo"  autocomplete="off" class="layui-input">
        <div id="SeatNo_text" class="layui-form-mid layui-word-aux"></div>
      </div>
    </div>
  </div>
  <div class="layui-form-item isHide">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">市场存管账号(MarAcctNo)</label>
      <div class="layui-input-inline">
        <input type="hidden" name="MarAcctNo"  autocomplete="off" class="layui-input">
        <div id="MarAcctNo_text" class="layui-form-mid layui-word-aux"></div>
      </div>
    </div>
  </div>
  <div class="layui-form-item isHide">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">投资人子账户号(SubAcctNo)</label>
      <div class="layui-input-inline">
        <input type="hidden" name="SubAcctNo"  autocomplete="off" class="layui-input">
        <div id="SubAcctNo_text" class="layui-form-mid layui-word-aux"></div>
      </div>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label" style="width: 180px;">交易金额(TrfAmt)</label>
      <div class="layui-input-inline">
        <input type="text" name="TrfAmt" value="100" autocomplete="off" class="layui-input">
      </div>
      <div class="layui-form-mid layui-word-aux">单位：分</div>
    </div>
  </div>

  <div class="layui-form-item isHide" style="text-align:center;">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="save">发送企业/个人投资人出金指令</button>
    </div>
  </div>
  <div class="layui-form-item" style="text-align:center;">
		<div class="layui-input-block" style="margin-left:0px;">
			<button class="layui-btn fakesub"   >提交</button>
		</div>
	</div>
</form>

<div class="layui-form-item layui-form-text " style="display:none;">
  <label class="layui-form-label" style="width: 180px;">发送报文为：</label>
  <div class="layui-input-block">
    <textarea id="send" class="layui-textarea"></textarea>
  </div>
</div>
<div class="layui-form-item layui-form-text " style="display:none;">
  <label class="layui-form-label" style="width: 180px;">收到的报文为：</label>
  <div class="layui-input-block">
    <textarea  id="recver" class="layui-textarea"></textarea>
  </div>
</div>

<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['form'], function(){
        var form = layui.form
            ,layer = layui.layer;

        $("input[name='Date']").val(new Date().pattern("yyyyMMdd"));
        $("input[name='Time']").val(new Date().pattern("HHmmss"));
        $("input[name='FtSeq']").val(new Date().pattern("yyyyMMddHHmmss")+num());

        $("input[name='MarketId']").val(parent.editData.MARKET_CD);
        $("#MarketId_text").text(parent.editData.MARKET_CD);
        $("input[name='MarAcctNo']").val(parent.editData.CK_ACCT);
        $("#MarAcctNo_text").text(parent.editData.CK_ACCT);
        $("input[name='SubAcctNo']").val(parent.editData.SYS_ACCT_NO);
        $("#SubAcctNo_text").text(parent.editData.SYS_ACCT_NO);
        $("input[name='SeatNo']").val(parent.editData.SEAT_NO);
        $("#SeatNo_text").text(parent.editData.SEAT_NO);

        //监听提交
        form.on('submit(save)', function(data){
            data.field.save=true;
            data.field.action="20004";
            $.ajax({
                url : "../demo/demo_buss_servlet.jsp",
                type : "post",
                async : false,
                data : data.field,
                dataType : "text",
                success : function(res) {
                    $("#send").val(res.split("|***|")[0].trim());
                    $("#recver").val(res.split("|***|")[1].trim());
                    //console.log(res.split("|***|")[1].trim())
                    layer.alert(res.split("|***|")[3].trim());
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