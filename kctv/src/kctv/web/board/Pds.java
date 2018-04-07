package kctv.web.board;

/**
 * <pre>
 * kctv.web.board
 * Pds.java
 * </pre>
 * <pre>
 * 게시판 자료실 정보 이용을 위한 모델 클래스
 * </pre>
 * 
 * @author : 서유진
 * @date   : 
 * @version: 
 */
public class Pds {
	String board_id;
	int pds_uid;
	int pds_board_uid;
	String pds_dir;
	String pds_file_name1; // newFileName
	String pds_file_name2; // orgFileName
	long pds_file_size;
	String pds_file_info;
	int pds_hit;
	String pds_is_image;
	String pds_is_main;
	String pds_regdate;
	
	public Pds(){
		
	}

	public Pds(String board_id, int board_uid, String folderName, String newFileName, String orgFileName, String fileType, long fileLength){
		this.board_id = board_id;
		this.pds_board_uid = board_uid;
		this.pds_dir = folderName;
		this.pds_file_name1 = newFileName;
		this.pds_file_name2 = orgFileName;
		this.pds_file_size = fileLength;
		this.pds_file_info = " ";
		this.pds_hit = 0;
		this.pds_is_main = "0";
		
		//System.out.println(fileType.substring(0,5));
		
		if(fileType.substring(0,5).equals("image"))	
			this.pds_is_image = "1";
		else
			this.pds_is_image = "0";
	}

	public String getBoard_id() {
		return board_id;
	}

	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}

	public int getPds_uid() {
		return pds_uid;
	}

	public void setPds_uid(int pds_uid) {
		this.pds_uid = pds_uid;
	}

	public int getPds_board_uid() {
		return pds_board_uid;
	}

	public void setPds_board_uid(int pds_board_uid) {
		this.pds_board_uid = pds_board_uid;
	}

	public String getPds_dir() {
		return pds_dir;
	}

	public void setPds_dir(String pds_dir) {
		this.pds_dir = pds_dir;
	}

	public String getPds_file_name1() {
		return pds_file_name1;
	}

	public void setPds_file_name1(String pds_file_name1) {
		this.pds_file_name1 = pds_file_name1;
	}

	public String getPds_file_name2() {
		return pds_file_name2;
	}

	public void setPds_file_name2(String pds_file_name2) {
		this.pds_file_name2 = pds_file_name2;
	}

	public long getPds_file_size() {
		return pds_file_size;
	}

	public void setPds_file_size(long pds_file_size) {
		this.pds_file_size = pds_file_size;
	}

	public String getPds_file_info() {
		return pds_file_info;
	}

	public void setPds_file_info(String pds_file_info) {
		this.pds_file_info = pds_file_info;
	}

	public int getPds_hit() {
		return pds_hit;
	}

	public void setPds_hit(int pds_hit) {
		this.pds_hit = pds_hit;
	}

	public String getPds_is_image() {
		return pds_is_image;
	}

	public void setPds_is_image(String pds_is_image) {
		this.pds_is_image = pds_is_image;
	}

	public String getPds_is_main() {
		return pds_is_main;
	}

	public void setPds_is_main(String pds_is_main) {
		this.pds_is_main = pds_is_main;
	}

	public String getPds_regdate() {
		return pds_regdate;
	}

	public void setPds_regdate(String pds_regdate) {
		this.pds_regdate = pds_regdate;
	}
}
