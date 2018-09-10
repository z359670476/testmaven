<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<div class="layui-form-item isHide">
        <label class="layui-form-label" style="width: 180px;">版本号(version)</label>
        <div class="layui-input-inline">
            <input type="hidden" name="version" autocomplete="off" class="layui-input" value="1.0">
            <div class="layui-form-mid layui-word-aux">1.0</div>
        </div>
</div>
<div class="layui-form-item isHide">
        <label class="layui-form-label" style="width: 180px;">编码(encoding)</label>
        <div class="layui-input-inline">
            <input type="hidden" name="encoding"  autocomplete="off" class="layui-input" value="utf-8">
            <div class="layui-form-mid layui-word-aux">utf-8</div>
        </div>
</div>
<div class="layui-form-item isHide">
        <label class="layui-form-label" style="width: 180px;">渠道类型(channelType)</label>
        <div class="layui-input-inline">
            <input type="hidden" name="channelType"  autocomplete="off" class="layui-input" value="01">
            <div class="layui-form-mid layui-word-aux">01</div>
        </div>
</div>
<div class="layui-form-item isHide">
        <label class="layui-form-label" style="width: 180px;">交易时间(transTime)</label>
        <div class="layui-input-inline">
            <input type="text" name="transTime"  autocomplete="off" class="layui-input input-disabled" readonly style="color:#999999; border: 0px;">
        </div>
</div>
<div class="layui-form-item isHide">
        <label class="layui-form-label" style="width: 180px;">流水号(serialNo)</label>
        <div class="layui-input-inline">
            <input type="text" name="serialNo"  autocomplete="off" class="layui-input input-disabled" readonly style="color:#999999; border: 0px;">
        </div>
        <div class="layui-form-mid layui-word-aux"><i class="layui-icon" id="fresh" style="font-size: 26px; color: #1E9FFF;margin-left: 10px;">&#x1002;</i>   </div>
</div>