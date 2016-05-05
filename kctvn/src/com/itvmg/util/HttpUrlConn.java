package com.itvmg.util;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class HttpUrlConn {
	public static String invoke_sync(String url, String charEncodingType) {
		long time = System.currentTimeMillis();

		System.out.println("request Url > " + url);

		String str = null;

		URL u = null;

		try {
			u = new URL(url);

			byte[] data = getResourceToURL(u);

			if ((data != null) && (data.length > 0)) {
				try {
					str = new String(data, charEncodingType);
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}

		System.out.println("request process time > " + (System.currentTimeMillis() - time));

		return str;
	}

	public static byte[] getResourceToURL(URL url) {
		HttpURLConnection urlCon = null;
		InputStream in = null;
		ByteArrayOutputStream bos = null;
		byte[] temp = null;
		byte[] data = null;

		try {
			urlCon = (HttpURLConnection) url.openConnection();
			in = urlCon.getInputStream();

			int len;
			temp = new byte[1024];
			bos = new ByteArrayOutputStream();
			while (true) {
				len = in.read(temp);
				if (len != -1) {
					bos.write(temp, 0, len);
				} else {
					break;
				}
			}
			data = bos.toByteArray();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (temp != null) {
				temp = null;
			}
			if (bos != null) {
				try {
					bos.close();
				} catch (IOException e1) {
					e1.printStackTrace();
				}
				bos = null;

			}
			if (in != null) {
				try {
					in.close();
				} catch (IOException e1) {
					e1.printStackTrace();
				}
				in = null;
			}
			if (urlCon != null) {
				urlCon.disconnect();
				urlCon = null;
			}
		}
		return data;
	}
}