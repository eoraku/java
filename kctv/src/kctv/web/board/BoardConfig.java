package kctv.web.board;

/**
 * <pre>
 * kctv.web.board
 * BoardConfig.java
 * </pre>
 * <pre>
 * 게시판 설정 정보 사용을 위한 모델 클래스
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2013. 12. 30.
 * @version: 
 */
public class BoardConfig {
	int    cfg_uid;
	String cfg_board_id;
	String cfg_group_id;
	String cfg_board_name;
	String cfg_board_table;
	String cfg_is_file;
	String cfg_is_notice;
	String cfg_is_secret;
	String cfg_is_category;
	String cfg_is_comment;
	String cfg_is_reply;
	String cfg_is_vote;
	String cfg_is_memberboard;
	String cfg_is_formmail;
	String cfg_is_group;
	int    cfg_grant_list;
	int    cfg_grant_read;
	int    cfg_grant_write;
	int    cfg_grant_comment;
	String cfg_header;
	String cfg_footer;
	String cfg_skin_list;
	String cfg_skin_read;
	String cfg_skin_write;
	String cfg_skin_pwd;
	String cfg_skin_comment;
	int    cfg_row_per_page;
	int    cfg_page_per_block;
	int    cfg_limit_depth;
	int    cfg_subject_length;
	int    cfg_limit_new;
	String cfg_is_image_view;
	String cfg_max_image_size;
	String cfg_page_num_color;
	String cfg_page_num_flag;
	String cfg_page_num_link_style;
	String cfg_is_addorigin;
	int    cfg_limit_write_time;
	String cfg_allow_file;
	int    cfg_max_filesize;
	int    cfg_max_file_cnt;
	String cfg_is_tag;
	String cfg_delete_reply;
	int    cfg_max_image_width;
	String cfg_view_prev_next;
	String cfg_view_list;
	String cfg_view_family;
	String cfg_icon_re;
	String cfg_icon_new;
	String cfg_icon_notice;
	String cfg_icon_secret;
	String cfg_icon_file;
	String cfg_regdate;
	String cfg_header_contents;
	String cfg_footer_contents;
	
	public boolean isCategory(){
		if(cfg_is_category != null && cfg_is_category.equals("1"))
			return true;
		else
			return false;
	}
	
	public boolean isGroup(){
		if(cfg_is_group !=null && cfg_is_group.equals("1"))
			return true;
		else
			return false;
	}
	
	public boolean isFile(){
		if(cfg_is_file != null && cfg_is_file.equals("1"))
			return true;
		else
			return false;
	}
	
	public boolean isComment(){
		if(cfg_is_comment != null && cfg_is_comment.equals("1"))
			return true;
		else
			return false;
	}
	
	public int getCfg_uid() {
		return cfg_uid;
	}
	public void setCfg_uid(int cfg_uid) {
		this.cfg_uid = cfg_uid;
	}
	public String getCfg_board_id() {
		return cfg_board_id;
	}
	public void setCfg_board_id(String cfg_board_id) {
		this.cfg_board_id = cfg_board_id;
	}
	public String getCfg_group_id() {
		return cfg_group_id;
	}

	public void setCfg_group_id(String cfg_group_id) {
		this.cfg_group_id = cfg_group_id;
	}

