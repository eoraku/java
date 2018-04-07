package kctv.web.common;

import java.io.File;

import com.oreilly.servlet.multipart.FileRenamePolicy; 

/**
 * <pre>
 * kctv.web.common
 * FileRenameTime.java
 * </pre>
 * <pre>
 * 서버에 파일 업로드시 처리하는 파일 리네임 클래스
 * FileRenamePolicy 를 이용하여 처리되어 있으며, 확장자 처리에 대한 변경이(ext 부분 날린후 이상없는지 테스트, body + 랜덤함수이용하여 리네임 처리) 필요할 것으로 판단됨.
 * </pre>
 * 
 * @author : 서유진
 * @date   : 
 * @version: 
 */
public class FileRenameTime implements FileRenamePolicy {
	@Override
	public File rename(File f) {
		String name = f.getName();
		String body = null;
		String ext = null;
		int dot = name.lastIndexOf(".");
		
		//확장자 추출
		if (dot != -1) {
			ext = name.substring(dot); // includes "."
		} else {
			ext = "";
		}
		
		body = Long.toString(System.currentTimeMillis());
		//body = (new java.text.SimpleDateFormat("yyyyMMdd_HHmmss",Locale.KOREA)).format(new Date());
		//body = (new java.text.SimpleDateFormat("yyyyMMdd",Locale.KOREA)).format(new Date())+"_"+Long.toString(System.currentTimeMillis());
		File renameFile = new File( f.getParent(), body + ext );
		if( renameFile.exists() ){
			int count = 0;
			do {
				count++;
				String newName = body + "_" + count + ext;
				renameFile = new File(f.getParent(), newName);
			}while( renameFile.exists() && count < 9999 );
		}
		f.renameTo( renameFile );
		return renameFile;
	}
}