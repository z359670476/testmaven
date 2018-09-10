package com.util;

import java.io.IOException;
import java.io.StringWriter;

import org.dom4j.Document;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;

public class DomUtils {
	
	public String xmlFormatPrint(Document doc) throws IOException{
		OutputFormat format = OutputFormat.createPrettyPrint();
        ///设置输出文件的编码
        format.setEncoding("utf-8");
		StringWriter out = new StringWriter();
        XMLWriter xmlWriter = new XMLWriter(out, format);
        //打印doc
        xmlWriter.write(doc);
        xmlWriter.flush();
        xmlWriter.close();
        String xmlString = out.toString();
        out.close();
        return xmlString;
	}

}
