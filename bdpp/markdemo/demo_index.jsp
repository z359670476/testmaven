<%@page import="com.enums.MarkEnum"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.enums.MarkEnum"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>     
<head>
<meta charset="utf-8">
<title>存管</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="../layui/css/layui.css" media="all">
<script src="../js/jquery-3.2.1.min.js"></script>
<script src="../layui/layui.js"></script>
<script src="../js/base.js?v=1.1"></script>

</head>
<body>


	<fieldset class="layui-elem-field layui-field-title"
		style="margin-top: 20px;">
		<legend>交易所基本信息</legend>
	</fieldset>


	<form class="layui-form" style="margin-top: 20px;">
		<div class="layui-row">
			<div class="layui-col-xs6">
				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label" style="width: 120px;">市场名称：</label>
						<div class="layui-input-inline">
							<label id="MARKET_NM" class="layui-form-label"
								style="width: 120px;"></label>
						</div>
					</div>
				</div>
			</div>
			<div class="layui-col-xs6">
				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label" style="width: 120px;">市场编号：</label>
						<div class="layui-input-inline">
							<label id="MARKET_CD" class="layui-form-label"
								style="width: 120px;"></label>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="layui-row">
			<div class="layui-col-xs6">
				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label" style="width: 120px;">市场收益子账户：</label>
						<div class="layui-input-inline">
							<label id="SY_ACCT" class="layui-form-label"
								style="width: 120px;"></label>
						</div>
					</div>
				</div>
			</div>
			<div class="layui-col-xs6">
				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label" style="width: 120px;">市场轧差子账户：</label>
						<div class="layui-input-inline">
							<label id="ZC_ACCT" class="layui-form-label"
								style="width: 120px;"></label>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="layui-row">
			<div class="layui-col-xs6">
				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label" style="width: 120px;">存管账户：</label>
						<div class="layui-input-inline">
							<label id="CK_ACCT" class="layui-form-label"
								style="width: 120px;"></label>
						</div>
					</div>
				</div>
			</div>
			<div class="layui-col-xs6">
				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label" style="width: 120px;">状态：</label>
						<div class="layui-input-inline">
							<label id="STATUS" class="layui-form-label" style="width: 280px;"></label>
						</div>
					</div>
					
				</div>
			</div>
			<div class="layui-col-xs6">
				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label" style="width: 120px;">清算状态：</label>
						<div class="layui-input-inline">
							<label id="CLEARING_STATUS" class="layui-form-label" style="width: 120px;"></label>
						</div>
					</div>
					
				</div>
			</div>
			<div class="layui-col-xs6">
				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label" style="width: 120px;">投资人交易规则：</label>
						<div class="layui-input-inline">
							 <select name="ruleDemo" lay-filter="ruleDemo">
						        <option value="0">全天</option>
						        <option value="1">普通</option>
						      </select>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="layui-form-item" style="text-align: center;">
			<div class="layui-input-block" style="margin-left: -270px;">
				<button class="layui-btn" lay-submit lay-filter="Signin" style="width: 100px;">签到</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button class="layui-btn" lay-submit lay-filter="Signout" style="width: 100px;">签退</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button class="layui-btn" lay-submit lay-filter="goldin" style="width: 100px;">入金</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button class="layui-btn" lay-submit lay-filter="goldout" style="width: 100px;">出金</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button class="layui-btn" lay-submit lay-filter="clearingResult" style="width: 120px;">查询清算结果</button>
				<!--       <button type="reset" class="layui-btn layui-btn-primary">重置</button> -->
			</div>

		</div>
	</form>	

	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
	<script type="text/javascript">
	var formIndex;
	//清算报文赋值
	 $("input[name='Date']").val(new Date().pattern("yyyyMMdd"));
	  $("input[name='Time']").val(new Date().pattern("HHmmss"));
	  $("input[name='SiNum']").val(new Date().pattern("yyyyMMdd"));
	  $("input[name='BtNum']").val("0001");
	  //---------------------------------------------------------------
	  
	 
		//签到
		layui.use('form', function() {
			var form = layui.form;
			formIndex=form;
			 getData();
			form.on('submit(Signin)', function(data) {
				layer.open({
					type : 2,
					skin : 'layui-layer-lan',
					title : [ '交易市场签到', 'font-size:18px;' ],
					content : 'demo_index_Signin.jsp',
					area : [ '50%', '95%' ],
					moveOut : true,
					end : function() {
					}
				});
			
				return false;
			});

			//签退
			form.on('submit(Signout)', function(data) {
				layer.open({
					type : 2,
					skin : 'layui-layer-lan',
					title : [ '交易市场签退', 'font-size:18px;' ],
					content : 'demo_index_Signout.jsp',
					area : [ '50%', '95%' ],
					moveOut : true,
					end : function() {
					}
				});
				return false;
			});
			//入金
			form.on('submit(goldin)', function(data) {
				layer.open({
					type : 2,
					skin : 'layui-layer-lan',
					title : [ '交易市场入金', 'font-size:18px;' ],
					content : 'demo_index_goldin.jsp',
					area : [ '60%', '95%' ],
					moveOut : true,
					end : function() {
					}
				});
				return false;
			});

			//出金
			form.on('submit(goldout)', function(data) {
				layer.open({
					type : 2,
					skin : 'layui-layer-lan',
					title : [ '交易市场出金', 'font-size:18px;' ],
					content : 'demo_index_goldout.jsp',
					area : [ '60%', '95%' ],
					moveOut : true,
					end : function() {
					}
				});
				return false;
			});
			
			//清算结果
			form.on('submit(clearingResult)', function(data) {
				layer.open({
					type : 2,
					skin : 'layui-layer-lan',
					title : [ '交易市场清算结果', 'font-size:18px;' ],
					content : 'demo_index_clearingResult.jsp',
					area : [ '60%', '95%' ],
					moveOut : true,
					end : function() {
					}
				});
				return false;
			});
			
			
			form.on('select(ruleDemo)', function(data){
				$.ajax({
					url : "demo_servlet.jsp",
					type : "post",
					data : {
						method : "updRuleDemo",
						value:data.value
					},
					dataType : "json",
					success : function(res) {
						if(res.ret)
		 					layer.alert("修改成功！",{icon: 1});
						else layer.alert("修改失败！",{icon: 5});
					}

				});

			});      
			
		});
		
	  
	  
		
		  function getData(){
		  //反显
			$.ajax({
				url : "demo_servlet.jsp",
				type : "post",
				data : {
					method : "basic"
				},
				dataType : "json",
				success : function(res) {
					var s=res[0].MARK_STATUS=="0"?"签退时间":"签到时间"
					var ttime=res[0].SIGN_TIME==""?"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;":"("+s+res[0].SIGN_TIME+")";
					$("#STATUS").html(getStatu(res[0].MARK_STATUS)+ttime);
					$("#ZC_ACCT").html(res[0].ZC_ACCT);
					$("#SY_ACCT").html(res[0].SY_ACCT);
					$("#CK_ACCT").html(res[0].CK_ACCT);
					$("#MARKET_CD").html(res[0].MARKET_CD);
					$("#MARKET_NM").html(res[0].MARKET_NM);
					$("#CLEARING_STATUS").html(getclStatu(res[0].CLEARING_STATUS));
					$("select[name='ruleDemo']").val(res[0].RULE_DEMO);
					formIndex.render('select');
				}

			});
		  }
	  
	  
	  
		function getStatu(s) {
			switch (s) {

			case "1":

				return "已签到";
				break;
			case "0":

				return "已签退";
				break;
			default:
				return "";
				break;
			}
		}
		function getclStatu(s) {
			switch (s) {

			case "1":
				return "清算完成";
				break;
			case "0":
				return "未清算";
				break;
			default:
				return "";
				break;
			}
		}
	</script>

</body>
</html>