package com.enums;

public enum AccountEnum {

    /**
     * 模拟市场demo中市场账号
     */
    ACCOUNT1("1000650000001");

    private String value;
    AccountEnum(String value){
        this.value = value;
    }
    public String getValue() {
        return value;
    }
}