	public String getCfg_board_name() {
		return cfg_board_name;
	}
	public void setCfg_board_name(String cfg_board_name) {
		this.cfg_board_name = cfg_board_name;
	}
	public String getCfg_board_table() {
		return cfg_board_table;
	}
	public void setCfg_board_table(String cfg_board_table) {
		this.cfg_board_table = cfg_board_table;
	}
	public String getCfg_is_file() {
		return cfg_is_file;
	}
	public void setCfg_is_file(String cfg_is_file) {
		this.cfg_is_file = cfg_is_file;
	}
	public String getCfg_is_notice() {
		return cfg_is_notice;
	}
	public void setCfg_is_notice(String cfg_is_notice) {
		this.cfg_is_notice = cfg_is_notice;
	}
	public String getCfg_is_secret() {
		return cfg_is_secret;
	}
	public void setCfg_is_secret(String cfg_is_secret) {
		this.cfg_is_secret = cfg_is_secret;
	}
	public String getCfg_is_category() {
		return cfg_is_category;
	}
	public void setCfg_is_category(String cfg_is_category) {
		this.cfg_is_category = cfg_is_category;
	}
	public String getCfg_is_comment() {
		return cfg_is_comment;
	}
	public void setCfg_is_comment(String cfg_is_comment) {
		this.cfg_is_comment = cfg_is_comment;
	}
	public String getCfg_is_reply() {
		return cfg_is_reply;
	}
	public void setCfg_is_reply(String cfg_is_reply) {
		this.cfg_is_reply = cfg_is_reply;
	}
	public String getCfg_is_vote() {
		return cfg_is_vote;
	}
	public void setCfg_is_vote(String cfg_is_vote) {
		this.cfg_is_vote = cfg_is_vote;
	}
	public String getCfg_is_memberboard() {
		return cfg_is_memberboard;
	}
	public void setCfg_is_memberboard(String cfg_is_memberboard) {
		this.cfg_is_memberboard = cfg_is_memberboard;
	}
	public String getCfg_is_formmail() {
		return cfg_is_formmail;
	}
	public void setCfg_is_formmail(String cfg_is_formmail) {
		this.cfg_is_formmail = cfg_is_formmail;
	}
	public String getCfg_is_group() {
		return cfg_is_group;
	}
	public void setCfg_is_group(String cfg_is_group) {
		this.cfg_is_group = cfg_is_group;
	}
	public int getCfg_grant_list() {
		return cfg_grant_list;
	}
	public void setCfg_grant_list(int cfg_grant_list) {
		this.cfg_grant_list = cfg_grant_list;
	}
	public int getCfg_grant_read() {
		return cfg_grant_read;
	}
	public void setCfg_grant_read(int cfg_grant_read) {
		this.cfg_grant_read = cfg_grant_read;
	}
	public int getCfg_grant_write() {
		return cfg_grant_write;
	}
	public void setCfg_grant_write(int cfg_grant_write) {
		this.cfg_grant_write = cfg_grant_write;
	}
	public int getCfg_grant_comment() {
		return cfg_grant_comment;
	}
	public void setCfg_grant_comment(int cfg_grant_comment) {
		this.cfg_grant_comment = cfg_grant_comment;
	}
	public String getCfg_header() {
		return cfg_header;
	}
	public void setCfg_header(String cfg_header) {
		this.cfg_header = cfg_header;
	}
	public String getCfg_footer() {
		return cfg_footer;
	}
	public void setCfg_footer(String cfg_footer) {
		this.cfg_footer = cfg_footer;
	}
	public String getCfg_skin_list() {
		return cfg_skin_list;
	}
	public void setCfg_skin_list(String cfg_skin_list) {
		this.cfg_skin_list = cfg_skin_list;
	}
	public String getCfg_skin_read() {
		return cfg_skin_read;
	}
	public void setCfg_skin_read(String cfg_skin_read) {
		this.cfg_skin_read = cfg_skin_read;
	}
	public String getCfg_skin_write() {
		return cfg_skin_write;
	}
	public void setCfg_skin_write(String cfg_skin_write) {
		this.cfg_skin_write = cfg_skin_write;
	}
	public String getCfg_skin_pwd() {
		return cfg_skin_pwd;
	}
	public void setCfg_skin_pwd(String cfg_skin_pwd) {
		this.cfg_skin_pwd = cfg_skin_pwd;
	}
	public String getCfg_skin_comment() {
		return cfg_skin_comment;
	}
	public void setCfg_skin_comment(String cfg_skin_comment) {
		this.cfg_skin_comment = cfg_skin_comment;
	}
	public int getCfg_row_per_page() {
		return cfg_row_per_page;
	}
	public void setCfg_row_per_page(int cfg_row_per_page) {
		this.cfg_row_per_page = cfg_row_per_page;
	}
	public int getCfg_page_per_block() {
		return cfg_page_per_block;
	}
	public void setCfg_page_per_block(int cfg_page_per_block) {
		this.cfg_page_per_block = cfg_page_per_block;
	}
	public int getCfg_limit_depth() {
		return cfg_limit_depth;
	}
	public void setCfg_limit_depth(int cfg_limit_depth) {
		this.cfg_limit_depth = cfg_limit_depth;
	}
	public int getCfg_subject_length() {
		return cfg_subject_length;
	}
	public void setCfg_subject_length(int cfg_subject_length) {
		this.cfg_subject_length = cfg_subject_length;
	}
	public int getCfg_limit_new() {
		return cfg_limit_new;
	}
	public void setCfg_limit_new(int cfg_limit_new) {
		this.cfg_limit_new = cfg_limit_new;
	}
	public String getCfg_is_image_view() {
		return cfg_is_image_view;
	}
	public void setCfg_is_image_view(String cfg_is_image_view) {
		this.cfg_is_image_view = cfg_is_image_view;
	}
	public String getCfg_max_image_size() {
		return cfg_max_image_size;
	}
	public void setCfg_max_image_size(String cfg_max_image_size) {
		this.cfg_max_image_size = cfg_max_image_size;
	}
	public String getCfg_page_num_color() {
		return cfg_page_num_color;
	}
	public void setCfg_page_num_color(String cfg_page_num_color) {
		this.cfg_page_num_color = cfg_page_num_color;
	}
	public String getCfg_page_num_flag() {
		return cfg_page_num_flag;
	}
	public void setCfg_page_num_flag(String cfg_page_num_flag) {
		this.cfg_page_num_flag = cfg_page_num_flag;
	}
	public String getCfg_page_num_link_style() {
		return cfg_page_num_link_style;
	}
	public void setCfg_page_num_link_style(String cfg_page_num_link_style) {
		this.cfg_page_num_link_style = cfg_page_num_link_style;
	}
	public String getCfg_is_addorigin() {
		return cfg_is_addorigin;
	}
	public void setCfg_is_addorigin(String cfg_is_addorigin) {
		this.cfg_is_addorigin = cfg_is_addorigin;
	}
	public int getCfg_limit_write_time() {
		return cfg_limit_write_time;
	}
	public void setCfg_limit_write_time(int cfg_limit_write_time) {
		this.cfg_limit_write_time = cfg_limit_write_time;
	}
	public String getCfg_allow_file() {
		return cfg_allow_file;
	}
	public void setCfg_allow_file(String cfg_allow_file) {
		this.cfg_allow_file = cfg_allow_file;
	}
	public int getCfg_max_filesize() {
		return cfg_max_filesize;
	}
	public void setCfg_max_filesize(int cfg_max_filesize) {
		this.cfg_max_filesize = cfg_max_filesize;
	}
	public int getCfg_max_file_cnt() {
		return cfg_max_file_cnt;
	}
	public void setCfg_max_file_cnt(int cfg_max_file_cnt) {
		this.cfg_max_file_cnt = cfg_max_file_cnt;
	}
	public String getCfg_is_tag() {
		return cfg_is_tag;
	}
	public void setCfg_is_tag(String cfg_is_tag) {
		this.cfg_is_tag = cfg_is_tag;
	}
	public String getCfg_delete_reply() {
		return cfg_delete_reply;
	}
	public void setCfg_delete_reply(String cfg_delete_reply) {
		this.cfg_delete_reply = cfg_delete_reply;
	}
	public int getCfg_max_image_width() {
		return cfg_max_image_width;
	}
	public void setCfg_max_image_width(int cfg_max_image_width) {
		this.cfg_max_image_width = cfg_max_image_width;
	}
	public String getCfg_view_prev_next() {
		return cfg_view_prev_next;
	}
	public void setCfg_view_prev_next(String cfg_view_prev_next) {
		this.cfg_view_prev_next = cfg_view_prev_next;
	}
	public String getCfg_view_list() {
		return cfg_view_list;
	}
	public void setCfg_view_list(String cfg_view_list) {
		this.cfg_view_list = cfg_view_list;
	}
	public String getCfg_view_family() {
		return cfg_view_family;
	}
	public void setCfg_view_family(String cfg_view_family) {
		this.cfg_view_family = cfg_view_family;
	}
	public String getCfg_icon_re() {
		return cfg_icon_re;
	}
	public void setCfg_icon_re(String cfg_icon_re) {
		this.cfg_icon_re = cfg_icon_re;
	}
	public String getCfg_icon_new() {
		return cfg_icon_new;
	}
	public void setCfg_icon_new(String cfg_icon_new) {
		this.cfg_icon_new = cfg_icon_new;
	}
	public String getCfg_icon_notice() {
		return cfg_icon_notice;
	}
	public void setCfg_icon_notice(String cfg_icon_notice) {
		this.cfg_icon_notice = cfg_icon_notice;
	}
	public String getCfg_icon_secret() {
		return cfg_icon_secret;
	}
	public void setCfg_icon_secret(String cfg_icon_secret) {
		this.cfg_icon_secret = cfg_icon_secret;
	}
	public String getCfg_icon_file() {
		return cfg_icon_file;
	}
	public void setCfg_icon_file(String cfg_icon_file) {
		this.cfg_icon_file = cfg_icon_file;
	}
	public String getCfg_regdate() {
		return cfg_regdate;
	}
	public void setCfg_regdate(String cfg_regdate) {
		this.cfg_regdate = cfg_regdate;
	}
	public String getCfg_header_contents() {
		return cfg_header_contents;
	}
	public void setCfg_header_contents(String cfg_header_contents) {
		this.cfg_header_contents = cfg_header_contents;
	}
	public String getCfg_footer_contents() {
		return cfg_footer_contents;
	}
	public void setCfg_footer_contents(String cfg_footer_contents) {
		this.cfg_footer_contents = cfg_footer_contents;
	}
}
