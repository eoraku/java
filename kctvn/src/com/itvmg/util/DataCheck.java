package com.itvmg.util;

import java.sql.Timestamp;
import java.util.List;

/**
 * 데이타의 유효 판별
 * 
 * @since 2010.04.19
 * @author skkwon
 * 
 */
public class DataCheck {

	public static boolean hasRecord(List<?> list) {
		return (list != null) && (list.size() > 0);
	}

	public static boolean isAvailable(String str) {
		return (str != null) && (str.length() > 0);
	}

	public static boolean isAvailable(String[] str) {
		return (str != null) && (str.length > 0);
	}

	public static boolean isAvailable(Timestamp timeStamp) {
		return (timeStamp != null) && (timeStamp.toString().length() > 0);
	}

	public static boolean isAvailable(Object obj) {
		return obj != null;
	}
}