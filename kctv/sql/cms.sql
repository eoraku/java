/* left menu */
select cmme_name "name", cmme_d1 "d1", cmme_d2 "d2", cmme_d3 "d3", cmme_d4 "d4", cmme_d5 "d5", cmme_parent "parent",cmme_depth "depth", cmme_uid "uid", cmme_link "link", cmme_link_target "link_target", cmme_direct_uid "direct_uid", cmct_frame_id "frame_id" 
	from cm_menu a, cm_contents b 
	where cmme_uid = cmct_cmme_uid(+) 
	and cmme_d1 = (select cmme_d1 from cm_menu where cmme_uid=#muid#) 
	/*and (cmme_parent=(select cmme_parent from cm_menu where cmme_uid=#muid#) or cmme_d3=0)*/ 
	and cmme_is_view = 1 and cmme_d2 >= 1 and cmme_depth<4 
	order by cmme_d1, cmme_d2, cmme_d3, cmme_d4, cmme_d5;

select cmme_name "name", cmme_d1 "d1", cmme_d2 "d2", cmme_d3 "d3", cmme_d4 "d4", cmme_d5 "d5", cmme_parent "parent",cmme_depth "depth", cmme_uid "uid", cmme_link "link", cmme_link_target "link_target", cmme_direct_uid "direct_uid", cmct_frame_id "frame_id" 
	,(select count(*) from cm_menu where cmme_parent=a.cmme_uid) "cnt_child"
	from cm_menu a, cm_contents b 
	where cmme_uid = cmct_cmme_uid(+) 
	and cmme_d1 = (select cmme_d1 from cm_menu where cmme_uid=205) 
	and cmme_is_view = 1 and cmme_d2 >= 1 and cmme_depth<4 
	order by cmme_d1, cmme_d2, cmme_d3, cmme_d4, cmme_d5;

/* left menu depth 3 */
select cmme_depth,cmme_uid,cmme_name,cmme_parent from cm_menu where cmme_uid=300;

/* left menu depth 2 */
select * from (select cmme_depth,cmme_uid,cmme_name,cmme_parent from cm_menu where cmme_parent=(select cmme_parent from cm_menu where cmme_uid=300) order by cmme_d1,cmme_d2,cmme_d3,cmme_d4,cmme_d5) where rownum<=1;

/* left menu depth 1 */
select * from (select cmme_depth,cmme_uid,cmme_name,cmme_parent 
		from cm_menu a
		where cmme_d1 = (select cmme_d1 from cm_menu where cmme_uid=300) 
		and cmme_is_view = 1 and cmme_d2 >= 1 and cmme_depth<4 
		order by cmme_d1, cmme_d2, cmme_d3, cmme_d4, cmme_d5) where rownum<=1;