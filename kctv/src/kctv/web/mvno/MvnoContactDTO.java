package kctv.web.mvno;

public class MvnoContactDTO {
	private int seq;
	private String reg_date;
	private String name;
	private String phone;
	private String zipcode;
	private String address;
	private String service;
	private String memo;
	private int del_flag;
	private int reply_flag;
	private String reply_date;
	private String del_date;
	private String mod_admin;

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public int getDel_flag() {
		return del_flag;
	}

	public void setDel_flag(int del_flag) {
		this.del_flag = del_flag;
	}

	public int getReply_flag() {
		return reply_flag;
	}

	public void setReply_flag(int reply_flag) {
		this.reply_flag = reply_flag;
	}

	public String getReply_date() {
		return reply_date;
	}

	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}

	public String getDel_date() {
		return del_date;
	}

	public void setDel_date(String del_date) {
		this.del_date = del_date;
	}

	public String getMod_admin() {
		return mod_admin;
	}

	public void setMod_admin(String mod_admin) {
		this.mod_admin = mod_admin;
	}

}
