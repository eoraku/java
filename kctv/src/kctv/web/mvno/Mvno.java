package kctv.web.mvno;

public class Mvno {
	private int seq;
	private String manufacturer;
	private int serviceable_flag;
	private int mms_flag;
	private int data_flag;
	private String note;
	private String model_name;

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public int getServiceable_flag() {
		return serviceable_flag;
	}

	public void setServiceable_flag(int serviceable_flag) {
		this.serviceable_flag = serviceable_flag;
	}

	public int getMms_flag() {
		return mms_flag;
	}

	public void setMms_flag(int mms_flag) {
		this.mms_flag = mms_flag;
	}

	public int getData_flag() {
		return data_flag;
	}

	public void setData_flag(int data_flag) {
		this.data_flag = data_flag;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getModel_name() {
		return model_name;
	}

	public void setModel_name(String model_name) {
		this.model_name = model_name;
	}

}
