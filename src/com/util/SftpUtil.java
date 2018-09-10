package com.util;

import com.jcraft.jsch.*;
import com.jcraft.jsch.ChannelSftp.LsEntry;

import java.io.*;
import java.util.*;

public class SftpUtil {
	private ChannelSftp sftp;
	private Session sshSession;
    private int port=22;
	
	/**
     * 连接sftp服务器
     * @return ChannelSftp
	 * @throws SftpException
     */
    public void connectServer(String server,String user,String password,String path) throws JSchException, SftpException {
        JSch jsch = new JSch();
        jsch.getSession(user, server, port);
        sshSession = jsch.getSession(user, server, port);
        System.out.println("Session created.");
        sshSession.setPassword(password);
        Properties sshConfig = new Properties();
        sshConfig.put("StrictHostKeyChecking", "no");
        sshSession.setConfig(sshConfig);
        sshSession.connect();
        System.out.println("Session connected.");
        System.out.println("Opening Channel.");
        Channel channel = sshSession.openChannel("sftp");
        channel.connect();
        sftp = (ChannelSftp) channel;
        System.out.println("Connected to " + server + ".");
        if (path.length() != 0)   sftp.cd(path); 
    }
    
    /** 
     * upload 
     * 上传文件 
     * @throws Exception
     * @return -1 文件不存在
     *           >=0 成功上传，返回文件的大小
     * @param newname 上传后的新文件名 
     * @param filename 上传的文件 
     * @throws SftpException
     * @throws FileNotFoundException 
     */ 
	public long upload(String filename,String newname) throws FileNotFoundException, SftpException
	{ 
		long result = 0; 
    	File file=new File(filename);
    	if (!file.exists()) return -1;
    	result = file.length();
    	sftp.put(new FileInputStream(file), newname);
    	return result; 
	} 
	
	
	/** 
     * upload 
     * @throws Exception
     * @return  
     * @param filename 
     */ 
	public long upload(String filename) 
	throws Exception  
	{ 
		String newname = ""; 
		if (filename.indexOf("/")>-1) 
		{ 
			newname = filename.substring(filename.lastIndexOf("/")+1); 
		}else 
		{ 
			newname = filename; 
		} 
		return upload(filename,newname); 
	} 
	
	
	/** 
     *   download 
     *   从ftp下载文件到本地 
     * @throws Exception
     * @return  
     * @param newfilename 本地生成的文件名 
     * @param filename 服务器上的文件名 
     */ 
	public long download(String filename,String newfilename)  
	throws Exception 
	{   
		long result = 0; 
		InputStream is = null; 
		FileOutputStream os = null; 
		try  
		{ 
			is = sftp.get(filename);        
			File outfile = new File(newfilename); 
			os = new FileOutputStream(outfile); 
			byte[] bytes = new byte[1024]; 
			int c; 
			while ((c = is.read(bytes)) != -1) { 
				os.write(bytes, 0, c); 
				result = result + c; 
			} 
		}catch (Exception e)  
		{ 
			e.printStackTrace(); 
		} 
		finally { 
			if (is != null) { 
				is.close(); 
			} 
			if (os != null) { 
				os.close(); 
			} 
		} 
		return result; 
	} 
    
    
	/** 
	   * 取得某个目录下的所有文件列表 
	 * @throws SftpException
	   * 
	   */ 
	@SuppressWarnings({ "unchecked", "rawtypes", "deprecation" })
	public List getFileList(String path) throws SftpException
	{ 
		Vector fileList;  
        List<String> fileNameList = new ArrayList<String>();  
        fileList = sftp.ls(path);  
        Iterator it = fileList.iterator();  
        while (it.hasNext()) {  
            String fileName = ((LsEntry) it.next()).getFilename();
            if (".".equals(fileName) || "..".equals(fileName)) {  
                continue;  
            }  
            fileNameList.add(fileName);  
        }  
        return fileNameList; 
		
	} 
	
	
	/** 
     * closeServer 
     * 断开与ftp服务器的链接 
     * @throws java.io.IOException 
     */ 
	public void closeServer() 
	{    
		if (sftp != null)  
		{ 
			sftp.disconnect();
			sftp = null;
		}
		if(sshSession!=null){
			sshSession.disconnect();
			sshSession=null;
		}

	} 
	
	
	public static void main(String [] args) throws Exception  
	{ 
		SftpUtil sftp=new SftpUtil();
		try { 
			//连接ftp服务器 
			sftp.connectServer("43.254.3.236", "100039", "cg_admin123456", "/100039");
			/**   上传文件到 info2 文件夹下 */ 
			System.out.println("filesize:"+sftp.upload("D:/Desktop/F_100050_STL01_20180111_0002.txt.gz")+"字节");
			/** 取得info2文件夹下的所有文件列表,并下载到 E盘下 */ 
			List list = sftp.getFileList(".");
			for (int i=0;i<list.size();i++) 
			{ 
				String filename = (String)list.get(i); 
				System.out.println(filename); 
				sftp.download(filename,"D:/"+filename);
			} 
		} catch (Exception e) { 
			e.printStackTrace();
		}finally 
		{ 
			sftp.closeServer(); 
		} 
	}

}
