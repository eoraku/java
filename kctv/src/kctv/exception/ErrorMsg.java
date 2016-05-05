package kctv.exception;

/**
 * <pre>
 * kctv.exception
 * ErrorMsg.java
 * </pre>
 * <pre>
 * 에러메시지 처리 클래스
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2013. 12. 13.
 * @version: 
 */
public class ErrorMsg extends RuntimeException {
	public ErrorMsg(){
		super();
	}
	public ErrorMsg(String message){
		super(message);
	}
}
