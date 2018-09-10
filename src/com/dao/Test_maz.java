package com.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class Test_maz {
    public static void main(String[]args){
        Mazeo maz = new Mazeo();
//        String accno = "1000652018041315134411000101";
//        String selSql = "select ID from TBL_BDPP_BALANCE where MARKET_CD=? and SYS_ACCT_NO=? ";
//        ArrayList<String[]> list = maz.executeQuery(selSql,
//                new String[] { "100065", accno});
//        String id = list.get(0)[0];
//        System.out.println(id);

        String transTime = "20170614";
        String seatNo = "100065";
        String serialNo	 = "10006500";
        String transAmt	 = "100065";
        String respCode	 = "1000";
        String respMsg	 = "100065";
        String addSql = "";
        String[] param = null;
        addSql = "INSERT INTO TBL_BDPP_EBANKS_BACK (ID,TRANS_TIME,SEAT_NO,SERIAL_NO,TRANS_AMT,RESP_CODE,RESP_MSG,MARKET_CD) VALUES (SEQ_TBL_BDPP_EBANKS_BACK.NEXTVAL,?,?,?,?,?,?,100065) ";
        param = new String[] { transTime,seatNo,serialNo,transAmt,respCode,respMsg };
        Boolean f = maz.execute(addSql, param);
        System.out.println(f);

    }
}
