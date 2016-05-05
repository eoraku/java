package kctv.web.common;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.regex.Pattern;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import kctv.web.board.Pds;

import com.oreilly.servlet.MultipartRequest;

/**
 * <pre>
 * kctv.web.common
 * Common.java
 * </pre>
 * 
 * <pre>
 * 공통으로 사용되는 파일 업로드, 생성, 삭제, 문자셋 변경 등의 처리 클래스
 * </pre>
 * 
 * @author : 강우진
 * @date : 2013. 12. 18.
 * @version:
 */
public class Common {
	public static String[] weeks = { "일", "월", "화", "수", "목", "금", "토" };
	public static String newsCategory[] = { "전체", "정치", "경제", "사회", "문화", "행정",
			"관광", "교육", "체육" };
	public static String newsGroup[] = { "0", "1", "2", "3", "4", "1", "2",
			"3", "4" };
	public static String boardId[] = { "", "bd_jobinfo", "bd_notice",
			"pg_board", "bd_opinion", "bd_cableqa", "bd_cablefq" };
	public static String boardName[] = { "", "채용정보", "공지사항", "프로그램게시판",
			"시청자의견", "고객의소리", "자주묻는질문" };
	public static String boardMenu[] = { "", "company", "company", "program",
			"program", "customer", "customer" };
	public static int boardMuid[] = { 0, 148, 117, 365, 173, 202, 203 };

	public static String uploadFolder = "upload/";

	/**
	 * @function : 게시판 첨부파일 등록
	 * @process :
	 * 
	 * @MethodName : pdsInsert
	 * @param smc
	 * @param multi
	 * @param boardUid
	 * @param boardId
	 * @param folderName
	 */
	@SuppressWarnings("rawtypes")
	public static void pdsInsert(SqlMapClientTemplate smc,
			MultipartRequest multi, int boardUid, String boardId,
			String folderName) {
		Enumeration efiles = multi.getFileNames();

		String fileName;
		String newFileName;
		String orgFileName;
		long fileLength;
		String fileType;

		while (efiles.hasMoreElements()) {
			fileName = (String) efiles.nextElement();

			// System.out.println(fileName);

			newFileName = multi.getFilesystemName(fileName);

			if (newFileName != null) {
				orgFileName = multi.getOriginalFileName(fileName);
				fileType = multi.getContentType(fileName);
				fileLength = ((File) multi.getFile(fileName)).length();

				/*
				 * System.out.println(newFileName);
				 * System.out.println(orgFileName);
				 * System.out.println(fileType); System.out.println(fileLength);
				 */

				Pds pds = new Pds(boardId, boardUid, folderName, newFileName,
						orgFileName, fileType, fileLength);
				smc.insert("pdsInsert", pds);
			}
		}
	}

	/**
	 * @function : 업로드 파일 정보 얻어오기
	 * @process :
	 * 
	 * @MethodName : getUploadedFileInfo
	 * @param multi
	 * @return
	 */
	public static FileInfo getUploadedFileInfo(MultipartRequest multi) {
		@SuppressWarnings("rawtypes")
		Enumeration efiles = multi.getFileNames();

		String fileName;
		String newFileName = null;
		String orgFileName = null;
		String fileType = null;
		long fileLength = 0;

		if (efiles.hasMoreElements()) {
			fileName = (String) efiles.nextElement();

			// System.out.println(fileName);

			newFileName = multi.getFilesystemName(fileName);

			if (newFileName != null) {
				orgFileName = multi.getOriginalFileName(fileName);
				fileType = multi.getContentType(fileName);
				fileLength = ((File) multi.getFile(fileName)).length();

				/*
				 * System.out.println(newFileName);
				 * System.out.println(orgFileName);
				 * System.out.println(fileType); System.out.println(fileLength);
				 */
			}
		}

		return new FileInfo(orgFileName, newFileName, fileType, fileLength);
	}

	/**
	 * @function : 년월 얻기
	 * @process :
	 * 
	 * @MethodName : getYearMonth
	 * @return
	 */
	public static String getYearMonth() {
		return (new java.text.SimpleDateFormat("yyyyMM", Locale.KOREA))
				.format(new Date());
	}

