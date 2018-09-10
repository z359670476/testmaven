package com.sdk;

import java.util.LinkedHashMap;
import java.util.Map;
import java.io.File;
import java.security.PrivateKey;
import java.security.PublicKey;
import bdpp.onl.sdk.BdppUtil;

public class PublicKeyUtil {


	private String url;

	public PublicKeyUtil(){
		url= Thread.currentThread().getContextClassLoader().getResource("/").getPath().replace("classes/","");
	}

	public PublicKeyUtil(String url) {
		this.url = url;
	}
	
	/**
	 * 使用私钥进行RSA签名
	 * @param reqMap 需要签名的数据
	 * @return 需验签数据
	 */
	public Map<String, String> signByRSA(Map<String, String> reqMap){
		// 读取.pfx格式的签名私钥证书
//		String pfxFile = System.getProperty("user.dir")+"\\key\\private_key.pfx";
		String pfxFile = url+"key"+File.separator+"private_key.pfx";
		System.out.println("签名私钥证书路径： " + pfxFile);

		String password = "123456";
		System.out.println("签名私钥证书密码: " + password);

		PrivateKey privateKey = BdppUtil.getSignPriKeyFromPfxFile(pfxFile,
				password);
		if (null != privateKey) {
			System.out.println("从文件成功读取到签名私钥 ");
		}


		// 用私钥签名
		System.out.println("签名前请求报文Map: " + reqMap);
		Map<String, String> reqMapWithSign = BdppUtil.signByRSA(reqMap, privateKey);
		System.out.println("签名后请求报文Map: " + reqMapWithSign);
		return reqMapWithSign;
	}
	
	
	/**
	 * 使用公钥进行RSA验签
	 * @param respMap 需验签数据
	 */
	public void validateByRSA(Map<String, String> respMap){
		// 读取.cer格式的验签公钥证书
		String cerFile = url+"key"+File.separator+"public_key.cer";
//		String cerFile = System.getProperty("user.dir")+"\\key\\public_key.cer";
		System.out.println("验签公钥证书路径： " + cerFile);

		PublicKey publicKey = BdppUtil.getValidatePubKeytFromCerFile(cerFile);
		if (null != publicKey) {
			System.out.println("从文件成功读取到验签公钥 ");
		}

		// 用公钥验签
		System.out.println("带签名的应答报文Map: " + respMap);
		System.out.println("签名内容: " + respMap.get("signature"));
		boolean validateSuccess = BdppUtil.validateByRSA(respMap, publicKey);
		if (validateSuccess) {
			System.out.println("验签通过");
		} else {
			System.out.println("验签失败");
		}
	}

	public static void main(String[] args) {
		PublicKeyUtil pku = new PublicKeyUtil("D:\\cg\\bdppGateway-demo-1023\\bdpp\\WEB-INF\\");
		//{marketId=100041, respCode=0000, bankAcctNo=************0048, channelType=01, busiCode=10001, version=1.0,
		// marAcctNo=10004100000, serialNo=20180110095443624953, seatNo=gr-10004, transTime=20180110095443,
		// encoding=UTF-8, respMsg=交易成功, subAcctNo=1000412017032415272101000101, signature=xtfQ2KQtNrsdwvDPy53C7GtDhAoXuUGnrNg8eMWQVqGefvW5HCa1XWJAjmAkf7JaTBsqODfZERqEIUqbk/gTVr7tV35sxNuzpAatwOcXielLrTx8VcmAPp+kMohakNzFFx1G9QKefOAsYvgebrACMQ0iIS3eFeoAJOjAT5YLKOjXRM5/zyGgid+IEcUICYiAHjBfS7jXYdqcYAQStl4yYxswDm5HGcpMILPU4CMt5x5/j0SElfrHdt9sIpUXWOsIGwa2J/CwniYgFAfBRDO/fYiCa6hjHKMceeBfbAH2av2JctoL4WV1smmyCVTvNFCafmrh7iifHNfie2xbHicqbw==}

		/*Map<String, String> respMap = new LinkedHashMap<String, String>();
		respMap.put("marketId","100041");
		respMap.put("respCode","0000");
		respMap.put("bankAcctNo","************0048");
		respMap.put("channelType","01");
		respMap.put("busiCode","10001");
		respMap.put("version","1.0");
		respMap.put("marAcctNo","10004100000");
		respMap.put("serialNo","20180110095443624953");
		respMap.put("seatNo","gr-10004");
		respMap.put("transTime","20180110095443");
		respMap.put("encoding","UTF-8");
		respMap.put("respMsg","交易成功");
		respMap.put("subAcctNo","1000412017032415272101000101");
		respMap.put("signature","xtfQ2KQtNrsdwvDPy53C7GtDhAoXuUGnrNg8eMWQVqGefvW5HCa1XWJAjmAkf7JaTBsqODfZERqEIUqbk/gTVr7tV35sxNuzpAatwOcXielLrTx8VcmAPp+kMohakNzFFx1G9QKefOAsYvgebrACMQ0iIS3eFeoAJOjAT5YLKOjXRM5/zyGgid+IEcUICYiAHjBfS7jXYdqcYAQStl4yYxswDm5HGcpMILPU4CMt5x5/j0SElfrHdt9sIpUXWOsIGwa2J/CwniYgFAfBRDO/fYiCa6hjHKMceeBfbAH2av2JctoL4WV1smmyCVTvNFCafmrh7iifHNfie2xbHicqbw==");

		pku.validateByRSA(respMap);*/
	}

}
