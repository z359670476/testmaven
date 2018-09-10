<%@page import="com.util.CacheManage"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.util.ApacheHttpClientUtil"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="com.enums.MarkEnum"%>
<%@page import="com.util.GZipUtils"%>
<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Date"%>
<%@page import="org.apache.commons.lang.time.DateFormatUtils"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@page import="com.dao.Mazeo"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.util.SockedClientUtil"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.util.DomUtils"%>
<%@page import="org.dom4j.Element"%>
<%@page import="org.dom4j.DocumentHelper"%>
<%@page import="org.dom4j.Document"%>
<%@page import="bdpp.onl.sdk.BdppUtil"%>
<%@page import="com.util.BDDateUtil"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Map"%>
<%@page import="java.io.File"%>
<%@page import="com.demo.FTPdemo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String macPass = "123456789";
 	/* String macPass="12345qwert"; *///12345qwert
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	String action = request.getParameter("action");
	Map<String, String[]> map = request.getParameterMap();
	
	System.out.println(action);
	
	for (Entry<String, String[]> en : map.entrySet()) {
		System.out.println(en.getKey() + ":" + en.getValue()[0]);
		if(en.getKey().equals("MarketId")&&en.getValue()[0].equals("100037"))
			macPass="12345qwert";
		/* if(en.getKey().equals("MarketId")&&en.getValue()[0].equals("100078"))
			macPass="12345qwert"; */
		if(en.getKey().equals("MarketId")&&en.getValue()[0].equals("100038"))
			macPass="12345qwert";
	
	}
