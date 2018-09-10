package com.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServlet;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class ReadXml extends HttpServlet{
	
	private String data;
	private String drive;
	
	public String getDrive() {
		return drive;
	}

	public void setDrive(String drive) {
		this.drive = drive;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	private String drivername;
	private String sConnStr;
	private String username;
	private String password;
	
	//mysql 配置
	private String server;
	private String dbname;
	private String user;
	private String pass;
	private String port;
	
	public String getServer() {
		return server;
	}

	public void setServer(String server) {
		this.server = server;
	}

	public String getDbname() {
		return dbname;
	}

	public void setDbname(String dbname) {
		this.dbname = dbname;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getPort() {
		return port;
	}

	public void setPort(String port) {
		this.port = port;
	}

	
	

	public String getDrivername() {
		return drivername;
	}

	public String getSConnStr() {
		return sConnStr;
	}

	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}

	public void setDrivername(String drivername) {
		this.drivername = drivername;
	}

	public void setSConnStr(String connStr) {
		sConnStr = connStr;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public ReadXml(String fileName) {
		try {
			DocumentBuilderFactory domfac = DocumentBuilderFactory.newInstance();
			DocumentBuilder dombuilder = domfac.newDocumentBuilder();
			InputStream is = new FileInputStream(fileName);
			Document doc = dombuilder.parse(is);
			Element root = doc.getDocumentElement();
			NodeList dbinfo = root.getChildNodes();
			if (dbinfo != null) {
				for (int i = 0; i < dbinfo.getLength(); i++) {
					Node db = dbinfo.item(i);
					for (Node node = db.getFirstChild(); node != null; node = node.getNextSibling()) {
						if (node.getNodeType() == Node.ELEMENT_NODE) {
							if(node.getNodeName().equals("data")){
								setData(node.getFirstChild().getNodeValue());	
							}
							if (node.getNodeName().equals("drivername")) {
								setDrivername(node.getFirstChild().getNodeValue());
							}
							
							
							if (node.getNodeName().equals("sConnStr")) {
								setSConnStr(node.getFirstChild().getNodeValue());
							}
							if (node.getNodeName().equals("username")) {
								setUsername(node.getFirstChild().getNodeValue());
							}
							if (node.getNodeName().equals("password")) {
								setPassword(node.getFirstChild().getNodeValue());
							}
							
							if (node.getNodeName().equals("driver")) {
								setDrive(node.getFirstChild().getNodeValue());
							}
							if (node.getNodeName().equals("server")) {
								setServer(node.getFirstChild().getNodeValue());
							}
							if (node.getNodeName().equals("dbname")) {
								setDbname(node.getFirstChild().getNodeValue());
							}
							if (node.getNodeName().equals("user")) {
								setUser(node.getFirstChild().getNodeValue());
							}
							if (node.getNodeName().equals("pass")) {
								setPass(node.getFirstChild().getNodeValue());
							}
							if (node.getNodeName().equals("port")) {
								setPort(node.getFirstChild().getNodeValue());
							}
						}
					}
				}
			}
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public static ConcurrentHashMap<String, String>  getXml(String fileURLName,String layerName,String[] clum){
		DocumentBuilderFactory domfc = DocumentBuilderFactory.newInstance();
		ConcurrentHashMap<String, String> map=new ConcurrentHashMap<String, String>();
		try {
			DocumentBuilder builder=domfc.newDocumentBuilder();
			InputStream is = new FileInputStream(fileURLName);
			Document doc=builder.parse(is);
			Element root= doc.getDocumentElement();
			NodeList xmlList= root.getChildNodes();
			if(xmlList!=null){
				for (int i = 0; i < xmlList.getLength(); i++) {
					Node xml = xmlList.item(i);
					if(layerName.equals(xml.getNodeName())){
						for(int j=0;j<xml.getChildNodes().getLength();j++){
							Node nd=xml.getChildNodes().item(j);
							if(clum!=null&&clum.length>0){
								for(String name:clum){
									if (name.equals(nd.getNodeName())) {
										map.put(name, nd.getFirstChild().getNodeValue());
									}
								}
							}
						}
					}
				}
			}
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return map;
	}
	
}
