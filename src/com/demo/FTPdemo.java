package com.demo;

import com.util.SftpUtil;
import org.apache.log4j.Logger;

import java.io.File;
import java.io.IOException;
import java.util.List;

public class FTPdemo {
	private final String ftpServer="43.254.3.236";
	private final int ftpPort =22;
	private   String ftpUser ;
	private   String ftpPwd ;
	//	private  String dir;
	private  String makeId;
	private  String date;
	private  String type;

	public FTPdemo(String ftpUser,String ftpPwd,String makeId,String date,String type){
		this.ftpUser=ftpUser;
		this.ftpPwd=ftpPwd;
//		 this.dir=dir;
		this.makeId=makeId;
		this.date=date;
		this.type=type;

	}

	/** 系统日志对象 */
	private static Logger logger = Logger.getLogger(FTPdemo.class);

	public static void main(String[] args) throws Exception {
		//FTP下载文件
		//new FTPTest().downFile("B_100019_DTL01_20171012_0001.txt.gz","D:"+File.separator+"ftp");
		//FTP上传STL01文件
//		new FTPdemo().uploadFileSTL01("F_100019_STL01_20171023_0001.txt.gz","D:"+File.separator+"ftp");
		//FTP上传STL02文件
//		new FTPdemo().uploadFileSTL02("F_100019_STL02_20171023_0001.txt.gz","D:"+File.separator+"ftp");

		FTPdemo ftp=new FTPdemo( "100035", "100035", "100035", "20171024", "DTL01");
		ftp.downFile("D:"+File.separator+"ftp");

	}


	/**
	 * FTP下载文件
	 * @param localPath 本地地址
	 * @throws IOException
	 */
	public void downFile(String localPath) throws Exception{
		String fileName="B_"+makeId+"_"+type+"_"+date+"_0001.txt.gz";
		String ftpPath ="/"+ftpUser+"/"+type;

		SftpUtil sftp = new SftpUtil();
		try {
			//连接ftp服务器
			System.out.println("开始连接ftp服务器"+ ftpServer + ":" + ftpPort + ftpPath);
			sftp.connectServer(ftpServer, ftpUser, ftpPwd, ftpPath);

			System.out.println("ftp服务器连接成功");
			//获取文件列表
			List<String> fileList = sftp.getFileList(".");
			if (fileList != null && fileList.size() > 0) {
				System.out.println("共有文件[" + fileList.size() + "]个");
				File localPathDir= new File(localPath);
				if(!localPathDir.exists()){
					localPathDir.mkdirs();
				}
				for (String file : fileList) {
					System.out.println("比较文件[" + file + "][" + fileName + "],匹配[" + file.equals(fileName) + "]");
					if (file.equals(fileName)) {
						sftp.download(file, localPath + File.separator + fileName);
						System.out.println("[ftp下载执行完成]");
						break;
					}
				}
			}
			sftp.closeServer();
		} catch (Exception e) {
			System.out.println("[对账文件下载失败][FTP异常]"+ e);
			throw e;
		} finally {
			sftp.closeServer();
			System.out.println("[FTP关闭]");
		}
	}

	/**
	 * FTP上传文件
	 * @param localPath 本地地址
	 * @throws IOException
	 */
	public boolean uploadFile(String localPath,String stakeNum) throws Exception{
		boolean ret=false;
		String fileName="F_"+makeId+"_"+type+"_"+date+"_"+stakeNum+".txt.gz";
		System.out.println(fileName);
		String ftpPath ="/"+ftpUser+"/"+type;
		SftpUtil sftp = new SftpUtil();
		try {
			//连接ftp服务器
			System.out.println("开始连接ftp服务器" + ftpServer + ":" + ftpPort + ftpPath);
			sftp.connectServer(ftpServer, ftpUser, ftpPwd, ftpPath);
			System.out.println("ftp服务器连接成功");
			//上传文件
			sftp.upload(localPath);
			System.out.println("上传文件成功，文件本地地址："+localPath);
			ret=true;
			sftp.closeServer();
		} catch (Exception e) {
			System.out.println("[对账文件上传失败][FTP异常]"+ e);
			throw e;
		} finally {
			sftp.closeServer();
			System.out.println("[FTP关闭]");
		}
		return ret;
	}
	
}