//	String host = "";
//	int port = 9999;
	String host = "101.231.114.246";
	int port = 11000;
	Mazeo maz = new Mazeo();
	if ("20003".equals(action)) {
		String Version = request.getParameter("Version");//
		String BusCd = request.getParameter("BusCd");//"20003";
		String MarketId = request.getParameter("MarketId");//"100036";
		String Date = request.getParameter("Date");// BDDateUtil.getCurrentDateyyyyMMdd();//"20170614";
		String Time = request.getParameter("Time");// BDDateUtil.getCurrentDateTimeHHmmss();//"175548";

		String FtSeq = request.getParameter("FtSeq");//BDDateUtil.getCurrentDateFtSeq();//"20170613175548915767";
		String SeatNo = request.getParameter("SeatNo");//"dj0001";
		String MarAcctNo = request.getParameter("MarAcctNo");//"1000360000001";
		String SubAcctNo = request.getParameter("SubAcctNo");//"1000362017032717250801000101";
		String TrfAmt = request.getParameter("TrfAmt");//"10000";

		String macHexStr = BdppUtil.encodeHmacMD5((BusCd + "|" + MarketId + "|" + Date + "|" + FtSeq + "|"
				+ SeatNo + "|" + MarAcctNo + "|" + SubAcctNo + "|" + TrfAmt).getBytes(), macPass.getBytes());
		//	System.out.println("16进制字符串格式的mac计算结果: " + macHexStr);
		String Mac = macHexStr;
		//	创建Document对象
		Document document = DocumentHelper.createDocument();
		// 创建根节点
		Element rss = document.addElement("MsgText");
		// 创建channel子节点
		Element channel = rss.addElement("GrpHdr");
		channel.addElement("Version").addText(Version);
		channel.addElement("BusCd").addText(BusCd);
		channel.addElement("MarketId").addText(MarketId);
		channel.addElement("Date").addText(Date);
		channel.addElement("Time").addText(Time);
		rss.addElement("FtSeq").addText(FtSeq);
		rss.addElement("Mac").addText(Mac);
		rss.addElement("SeatNo").addText(SeatNo);
		rss.addElement("MarAcctNo").addText(MarAcctNo);
		rss.addElement("SubAcctNo").addText(SubAcctNo);
		rss.addElement("TrfAmt").addText(TrfAmt);

		DomUtils domu = new DomUtils();
		String xmlString = domu.xmlFormatPrint(document);

		String strLen = String.valueOf(xmlString.length());
		strLen = StringUtils.leftPad(strLen, 6, '0');
		xmlString = strLen + xmlString;
		if (map.containsKey("save")) {
			String addSql = "insert into TBL_BDPP_TRANS_FLOW (ID, MARKET_CD, CK_ACCT, SEAT_NO, TRANS_TP,SUB_TRANS_TP,SERIAL_NO,TRANS_DT,TRANS_TIME,TRANS_AT,TRANS_CURR_CD,SYS_ACCT_NO,CHANNEL_TP,BANK_ACCT_NO,BANK_ABBR,BANK_NM,     IS_DEL, STATUS, CREATE_TIME, REMARK) values (SEQ_BDPP_TRANS_FLOW.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,0,?,sysdate,'') ";
			String[] param = new String[] { MarketId, MarAcctNo, SeatNo, BusCd, "01", FtSeq, Date, Time, TrfAmt,
					"156", SubAcctNo, "01", "", "", "", "0" };
			System.out.println(Arrays.toString(param));
			if (maz.execute(addSql, param)) {
				System.out.println(BusCd + "加入数据成功....." + SeatNo);
			} else
				System.out.println(BusCd + "加入数据失败....." + SeatNo);
		}
		SockedClientUtil scu = new SockedClientUtil();
		String responseXml = scu.ConnectScoket(host, port, xmlString);

		//解析xml
		String code = "";
		String info = "";
		Document doc = DocumentHelper.parseText(responseXml.substring(6, responseXml.length()));
		Element root = doc.getRootElement();
		Element eData = root.element("Rst");
		Iterator itData = eData.elementIterator();
		while (itData.hasNext()) {
			Element eBuss = (Element) itData.next();//buss 条数循环
			if ("Code".equals(eBuss.getName()))
				code = eBuss.getText();
			else if("Info".equals(eBuss.getName()))
				info = eBuss.getText();
		}

		String resXmlString = domu.xmlFormatPrint(doc);
		out.println(new String((xmlString + "|***|" + resXmlString + "|***|" + code + "|***|" + info).getBytes(), "UTF-8"));

		if (code.equals("0000"))
			code = "1";
		else
			code = "2";

		if (map.containsKey("save")) {
			String updSql = "update TBL_BDPP_TRANS_FLOW set STATUS=? where SERIAL_NO=?";
			if (maz.execute(updSql, new String[] { code, FtSeq })) {
				System.out.println(FtSeq + "修改流水状态成功-为：" + code);
			} else
				System.out.println(FtSeq + "修改流水状态失败-为：" + code);
		}

	} else if ("20004".equals(action)) {

		String Version = request.getParameter("Version");
		String BusCd = request.getParameter("BusCd");
		String MarketId = request.getParameter("MarketId");
		String Date = request.getParameter("Date");// BDDateUtil.getCurrentDateyyyyMMdd();//"20170614";
		String Time = request.getParameter("Time");// BDDateUtil.getCurrentDateTimeHHmmss();//"175548";

		String FtSeq = request.getParameter("FtSeq");//BDDateUtil.getCurrentDateFtSeq();//"20170613175548915767";
		String SeatNo = request.getParameter("SeatNo");//"dj0001";
		String MarAcctNo = request.getParameter("MarAcctNo");//"1000360000001";
		String SubAcctNo = request.getParameter("SubAcctNo");//"1000362017032717250801000101";
		String TrfAmt = request.getParameter("TrfAmt");//"10000";

		String macHexStr = BdppUtil.encodeHmacMD5((BusCd + "|" + MarketId + "|" + Date + "|" + FtSeq + "|"
				+ SeatNo + "|" + MarAcctNo + "|" + SubAcctNo + "|" + TrfAmt).getBytes(), macPass.getBytes());
		//	System.out.println("16进制字符串格式的mac计算结果: " + macHexStr);
		String Mac = macHexStr;
		//	创建Document对象
		Document document = DocumentHelper.createDocument();
		// 创建根节点
		Element rss = document.addElement("MsgText");
		// 创建channel子节点
		Element channel = rss.addElement("GrpHdr");
		channel.addElement("Version").addText(Version);
		channel.addElement("BusCd").addText(BusCd);
		channel.addElement("MarketId").addText(MarketId);
		channel.addElement("Date").addText(Date);
		channel.addElement("Time").addText(Time);
		rss.addElement("FtSeq").addText(FtSeq);
		rss.addElement("Mac").addText(Mac);
		rss.addElement("SeatNo").addText(SeatNo);
		rss.addElement("MarAcctNo").addText(MarAcctNo);
		rss.addElement("SubAcctNo").addText(SubAcctNo);
		rss.addElement("TrfAmt").addText(TrfAmt);

		DomUtils domu = new DomUtils();
		String xmlString = domu.xmlFormatPrint(document);

		String strLen = String.valueOf(xmlString.length());
		strLen = StringUtils.leftPad(strLen, 6, '0');
		xmlString = strLen + xmlString;

		if (map.containsKey("save")) {
			String selSql = "select INV_TYPE from TBL_BDPP_INVESTOR where MARKET_CD=? and SEAT_NO=? ";
			ArrayList<String[]> list = maz.executeQuery(selSql, new String[] { MarketId, SeatNo });
			String subBusCd = "";
			if (list != null && list.size() > 0)
				subBusCd = list.get(0)[0];
			String addSql = "insert into TBL_BDPP_TRANS_FLOW (ID, MARKET_CD, CK_ACCT, SEAT_NO, TRANS_TP,SUB_TRANS_TP,SERIAL_NO,TRANS_DT,TRANS_TIME,TRANS_AT,TRANS_CURR_CD,SYS_ACCT_NO,CHANNEL_TP,BANK_ACCT_NO,BANK_ABBR,BANK_NM,     IS_DEL, STATUS, CREATE_TIME, REMARK) values (SEQ_BDPP_TRANS_FLOW.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,0,?,sysdate,'') ";
			String[] param = new String[] { MarketId, MarAcctNo, SeatNo, BusCd, subBusCd, FtSeq, Date, Time,
					TrfAmt, "156", SubAcctNo, "01", "", "", "", "0" };
			System.out.println(Arrays.toString(param));
			if (maz.execute(addSql, param)) {
				System.out.println(BusCd + "加入数据成功....." + SeatNo);
			} else
				System.out.println(BusCd + "加入数据失败....." + SeatNo);
		}

		SockedClientUtil scu = new SockedClientUtil();
		String responseXml = scu.ConnectScoket(host, port, xmlString);

		//解析xml
		String code = "";
		String info = "";
		Document doc = DocumentHelper.parseText(responseXml.substring(6, responseXml.length()));
		Element root = doc.getRootElement();
		Element eData = root.element("Rst");
		Iterator itData = eData.elementIterator();
		while (itData.hasNext()) {

		    Element eBuss = (Element) itData.next();//buss 条数循环
			if ("Code".equals(eBuss.getName()))
				code = eBuss.getText();
			else if("Info".equals(eBuss.getName()))
			    info = eBuss.getText();

		}

		String resXmlString = domu.xmlFormatPrint(doc);

		out.println(new String((xmlString + "|***|" + resXmlString + "|***|" + code + "|***|" + info).getBytes(), "UTF-8"));

		if (code.equals("0000"))
			code = "1";
		else
			code = "2";

		if (map.containsKey("save")) {
			String updSql = "update TBL_BDPP_TRANS_FLOW set STATUS=? where SERIAL_NO=?";
			if (maz.execute(updSql, new String[] { code, FtSeq })) {
				System.out.println(FtSeq + "修改流水状态成功-为：" + code);
			} else
				System.out.println(FtSeq + "修改流水状态失败-为：" + code);
		}
	} else if ("20007".equals(action)) {

		String Version = request.getParameter("Version");
		String BusCd = request.getParameter("BusCd");
		String MarketId = request.getParameter("MarketId");
		String Date = request.getParameter("Date");// BDDateUtil.getCurrentDateyyyyMMdd();//"20170614";
		String Time = request.getParameter("Time");// BDDateUtil.getCurrentDateTimeHHmmss();//"175548";

		String SiNum = request.getParameter("SiNum");//"20170614";
		String BtNum = request.getParameter("BtNum");//"0001";

		String macHexStr = BdppUtil.encodeHmacMD5(
				(BusCd + "|" + MarketId + "|" + Date + "|" + SiNum + "|" + BtNum).getBytes(),
				macPass.getBytes());
		//	System.out.println("16进制字符串格式的mac计算结果: " + macHexStr);
		String Mac = macHexStr;
		//	创建Document对象
		Document document = DocumentHelper.createDocument();
		// 创建根节点
		Element rss = document.addElement("MsgText");
		// 创建channel子节点
		Element channel = rss.addElement("GrpHdr");
		channel.addElement("Version").addText(Version);
		channel.addElement("BusCd").addText(BusCd);
		channel.addElement("MarketId").addText(MarketId);
		channel.addElement("Date").addText(Date);
		channel.addElement("Time").addText(Time);
		rss.addElement("SiNum").addText(SiNum);
		rss.addElement("BtNum").addText(BtNum);
		rss.addElement("Mac").addText(Mac);

		DomUtils domu = new DomUtils();
		String xmlString = domu.xmlFormatPrint(document);

		String strLen = String.valueOf(xmlString.length());
		strLen = StringUtils.leftPad(strLen, 6, '0');
		xmlString = strLen + xmlString;
		SockedClientUtil scu = new SockedClientUtil();
		String responseXml = scu.ConnectScoket(host, port, xmlString);

		//解析xml
		Document doc = DocumentHelper.parseText(responseXml.substring(6, responseXml.length()));
		Element root = doc.getRootElement();
		Element eData = root.element("Rst");
		Element Info = eData.element("Info");
		Element Code = eData.element("Code");
		Iterator itData = eData.elementIterator();
		while (itData.hasNext()) {
			Element eBuss = (Element) itData.next();//buss 条数循环
			System.out.println(eBuss.getName() + ":" + eBuss.getText());
		}

		//清算成功修改状态
		if("0000".equals(Code.getText().trim())){
			String updSql = "update TBL_BDPP_MARKET set CLEARING_STATUS=?,CLEARING_TIME=sysdate  where MARKET_CD=?";
			if(maz.execute(updSql, new String[] {"1",MarkEnum.MARKCODE.getValue()}))
				CacheManage. setMartCache();
		} 
		
		String resXmlString = domu.xmlFormatPrint(doc);
		if ("true".equals(request.getParameter("markDemo"))) {
			out.println(new String(Info.getText().getBytes(), "UTF-8"));
		}else{

		out.println(new String((xmlString + "|***|" + resXmlString).getBytes(), "UTF-8"));
		}
	} else if ("20005".equals(action)) {
		String Version = request.getParameter("Version");
		String BusCd = request.getParameter("BusCd");
		String MarketId = request.getParameter("MarketId");
		String Date = request.getParameter("Date");// BDDateUtil.getCurrentDateyyyyMMdd();//"20170614";
		String Time = request.getParameter("Time");// BDDateUtil.getCurrentDateTimeHHmmss();//"175548";

		String FtSeq = request.getParameter("FtSeq");// BDDateUtil.getCurrentDateFtSeq();//"2017061215030034811";
		String SrcDate = request.getParameter("SrcDate");//"20170612";

		String macHexStr = BdppUtil.encodeHmacMD5(
				(BusCd + "|" + MarketId + "|" + Date + "|" + FtSeq).getBytes(), macPass.getBytes());
		//	System.out.println("16进制字符串格式的mac计算结果: " + macHexStr);
		String Mac = macHexStr;
		//	创建Document对象
		Document document = DocumentHelper.createDocument();
		// 创建根节点
		Element rss = document.addElement("MsgText");
		// 创建channel子节点
		Element channel = rss.addElement("GrpHdr");
		channel.addElement("Version").addText(Version);
		channel.addElement("BusCd").addText(BusCd);
		channel.addElement("MarketId").addText(MarketId);
		channel.addElement("Date").addText(Date);
		channel.addElement("Time").addText(Time);
		rss.addElement("FtSeq").addText(FtSeq);
		rss.addElement("SrcDate").addText(SrcDate);
		rss.addElement("Mac").addText(Mac);

		DomUtils domu = new DomUtils();
		String xmlString = domu.xmlFormatPrint(document);

		String strLen = String.valueOf(xmlString.length());
		strLen = StringUtils.leftPad(strLen, 6, '0');
		xmlString = strLen + xmlString;
		SockedClientUtil scu = new SockedClientUtil();
		String responseXml = scu.ConnectScoket(host, port, xmlString);

		//解析xml
		Document doc = DocumentHelper.parseText(responseXml.substring(6, responseXml.length()));
		Element root = doc.getRootElement();
		Element eData = root.element("Rst");
		Iterator itData = eData.elementIterator();
		String code="";
		while (itData.hasNext()) {
			Element eBuss = (Element) itData.next();//buss 条数循环
			System.out.println(eBuss.getName() + ":" + eBuss.getText());
			if("Code".equals(eBuss.getName())) code=eBuss.getText();
		}
		
		if("selStaus".equals(request.getParameter("markdemo"))){
			JSONObject obj=new JSONObject();
			String ret="0",msg="";
			if("1025".equals(code)){
				ret="1";
				msg="被查询流水已成功";
			}else if("1026".equals(code)){
				ret="2";
				msg="被查询流水已失败";
			}else if("1027".equals(code)){
				ret="2";
				msg="被查询流水不存在";
			}else if("1028".equals(code)){
				ret="2";
				msg="被查询流水状态未知";
			}else if("1029".equals(code)){
				msg="被查询流水处理中";
			}
			obj.put("msg", msg);
			String updSql="update TBL_BDPP_TRANS_FLOW set STATUS=? where SERIAL_NO=? ";
			if(!"0".equals(ret)){
				if(maz.execute(updSql, new String[]{ret,FtSeq})){
					String selSql="select * from TBL_BDPP_TRANS_FLOW where SERIAL_NO=? ";
					JSONArray arr= maz.executeQueryToJSON(selSql, new String[]{FtSeq});
					System.out.println(arr);
					obj.put("data", arr);
				}
			}
			out.println(obj);
			return;
		}
		
		
		String resXmlString = domu.xmlFormatPrint(doc);

		out.println(new String((xmlString + "|***|" + resXmlString).getBytes(), "UTF-8"));

	} else if ("20001".equals(action)) {
		String Version = request.getParameter("Version");
		String BusCd = request.getParameter("BusCd");
		String MarketId = request.getParameter("MarketId");
		String Date = request.getParameter("Date");// BDDateUtil.getCurrentDateyyyyMMdd();//"20170614";
		String Time = request.getParameter("Time");// BDDateUtil.getCurrentDateTimeHHmmss();//"175548";

		String FtSeq = request.getParameter("FtSeq");
		//市场流水号
		String macHexStr = BdppUtil.encodeHmacMD5(
				(BusCd + "|" + MarketId + "|" + Date + "|" + FtSeq).getBytes(), macPass.getBytes());
		//MAC校验码
		String Mac = macHexStr;
		//创建Document对象
		Document document = DocumentHelper.createDocument();
		// 创建根节点
		Element rss = document.addElement("MsgText");
		// 创建channel子节点
		Element channel = rss.addElement("GrpHdr");//消息包头
		channel.addElement("Version").addText(Version);//版本
		channel.addElement("BusCd").addText(BusCd);//业务功能编码
		channel.addElement("MarketId").addText(MarketId);//市场代码
		channel.addElement("Date").addText(Date);//交易日期
		channel.addElement("Time").addText(Time);//交易时间
		rss.addElement("FtSeq").addText(FtSeq);//市场流水号
		rss.addElement("Mac").addText(Mac);//MAC校验码

		DomUtils domu = new DomUtils();
		String xmlString = domu.xmlFormatPrint(document);

		String strLen = String.valueOf(xmlString.length());
		strLen = StringUtils.leftPad(strLen, 6, '0');
		xmlString = strLen + xmlString;
		SockedClientUtil scu = new SockedClientUtil();
		String responseXml = scu.ConnectScoket(host, port, xmlString);

		//解析xml
		Document doc = DocumentHelper.parseText(responseXml.substring(6, responseXml.length()));
		Element root = doc.getRootElement();
		Element eData = root.element("Rst");
		Element Info = eData.element("Info");
		Element Code = eData.element("Code");
		Iterator itData = eData.elementIterator();
		while (itData.hasNext()) {
			Element eBuss = (Element) itData.next();//buss 条数循环
			System.out.println(eBuss.getName() + ":" + eBuss.getText());
		}

		String resXmlString = domu.xmlFormatPrint(doc);
		//签到成功修改状态
		if("0000".equals(Code.getText().trim())){
			String updSql = "update TBL_BDPP_MARKET set MARK_STATUS=?,SIGN_TIME=sysdate where MARKET_CD=?";
			if(maz.execute(updSql, new String[] {"1",MarkEnum.MARKCODE.getValue()}))
				CacheManage. setMartCache();
		} 
		
		
		if ("true".equals(request.getParameter("markDemo"))) {
			out.println(new String(Info.getText().getBytes(), "UTF-8"));
		} else {
			out.println(new String((xmlString + "|***|" + resXmlString).getBytes(), "UTF-8"));
		}

	} else if ("20002".equals(action)) {
		String Version = request.getParameter("Version");
		String BusCd = request.getParameter("BusCd");
		String MarketId = request.getParameter("MarketId");
		String Date = request.getParameter("Date");// BDDateUtil.getCurrentDateyyyyMMdd();//"20170614";
		String Time = request.getParameter("Time");// BDDateUtil.getCurrentDateTimeHHmmss();//"175548";

		String FtSeq = request.getParameter("FtSeq");
		//市场流水号
		String macHexStr = BdppUtil.encodeHmacMD5(
				(BusCd + "|" + MarketId + "|" + Date + "|" + FtSeq).getBytes(), macPass.getBytes());
		//MAC校验码
		String Mac = macHexStr;
		//创建Document对象
		Document document = DocumentHelper.createDocument();
		// 创建根节点
		Element rss = document.addElement("MsgText");
		// 创建channel子节点
		Element channel = rss.addElement("GrpHdr");//消息包头
		channel.addElement("Version").addText(Version);//版本
		channel.addElement("BusCd").addText(BusCd);//业务功能编码
		channel.addElement("MarketId").addText(MarketId);//市场代码
		channel.addElement("Date").addText(Date);//交易日期
		channel.addElement("Time").addText(Time);//交易时间
		rss.addElement("FtSeq").addText(FtSeq);//市场流水号
		rss.addElement("Mac").addText(Mac);//MAC校验码

		DomUtils domu = new DomUtils();
		String xmlString = domu.xmlFormatPrint(document);

		String strLen = String.valueOf(xmlString.length());
		strLen = StringUtils.leftPad(strLen, 6, '0');
		xmlString = strLen + xmlString;
		SockedClientUtil scu = new SockedClientUtil();
		String responseXml = scu.ConnectScoket(host, port, xmlString);

		//解析xml
		Document doc = DocumentHelper.parseText(responseXml.substring(6, responseXml.length()));
		Element root = doc.getRootElement();
		Element eData = root.element("Rst");
		Element Info = eData.element("Info");
		Element Code = eData.element("Code");

		Iterator itData = eData.elementIterator();
		while (itData.hasNext()) {
			Element eBuss = (Element) itData.next();//buss 条数循环
		}

		String resXmlString = domu.xmlFormatPrint(doc);
		//签退成功修改状态
		if("0000".equals(Code.getText())){
			String updSql = "update TBL_BDPP_MARKET set MARK_STATUS=?,SIGN_TIME=sysdate  where MARKET_CD=?";
			if(maz.execute(updSql, new String[] { "0",MarkEnum.MARKCODE.getValue() }))
				CacheManage. setMartCache();
		} 
		
		if ("true".equals(request.getParameter("markDemo"))) {
			out.println(new String(Info.getText().getBytes(), "UTF-8"));
		}

		else {
			out.println(new String((xmlString + "|***|" + resXmlString).getBytes(), "UTF-8"));
		}

	} else if ("20006".equals(action)) {
		String Version = request.getParameter("Version");
		String BusCd = request.getParameter("BusCd");
		String MarketId = request.getParameter("MarketId");
		String Date = request.getParameter("Date");// BDDateUtil.getCurrentDateyyyyMMdd();//"20170614";
		String Time = request.getParameter("Time");// BDDateUtil.getCurrentDateTimeHHmmss();//"175548";
		String FtSeq = request.getParameter("FtSeq");
		//市场存管账户号
		String MarAcctNo = request.getParameter("MarAcctNo");//"1000190000001";
		//交易金额
		String TrfAmt = request.getParameter("TrfAmt");//"1";
		//轧差账户出金
		//业务属性(1000:资金轧差,1001:收益划出,1111:其他)
		String BusAttr = request.getParameter("BusAttr");//"1000";
		//市场子账户号
		String SubAcctNo = request.getParameter("SubAcctNo");//"1000190000003";

		//银行账户组件
		//银行帐号
		String Id = request.getParameter("Id");//"01090520501420101000391";
		//户主名称
		String Name = request.getParameter("Name");//"北京市乐尔莱服装服饰有限公司 DPN( 脱敏 )";
		//账户类型
		String Type = request.getParameter("Type");//"B";
		//银行标志
		String BankFlag = request.getParameter("BankFlag");//"BCCB";
		//银行分支行号
		String RcvCode = request.getParameter("RcvCode");//"1";
		//支行名称
		String RcvName = request.getParameter("RcvName");//"北京南苑支行";

		//MAC校验码
		String macHexStr = BdppUtil.encodeHmacMD5((BusCd + "|" + MarketId + "|" + Date + "|" + FtSeq + "|"
				+ BusAttr + "|" + MarAcctNo + "|" + SubAcctNo + "|" + Id + "|" + TrfAmt).getBytes(),
				macPass.getBytes());
		//	System.out.println("16进制字符串格式的mac计算结果: " + macHexStr);
		String Mac = macHexStr;
		//			创建Document对象
		Document document = DocumentHelper.createDocument();
		// 创建根节点
		Element rss = document.addElement("MsgText");
		// 创建channel子节点
		Element channel = rss.addElement("GrpHdr");//消息包头
		channel.addElement("Version").addText(Version);//版本
		channel.addElement("BusCd").addText(BusCd);//业务功能编码
		channel.addElement("MarketId").addText(MarketId);//市场代码
		channel.addElement("Date").addText(Date);//交易日期
		channel.addElement("Time").addText(Time);//交易时间
		rss.addElement("FtSeq").addText(FtSeq);//市场流水号
		rss.addElement("Mac").addText(Mac);//MAC校验码
		rss.addElement("MarAcctNo").addText(MarAcctNo);//市场存管账户号
		rss.addElement("SubAcctNo").addText(SubAcctNo);//市场子账户号
		rss.addElement("TrfAmt").addText(TrfAmt);//交易金额
		rss.addElement("BusAttr").addText(BusAttr);//业务属性(1000:资金轧差,1001:收益划出,1111:其他)
		Element BkAcct = rss.addElement("BkAcct");//银行账户
		BkAcct.addElement("Id").addText(Id);//银行帐号
		BkAcct.addElement("Name").addText(Name);//户主名称
		BkAcct.addElement("Type").addText(Type);//账户类型
		BkAcct.addElement("BankFlag").addText(BankFlag);//银行标志
		BkAcct.addElement("RcvCode ").addText(RcvCode);//银行分支行号
		BkAcct.addElement("RcvName").addText(RcvName);//支行名称
		DomUtils domu = new DomUtils();
		String xmlString = domu.xmlFormatPrint(document);
		String strLen = String.valueOf(xmlString.getBytes("utf-8").length);
		strLen = StringUtils.leftPad(strLen, 6, '0');
		xmlString = strLen + xmlString;
		SockedClientUtil scu = new SockedClientUtil();
		String responseXml = scu.ConnectScoket(host, port, xmlString);

		//解析xml
		Document doc = DocumentHelper.parseText(responseXml.substring(6, responseXml.length()));
		Element root = doc.getRootElement();
		Element eData = root.element("Rst");
		Element Info = eData.element("Info");
		Element Code = eData.element("Code");
		Iterator itData = eData.elementIterator();
		while (itData.hasNext()) {
			Element eBuss = (Element) itData.next();//buss 条数循环
		}

		String resXmlString = domu.xmlFormatPrint(doc);
		
		
		if("0000".equals(Code.getText().trim())){
			String addSql="";
			String[] param=null;
			addSql="insert into TBL_BDPP_TRANS_FLOW (ID, MARKET_CD, TRANS_TP,SERIAL_NO,TRANS_TIME,TRANS_AT,TRANS_CURR_CD,SYS_ACCT_NO,CHANNEL_TP, IS_DEL, STATUS, CREATE_TIME,TRANS_DT,CK_ACCT) values (SEQ_BDPP_TRANS_FLOW.NEXTVAL,?,?,?,?,?,?,?,?,0,?,sysdate,TO_CHAR(sysdate, 'yyyyMMdd'),?) ";
			param= new String[]{MarketId,BusCd,FtSeq,Time,TrfAmt,"156",SubAcctNo,"01","0",MarAcctNo};
			
			maz.execute(addSql, param);
		}

		if ("true".equals(request.getParameter("markDemo"))) {
			out.println(new String(Info.getText().getBytes(), "UTF-8"));
		} else {
			out.println(new String((xmlString + "|***|" + resXmlString).getBytes(), "UTF-8"));
		}
	} else if ("20008".equals(action)) {

		String Version = request.getParameter("Version");
		String BusCd = request.getParameter("BusCd");
		String MarketId = request.getParameter("MarketId");
		String Date = request.getParameter("Date");// BDDateUtil.getCurrentDateyyyyMMdd();//"20170614";
		String Time = request.getParameter("Time");// BDDateUtil.getCurrentDateTimeHHmmss();//"175548";
		/**
		 * 文件业务功能
		 * 0000:其他, 0001:市场日终清算文件， 0002:北京结算出入金对账文件, 0003:开销户对账文件, 0004:交易信息登记文件，0005:清算失败结果文件
		 */
		String BusCode = request.getParameter("BusCode");//"0001";
		//文件业务日期
		String BusDate = request.getParameter("BusDate");//"20171027";
		//文件存放主机
		String Host = request.getParameter("Host");//"43.254.3.236";
		//文件名称
		String FileName = request.getParameter("FileName");//"F_100037_STL01_20171027_0003.txt.gz";
		//文件长度
		String FileLen = request.getParameter("FileLen");//"326";
		//文件时间
		String FileTime = request.getParameter("FileTime");//"20171027000000";

		//MAC校验码
		String macHexStr = BdppUtil.encodeHmacMD5(
				(BusCd + "|" + MarketId + "|" + Date + "|" + BusCode + "|" + FileName).getBytes(),
				macPass.getBytes());
		//	System.out.println("16进制字符串格式的mac计算结果: " + macHexStr);
		String Mac = macHexStr;
		//	创建Document对象
		Document document = DocumentHelper.createDocument();
		// 创建根节点
		Element rss = document.addElement("MsgText");
		// 创建channel子节点
		Element channel = rss.addElement("GrpHdr");//消息包头
		channel.addElement("Version").addText(Version);//版本
		channel.addElement("BusCd").addText(BusCd);//业务功能编码
		channel.addElement("MarketId").addText(MarketId);//市场代码
		channel.addElement("Date").addText(Date);//交易日期
		channel.addElement("Time").addText(Time);//交易时间
		Element file = rss.addElement("FileInfo");//文件信息
		file.addElement("BusCode").addText(BusCode);//文件业务功能
		file.addElement("BusDate").addText(BusDate);//文件业务日期
		file.addElement("Host").addText(Host);//文件存放主机
		file.addElement("FileName").addText(FileName);//文件名称
		file.addElement("FileLen").addText(FileLen);//文件长度
		file.addElement("FileTime").addText(FileTime);//文件时间

		rss.addElement("Mac").addText(Mac);//MAC校验码

		DomUtils domu = new DomUtils();
		String xmlString = domu.xmlFormatPrint(document);

		String strLen = String.valueOf(xmlString.length());
		strLen = StringUtils.leftPad(strLen, 6, '0');
		xmlString = strLen + xmlString;
		SockedClientUtil scu = new SockedClientUtil();
		String responseXml = scu.ConnectScoket(host, port, xmlString);

		//解析xml
		Document doc = DocumentHelper.parseText(responseXml.substring(6, responseXml.length()));
		Element root = doc.getRootElement();
		Element eData = root.element("Rst");
		Iterator itData = eData.elementIterator();
		while (itData.hasNext()) {
			Element eBuss = (Element) itData.next();//buss 条数循环
			System.out.println(eBuss.getName() + ":" + eBuss.getText());
		}

		String resXmlString = domu.xmlFormatPrint(doc);
		out.println(new String((xmlString + "|***|" + resXmlString).getBytes(), "UTF-8"));

	} else if ("20010".equals(action)) {
		String Version = request.getParameter("Version");
		String BusCd = request.getParameter("BusCd");
		String MarketId = request.getParameter("MarketId");
		String Date = request.getParameter("Date");// BDDateUtil.getCurrentDateyyyyMMdd();//"20170614";
		String Time = request.getParameter("Time");// BDDateUtil.getCurrentDateTimeHHmmss();//"175548";

		//账户类型 (0:市场   1:投资人)
		String AccType = request.getParameter("AccType");//"0";
		//资金账号(存管账户号、收益账户号等)
		String AcctNo = request.getParameter("AcctNo");//"1000190000001";

		String macHexStr = BdppUtil.encodeHmacMD5(
				(BusCd + "|" + MarketId + "|" + Date + "|" + AcctNo).getBytes(), macPass.getBytes());
		//MAC校验码
		String Mac = macHexStr;
		//创建Document对象
		Document document = DocumentHelper.createDocument();
		// 创建根节点
		Element rss = document.addElement("MsgText");
		// 创建channel子节点
		Element channel = rss.addElement("GrpHdr");//消息包头
		channel.addElement("Version").addText(Version);//版本
		channel.addElement("BusCd").addText(BusCd);//业务功能编码
		channel.addElement("MarketId").addText(MarketId);//市场代码
		channel.addElement("Date").addText(Date);//交易日期
		channel.addElement("Time").addText(Time);//交易时间
		rss.addElement("AccType").addText(AccType);//账户类型
		rss.addElement("AcctNo").addText(AcctNo);//资金账号
		rss.addElement("Mac").addText(Mac);//MAC校验码

		DomUtils domu = new DomUtils();
		String xmlString = domu.xmlFormatPrint(document);

		String strLen = String.valueOf(xmlString.length());
		strLen = StringUtils.leftPad(strLen, 6, '0');
		xmlString = strLen + xmlString;
		SockedClientUtil scu = new SockedClientUtil();
		String responseXml = scu.ConnectScoket(host, port, xmlString);

		//解析xml
		String code = "";
		String info = "";
		String acctSta = "";
		//当前余额
		String currentBalance = null;
		//可用金额
		String usableBalance = null;
		//冻结金额
		String freezeBalance = null;
		//可取金额
		String cashBalance = null;
		Document doc = DocumentHelper.parseText(responseXml.substring(6, responseXml.length()));
		Element root = doc.getRootElement();
		Element eData = root.element("Rst");
		Iterator itData = eData.elementIterator();
		while (itData.hasNext()) {
			Element eBuss = (Element) itData.next();//buss 条数循环
			System.out.println(eBuss.getName() + ":" + eBuss.getText());
			if ("Code".equals(eBuss.getName())) {
				code = eBuss.getText();
			}else if("Info".equals(eBuss.getName())){
				info = eBuss.getText();
			}
		}

		//存储数据库
		if (map.containsKey("save")) {
			if (code.equals("0000")) {
				//账户状态(0 正常 1 冻结 2 未激活)
				Element AcctSta = root.element("AcctSta");
				acctSta = AcctSta.getText();

				Element AcctBalSum = root.element("AcctBalSum");
				Iterator acctBalSumIterator = AcctBalSum.elementIterator();
				while (acctBalSumIterator.hasNext()) {
					Element acctBalSumElement = (Element) acctBalSumIterator.next();//buss 条数循环
					if ("CurBal".equals(acctBalSumElement.getName())) {
						currentBalance = acctBalSumElement.getText();
					} else if ("UsaBal".equals(acctBalSumElement.getName())) {
						usableBalance = acctBalSumElement.getText();
					} else if ("FreBal".equals(acctBalSumElement.getName())) {
						freezeBalance = acctBalSumElement.getText();
					} else if ("CasBal".equals(acctBalSumElement.getName())) {
						cashBalance = acctBalSumElement.getText();
					}
				}

				//存储数据库
				String selSql = "select ID from TBL_BDPP_BALANCE where MARKET_CD=? and SYS_ACCT_NO=? and TRANS_DT=? and ACCOUNT_TYPE=?";
				ArrayList<String[]> list = maz.executeQuery(selSql,
						new String[] { MarketId, AcctNo, Date, AccType });
				if (list != null && list.size() > 0) {
					//更新余额
					String id = list.get(0)[0];
					String updSql = "";
					String[] param = null;
					if ("1".equals(AccType)) {
						//更新投资人余额
						updSql = "update TBL_BDPP_BALANCE set TRANS_TIME=?,ACCOUNT_STATUS=?,CURRENT_BALANCE=?,USABLE_BALANCE=?,FREEZE_BALANCE=?,CASH_BALANCE=?,UPDATE_TIME=sysdate where ID=?";
						param = new String[] { Time, acctSta, currentBalance, usableBalance, freezeBalance,
								cashBalance, id };
					} else if ("0".equals(AccType)) {
						//更新市场余额
						updSql = "update TBL_BDPP_BALANCE set TRANS_TIME=?,ACCOUNT_STATUS=?,CURRENT_BALANCE=?,USABLE_BALANCE=?,FREEZE_BALANCE=?,UPDATE_TIME=sysdate where ID=?";
						param = new String[] { Time, acctSta, currentBalance, usableBalance, freezeBalance,
								id };
					}
					if (maz.execute(updSql, param)) {
						System.out.println(BusCd + "更新数据成功....." + id);
					} else {
						System.out.println(BusCd + "更新数据失败....." + id);
					}
				} else {
					//插入信息
					System.out.println("新增余额");
					String addSql = "";
					String[] param = null;
					if ("1".equals(AccType)) {
						//投资人余额
						addSql = "INSERT INTO TBL_BDPP_BALANCE (ID, MARKET_CD, SYS_ACCT_NO, TRANS_DT,TRANS_TIME,ACCOUNT_TYPE,ACCOUNT_STATUS,CURRENT_BALANCE,USABLE_BALANCE,FREEZE_BALANCE,CASH_BALANCE,IS_DEL, STATUS, CREATE_TIME, REMARK) VALUES (SEQ_BDPP_BALANCE.NEXTVAL,?,?,?,?,?,?,?,?,?,?,0,0,SYSDATE,'') ";
						param = new String[] { MarketId, AcctNo, Date, Time, AccType, acctSta, currentBalance,
								usableBalance, freezeBalance, cashBalance };
					} else if ("0".equals(AccType)) {
						//市场余额，比投资人少一个可取金额参数
						addSql = "INSERT INTO TBL_BDPP_BALANCE (ID, MARKET_CD, SYS_ACCT_NO, TRANS_DT,TRANS_TIME,ACCOUNT_TYPE,ACCOUNT_STATUS,CURRENT_BALANCE,USABLE_BALANCE,FREEZE_BALANCE,IS_DEL, STATUS, CREATE_TIME, REMARK) VALUES (SEQ_BDPP_BALANCE.NEXTVAL,?,?,?,?,?,?,?,?,?,0,0,SYSDATE,'') ";
						param = new String[] { MarketId, AcctNo, Date, Time, AccType, acctSta, currentBalance,
								usableBalance, freezeBalance };
					}
					if (maz.execute(addSql, param)) {
						System.out.println(BusCd + "加入数据成功.....");
					} else {
						System.out.println(BusCd + "加入数据失败.....");
					}
				}
			}
		}

		String resXmlString = domu.xmlFormatPrint(doc);
		//当前余额：可用金额: 冻结金额: 可取金额：
		out.println(new String((xmlString + "|***|" + resXmlString + "|***|" + code + "|***|" + info + "|***|" + currentBalance + "|***|" + usableBalance + "|***|" + freezeBalance + "|***|" + cashBalance).getBytes(), "UTF-8"));
	} else if ("createFile".equals(action)) {
		String marketId = request.getParameter("makeId");
		String type = request.getParameter("type");
		String siNum = request.getParameter("date");
		String btNum = request.getParameter("stakeNum");
		Map<String, String> retMap = new HashMap<String, String>();
		String fileName = "";
		String createTime="";
		String selMarkSql = "select * from tbl_bdpp_market where MARKET_CD=? ";
		
		
		
		JSONArray markArr = maz.executeQueryToJSON(selMarkSql, new String[] { marketId });
		if (markArr == null || markArr.size() == 0) {
			out.println("{\"ret\":false,\"msg\":\"无此市场\"}");
			return;
		}
		
		//同步余额
		Map<String,String> resMap=new HashMap<String,String>();
		resMap.put("Version", "1.0.0");
		resMap.put("BusCd", "20010");
		resMap.put("MarketId", MarkEnum.MARKCODE.getValue());
		resMap.put("Time", DateFormatUtils.format(Calendar.getInstance().getTime(), "HHmmss"));
		resMap.put("Date", DateFormatUtils.format(Calendar.getInstance().getTime(), "yyyyMMdd"));
		resMap.put("action", "Onekey");
		resMap.put("save", "");
		String reponseTxt= ApacheHttpClientUtil.HttpPostMap(request.getRequestURL().toString(), resMap, "utf-8");
// 		System.out.println("一键查询余额返回文本："+reponseTxt);
		String marAcctNo = markArr.getJSONObject(0).getString("CK_ACCT");

		String selInvSql = "select * from tbl_bdpp_investor where MARKET_CD=? and STATUS=1 AND IS_DEL=0 ";
		JSONArray invArr = maz.executeQueryToJSON(selInvSql, new String[] { marketId });
		int totalPenCount = invArr.size();//9;//总笔数

		if ("STL01".equals(type)) {
			String selBuySql = "select b.*,(TRANS_AT+SERVICE_FEE-0-SERVICE_FEE) as ZC from TBL_BDPP_DEAL_BUY b where MARKET_CD=? and to_char(CREATE_TIME,'yyyyMMdd')=?";
			String selSellSql = "select s.*,(0-(TRANS_AT-SERVICE_FEE)-SERVICE_FEE) as ZC from TBL_BDPP_DEAL_SELL s where MARKET_CD=? and to_char(CREATE_TIME,'yyyyMMdd')=?";
//			String selBalSql = "select * from TBL_BDPP_BALANCE where MARKET_CD=? and TRANS_DT=? and ACCOUNT_TYPE=1  and  STATUS=0 ";
			String selBalSql = "select * from TBL_BDPP_BALANCE where MARKET_CD=? and TRANS_DT=? and ACCOUNT_TYPE=1 and ACCOUNT_STATUS=0 and  STATUS=0 ";

			JSONArray buyArr = maz.executeQueryToJSON(selBuySql, new String[] { marketId, siNum });
			JSONArray sellArr = maz.executeQueryToJSON(selSellSql, new String[] { marketId, siNum });
			JSONArray balArr = maz.executeQueryToJSON(selBalSql, new String[] { marketId, siNum });

			// 		String marketId="100018";//市场代码
			// 		String marAcctNo=markArr.getJSONObject(0).getString("CK_ACCT");//"1000180000001";//存管账号
			// 		String siNum =DateFormatUtils.format(new Date(), "yyyyMMdd");//场次号
			// 		String btNum ="0003";//批次号
			createTime = DateFormatUtils.format(new Date(), "yyyyMMddHHmmss");//文本生成时间

// 			int totalProfit = getTotalSXF(buyArr, sellArr);//-1000;//总收益
			int totalProfit = 0;//getTotalSXF(buyArr, sellArr);//-1000;//总收益

			int netAmount = 0;//getTotalZC(buyArr, sellArr);//18704919;//轧差金额
			int totalBalance = getTotalBla(balArr);//40;//总余额
			ArrayList<Object> list = new ArrayList<Object>();
			for (int i = 0; i < invArr.size(); i++) {
				//投资人明细
				String seatNo = invArr.getJSONObject(i).getString("SEAT_NO");//"bj001";//席位号
				String subAcctNo = invArr.getJSONObject(i).getString("SYS_ACCT_NO");//"1000182017042513323101000201";//投资人存管账户号
				String subAccName = invArr.getJSONObject(i).getString("INV_NAME");//"王援朝";//投资人存管账户名
				int[] fan = getTotalFinance(buyArr, sellArr, seatNo);
				int totalExpenditure = fan[0];//0;//当日支出总额
				int totalIncome = fan[1];//0;//当日收入总额
				int poundage = fan[2];//手续费
				int accountBalance = getBalance(balArr, subAcctNo);//0;//账户余额
				//投资人总手续费
				totalProfit+=poundage;
				netAmount+= totalExpenditure-totalIncome- poundage;
				
				LinkedHashMap<String, Object> subMap = new LinkedHashMap<String, Object>();
				subMap.put("seatNo", seatNo);
				subMap.put("subAcctNo", subAcctNo);
				subMap.put("subAccName", subAccName);
				subMap.put("totalExpenditure", dealIntDate(totalExpenditure, 14));
				subMap.put("totalIncome", dealIntDate(totalIncome, 14));
				subMap.put("poundage", dealIntDate(poundage, 14));
				subMap.put("accountBalance", dealIntDate( accountBalance -totalExpenditure+totalIncome , 14) );
				list.add(subMap);
			}
			String title = marketId + "|" + marAcctNo + "|" + siNum + "|" + btNum + "|" + createTime
					+ getWrapString() + dealIntDate(totalPenCount, 8) + "|" + dealIntDate(totalProfit, 14) + "|"
					+ dealIntDate(netAmount, 14) + "|" + dealIntDate(totalBalance, 14) + "|";
			retMap.put("name", "F_" + marketId + "_STL01_" + siNum//DateFormatUtils.format(new Date(), "yyyyMMdd")
					+ "_" + btNum + ".txt");
			retMap.put("content", getStringContent(title, list));
		} 
		//直接生成文件上传ftp服务器
		if ("uploadFtp".equals(request.getParameter("upload"))) {
			String urld = Thread.currentThread().getContextClassLoader().getResource("/").getPath()
					.replace("classes/", "");
			
			File localPathDir= new File(urld);
			if(!localPathDir.exists()){
				localPathDir.mkdirs();
			}
			
			urld += retMap.get("name")+".gz";
			GZipUtils.stringToGZip(urld, retMap.get("content"));
			
			File f=new File(urld);
			long fLength=f.length();
			System.out.println("文件长度："+f.length());
			FTPdemo ftp = new FTPdemo(marketId, marketId, marketId, siNum, type);
			boolean ret = ftp.uploadFile(urld, btNum);
			System.out.println("ret:"+ret);
			//发送文件生成通知
			if(ret){
				String Version = "1.0.0";
				String BusCd = "20008";
				String MarketId =MarkEnum.MARKCODE.getValue(); //request.getParameter("MarketId");
				String Date = DateFormatUtils.format(Calendar.getInstance().getTime(), "yyyyMMdd");//request.getParameter("Date");BDDateUtil.getCurrentDateyyyyMMdd();//"20170614";
				String Time = DateFormatUtils.format(Calendar.getInstance().getTime(), "HHmmss");//request.getParameter("Time"); BDDateUtil.getCurrentDateTimeHHmmss();//"175548";
				String BusCode =btNum;
				//文件业务日期
				String BusDate =siNum;
				//文件存放主机
				String Host ="43.254.3.236";
				//文件名称
				String FileName = retMap.get("name")+".gz";
				//文件长度
				String FileLen = fLength+"";
				//文件时间
				String FileTime = createTime;// request.getParameter("FileTime");//"20171027000000";

				//MAC校验码
				String macHexStr = BdppUtil.encodeHmacMD5(
						(BusCd + "|" + MarketId + "|" + Date + "|" + BusCode + "|" + FileName).getBytes(),
						macPass.getBytes());
				//	System.out.println("16进制字符串格式的mac计算结果: " + macHexStr);
				String Mac = macHexStr;
				//	创建Document对象
				Document document = DocumentHelper.createDocument();
				// 创建根节点
				Element rss = document.addElement("MsgText");
				// 创建channel子节点
				Element channel = rss.addElement("GrpHdr");//消息包头
				channel.addElement("Version").addText(Version);//版本
				channel.addElement("BusCd").addText(BusCd);//业务功能编码
				channel.addElement("MarketId").addText(MarketId);//市场代码
				channel.addElement("Date").addText(Date);//交易日期
				channel.addElement("Time").addText(Time);//交易时间
				Element file = rss.addElement("FileInfo");//文件信息
				file.addElement("BusCode").addText(BusCode);//文件业务功能
				file.addElement("BusDate").addText(BusDate);//文件业务日期
				file.addElement("Host").addText(Host);//文件存放主机
				file.addElement("FileName").addText(FileName);//文件名称
				file.addElement("FileLen").addText(FileLen);//文件长度
				file.addElement("FileTime").addText(FileTime);//文件时间

				rss.addElement("Mac").addText(Mac);//MAC校验码

				DomUtils domu = new DomUtils();
				String xmlString = domu.xmlFormatPrint(document);

				String strLen = String.valueOf(xmlString.length());
				strLen = StringUtils.leftPad(strLen, 6, '0');
				xmlString = strLen + xmlString;
				SockedClientUtil scu = new SockedClientUtil();
				
				String responseXml = scu.ConnectScoket(host, port, xmlString);

				//解析xml
				Document doc = DocumentHelper.parseText(responseXml.substring(6, responseXml.length()));
				Element root = doc.getRootElement();
				Element eData = root.element("Rst");
				Iterator itData = eData.elementIterator();
				while (itData.hasNext()) {
					Element eBuss = (Element) itData.next();//buss 条数循环
					System.out.println(eBuss.getName() + ":" + eBuss.getText());
				}
			}
			out.println(new String(("{\"ret\":" + ret + "}").getBytes(), "UTF-8")  );
			return;
		}

		String disName = URLEncoder.encode(retMap.get("name"), "UTF-8");
		response.reset();
		response.setContentType("application/x-msdownload");
		response.addHeader("Content-Disposition", "attachment; filename=\"" + disName + "\"");
		int fileLength = retMap.get("content").length();//(int) file.length();  
		/* 如果文件长度大于0 */
		if (fileLength != 0) {
			ServletOutputStream servletOS = response.getOutputStream();
			servletOS.write(retMap.get("content").getBytes("UTF-8"));
			servletOS.flush();
			servletOS.close();
		}
		out.clear();
		out = pageContext.pushBody();
	} else if ("Onekey".equals(action)) {
		String Version = request.getParameter("Version");
		String BusCd = request.getParameter("BusCd");
		String MarketId = request.getParameter("MarketId");

		//查看信息
		String querySql = "select SYS_ACCT_NO from TBL_BDPP_INVESTOR where MARKET_CD=? and is_del=0 and STATUS=1 ";
		ArrayList<String[]> queryInvestorList = maz.executeQuery(querySql, new String[] { MarketId });
		if (queryInvestorList != null && queryInvestorList.size() > 0) {
			//计时器
			long begintime = System.nanoTime();
			int count = 0;
			for (int i = 0; i <= queryInvestorList.size(); i++) {

				String Date = request.getParameter("Date");// BDDateUtil.getCurrentDateyyyyMMdd();//"20170614";
				String Time = request.getParameter("Time");// BDDateUtil.getCurrentDateTimeHHmmss();//"175548";

				//账户类型 (0:市场   1:投资人)
				String AccType = "";
				//资金账号(存管账户号、收益账户号等)
				String AcctNo = "";
				if (i == queryInvestorList.size()) {
					AccType = "0";
					//查询市场存管账号
					String queryAcctNoSql = "select CK_ACCT from TBL_BDPP_MARKET where MARKET_CD=?";
					ArrayList<String[]> queryAcctNoList = maz.executeQuery(queryAcctNoSql,
							new String[] { MarketId });
					AcctNo = queryAcctNoList.get(0)[0];//"1000190000001";
				} else {
					AccType = "1";
					AcctNo = queryInvestorList.get(i)[0];//"1000190000001";
				}

				String macHexStr = BdppUtil.encodeHmacMD5(
						(BusCd + "|" + MarketId + "|" + Date + "|" + AcctNo).getBytes(), macPass.getBytes());
				//MAC校验码
				String Mac = macHexStr;
				//创建Document对象
				Document document = DocumentHelper.createDocument();
				// 创建根节点
				Element rss = document.addElement("MsgText");
				// 创建channel子节点
				Element channel = rss.addElement("GrpHdr");//消息包头
				channel.addElement("Version").addText(Version);//版本
				channel.addElement("BusCd").addText(BusCd);//业务功能编码
				channel.addElement("MarketId").addText(MarketId);//市场代码
				channel.addElement("Date").addText(Date);//交易日期
				channel.addElement("Time").addText(Time);//交易时间
				rss.addElement("AccType").addText(AccType);//账户类型
				rss.addElement("AcctNo").addText(AcctNo);//资金账号
				rss.addElement("Mac").addText(Mac);//MAC校验码

				DomUtils domu = new DomUtils();
				String xmlString = domu.xmlFormatPrint(document);

				String strLen = String.valueOf(xmlString.length());
				strLen = StringUtils.leftPad(strLen, 6, '0');
				xmlString = strLen + xmlString;
				SockedClientUtil scu = new SockedClientUtil();
				String responseXml = scu.ConnectScoket(host, port, xmlString);

				//解析xml
				String code = "";
				Document doc = DocumentHelper.parseText(responseXml.substring(6, responseXml.length()));
				Element root = doc.getRootElement();
				Element eData = root.element("Rst");
				Iterator itData = eData.elementIterator();
				while (itData.hasNext()) {
					Element eBuss = (Element) itData.next();//buss 条数循环
					System.out.println(eBuss.getName() + ":" + eBuss.getText());
					if ("Code".equals(eBuss.getName())) {
						code = eBuss.getText();
						System.out.println("code:" + code);
					}
				}

				//存储数据库
				if (map.containsKey("save")) {
					if (code.equals("0000")) {
						//账户状态(0 正常 1 冻结 2 未激活)
						Element AcctSta = root.element("AcctSta");
						String acctSta = AcctSta.getText();

						//当前余额
						String currentBalance = null;
						//可用金额
						String usableBalance = null;
						//冻结金额
						String freezeBalance = null;
						//可取金额
						String cashBalance = null;
						Element AcctBalSum = root.element("AcctBalSum");
						Iterator acctBalSumIterator = AcctBalSum.elementIterator();
						while (acctBalSumIterator.hasNext()) {
							Element acctBalSumElement = (Element) acctBalSumIterator.next();//buss 条数循环
							if ("CurBal".equals(acctBalSumElement.getName())) {
								currentBalance = acctBalSumElement.getText();
							} else if ("UsaBal".equals(acctBalSumElement.getName())) {
								usableBalance = acctBalSumElement.getText();
							} else if ("FreBal".equals(acctBalSumElement.getName())) {
								freezeBalance = acctBalSumElement.getText();
							} else if ("CasBal".equals(acctBalSumElement.getName())) {
								cashBalance = acctBalSumElement.getText();
							}
						}

						//存储数据库
						String selSql = "select ID from TBL_BDPP_BALANCE where MARKET_CD=? and SYS_ACCT_NO=? and TRANS_DT=? and ACCOUNT_TYPE=?";
						ArrayList<String[]> list = maz.executeQuery(selSql,
								new String[] { MarketId, AcctNo, Date, AccType });
						if (list != null && list.size() > 0) {
							//更新余额
							String id = list.get(0)[0];
							String updSql = "";
							String[] param = null;
							if ("1".equals(AccType)) {
								//更新投资人余额
								updSql = "update TBL_BDPP_BALANCE set TRANS_TIME=?,ACCOUNT_STATUS=?,CURRENT_BALANCE=?,USABLE_BALANCE=?,FREEZE_BALANCE=?,CASH_BALANCE=?,UPDATE_TIME=sysdate where ID=?";
								param = new String[] { Time, acctSta, currentBalance, usableBalance,
										freezeBalance, cashBalance, id };
							} else if ("0".equals(AccType)) {
								//更新市场余额
								updSql = "update TBL_BDPP_BALANCE set TRANS_TIME=?,ACCOUNT_STATUS=?,CURRENT_BALANCE=?,USABLE_BALANCE=?,FREEZE_BALANCE=?,UPDATE_TIME=sysdate where ID=?";
								param = new String[] { Time, acctSta, currentBalance, usableBalance,
										freezeBalance, id };
							}
							if (maz.execute(updSql, param)) {
								count++;
								System.out.println(BusCd + "更新数据成功....." + id);
							} else {
								System.out.println(BusCd + "更新数据失败....." + id);
							}
						} else {
							//插入信息
							System.out.println("新增余额");
							String addSql = "";
							String[] param = null;
							if ("1".equals(AccType)) {
								//投资人余额
								addSql = "INSERT INTO TBL_BDPP_BALANCE (ID, MARKET_CD, SYS_ACCT_NO, TRANS_DT,TRANS_TIME,ACCOUNT_TYPE,ACCOUNT_STATUS,CURRENT_BALANCE,USABLE_BALANCE,FREEZE_BALANCE,CASH_BALANCE,IS_DEL, STATUS, CREATE_TIME, REMARK) VALUES (SEQ_BDPP_BALANCE.NEXTVAL,?,?,?,?,?,?,?,?,?,?,0,0,SYSDATE,'') ";
								param = new String[] { MarketId, AcctNo, Date, Time, AccType, acctSta,
										currentBalance, usableBalance, freezeBalance, cashBalance };
							} else if ("0".equals(AccType)) {
								//市场余额，比投资人少一个可取金额参数
								addSql = "INSERT INTO TBL_BDPP_BALANCE (ID, MARKET_CD, SYS_ACCT_NO, TRANS_DT,TRANS_TIME,ACCOUNT_TYPE,ACCOUNT_STATUS,CURRENT_BALANCE,USABLE_BALANCE,FREEZE_BALANCE,IS_DEL, STATUS, CREATE_TIME, REMARK) VALUES (SEQ_BDPP_BALANCE.NEXTVAL,?,?,?,?,?,?,?,?,?,0,0,SYSDATE,'') ";
								param = new String[] { MarketId, AcctNo, Date, Time, AccType, acctSta,
										currentBalance, usableBalance, freezeBalance };
							}
							if (maz.execute(addSql, param)) {
								count++;
								System.out.println(BusCd + "加入数据成功.....");
							} else {
								System.out.println(BusCd + "加入数据失败.....");
							}
						}
					}
				}
				String resXmlString = domu.xmlFormatPrint(doc);
			}
			long endtime = System.nanoTime();
			long costTime = (endtime - begintime) / 1000000000;
			System.out.println("共计消耗时间" + costTime + "秒");
			out.println(count + "|***|" + costTime);
		}
	}
