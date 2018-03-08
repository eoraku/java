package com.infohub.android.hello;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
////20170824源뚯�
public class RequestFromBillboardHot1 {
	
	ArrayList<String> htmls=new ArrayList<String>();  // 1
	boolean isConnection=false;
	
	public void getAllHtml(String newUrls){
		htmls.clear();   // 2
		InputStream inputStream;
		URL url=null;
		try {   // 3 
			url= new URL(newUrls);  // 4
			HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
            // 5
			inputStream = new BufferedInputStream(urlConnection.getInputStream());
			// 6
			BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, "euc-kr"), 8);
            
			String line = null;
			while ((line = reader.readLine()) != null)  // 7
			{
				if(!line.trim().equals("")){  // 8

					htmls.add(line.trim());
				}
			}
			inputStream.close();  // 9
			isConnection=true;

		} catch (Exception e) {
			isConnection = false;
			System.out.println(e);
		}
	}
	
	public void printHtml(String filename){
		PrintWriter pw=null;
		try {
			pw=new PrintWriter(new FileWriter(filename,false),true);  // 10
			for (String dto : htmls) {
				pw.println(dto);   // 11
			}
		} catch (IOException e) {
			System.out.println(e);
		}finally {  // 12 
			pw.close();
		}
	}
	
	public void printHtml(){
		for (String dto : htmls) {   // 13
			System.out.println(dto);
		}
	}
	
	public static void main(String[] args) {
		RequestFromBillboardHot1 rfw=new RequestFromBillboardHot1();
		String a="https://www.billboard.com/charts/hot-100/";        // http -> https濡� �닔�젙
		rfw.getAllHtml(a);  // 14 
		//rfw.printHtml();
		rfw.printHtml("bilboardhot.txt");
		System.out.println("~~~~~End");
	}
}