	/**
	 * @function : 년월일 얻기
	 * @process :
	 * 
	 * @MethodName : getDate
	 * @return
	 */
	public static String getDate() {
		return (new java.text.SimpleDateFormat("yyyyMMdd", Locale.KOREA))
				.format(new Date());
	}
	
	@SuppressWarnings("deprecation")
	public static String getDateFromDay(String returnFormat, int day){
		DateFormat sdFormat = new SimpleDateFormat(returnFormat, Locale.KOREA);
		Calendar calendar = new GregorianCalendar(Locale.KOREA);
		calendar.add(calendar.DATE, day);
		Date date = calendar.getTime();
		return sdFormat.format(date);
	}

	/**
	 * @function : 년월일 시분초 얻기
	 * @process :
	 * 
	 * @MethodName : getDateTime
	 * @return
	 */
	public static String getDateTime() {
		return (new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss",
				Locale.KOREA)).format(new Date());
	}

	/**
	 * @function : 디렉토리 생성
	 * @process :
	 * 
	 * @MethodName : makeDir
	 * @param realPath
	 */
	public static void makeDir(String realPath) {
		File filePath = new File(realPath);

		if (!filePath.exists()) {
			// 상위 디렉토리가 존재하지 않으면 상위디렉토리부터 생성.
			filePath.mkdirs();
		}
	}

	/**
	 * @function : 파일 삭제
	 * @process :
	 * 
	 * @MethodName : deleteFile
	 * @param filePath
	 */
	public static void deleteFile(String filePath) {
		File file = new File(filePath);
		if (file.exists())
			file.delete();
	}

	/**
	 * @function : Asx 파일 제작
	 * @process : 프로그램 별 경로 코드를 설정하여 wmv파일 경로를 지정하여 asx파일 제작
	 * 
	 * @MethodName : createAsxFile
	 * @param folderName
	 * @param asxName
	 * @param title
	 */
	public static void createAsxFile(String folderName, String asxName,
			String title) {
		String tmp = asxName.substring(6, asxName.lastIndexOf("."));
		String wmvNmae = asxName.substring(0, asxName.lastIndexOf("."));
		String prefix = "";
		String content = "";

		// 각 프로그램 별 경로 코드 설정
		if (tmp.equals("n1") || tmp.equals("n2") || tmp.equals("n3")
				|| tmp.equals("n4") || tmp.equals("n5") || tmp.equals("n7"))
			prefix = tmp.substring(1);
		else if (tmp.equals("glo"))
			prefix = "rel";
		else if (tmp.equals("sea"))
			prefix = "jjd";
		else if (tmp.equals("bic"))
			prefix = "jjd";
		else if (tmp.equals("ins"))
			prefix = "jjd";
		else if (tmp.equals("pd"))
			prefix = "sam";
		else if (tmp.equals("tuk"))
			prefix = "sam";
		else if (tmp.equals("sol"))
			prefix = "sam";
		else if (tmp.equals("chall"))
			prefix = "car";
		else if (tmp.equals("wnj"))
			prefix = "inv";
		else if (tmp.equals("sisa"))
			prefix = "inv";
		else if (tmp.equals("sot"))
			prefix = "rel";
		else if (tmp.equals("ch5"))
			prefix = "mad";
		else if (tmp.equals("lov"))
			prefix = "mad";
		else if (tmp.indexOf("dol") >= 0)
			prefix = "mad";
		else if (tmp.indexOf("do") >= 0)
			prefix = "mad";
		else if (tmp.indexOf("spo") >= 0)
			prefix = "spo";
		else
			prefix = tmp;

		// if(prefix.length()>3 && prefix.substring(0,3)=="spo")
		// prefix = prefix.substring(0,3);

		// asx 파일 내용
		content += "<ASX version =\"3.0\">\n";
		content += "\t<title>" + title + "</title>\n";
		content += "\t<Entry>\n";
		content += "\t\t<Banner href =\"http://www.kctvjeju.com/a/kctvjeju.gif\">\n";
		content += "\t\t\t<Abstract>클릭하시면 KCTV제주방송홈페이지로 이동합니다.</Abstract>\n";
		content += "\t\t\t<MoreInfo href = \"http://www.kctvjeju.com\" target=\"_blank\"/>\n";
		content += "\t\t</Banner>\n";
		content += "\t\t<ref href = \"mms://media1.kctvjeju.com/" + prefix
				+ "/" + wmvNmae + ".wmv\"/>\n";
		content += "\t</Entry>\n";
		content += "</ASX>";

		File file = null;
		FileWriter fileWriter = null;
		BufferedWriter bufferedWriter = null;

		// 파일 생성
		try {
			file = new File(folderName + "\\" + asxName);
			fileWriter = new FileWriter(file);
			bufferedWriter = new BufferedWriter(fileWriter);
			bufferedWriter.write(content);
			bufferedWriter.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (bufferedWriter != null)
				try {
					bufferedWriter.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
		}
	}

	/**
	 * @function : 문자열 자르기
	 * @process : szText 로 들어온 문자열을 태그 설정에 따라 <(/?)([^<>]*)?> 에 매치되는 태그 제거 공백,
	 *          &amp; 를 &으로, 공백문자열과 /, !를 제거
	 * 
	 * @MethodName : cutStr
	 * @param szText
	 *            원본 문자열 파라미터
	 * @param szKey
	 *            자르고 싶은 문자열 파라미터
	 * @param nLength
	 *            문자열 최대 길이
	 * @param nPrev
	 * @param isNotag
	 *            태그 유무 설정
	 * @param isAdddot
	 *            ... 말줄임표 유무 설정
	 * @return
	 */
	public static final String cutStr(String szText, String szKey, int nLength,
			int nPrev, boolean isNotag, boolean isAdddot) {
		String r_val = szText;
		int oF = 0, oL = 0, rF = 0, rL = 0;
		int nLengthPrev = 0;

		// szText 중 태그 영역 replace 패턴
		Pattern p = Pattern
				.compile("<(/?)([^<>]*)?>", Pattern.CASE_INSENSITIVE);

		// isNotag 값에 따라 tag 제거
		if (isNotag) {
			r_val = p.matcher(r_val).replaceAll("");
		}
		r_val = r_val.replaceAll("&amp;", "&");
		r_val = r_val.replaceAll("(!/|\r|\n|&nbsp;)", "");

		try {
			byte[] bytes = r_val.getBytes("UTF-8");
			// sz키가 있으면 아래수행
			if (szKey != null && !szKey.equals("")) {
				nLengthPrev = (r_val.indexOf(szKey) == -1) ? 0 : r_val
						.indexOf(szKey); // replace한 szText에서 szKey가 있을 경우 위치 지정
											// 없을경우 0
				nLengthPrev = r_val.substring(0, nLengthPrev).getBytes("MS949").length; // szKey까지 길이를 자르고 바이트 길이 연산
				nLengthPrev = (nLengthPrev - nPrev >= 0) ? nLengthPrev - nPrev : 0; // nPrev 길이보다 길면 nlengtgPrev - nPrev 연산
			}

			int j = 0;

			if (nLengthPrev > 0) {
				while (j < bytes.length) {
					if ((bytes[j] & 0x80) != 0) {
						oF += 2;
						rF += 3;
						if (oF + 2 > nLengthPrev) {
							break;
						}
						j += 3;
					} else {
						if (oF + 1 > nLengthPrev) {
							break;
						}
						++oF;
						++rF;
						++j;
					}
				}
			}

			j = rF;

			while (j < bytes.length) {
				if ((bytes[j] & 0x80) != 0) {
					if (oL + 2 > nLength) {
						break;
					}
					oL += 2;
					rL += 3;
					j += 3;
				} else {
					if (oL + 1 > nLength) {
						break;
					}
					++oL;
					++rL;
					++j;
				}
			}

			r_val = new String(bytes, rF, rL, "UTF-8");

			// 말줄임표 설정과 리플레이스된 문자열 길이에 따라 ... 붙임
			if (isAdddot && rF + rL + 3 <= bytes.length) {
				r_val += "...";
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return r_val;
	}

	/**
	 * @function : 문자열 리플레이스
	 * @process :
	 * 
	 * @MethodName : replace
	 * @param str
	 *            원문자열
	 * @param pattern
	 *            바꿀 문자열
	 * @param replace
	 *            바뀌는 문자열
	 * @return
	 */
	public static String replace(String str, String pattern, String replace) {
		int s = 0;
		int e = 0;
		StringBuffer result = new StringBuffer();

		while ((e = str.indexOf(pattern, s)) >= 0) {
			result.append(str.substring(s, e));
			result.append(replace);
			s = e + pattern.length();
		}

		result.append(str.substring(s));
		return result.toString();
	}

	/**
	 * @function : \n 을 <br />로 처리
	 * @process  : 
	 * 
	 * @MethodName : replaceLineToBR
	 * @param str
	 * @return
	 */
	public static String replaceLineToBR(String str) {
		if (str != null && str.length() > 0)
			return (str.replace(System.getProperty("line.separator"), "<br/>"))
					.replace("\n", "<br/>");
		else
			return "";
	}

	/**
	 * @function : br 태그 제거하고 <를 &lt; 로 변경
	 * @process  : 
	 * 
	 * @MethodName : replaceBRtoSpace
	 * @param str
	 * @return
	 */
	public static String replaceBRtoSpace(String str) {
		// '/<br(.*)>/'
		// '/<br([^\/]*)>/i'
		if (str != null && str.length() > 0) {
			Pattern pattern = Pattern.compile("(?i)<br/?>");
			return str.replaceAll(pattern.pattern(), " ").replace("<", "&lt;");
		} else
			return "";
	}

	/**
	 * @function : p 태그 제거
	 * @process  : 
	 * 
	 * @MethodName : replacePtoNone
	 * @param str
	 * @return
	 */
	public static String replacePtoNone(String str) {
		if (str != null && str.length() > 0) {
			Pattern pattern = Pattern.compile("(?i)</?p/?>");
			return str.replaceAll(pattern.pattern(), "");
		} else
			return "";
	}

	/**
	 * @function : 줄바꿈 제거
	 * @process  : line.separator -> 운영체제 줄바꿈 문자 처리, \n 처리, trim 으로 여백 제거
	 * 
	 * @MethodName : replaceTrim
	 * @param str
	 * @return
	 */
	public static String replaceTrim(String str) {
		if (str != null && str.length() > 0)
			return (str.replace(System.getProperty("line.separator"), ""))
					.replace("\n", "").trim();
		else
			return "";
	}

	/**
	 * @function : ' 를 ''로 변경
	 * @process  : 
	 * 
	 * @MethodName : replaceQuote
	 * @param str
	 * @return
	 */
	public static String replaceQuote(String str) {
		return str.replace("'", "''");
	}

	/**
	 * @function : string 을 int로 반환
	 * @process  : 
	 * 
	 * @MethodName : strToInt
	 * @param str
	 * @return
	 */
	public static int strToInt(String str) {
		if (str == null || str.equals("") || str.equals("off")
				|| str.equals("false"))
			return 0;
		else
			return Integer.parseInt(str);
	}

	/**
	 * @function : string을 int로 반환
	 * @process  : 
	 * 
	 * @MethodName : strToInt
	 * @param str
	 * @param val
	 * 잘못된 string을 넘겨받았을 경우 리턴될 값
	 * @return
	 */
	public static int strToInt(String str, int val) {
		if (str == null || str.equals("") || str.equals("off")
				|| str.equals("false"))
			return val;
		else
			return Integer.parseInt(str);
	}

	public static String strToStr(String str) {
		if (str == null)
			return "";
		else
			return str;
	}

	public static String strToStr(String str, String val) {
		if (str == null || str.equals(""))
			return val;
		else
			return str;
	}

	/**
	 * @function : URL 인코드 (UTF-8)
	 * @process  : 
	 * 
	 * @MethodName : enURL8
	 * @param str
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public static String enURL8(String str) throws UnsupportedEncodingException {
		return URLEncoder.encode(str, "UTF-8");
	}

	/**
	 * @function : URL 디코드 (UTF-8)
	 * @process  : 
	 * 
	 * @MethodName : deURL8
	 * @param str
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public static String deURL8(String str) throws UnsupportedEncodingException {
		return URLDecoder.decode(str, "UTF-8");
	}

	/**
	 * @function : URL인코드 (EUC-KR)
	 * @process  : 
	 * 
	 * @MethodName : enURLK
	 * @param str
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public static String enURLK(String str) throws UnsupportedEncodingException {
		return URLEncoder.encode(str, "EUC-KR");
	}

	/**
	 * @function : URL디코드 (EUC-KR)
	 * @process  : 
	 * 
	 * @MethodName : deURLK
	 * @param str
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public static String deURLK(String str) throws UnsupportedEncodingException {
		return URLDecoder.decode(str, "EUC-KR");
	}

	/**
	 * @function : String 캐릭터셋 변경(utf-8)
	 * @process  : 
	 * 
	 * @MethodName : toUTF8
	 * @param str
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public static String toUTF8(String str) throws UnsupportedEncodingException {
		return new String(str.getBytes("ISO-8859-1"), "utf-8");
	}

	/**
	 * @function : String 캐릭터셋 변경 (euc-kr)
	 * @process  : 
	 * 
	 * @MethodName : toEUCKR
	 * @param str
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public static String toEUCKR(String str)
			throws UnsupportedEncodingException {
		return new String(str.getBytes("ISO-8859-1"), "euc-kr");
	}

	/**
	 * @function : EUC-KR 을 ISO-8859-1 로 변경
	 * @process  : 
	 * 
	 * @MethodName : to8859fromEUCKR
	 * @param str
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public static String to8859fromEUCKR(String str)
			throws UnsupportedEncodingException {
		return new String(str.getBytes("euc-kr"), "ISO-8859-1");
	}

	/**
	 * @function : UTF-8을 ISO-8859-1 로 변경
	 * @process  : 
	 * 
	 * @MethodName : to8859fromUTF8
	 * @param str
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public static String to8859fromUTF8(String str)
			throws UnsupportedEncodingException {
		return new String(str.getBytes("utf-8"), "ISO-8859-1");
	}

	/**
	 * @function : UTF-8 을 EUC-KR로
	 * @process  : 
	 * 
	 * @MethodName : toEUCKRfromUTF8
	 * @param str
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public static String toEUCKRfromUTF8(String str)
			throws UnsupportedEncodingException {
		return new String(str.getBytes("utf-8"), "euc-kr");
	}

	/**
	 * @function : EUC-KR 을 UTF-8로
	 * @process  : 
	 * 
	 * @MethodName : toUTF8fromEUCKR
	 * @param str
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public static String toUTF8fromEUCKR(String str)
			throws UnsupportedEncodingException {
		return new String(str.getBytes("euc-kr"), "utf-8");
	}

	/*
	 * public static String toCharset(String str) throws
	 * UnsupportedEncodingException{ //return new
	 * String(str.getBytes("ISO-8859-1"), "ISO-8859-1"); //return new
	 * String(str.getBytes("ISO-8859-1"), "KSC5601"); //return new
	 * String(str.getBytes("ISO-8859-1"), "EUC-KR"); //return new
	 * String(str.getBytes("ISO-8859-1"), "UTF-8"); //return new
	 * String(str.getBytes("KSC5601"), "KSC5601"); //return new
	 * String(str.getBytes("KSC5601"), "ISO-8859-1"); //return new
	 * String(str.getBytes("KSC5601"), "EUC-KR"); //return new
	 * String(str.getBytes("KSC5601"), "UTF-8"); //return new
	 * String(str.getBytes("EUC-KR"), "EUC-KR"); //return new
	 * String(str.getBytes("EUC-KR"), "ISO-8859-1"); //return new
	 * String(str.getBytes("EUC-KR"), "KSC5601"); //return new
	 * String(str.getBytes("EUC-KR"), "UTF-8"); //return new
	 * String(str.getBytes("UTF-8"), "UTF-8"); //return new
	 * String(str.getBytes("UTF-8"), "ISO-8859-1"); //return new
	 * String(str.getBytes("UTF-8"), "KSC5601"); //return new
	 * String(str.getBytes("UTF-8"), "EUC-KR"); }
	 */
}