%>
<%!private boolean wrap = true;//是否换行

	/**
	 * 换行处用到，控制文本是否换行
	 * @return String 换行符
	 */
	private String getWrapString() {
		return wrap ? "\r\n" : "";
	}

	/**
	 * 处理数字位数前面补零
	 * @param math 数字
	 * @param num 位数
	 * @return String 补零后数据
	 */
	private String dealIntDate(int math, int num) {
		return math >= 0 ? StringUtils.leftPad(math + "", num, '0') : "-" + StringUtils.leftPad((-math) + "", num, '0');
	}

	/**
	 * 生成文件的数据文本
	 * @param title 头信息字符串
	 * @param list 循环数据信息
	 * @return String 文件数据
	 */
	private String getStringContent(String title, ArrayList<Object> list) {
		StringBuffer sb = new StringBuffer(title);
		for (Object obj : list) {
			sb = sb.deleteCharAt(sb.length() - 1).append(getWrapString());
			for (Entry<String, Object> subEntry : ((LinkedHashMap<String, Object>) obj).entrySet()) {
				if ("subList".equals(subEntry.getKey())) {
					for (LinkedHashMap<String, Object> grandMap : (ArrayList<LinkedHashMap<String, Object>>) subEntry
							.getValue()) {
						sb = sb.deleteCharAt(sb.length() - 1).append(getWrapString()).append("-");
						for (Entry<String, Object> grandEntry : grandMap.entrySet()) {
							sb.append(grandEntry.getValue()).append("|");
						}
					}
					sb.append("|");
				} else
					sb.append(subEntry.getValue()).append("|");
			}
		}
		return sb.substring(0, sb.length() - 1);
	}

	//总手续费，总收益
	private int getTotalSXF(JSONArray buyArr, JSONArray sellArr) {
		int sum = 0;
		for (int i = 0; i < buyArr.size(); i++) {
			sum += buyArr.getJSONObject(i).getInt("SERVICE_FEE");
		}
		for (int i = 0; i < sellArr.size(); i++) {
			sum += sellArr.getJSONObject(i).getInt("SERVICE_FEE");
		}
		return sum;

	}

	//总余额
	private int getTotalBla(JSONArray balArr) {
		int sum = 0;
		for (int i = 0; i < balArr.size(); i++) {
			sum += balArr.getJSONObject(i).getInt("CURRENT_BALANCE");
		}
		return sum;
	}

	//轧差总金额
	private int getTotalZC(JSONArray buyArr, JSONArray sellArr) {
		int sum = 0;
		for (int i = 0; i < buyArr.size(); i++) {
			sum += buyArr.getJSONObject(i).getInt("ZC");
		}
		for (int i = 0; i < sellArr.size(); i++) {
			sum += sellArr.getJSONObject(i).getInt("ZC");
		}
		return sum;
	}

	//当日支出总额
	private int[] getTotalFinance(JSONArray buyArr, JSONArray sellArr, String seatNo) {
		int outSum = 0;
		int sxf = 0;
		for (int i = 0; i < buyArr.size(); i++) {
			if (seatNo.equals(buyArr.getJSONObject(i).getString("SEAT_NO"))) {
				outSum += buyArr.getJSONObject(i).getInt("TRANS_AT") + buyArr.getJSONObject(i).getInt("SERVICE_FEE");
				sxf += buyArr.getJSONObject(i).getInt("SERVICE_FEE");
			}
		}
		int inSum = 0;
		for (int i = 0; i < sellArr.size(); i++) {
			if (seatNo.equals(sellArr.getJSONObject(i).getString("SEAT_NO"))) {
				inSum += sellArr.getJSONObject(i).getInt("TRANS_AT") - sellArr.getJSONObject(i).getInt("SERVICE_FEE");
				sxf += sellArr.getJSONObject(i).getInt("SERVICE_FEE");
			}
		}
		return new int[] { outSum, inSum, sxf };
	}

	//指定投资人的余额
	private int getBalance(JSONArray balArr, String acctNo) {
		for (int i = 0; i < balArr.size(); i++) {
			if (acctNo.equals(balArr.getJSONObject(i).getString("SYS_ACCT_NO"))) {
				return balArr.getJSONObject(i).getInt("CURRENT_BALANCE");
			}
		}
		return 0;
	}%>