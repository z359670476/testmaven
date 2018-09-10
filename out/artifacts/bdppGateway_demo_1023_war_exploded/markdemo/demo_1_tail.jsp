<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<div class="layui-form-item isHide">
        <label class="layui-form-label" style="width: 180px;">前台返回地址(frontUrl)</label>
        <div class="layui-input-inline">
            <input type="hidden" name="frontUrl"  autocomplete="off" class="layui-input" value="http://117.78.48.115:8083/cgdemo/markdemo/demo_before_back.jsp" >
            <div class="layui-form-mid layui-word-aux">http://117.78.48.115:8083/cgdemo/markdemo/demo_before_back.jsp</div>
        </div>
</div>
<div class="layui-form-item isHide">
        <label class="layui-form-label" style="width: 180px;">后台通知地址(backUrl)</label>
        <div class="layui-input-inline">
            <input type="hidden" name="backUrl"  autocomplete="off" class="layui-input" value="http://117.78.48.115:8083/cgdemo/markdemo/demo_last_back.jsp">
            <div class="layui-form-mid layui-word-aux">http://117.78.48.115:8083/cgdemo/markdemo/demo_last_back.jsp</div>
        </div>
</div>
<div class="layui-form-item" style="display: none;">
        <label class="layui-form-label" style="width: 180px;">签名(signature)</label>
        <div class="layui-input-inline">
            <input type="text" name="signature"  autocomplete="off" class="layui-input isHide">
        </div>
</div>
