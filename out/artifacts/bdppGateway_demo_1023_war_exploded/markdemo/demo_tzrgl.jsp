<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>投资人管理</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="../layui/css/layui.css"  media="all">
	<script src="../js/jquery-3.2.1.min.js"></script>
	<script src="../layui/layui.js"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
	<legend>投资人管理</legend>
</fieldset>
<div style="margin-left: 20px">
	<button id="invers_persion" data-method="offset" data-type="auto" class="layui-btn layui-btn-normal">新增个人投资人</button>
	<button id="invers_enterprise" data-method="offset" data-type="auto" class="layui-btn layui-btn-normal">新增企业投资人</button>

	<table class="layui-table" lay-data="{ even:true,page:true ,url:'demo_buss_servlet.jsp',limit:'10',where: {method: 'selInvestor'},method: 'post',initSort:{field:'CREATE_TIME', type:'desc'}}" lay-filter="demo">
		<thead>
		<tr>
			<%--<th lay-data="{field:'MARKET_CD', width:150, sort: true, fixed: true}">市场编号</th>--%>
			<%--<th lay-data="{field:'CK_ACCT', width:150}">市场存管账号</th>--%>
			<th lay-data="{field:'SEAT_NO', width:80}">席位号</th>
			<th lay-data="{field:'SYS_ACCT_NO', width:120}">投资人账号</th>
			<th lay-data="{field:'BANK_ACCT_NO', width:120}">银行账号</th>
			<th lay-data="{field:'INV_TYPE', width:100,templet:'#tzr_type'}">投资人类型</th>
			<th lay-data="{field:'INV_NAME', width:120}">姓名</th>
			<th lay-data="{field:'CERT_ID', width:120}">投资人证件号码</th>
			<th lay-data="{field:'COM_INSTRUMENT', width:110}">营业执照号</th>
			<th lay-data="{fixed: 'right', width:260, align:'center', toolbar: '#barDemo'}">操作</th>
		</tr>
		</thead>
	</table>

</div>
<script type="text/html" id="barDemo">
	<a class="layui-btn layui-btn-mini" lay-event="sel">
		查看<%--<i class="layui-icon">&#xe615;</i>--%>
	</a>
	<%--<a class="layui-btn layui-btn-mini" lay-event="edit">
		修改
	</a>
	<a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="del">
		删除
	</a>--%>

	<a class="layui-btn layui-btn-mini" lay-event="in">
		入金
	</a>
	<a class="layui-btn layui-btn-mini" lay-event="out">
		出金
	</a>
	<a class="layui-btn layui-btn-mini" lay-event="buy">
		买卖
	</a>
	<a class="layui-btn layui-btn-mini" lay-event="balance">
		余额
	</a>


