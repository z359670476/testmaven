package com.enums;
/**
 * 模拟市场demo中市场写死信息
 * @author like
 *
 */
public enum MarkEnum {
	
	/**
	 * 模拟市场demo中市场编号
	 */
	MARKCODE("100065");
	
	private String value;
	MarkEnum(String value){
		this.value = value;
	}
	public String getValue() {
		return value;
	}

}