</script>
<script type="text/html" id="status">
	{{# if(d.STATUS!=null&&d.STATUS=="0"){ }}
	启用
	{{# }else { }}
	禁止
	{{# }}}
</script>


<script type="text/html" id="tzr_type">
	{{# if(d.INV_TYPE!=null&&d.INV_TYPE=="01"){ }}
	个人投资人
	{{# }else { }}
	企业投资人
	{{# } }}
</script>

<script>
	var canCRJ;
    $.ajax({
		url : "demo_servlet.jsp",
		type : "post",
		data : {
			method : "isCRJ"
		},
		dataType : "json",
		success : function(res) {
			canCRJ=res;
		}
	});
    
    var editData;
    layui.use('table', function(){
        var table = layui.table;
        //监听表格复选框选择
        table.on('checkbox(demo)', function(obj){
            console.log(obj)
        });
        //监听工具条
        table.on('tool(demo)', function(obj){
            var data = obj.data;
            if(obj.event === 'sel'){
                editData=data;
                layer.open({
                    type: 2,
                    skin: 'layui-layer-lan',
                    title: ['投资人信息', 'font-size:18px;'],
                    content: 'demo_tzrgl_sel.jsp',
                    area: ['80%', '85%'],
                    moveOut :true,
                    end: function(){
                    }
                });

            } else if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    $.ajax({
                        type: "POST",
                        url: "demo_buss_servlet.jsp",
                        data: {method:"delInvestor",ID:data.ID},
                        dataType: "json",
                        success: function(d){
                            if(d.ret){
                                layer.msg("删除成功");
                                obj.del();
                                layer.close(index);
                            }else{
                                layer.msg("新增失败");
                            }
                        }
                    });
                });
            } else if(obj.event === 'edit'){
                editData=data;
                layer.open({
                    type: 2,
                    skin: 'layui-layer-lan',
                    title: ['投资人信息修改', 'font-size:18px;'],
                    content: 'demo_tzrgl_edit.jsp',
                    area: ['836px', '417px'],
                    moveOut :true,
                    end: function(){
                        if(editData.ret){
                            obj.update({SYS_ACCT_NO:editData.data.SYS_ACCT_NO,
                                STATUS:editData.data.STATUS});
                            editData.ret=false;
                        }
                    }
                });
            }else if(obj.event === 'in'){//入金
            	if(!canCRJ.ret) {
            		layer.alert(canCRJ.msg+",不能入金！");
            		return;
            	}
                editData=data;
                layer.open({
                    type: 2,
                    skin: 'layui-layer-lan',
                    title: [data.INV_TYPE=="01"?'个人入金':'企业B2B入金', 'font-size:18px;'],
                    content:data.INV_TYPE=="01"?'demo_20003.jsp':'demo_10006.jsp' ,
                    area: ['836px', '417px'],
                    moveOut :true
                });
            }else if(obj.event === 'out'){//出金
            	if(!canCRJ.ret){
            		layer.alert(canCRJ.msg+",不能出金！");
            		return;
            	}
                editData=data;
                layer.open({
                    type: 2,
                    skin: 'layui-layer-lan',
                    title: ['出金(企业/个人)', 'font-size:18px;'],
                    content: 'demo_20004.jsp',
                    area: ['836px', '417px'],
                    moveOut :true
                });
            }else if(obj.event === 'buy'){//买入
                editData=data;
                layer.open({
                    type: 2,
                    skin: 'layui-layer-lan',
                    title: ['新增投资人买卖信息', 'font-size:18px;'],
                    content: 'demo_tzrbuy_add.jsp',
                    area: ['836px', '417px'],
                    moveOut :true

                });
            }else if(obj.event === 'balance'){//余额查询
                editData=data;
                layer.open({
                    type: 2,
                    skin: 'layui-layer-lan',
                    title: ['余额查询', 'font-size:18px;'],
                    content: 'demo_20010.jsp',
                    area: ['836px', '417px'],
                    moveOut :true
                });
            }
        });

        /*var $ = layui.$, active = {
            getCheckData: function(){ //获取选中数据
                var checkStatus = table.checkStatus('idTest')
                    ,data = checkStatus.data;
                layer.alert(JSON.stringify(data));
            }
            ,getCheckLength: function(){ //获取选中数目
                var checkStatus = table.checkStatus('idTest')
                    ,data = checkStatus.data;
                layer.msg('选中了：'+ data.length + ' 个');
            }
            ,isAll: function(){ //验证是否全选
                var checkStatus = table.checkStatus('idTest');
                layer.msg(checkStatus.isAll ? '全选': '未全选')
            }
        };*/

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });


        $("#invers_persion").click(function(){
            layer.open({
                type: 2,
                skin: 'layui-layer-lan',
                title: ['新增个人投资人', 'font-size:18px;'],
                content: 'demo_10001.jsp',
                area: ['98%', '98%'],
                moveOut :true,
                end: function(){
                    /*if(addRet){
                        parent.$("#iframe").attr("src","jys/demo_scgl.jsp");
                    }*/
                }
            });
        });

        $("#invers_enterprise").click(function(){
            layer.open({
                type: 2,
                skin: 'layui-layer-lan',
                title: ['新增企业投资人', 'font-size:18px;'],
                content: 'demo_10002.jsp',
                area: ['98%', '98%'],
                moveOut :true,
                end: function(){
                    /*if(addRet){
                        parent.$("#iframe").attr("src","jys/demo_scgl.jsp");
                    }*/
                }
            });
        });
    });
</script>

</body>
</html>