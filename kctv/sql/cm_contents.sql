--------------------------------------------------------
--  파일이 생성됨 - 화요일-11월-20-2012   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CM_CONTENTS
--------------------------------------------------------

  CREATE TABLE "KCTV2"."CM_CONTENTS" 
   (	"CMCT_CMME_UID" NUMBER(10,0), 
	"CMCT_FRAME_ID" NUMBER(2,0), 
	"CMCT_TYPE" NUMBER(1,0), 
	"CMCT_CHARGE" VARCHAR2(100 BYTE), 
	"CMCT_IS_HIT" NUMBER(1,0), 
	"CMCT_HIT" NUMBER(10,0) DEFAULT 0, 
	"CMCT_CONTENTS" CLOB, 
	"CMCT_BOARD_ID" VARCHAR2(20 BYTE), 
	"CMCT_EXEFILE" VARCHAR2(255 BYTE), 
	"CMCT_REGDATE" DATE, 
	"CMCT_MODIFYDATE" DATE, 
	"CMCT_ADAD_ID" VARCHAR2(12 BYTE), 
	"CMCT_AHEAD_TYPE" NUMBER(1,0), 
	"CMCT_AHEAD_CONTENTS" VARCHAR2(4000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 262144 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" 
 LOB ("CMCT_CONTENTS") STORE AS (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 PCTVERSION 10
  NOCACHE LOGGING 
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)) ;
 

   COMMENT ON COLUMN "KCTV2"."CM_CONTENTS"."CMCT_CMME_UID" IS '메뉴번호';
 
   COMMENT ON COLUMN "KCTV2"."CM_CONTENTS"."CMCT_FRAME_ID" IS '콘텐츠 프레임 주소(config.asp에 정의 CFG_ARR_FRAME)';
 
   COMMENT ON COLUMN "KCTV2"."CM_CONTENTS"."CMCT_TYPE" IS '콘텐트 타입(0: HTML 입력 1: 게시판 2: 실행 파일명 등록 )';
 
   COMMENT ON COLUMN "KCTV2"."CM_CONTENTS"."CMCT_CHARGE" IS '콘텐츠 담당자';
 
   COMMENT ON COLUMN "KCTV2"."CM_CONTENTS"."CMCT_IS_HIT" IS '조회수 여부(0: 카운트 차단 1: 카운트 허용)';
 
   COMMENT ON COLUMN "KCTV2"."CM_CONTENTS"."CMCT_HIT" IS '조회수';
 
   COMMENT ON COLUMN "KCTV2"."CM_CONTENTS"."CMCT_CONTENTS" IS '메뉴 내용(HTML 입력)';
 
   COMMENT ON COLUMN "KCTV2"."CM_CONTENTS"."CMCT_BOARD_ID" IS '게시판 아이디(게시판 연결)';
 
   COMMENT ON COLUMN "KCTV2"."CM_CONTENTS"."CMCT_EXEFILE" IS '실행 파일(파일 연결)';
 
   COMMENT ON COLUMN "KCTV2"."CM_CONTENTS"."CMCT_REGDATE" IS '콘텐츠 등록일';
 
   COMMENT ON COLUMN "KCTV2"."CM_CONTENTS"."CMCT_MODIFYDATE" IS '콘텐츠 수정일';
 
   COMMENT ON COLUMN "KCTV2"."CM_CONTENTS"."CMCT_ADAD_ID" IS '콘텐츠 등록자';
 
   COMMENT ON COLUMN "KCTV2"."CM_CONTENTS"."CMCT_AHEAD_TYPE" IS '상단 콘텐츠 사용여부(1:사용, 0:사용안함)';
 
   COMMENT ON COLUMN "KCTV2"."CM_CONTENTS"."CMCT_AHEAD_CONTENTS" IS '상단 콘텐츠 내용(Html 입력)';
REM INSERTING into KCTV2.CM_CONTENTS
SET DEFINE OFF;
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (62,3,0,'. 관리자[test@test.test] (☎ )',1,6257,null,null,to_date('06/08/03','RR/MM/DD'),to_date('07/04/20','RR/MM/DD'),'admin1',1,'<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=13><IMG height=147 src="/images/50/52-mid_left.gif" width=13></TD>
<TD vAlign=center background=/images/50/52-mid_bg.gif>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD vAlign=top width=205><IMG height=113 src="/images/50/61-img.gif" width=193></TD>
<TD vAlign=top>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD height=26><SPAN style="FONT-SIZE: 14px"><IMG height=13 hspace=5 src="/images/50/icon_point1.gif" width=5 align=absMiddle vspace=5><STRONG>뮤직 5 </STRONG></SPAN></TD></TR>
<TR>
<TD background=../images/50/52-line.gif height=2></TD></TR>
<TR>
<TD>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-time.gif" width=64 vspace=3></TD>
<TD><STRONG><FONT color=#49aab0>60분</FONT></STRONG>/ (수) 13:10, 17:30, 20:30, 00:00, 03:20 <BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (토) 13:10, 16:50, 20:30, 00:00, 03:20</TD></TR>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-charge.gif" width=64 vspace=3></TD>
<TD><FONT color=#333333>&#8226; PD :강방석 &#8226; 작가:김경순</FONT></TD></TR>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-master.gif" width=64 vspace=3></TD>
<TD><FONT color=#333333>강경필</FONT></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
<TD width=13><IMG height=147 src="/images/50/52-mid_right.gif" width=13></TD></TR></TBODY></TABLE>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (68,3,0,'. 관리자[test@test.test] (☎ )',1,15335,null,null,to_date('06/08/03','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',1,'<div id="program_top">
	<ul>
		<li id="program_left"><img src="/images/50/52-mid_left.gif" width="13" height="147"></li>
		<li id="program_center">
			<ul id="ul_program_center">
				<li id="program_img"><img src="/images/50/67-img.gif" width="193" height="113"></li>
				<li id="program_info">
					<ul id="ul_program_info">
						<li id="program_info_1"><img src="/images/50/icon_point1.gif" width="5" height="13"> <strong>Scuba 리포트</strong></li>
						<li id="program_info_2"></li>
						<li id="program_info_3"><img src="/images/50/52-time.gif" width="64" height="21"> <strong>30분 해양다큐멘터리 (월 1편)</strong> / <a href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</a></li>
						<li id="program_info_4"><img src="/images/50/52-charge.gif" width="64" height="21"> PD : 한경엽, 수중촬영 : 이명덕(DiveWeb)</li>
					</ul>
				</li>
			</ul>
		</li>
		<li id="program_right"><img src="/images/50/52-mid_right.gif" width=13 height=147></li>
	</ul>
</div>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (256,3,2,'kctvjeju12 kctvjeju12[ra9801@kctvjeju.com] (☎ )',0,0,null,'/program/news_event.asp',to_date('08/10/10','RR/MM/DD'),to_date('08/10/13','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (224,3,3,'kctvjeju12 kctvjeju12[ra9801@kctvjeju.com] (☎ )',0,0,null,null,to_date('08/10/14','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (287,3,3,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,null,to_date('09/08/21','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (288,4,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/program/foregin.asp',to_date('09/09/23','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (289,4,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/program/foregin_1.asp',to_date('09/09/25','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (290,4,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/program/foregin_2.asp',to_date('09/09/25','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (291,4,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/program/foregin_3.asp',to_date('09/09/25','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (73,3,0,'. 관리자[test@test.test] (☎ )',1,24531,null,null,to_date('06/08/03','RR/MM/DD'),to_date('12/08/30','RR/MM/DD'),'kctvjeju12',1,'<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD width=13><IMG src="/images/50/52-mid_left.gif" width=13 height=147></TD>
<TD vAlign=center background=/images/50/52-mid_bg.gif>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD vAlign=top width=205><IMG src="/program/img/fishing.jpg" width=193 height=113></TD>
<TD vAlign=top>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD height=26><SPAN style="FONT-SIZE: 14px"><IMG hspace=5 vspace=5 align=absMiddle src="/images/50/icon_point1.gif" width=5 height=13><STRONG>SPECIAL FISHING!!</STRONG></SPAN></TD></TR>
<TR>
<TD height=2 background=../images/50/52-line.gif></TD></TR>
<TR>
<TD>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD width=75><IMG hspace=3 vspace=3 src="/images/50/52-time.gif" width=64 height=21></TD>
<TD><STRONG><FONT color=#49aab0>(수) 08:00, 13:20, 18:30</FONT></STRONG><STRONG><FONT color=#49aab0>&nbsp;</FONT></STRONG>/ <A href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</A></TD></TR>
<TR>
<TD width=75><IMG hspace=3 vspace=3 src="/images/50/52-charge.gif" width=64 height=21></TD>
<TD><FONT color=#333333>&#8226; PD :&nbsp;부강언,&nbsp;정승원 </FONT></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
<TD width=13><IMG src="/images/50/52-mid_right.gif" width=13 height=147></TD></TR></TBODY></TABLE>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (54,3,0,'. 관리자[test@test.test] (☎ )',1,74530,null,null,to_date('06/07/26','RR/MM/DD'),to_date('11/06/29','RR/MM/DD'),'kctvjeju12',1,'<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD width=13><IMG src="/images/50/52-mid_left.gif" width=13 height=147></TD>
<TD vAlign=center background=/images/50/52-mid_bg.gif>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD vAlign=top width=205><IMG src="/images/50/52-thum.gif" width=193 height=113></TD>
<TD vAlign=top>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD height=26><SPAN style="FONT-SIZE: 14px"><IMG hspace=5 vspace=5 align=absMiddle src="/images/50/icon_point1.gif" width=5 height=13><STRONG>삼춘 어디감수과 </STRONG></SPAN></TD></TR>
<TR>
<TD height=2 background=../images/50/52-line.gif></TD></TR>
<TR>
<TD>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD width=75><IMG hspace=3 vspace=3 src="/images/50/52-time.gif" width=64 height=21></TD>
<TD><STRONG><FONT color=#49aab0>40분</FONT></STRONG>/ <A href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</A></TD></TR>
<TR>
<TD width=75><IMG hspace=3 vspace=3 src="/images/50/52-charge.gif" width=64 height=21></TD>
<TD><FONT color=#333333>&#8226; PD :&nbsp;이태민&nbsp;&nbsp; </FONT></TD></TR>
<TR>
<TD width=75><IMG hspace=3 vspace=3 src="/images/50/52-master.gif" width=64 height=21></TD>
<TD><FONT color=#333333>오미연(제주어 진행)</FONT></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
<TD width=13><IMG src="/images/50/52-mid_right.gif" width=13 height=147></TD></TR></TBODY></TABLE>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (297,0,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/product/dv_phone_intro.asp',to_date('09/11/06','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (298,0,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/product/dv_phone_price.asp',to_date('09/11/06','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (299,0,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/product/dv_in_price.asp',to_date('09/11/09','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (300,0,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/product/dv_in_intro.asp',to_date('09/11/09','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (301,0,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/product/triple.asp',to_date('09/11/11','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (303,0,2,'편성제작국 관리자[webmaster@kctvjeju.com] (☎ 064-741-7728)',0,0,null,'/product/double.asp',to_date('09/11/16','RR/MM/DD'),to_date('09/11/16','RR/MM/DD'),'admin',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (310,0,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/product/dv_set_intro.asp',to_date('09/11/26','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (314,5,0,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,null,to_date('10/01/14','RR/MM/DD'),to_date('10/01/14','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (268,3,3,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'268',to_date('09/04/10','RR/MM/DD'),to_date('09/05/28','RR/MM/DD'),'kctvjeju12',0,'<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=13><IMG height=147 src="/images/50/52-mid_left.gif" width=13></TD>
<TD vAlign=center background=/images/50/52-mid_bg.gif>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD vAlign=top width=205><IMG height=113 src="/program/img/apt2.jpg" 
width=193></TD>
<TD vAlign=top>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD height=26><SPAN style="FONT-SIZE: 14px"><IMG height=13 hspace=5 
src="/images/50/icon_point1.gif" width=5 align=absMiddle vspace=5><STRONG>우리 
아파트로 오세요</STRONG></SPAN></TD></TR>
<TR>
<TD background=../images/50/52-line.gif height=2></TD></TR>
<TR>
<TD>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-time.gif" width=64 
vspace=3></TD>
<TD><STRONG><FONT color=#49aab0>30분 </FONT></STRONG>/ <A 
href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</A></TD></TR>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-charge.gif" width=64 
vspace=3></TD>
<TD><FONT color=#333333>&#8226; PD : 이태민&nbsp; </FONT></TD></TR>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-master.gif" width=64 
vspace=3></TD>
<TD><FONT color=#333333>일일리포터(아파트주민) 
</FONT></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
<TD width=13><IMG height=147 src="/images/50/52-mid_right.gif" 
width=13></TD></TR></TBODY></TABLE>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (114,3,0,'. 관리자[test@test.test] (☎ )',1,31936,null,null,to_date('06/07/28','RR/MM/DD'),to_date('08/06/23','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (192,0,0,'. 관리자[test@test.test] (☎ )',1,18,null,null,to_date('06/08/01','RR/MM/DD'),to_date('06/08/02','RR/MM/DD'),'admin3',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (124,4,1,'test test[test@test.co.kr] (☎ )',1,10434,'visit',null,to_date('06/07/28','RR/MM/DD'),null,'test',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (118,4,1,'test test[test@test.co.kr] (☎ )',1,119,'cablefq',null,to_date('06/07/28','RR/MM/DD'),null,'test',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (119,4,1,'test test[test@test.co.kr] (☎ )',1,8590,'cableqa',null,to_date('06/07/28','RR/MM/DD'),null,'test',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (163,7,2,'. 관리자[test@test.test] (☎ )',1,12404,null,'/promise/use.html',to_date('06/07/29','RR/MM/DD'),to_date('07/08/14','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (186,0,0,'. 관리자[test@test.test] (☎ )',1,50,null,null,to_date('06/07/31','RR/MM/DD'),to_date('07/09/19','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (164,7,2,'. 관리자[test@test.test] (☎ )',1,10933,null,'/promise/use_cable.html',to_date('06/07/29','RR/MM/DD'),to_date('10/01/19','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (173,3,1,'test test[test@test.co.kr] (☎ )',1,95656,'opinion',null,to_date('06/07/29','RR/MM/DD'),null,'test',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (120,4,2,'test test[test@test.co.kr] (☎ )',1,13024,'book','/cabledic/main.asp',to_date('06/07/29','RR/MM/DD'),to_date('07/02/21','RR/MM/DD'),'admin4',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (159,3,4,'test test[test@test.co.kr] (☎ )',1,1048,null,'159',to_date('06/07/29','RR/MM/DD'),to_date('07/06/15','RR/MM/DD'),'admin2',0,'<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=13><IMG height=147 src="/images/50/52-mid_left.gif" width=13></TD>
<TD vAlign=center background=/images/50/52-mid_bg.gif>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD vAlign=top width=205><IMG height=113 src="/images/50/72-img.gif" width=193></TD>
<TD vAlign=top>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD height=26><SPAN style="FONT-SIZE: 14px"><IMG height=13 hspace=5 src="/images/50/icon_point1.gif" width=5 align=absMiddle vspace=5><STRONG>SPECIAL FISHING!! 제 주 바 다 </STRONG></SPAN></TD></TR>
<TR>
<TD background=../images/50/52-line.gif height=2></TD></TR>
<TR>
<TD>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-time.gif" width=64 vspace=3></TD>
<TD><STRONG><FONT color=#49aab0>격주30분</FONT></STRONG>/ <BR>(화,금) 08:30, 10:30, 14:30, 18:30, 23:30, 02:40, 05:20</TD></TR>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-charge.gif" width=64 vspace=3></TD>
<TD><FONT color=#333333>&#8226; PD :&nbsp;부강언 CAM : 한경엽,&nbsp;부강언,&nbsp;정승원 </FONT></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
<TD width=13><IMG height=147 src="/images/50/52-mid_right.gif" width=13></TD></TR></TBODY></TABLE>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (185,8,2,'. 관리자[test@test.test] (☎ )',1,26057,null,'/sitemap/sitemap.asp',to_date('06/07/31','RR/MM/DD'),to_date('06/08/09','RR/MM/DD'),'admin',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (187,0,0,'. 관리자[test@test.test] (☎ )',1,13,null,null,to_date('06/07/31','RR/MM/DD'),null,'admin3',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (34,1,1,'test test[test@test.co.kr] (☎ )',1,54051,'pp',null,to_date('06/07/31','RR/MM/DD'),null,'test',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (28,0,2,'. 관리자[admin2@test.test] (☎ )',1,7960,null,'/cyber/advertise.asp',to_date('06/08/01','RR/MM/DD'),to_date('06/08/18','RR/MM/DD'),'admin',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (193,0,0,'. 관리자[admin2@test.test] (☎ )',1,12,null,null,to_date('06/08/01','RR/MM/DD'),to_date('06/08/02','RR/MM/DD'),'admin3',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (194,0,0,'. 관리자[admin2@test.test] (☎ )',1,12,null,null,to_date('06/08/01','RR/MM/DD'),to_date('06/08/02','RR/MM/DD'),'admin3',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (29,0,2,'. 관리자[test@test.test] (☎ )',1,18225,null,'/product/price_search_step1.asp',to_date('06/08/02','RR/MM/DD'),to_date('06/08/09','RR/MM/DD'),'admin',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (195,0,0,'. 관리자[admin2@test.test] (☎ )',1,7,null,null,to_date('06/08/01','RR/MM/DD'),to_date('06/08/02','RR/MM/DD'),'admin3',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (113,3,2,'test test[test@test.co.kr] (☎ )',1,212508,null,'/pro_view/List_hd.asp',to_date('06/08/01','RR/MM/DD'),to_date('11/07/06','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (191,0,0,'. admin4[test@test.test] (☎ )',1,3,null,null,to_date('06/08/02','RR/MM/DD'),to_date('07/09/19','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (3,0,2,null,1,148695,null,'/product/dv_on.asp',to_date('06/07/21','RR/MM/DD'),to_date('09/07/07','RR/MM/DD'),'kctvjeju12',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (117,4,1,'나우엔터 관리자[shinda@nowenter.co.kr] (☎ ..)',1,154506,'notice',null,to_date('06/07/22','RR/MM/DD'),to_date('06/08/04','RR/MM/DD'),'admin',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (4,0,2,'. 관리자[test@test.test] (☎ )',1,11108,null,'/product/on_music.asp',to_date('06/07/24','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (162,5,0,null,1,4,null,null,to_date('06/07/25','RR/MM/DD'),null,'admin2',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (152,7,2,null,1,4836,null,'/member/join.asp',to_date('06/07/24','RR/MM/DD'),to_date('07/08/27','RR/MM/DD'),'kctvjeju12',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (128,5,2,null,1,62893,null,'/help/service_int_request.asp',to_date('06/07/24','RR/MM/DD'),to_date('06/07/30','RR/MM/DD'),'admin',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (160,5,2,null,1,19,null,'/help/bill_search_amount.asp',to_date('06/07/25','RR/MM/DD'),to_date('06/07/31','RR/MM/DD'),'admin',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (129,5,2,null,1,17313,null,'/help/service_as_request.asp',to_date('06/07/24','RR/MM/DD'),to_date('06/07/30','RR/MM/DD'),'admin',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (130,5,2,null,1,4422,null,'/help/service_move_request.asp',to_date('06/07/24','RR/MM/DD'),to_date('06/07/30','RR/MM/DD'),'admin',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (131,5,2,null,1,7668,null,'/help/member_login.asp',to_date('06/07/24','RR/MM/DD'),to_date('06/07/31','RR/MM/DD'),'admin',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (158,5,2,null,1,26,null,'/help/member_search_work.asp',to_date('06/07/25','RR/MM/DD'),to_date('06/07/31','RR/MM/DD'),'admin',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (133,5,2,null,1,4020,null,'/help/bill_search_amount.asp',to_date('06/07/25','RR/MM/DD'),to_date('06/07/31','RR/MM/DD'),'admin',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (134,5,2,null,1,115,null,'/help/bill_account_change.asp',to_date('06/07/25','RR/MM/DD'),to_date('06/07/31','RR/MM/DD'),'admin',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (161,5,2,null,1,14,null,'/help/bill_pay_amount.asp',to_date('06/07/25','RR/MM/DD'),to_date('06/07/31','RR/MM/DD'),'admin',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (135,5,2,null,1,105,null,'/help/bill_pay_amount.asp',to_date('06/07/25','RR/MM/DD'),to_date('06/07/31','RR/MM/DD'),'admin',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (151,7,2,'test test[test@test.co.kr] (☎ )',1,15278,null,'/member/login.asp',to_date('06/07/25','RR/MM/DD'),to_date('08/11/20','RR/MM/DD'),'kctvjeju12',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (138,5,1,null,1,23792,'event',null,to_date('06/07/25','RR/MM/DD'),to_date('06/08/04','RR/MM/DD'),'admin',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (139,5,2,null,1,11295,null,'/custom/use_ars.asp',to_date('06/07/25','RR/MM/DD'),to_date('12/11/02','RR/MM/DD'),'kctvjeju12',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (165,5,2,null,1,17686,null,'/custom/use_digital.asp',to_date('06/07/27','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (168,5,0,null,1,2797,null,null,to_date('06/07/27','RR/MM/DD'),to_date('10/07/06','RR/MM/DD'),'kctvjeju12',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (169,5,0,null,1,4482,null,null,to_date('06/07/27','RR/MM/DD'),to_date('10/06/22','RR/MM/DD'),'kctvjeju12',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (5,0,2,'. 관리자[admin2@test.test] (☎ )',1,11687,null,'/product/on_data.asp',to_date('06/07/27','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (170,5,0,null,1,4689,null,null,to_date('06/07/27','RR/MM/DD'),to_date('08/10/29','RR/MM/DD'),'kctvjeju12',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (6,0,2,'. 관리자[test@test.test] (☎ )',1,9638,null,'/product/on_norae.asp',to_date('06/07/27','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (8,0,2,'. 관리자[admin2@test.test] (☎ )',1,14006,null,'/product/on_pay.asp',to_date('06/07/27','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (7,0,2,'. 관리자[admin2@test.test] (☎ )',1,12545,null,'/vod/intro.html',to_date('06/07/27','RR/MM/DD'),to_date('08/09/17','RR/MM/DD'),'kctvjeju12',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (10,0,0,'. 관리자[admin2@test.test] (☎ )',1,107873,null,null,to_date('06/07/27','RR/MM/DD'),to_date('11/12/12','RR/MM/DD'),'admin',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (16,0,0,'. 관리자[admin2@test.test] (☎ )',1,29077,null,null,to_date('06/07/27','RR/MM/DD'),to_date('08/10/14','RR/MM/DD'),'kctvjeju12',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (23,0,0,'. 관리자[admin2@test.test] (☎ )',1,25206,null,null,to_date('06/07/27','RR/MM/DD'),to_date('07/04/21','RR/MM/DD'),'admin1',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (27,0,2,'. 관리자[admin2@test.test] (☎ )',1,19145,null,'/product/ad_info.asp',to_date('06/07/27','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (171,5,2,null,1,1904,null,'/custom/use_cable.asp',to_date('06/07/27','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (172,5,0,null,1,1967,null,null,to_date('06/07/27','RR/MM/DD'),to_date('06/07/31','RR/MM/DD'),'admin',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (166,5,2,null,1,5982,null,'/custom/use_cable.asp',to_date('06/07/27','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (11,0,2,'. 관리자[test@test.test] (☎ )',1,53108,null,'/product/cable_normal.asp',to_date('06/07/27','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (149,0,0,'. 관리자[test@test.test] (☎ )',1,31707,null,null,to_date('06/07/27','RR/MM/DD'),to_date('11/12/12','RR/MM/DD'),'kctvjeju12',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (12,0,0,'. 관리자[test@test.test] (☎ )',1,23598,null,null,to_date('06/07/27','RR/MM/DD'),to_date('11/12/12','RR/MM/DD'),'kctvjeju12',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (13,0,0,'. 관리자[test@test.test] (☎ )',1,11483,null,null,to_date('06/07/27','RR/MM/DD'),to_date('09/08/12','RR/MM/DD'),'kctvjeju12',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (14,0,2,'. 관리자[test@test.test] (☎ )',1,14430,null,'/product/cable_pay.asp',to_date('06/07/27','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (17,0,0,'. 관리자[test@test.test] (☎ )',1,8819,null,null,to_date('06/07/27','RR/MM/DD'),to_date('08/10/14','RR/MM/DD'),'kctvjeju12',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (18,0,0,'. 관리자[test@test.test] (☎ )',1,7350,null,null,to_date('06/07/27','RR/MM/DD'),to_date('08/10/14','RR/MM/DD'),'kctvjeju12',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (19,0,0,'. 관리자[admin2@test.test] (☎ )',1,7330,null,null,to_date('06/07/27','RR/MM/DD'),to_date('08/10/14','RR/MM/DD'),'kctvjeju12',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (20,0,0,'. 관리자[admin2@test.test] (☎ )',1,7120,null,null,to_date('06/07/27','RR/MM/DD'),to_date('08/10/14','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (174,5,0,null,1,58,null,null,to_date('06/07/28','RR/MM/DD'),to_date('06/07/31','RR/MM/DD'),'admin',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (175,5,0,null,1,67,null,null,to_date('06/07/28','RR/MM/DD'),to_date('06/07/31','RR/MM/DD'),'admin',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (176,5,0,null,1,94,null,null,to_date('06/07/28','RR/MM/DD'),to_date('06/07/31','RR/MM/DD'),'admin',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (177,5,0,null,1,69,null,null,to_date('06/07/28','RR/MM/DD'),to_date('06/07/31','RR/MM/DD'),'admin',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (178,5,0,null,1,67,null,null,to_date('06/07/28','RR/MM/DD'),to_date('06/07/31','RR/MM/DD'),'admin',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (179,5,0,null,1,63,null,null,to_date('06/07/28','RR/MM/DD'),to_date('06/07/31','RR/MM/DD'),'admin',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (180,5,0,null,1,61,null,null,to_date('06/07/28','RR/MM/DD'),to_date('06/07/31','RR/MM/DD'),'admin',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (181,5,0,null,1,66,null,null,to_date('06/07/28','RR/MM/DD'),to_date('06/07/31','RR/MM/DD'),'admin',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (182,4,0,null,1,99,null,null,to_date('06/07/28','RR/MM/DD'),to_date('06/07/31','RR/MM/DD'),'admin',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (167,5,2,null,1,5516,null,'/custom/use_cnet.asp',to_date('06/07/28','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (21,0,0,'. 관리자[test@test.test] (☎ )',1,7970,null,null,to_date('06/07/28','RR/MM/DD'),to_date('07/10/31','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (24,0,0,'. 관리자[admin2@test.test] (☎ )',1,37166,null,null,to_date('06/07/28','RR/MM/DD'),to_date('08/10/14','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (25,0,0,'. 관리자[admin2@test.test] (☎ )',1,6121,null,null,to_date('06/07/28','RR/MM/DD'),to_date('08/10/13','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (223,3,3,'kctvjeju12 kctvjeju12[ra9801@kctvjeju.com] (☎ )',0,0,null,null,to_date('07/10/02','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (229,3,4,'kctvjeju12 kctvjeju12[ra9801@kctvjeju.com] (☎ )',1,8440,null,'229',to_date('08/02/14','RR/MM/DD'),to_date('08/02/29','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (233,3,1,'kctvjeju12 kctvjeju12[ra9801@kctvjeju.com] (☎ )',0,0,'c_top',null,to_date('08/04/02','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (234,7,2,'kctvjeju12 kctvjeju12[ra9801@kctvjeju.com] (☎ )',0,0,null,'/promise/use_phone.html',to_date('08/05/28','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (246,4,2,'kctvjeju12 kctvjeju12[ra9801@kctvjeju.com] (☎ )',0,0,null,'/vod/intro.html',to_date('08/09/16','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (255,0,2,'kctvjeju12 kctvjeju12[ra9801@kctvjeju.com] (☎ )',0,0,null,'/product/hot.html',to_date('08/10/06','RR/MM/DD'),to_date('08/10/06','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (267,3,0,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,null,to_date('09/04/10','RR/MM/DD'),to_date('09/05/28','RR/MM/DD'),'kctvjeju12',0,'<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=13><IMG height=147 src="/images/50/52-mid_left.gif" width=13></TD>
<TD vAlign=center background=/images/50/52-mid_bg.gif>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD vAlign=top width=205><IMG height=113 src="/program/img/apt2.jpg" 
width=193></TD>
<TD vAlign=top>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD height=26><SPAN style="FONT-SIZE: 14px"><IMG height=13 hspace=5 
src="/images/50/icon_point1.gif" width=5 align=absMiddle vspace=5><STRONG>우리 
아파트로 오세요</STRONG></SPAN></TD></TR>
<TR>
<TD background=../images/50/52-line.gif height=2></TD></TR>
<TR>
<TD>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-time.gif" width=64 
vspace=3></TD>
<TD><STRONG><FONT color=#49aab0>30분 </FONT></STRONG>/ <a href="/contents/index2.asp?muid=235&pmuid=50">편성표 바로가기</a></TD></TR>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-charge.gif" width=64 
vspace=3></TD>
<TD><FONT color=#333333>&#8226; PD : 이태민&nbsp; </FONT></TD></TR>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-master.gif" width=64 
vspace=3></TD>
<TD><FONT color=#333333>일일리포터(아파트주민) 
</FONT></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
<TD width=13><IMG height=147 src="/images/50/52-mid_right.gif" 
width=13></TD></TR></TBODY></TABLE>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (63,3,3,'. 관리자[test@test.test] (☎ )',1,1775,null,'63',to_date('06/08/03','RR/MM/DD'),to_date('07/04/20','RR/MM/DD'),'admin1',1,'<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=13><IMG height=147 src="/images/50/52-mid_left.gif" width=13></TD>
<TD vAlign=center background=/images/50/52-mid_bg.gif>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD vAlign=top width=205><IMG height=113 src="/images/50/61-img.gif" width=193></TD>
<TD vAlign=top>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD height=26><SPAN style="FONT-SIZE: 14px"><IMG height=13 hspace=5 src="/images/50/icon_point1.gif" width=5 align=absMiddle vspace=5><STRONG>뮤직 5 </STRONG></SPAN></TD></TR>
<TR>
<TD background=../images/50/52-line.gif height=2></TD></TR>
<TR>
<TD>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-time.gif" width=64 vspace=3></TD>
<TD><STRONG><FONT color=#49aab0>60분</FONT></STRONG>/ (수) 13:10, 17:30, 20:30, 00:00, 03:20 <BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (토) 13:10, 16:50, 20:30, 00:00, 03:20</TD></TR>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-charge.gif" width=64 vspace=3></TD>
<TD><FONT color=#333333>&#8226; PD :강방석 &#8226; 작가:김경순</FONT></TD></TR>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-master.gif" width=64 vspace=3></TD>
<TD><FONT color=#333333>강경필</FONT></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
<TD width=13><IMG height=147 src="/images/50/52-mid_right.gif" width=13></TD></TR></TBODY></TABLE>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (65,3,4,'test test[test@test.co.kr] (☎ )',1,2137,null,'65',to_date('06/07/29','RR/MM/DD'),to_date('07/04/20','RR/MM/DD'),'admin1',0,'<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=13><IMG height=147 src="/images/50/52-mid_left.gif" width=13></TD>
<TD vAlign=center background=/images/50/52-mid_bg.gif>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD vAlign=top width=205><IMG height=113 src="/images/50/61-img.gif" width=193></TD>
<TD vAlign=top>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD height=26><SPAN style="FONT-SIZE: 14px"><IMG height=13 hspace=5 src="/images/50/icon_point1.gif" width=5 align=absMiddle vspace=5><STRONG>뮤직 5 </STRONG></SPAN></TD></TR>
<TR>
<TD background=../images/50/52-line.gif height=2></TD></TR>
<TR>
<TD>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-time.gif" width=64 vspace=3></TD>
<TD><STRONG><FONT color=#49aab0>60분</FONT></STRONG>/ (수) 13:10, 17:30, 20:30, 00:00, 03:20 <BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (토) 13:10, 16:50, 20:30, 00:00, 03:20</TD></TR>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-charge.gif" width=64 vspace=3></TD>
<TD><FONT color=#333333>&#8226; PD :강방석 &#8226; 작가:김경순</FONT></TD></TR>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-master.gif" width=64 vspace=3></TD>
<TD><FONT color=#333333>강경필</FONT></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
<TD width=13><IMG height=147 src="/images/50/52-mid_right.gif" width=13></TD></TR></TBODY></TABLE>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (69,3,3,'. 관리자[test@test.test] (☎ )',1,13515,null,'69',to_date('06/08/03','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',1,'<div id="program_top">
	<ul>
		<li id="program_left"><img src="/images/50/52-mid_left.gif" width="13" height="147"></li>
		<li id="program_center">
			<ul id="ul_program_center">
				<li id="program_img"><img src="/images/50/67-img.gif" width="193" height="113"></li>
				<li id="program_info">
					<ul id="ul_program_info">
						<li id="program_info_1"><img src="/images/50/icon_point1.gif" width="5" height="13"> <strong>Scuba 리포트</strong></li>
						<li id="program_info_2"></li>
						<li id="program_info_3"><img src="/images/50/52-time.gif" width="64" height="21"> <strong>30분 해양다큐멘터리 (월 1편)</strong> / <a href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</a></li>
						<li id="program_info_4"><img src="/images/50/52-charge.gif" width="64" height="21"> PD : 한경엽, 수중촬영 : 이명덕(DiveWeb)</li>
					</ul>
				</li>
			</ul>
		</li>
		<li id="program_right"><img src="/images/50/52-mid_right.gif" width=13 height=147></li>
	</ul>
</div>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (70,3,4,'test test[test@test.co.kr] (☎ )',1,151,null,'70',to_date('06/07/26','RR/MM/DD'),to_date('07/04/20','RR/MM/DD'),'admin1',null,'<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=13><IMG height=147 src="/images/50/52-mid_left.gif" width=13></TD>
<TD vAlign=center background=/images/50/52-mid_bg.gif>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD vAlign=top width=205><IMG height=113 src="/images/50/67-img.gif" width=193></TD>
<TD vAlign=top>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD height=26><SPAN style="FONT-SIZE: 14px"><IMG height=13 hspace=5 src="/images/50/icon_point1.gif" width=5 align=absMiddle vspace=5><STRONG>Scuba 리포트</STRONG></SPAN></TD></TR>
<TR>
<TD background=../images/50/52-line.gif height=2></TD></TR>
<TR>
<TD>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-time.gif" width=64 vspace=3></TD>
<TD><STRONG><FONT color=#49aab0>30분 해양다큐멘터리 / 월 2편(격주 제작)<BR></FONT></STRONG>(화,금)08:30, 10:30, 14:30, 18:30, 23:30, 02:40, 05:20</TD></TR>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-charge.gif" width=64 vspace=3></TD>
<TD><FONT color=#333333>&#8226; 연출 : 한경엽 &nbsp;&#8226;&nbsp;수중촬영 : 이명덕(DiveWeb)</FONT></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
<TD width=13><IMG height=147 src="/images/50/52-mid_right.gif" width=13></TD></TR></TBODY></TABLE>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (71,3,4,'test test[test@test.co.kr] (☎ )',1,441,null,'71',to_date('06/07/29','RR/MM/DD'),to_date('07/04/20','RR/MM/DD'),'admin1',0,'<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=13><IMG height=147 src="/images/50/52-mid_left.gif" width=13></TD>
<TD vAlign=center background=/images/50/52-mid_bg.gif>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD vAlign=top width=205><IMG height=113 src="/images/50/67-img.gif" width=193></TD>
<TD vAlign=top>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD height=26><SPAN style="FONT-SIZE: 14px"><IMG height=13 hspace=5 src="/images/50/icon_point1.gif" width=5 align=absMiddle vspace=5><STRONG>Scuba 리포트</STRONG></SPAN></TD></TR>
<TR>
<TD background=../images/50/52-line.gif height=2></TD></TR>
<TR>
<TD>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-time.gif" width=64 vspace=3></TD>
<TD><STRONG><FONT color=#49aab0>30분 해양다큐멘터리 / 월 2편(격주 제작)<BR></FONT></STRONG>(화,금)08:30, 10:30, 14:30, 18:30, 23:30, 02:40, 05:20</TD></TR>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-charge.gif" width=64 vspace=3></TD>
<TD><FONT color=#333333>&#8226; 연출 : 한경엽 &nbsp;&#8226;&nbsp;수중촬영 : 이명덕(DiveWeb)</FONT></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
<TD width=13><IMG height=147 src="/images/50/52-mid_right.gif" width=13></TD></TR></TBODY></TABLE>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (74,3,3,'. 관리자[test@test.test] (☎ )',1,112454,null,'74',to_date('06/08/03','RR/MM/DD'),to_date('12/08/30','RR/MM/DD'),'kctvjeju12',1,'<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD width=13><IMG src="/images/50/52-mid_left.gif" width=13 height=147></TD>
<TD vAlign=center background=/images/50/52-mid_bg.gif>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD vAlign=top width=205><IMG src="/program/img/fishing.jpg" width=193 height=113></TD>
<TD vAlign=top>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD height=26><SPAN style="FONT-SIZE: 14px"><IMG hspace=5 vspace=5 align=absMiddle src="/images/50/icon_point1.gif" width=5 height=13><STRONG>SPECIAL FISHING!!</STRONG></SPAN></TD></TR>
<TR>
<TD height=2 background=../images/50/52-line.gif></TD></TR>
<TR>
<TD>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD width=75><IMG hspace=3 vspace=3 src="/images/50/52-time.gif" width=64 height=21></TD>
<TD><STRONG><FONT color=#49aab0>(수)&nbsp;08:00, 13:20, 18:30&nbsp;</FONT></STRONG>/ <A href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</A></TD></TR>
<TR>
<TD width=75><IMG hspace=3 vspace=3 src="/images/50/52-charge.gif" width=64 height=21></TD>
<TD><FONT color=#333333>&#8226; PD :&nbsp;부강언,&nbsp;정승원 </FONT></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
<TD width=13><IMG src="/images/50/52-mid_right.gif" width=13 height=147></TD></TR></TBODY></TABLE>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (75,3,4,'test test[test@test.co.kr] (☎ )',1,5455,null,'75',to_date('06/07/29','RR/MM/DD'),to_date('12/07/20','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (78,3,3,'. 관리자[test@test.test] (☎ )',1,10369,null,'78',to_date('06/08/03','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',1,'<div id="program_top">
	<ul>
		<li id="program_left"><img src="/images/50/52-mid_left.gif" width="13" height="147"></li>
		<li id="program_center">
			<ul id="ul_program_center">
				<li id="program_img"><img src="/images/50/76-img.gif" width="193" height="113"></li>
				<li id="program_info">
					<ul id="ul_program_info">
						<li id="program_info_1"><img src="/images/50/icon_point1.gif" width="5" height="13"> <strong>열린채널KCTV</strong></li>
						<li id="program_info_2"></li>
						<li id="program_info_3"><img src="/images/50/52-time.gif" width="64" height="21"> <strong>50분</strong> / <a href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</a></li>
						<li id="program_info_4"><img src="/images/50/52-charge.gif" width="64" height="21"> PD : PD: 현동협 / CAM: 한경엽, 부강언, 정승원</li>
					</ul>
				</li>
			</ul>
		</li>
		<li id="program_right"><img src="/images/50/52-mid_right.gif" width=13 height=147></li>
	</ul>
</div>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (341,0,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/vod/vod_new.asp?sector=02',to_date('10/11/16','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (342,0,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/vod/vod_top.asp?sector=04',to_date('10/11/16','RR/MM/DD'),to_date('10/11/22','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (343,0,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/vod/vod_top.asp?sector=03',to_date('10/11/16','RR/MM/DD'),to_date('10/11/22','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (347,0,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/vod/Vod_Event.asp',to_date('11/03/17','RR/MM/DD'),to_date('11/03/17','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (348,6,1,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,'Form',null,to_date('11/03/29','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (350,8,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/member/login_new.asp',to_date('11/04/19','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (351,3,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/pro_view/List_hd.asp',to_date('11/06/08','RR/MM/DD'),to_date('11/06/08','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (356,0,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/product/double_broad.asp',to_date('11/09/26','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (357,8,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/promise/use_line.html',to_date('11/10/27','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (358,5,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/popup/Event.html',to_date('11/12/13','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (359,5,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,'harmony','/popup/dream_harmony.asp',to_date('12/06/20','RR/MM/DD'),to_date('12/06/22','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (360,6,0,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',1,479,null,null,to_date('12/07/07','RR/MM/DD'),to_date('12/07/07','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (362,6,0,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',1,325,null,null,to_date('12/07/07','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (143,6,0,'. 관리자[test@test.test] (☎ )',1,65255,null,null,to_date('06/08/02','RR/MM/DD'),to_date('10/12/22','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (146,6,0,'. 관리자[test@test.test] (☎ )',1,29995,null,null,to_date('06/08/02','RR/MM/DD'),to_date('10/11/02','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (197,0,0,'. 관리자[test@test.test] (☎ )',1,2,null,null,to_date('06/08/02','RR/MM/DD'),to_date('07/10/08','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (198,0,0,'. 관리자[test@test.test] (☎ )',1,3,null,null,to_date('06/08/02','RR/MM/DD'),to_date('06/08/02','RR/MM/DD'),'admin3',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (199,0,0,'. 관리자[test@test.test] (☎ )',1,2,null,null,to_date('06/08/02','RR/MM/DD'),to_date('08/01/05','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (200,0,0,'. 관리자[test@test.test] (☎ )',1,4,null,null,to_date('06/08/02','RR/MM/DD'),null,'admin3',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (189,0,0,'. 관리자[test@test.test] (☎ )',1,6,null,null,to_date('06/08/02','RR/MM/DD'),to_date('06/08/02','RR/MM/DD'),'admin4',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (196,6,2,'. 관리자[test@test.test] (☎ )',1,16078,null,'/company/ci.asp',to_date('06/08/02','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (190,0,0,'. admin4[test@test.test] (☎ )',1,9,null,null,to_date('06/08/02','RR/MM/DD'),to_date('06/08/02','RR/MM/DD'),'admin4',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (147,6,0,'. 관리자[test@test.test] (☎ )',1,21185,null,null,to_date('06/08/02','RR/MM/DD'),to_date('09/12/21','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (346,4,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/kctvN/Use.html',to_date('11/03/04','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (201,7,2,null,1,6573,null,'/promise/private.html',to_date('06/08/02','RR/MM/DD'),to_date('08/06/29','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (115,3,2,null,1,42719,null,'/program/profile.asp',to_date('06/08/03','RR/MM/DD'),to_date('07/09/20','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (188,0,0,'. 관리자[test@test.test] (☎ )',1,7,null,null,to_date('06/08/02','RR/MM/DD'),to_date('06/08/02','RR/MM/DD'),'admin4',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (144,6,0,'. 관리자[test@test.test] (☎ )',1,261,null,null,to_date('06/08/02','RR/MM/DD'),to_date('06/08/03','RR/MM/DD'),'admin3',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (58,3,0,'. 관리자[test@test.test] (☎ )',1,22352,null,null,to_date('06/08/03','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',1,'<div id="program_top">
	<ul>
		<li id="program_left"><img src="/images/50/52-mid_left.gif" width="13" height="147"></li>
		<li id="program_center">
			<ul id="ul_program_center">
				<li id="program_img"><img src="/program/img/race.jpg" width="193" height="113"></li>
				<li id="program_info">
					<ul id="ul_program_info">
						<li id="program_info_1"><img src="/images/50/icon_point1.gif" width="5" height="13"> <strong>KCTV레포츠 경마</strong></li>
						<li id="program_info_2"></li>
						<li id="program_info_3"><img src="/images/50/52-time.gif" width="64" height="21"> <strong>50분(주2회 수/목 방송)</strong> / <a href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</a></li>
						<li id="program_info_4"><img src="/images/50/52-charge.gif" width="64" height="21"> PD : 김정혁, 조정수</li>
						<li id="program_info_5"><img src="/images/50/52-master.gif" width="64" height="21"> 김연송, 양성주(경마전문가)</li>
					</ul>
				</li>
			</ul>
		</li>
		<li id="program_right"><img src="/images/50/52-mid_right.gif" width=13 height=147></li>
	</ul>
</div>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (77,3,0,'. 관리자[test@test.test] (☎ )',1,17607,null,null,to_date('06/08/03','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',1,'<div id="program_top">
	<ul>
		<li id="program_left"><img src="/images/50/52-mid_left.gif" width="13" height="147"></li>
		<li id="program_center">
			<ul id="ul_program_center">
				<li id="program_img"><img src="/images/50/76-img.gif" width="193" height="113"></li>
				<li id="program_info">
					<ul id="ul_program_info">
						<li id="program_info_1"><img src="/images/50/icon_point1.gif" width="5" height="13"> <strong>열린채널KCTV</strong></li>
						<li id="program_info_2"></li>
						<li id="program_info_3"><img src="/images/50/52-time.gif" width="64" height="21"> <strong>50분</strong> / <a href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</a></li>
						<li id="program_info_4"><img src="/images/50/52-charge.gif" width="64" height="21"> PD : PD: 현동협 / CAM: 한경엽, 부강언, 정승원</li>
					</ul>
				</li>
			</ul>
		</li>
		<li id="program_right"><img src="/images/50/52-mid_right.gif" width=13 height=147></li>
	</ul>
</div>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (81,3,0,'. 관리자[test@test.test] (☎ )',1,6268,null,null,to_date('06/08/03','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',1,'<div id="program_top">
	<ul>
		<li id="program_left"><img src="/images/50/52-mid_left.gif" width="13" height="147"></li>
		<li id="program_center">
			<ul id="ul_program_center">
				<li id="program_img"><img src="/program/img/cli_doctor2.gif" width="193" height="113"></li>
				<li id="program_info">
					<ul id="ul_program_info">
						<li id="program_info_1"><img src="/images/50/icon_point1.gif" width="5" height="13"> <strong>Talk Talk TV닥터</strong></li>
						<li id="program_info_2"></li>
						<li id="program_info_3"><img src="/images/50/52-time.gif" width="64" height="21"> <strong>30분</strong> / <a href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</a></li>
						<li id="program_info_4"><img src="/images/50/52-charge.gif" width="64" height="21"> PD : 현동협</li>
						<li id="program_info_5"><img src="/images/50/52-master.gif" width="64" height="21"> 신소영</li>
					</ul>
				</li>
			</ul>
		</li>
		<li id="program_right"><img src="/images/50/52-mid_right.gif" width=13 height=147></li>
	</ul>
</div>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (221,3,3,'kctvjeju12 kctvjeju12[ra9801@kctvjeju.com] (☎ )',0,0,null,null,to_date('07/10/02','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (232,3,1,'kctvjeju12 kctvjeju12[ra9801@kctvjeju.com] (☎ )',0,0,'chall',null,to_date('08/04/02','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (236,2,3,'kctvjeju12 kctvjeju12[ra9801@kctvjeju.com] (☎ )',1,31,null,null,to_date('08/07/14','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (238,3,3,'kctvjeju12 kctvjeju12[ra9801@kctvjeju.com] (☎ )',1,36025,null,'238',to_date('08/07/14','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',0,'<div id="program_top">
	<ul>
		<li id="program_left"><img src="/images/50/52-mid_left.gif" width="13" height="147"></li>
		<li id="program_center">
			<ul id="ul_program_center">
				<li id="program_img"><img src="/program/img/english3.jpg" width="193" height="113"></li>
				<li id="program_info">
					<ul id="ul_program_info">
						<li id="program_info_1"><img src="/images/50/icon_point1.gif" width="5" height="13"> <strong>English News</strong></li>
						<li id="program_info_2"></li>
						<li id="program_info_3"><img src="/images/50/52-time.gif" width="64" height="21"> <strong>20분 월~금 / 20min. Mon~Fri</strong> / <a href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</a></li>
						<li id="program_info_4"><img src="/images/50/52-charge.gif" width="64" height="21"> PD : PD :부혜선 / Bu, Hye-seon</li>
						<li id="program_info_5"><img src="/images/50/52-master.gif" width="64" height="21"> G. Nikitas Brountas</li>
					</ul>
				</li>
			</ul>
		</li>
		<li id="program_right"><img src="/images/50/52-mid_right.gif" width=13 height=147></li>
	</ul>
</div>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (86,3,0,'. 관리자[test@test.test] (☎ )',1,17478,null,null,to_date('06/08/03','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',1,'<div id="program_top">
	<ul>
		<li id="program_left"><img src="/images/50/52-mid_left.gif" width="13" height="147"></li>
		<li id="program_center">
			<ul id="ul_program_center">
				<li id="program_img"><img src="/images/50/86-img.gif" width="193" height="113"></li>
				<li id="program_info">
					<ul id="ul_program_info">
						<li id="program_info_1"><img src="/images/50/icon_point1.gif" width="5" height="13"> <strong>열린TV광장</strong></li>
						<li id="program_info_2"></li>
						<li id="program_info_3"><img src="/images/50/52-time.gif" width="64" height="21"> <strong>50분</strong> / <a href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</a></li>
						<li id="program_info_4"><img src="/images/50/52-charge.gif" width="64" height="21"> PD : 현동협, 이태민 / CAM 한경엽, 부강언, 정승원 </li>
					</ul>
				</li>
			</ul>
		</li>
		<li id="program_right"><img src="/images/50/52-mid_right.gif" width=13 height=147></li>
	</ul>
</div>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (90,3,0,'. 관리자[test@test.test] (☎ )',1,18142,null,null,to_date('06/08/03','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',1,'<div id="program_top">
	<ul>
		<li id="program_left"><img src="/images/50/52-mid_left.gif" width="13" height="147"></li>
		<li id="program_center">
			<ul id="ul_program_center">
				<li id="program_img"><img src="/program/img/tree2.gif" width="193" height="113"></li>
				<li id="program_info">
					<ul id="ul_program_info">
						<li id="program_info_1"><img src="/images/50/icon_point1.gif" width="5" height="13"> <strong>웰빙스토리 3色제주</strong></li>
						<li id="program_info_2"></li>
						<li id="program_info_3"><img src="/images/50/52-time.gif" width="64" height="21"> <strong>50분</strong> / <a href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</a></li>
						<li id="program_info_4"><img src="/images/50/52-charge.gif" width="64" height="21"> PD : 현승헌, 이태민</li>
						<li id="program_info_5"><img src="/images/50/52-master.gif" width="64" height="21"> 이현애</li>
					</ul>
				</li>
			</ul>
		</li>
		<li id="program_right"><img src="/images/50/52-mid_right.gif" width=13 height=147></li>
	</ul>
</div>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (211,6,1,'편성제작국 관리자[webmaster@kctvjeju.com] (☎ 064-741-7728)',1,2490,'jobqa',null,to_date('06/11/09','RR/MM/DD'),null,'admin',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (55,3,3,'. 관리자[test@test.test] (☎ )',1,40846,null,'55',to_date('06/07/26','RR/MM/DD'),to_date('10/08/31','RR/MM/DD'),'kctvjeju12',null,'<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD width=13><IMG src="/images/50/52-mid_left.gif" width=13 height=147></TD>
<TD vAlign=center background=/images/50/52-mid_bg.gif>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD vAlign=top width=205><IMG src="/images/50/52-thum.gif" width=193 height=113></TD>
<TD vAlign=top>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD height=26><SPAN style="FONT-SIZE: 14px"><IMG hspace=5 vspace=5 align=absMiddle src="/images/50/icon_point1.gif" width=5 height=13><STRONG>삼춘 어디감수과 </STRONG></SPAN></TD></TR>
<TR>
<TD height=2 background=../images/50/52-line.gif></TD></TR>
<TR>
<TD>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD width=75><IMG hspace=3 vspace=3 src="/images/50/52-time.gif" width=64 height=21></TD>
<TD><STRONG><FONT color=#49aab0>40분</FONT></STRONG>/ <A href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</A></TD></TR>
<TR>
<TD width=75><IMG hspace=3 vspace=3 src="/images/50/52-charge.gif" width=64 height=21></TD>
<TD><FONT color=#333333>&#8226; PD :&nbsp;이태민&nbsp;&nbsp; </FONT></TD></TR>
<TR>
<TD width=75><IMG hspace=3 vspace=3 src="/images/50/52-master.gif" width=64 height=21></TD>
<TD><FONT color=#333333>오미연(제주어 진행)</FONT></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
<TD width=13><IMG src="/images/50/52-mid_right.gif" width=13 height=147></TD></TR></TBODY></TABLE>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (215,5,2,'. admin4[test@test.test] (☎ )',1,5172,null,'/help/service_out_request.asp',to_date('07/07/13','RR/MM/DD'),to_date('07/07/16','RR/MM/DD'),'admin4',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (216,7,2,'kctvjeju12 kctvjeju12[ra9801@kctvjeju.com] (☎ )',1,6457,null,'/member/realname.asp',to_date('07/08/27','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (217,3,2,'kctvjeju12 kctvjeju12[ra9801@kctvjeju.com] (☎ )',1,246808,null,'/program/total.asp',to_date('07/08/30','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (265,3,3,'편성제작국 관리자[webmaster@kctvjeju.com] (☎ 064-741-7728)',0,0,null,null,to_date('09/02/16','RR/MM/DD'),null,'admin',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (273,0,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/product/brand_input.asp',to_date('09/05/30','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (355,0,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/product/dv_on_broad.asp',to_date('11/09/26','RR/MM/DD'),to_date('11/09/26','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (102,3,0,'. 관리자[test@test.test] (☎ )',1,13689,null,null,to_date('06/08/03','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',1,'<div id="program_top">
	<ul>
		<li id="program_left"><img src="/images/50/52-mid_left.gif" width="13" height="147"></li>
		<li id="program_center">
			<ul id="ul_program_center">
				<li id="program_img"><img src="/images/50/102-img.gif" width="193" height="113"></li>
				<li id="program_info">
					<ul id="ul_program_info">
						<li id="program_info_1"><img src="/images/50/icon_point1.gif" width="5" height="13"> <strong>국제자유도시 생활영어 “ Hi, Jeju"</strong></li>
						<li id="program_info_2"></li>
						<li id="program_info_3"><img src="/images/50/52-time.gif" width="64" height="21"> <strong>50분</strong> / <a href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</a></li>
						<li id="program_info_4"><img src="/images/50/52-charge.gif" width="64" height="21"> PD : 담당: 현동협, 외주촬영: 위놉스 </li>
						<li id="program_info_5"><img src="/images/50/52-master.gif" width="64" height="21"> 홍미선, Wojcieh</li>
					</ul>
				</li>
			</ul>
		</li>
		<li id="program_right"><img src="/images/50/52-mid_right.gif" width=13 height=147></li>
	</ul>
</div>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (208,5,0,'. 관리자[test@test.test] (☎ )',1,2550,null,null,to_date('06/09/30','RR/MM/DD'),to_date('06/09/30','RR/MM/DD'),'admin1',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (214,3,3,'. 관리자[test@test.test] (☎ )',1,66548,null,'214',to_date('07/07/07','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',0,'<div id="program_top">
	<ul>
		<li id="program_left"><img src="/images/50/52-mid_left.gif" width="13" height="147"></li>
		<li id="program_center">
			<ul id="ul_program_center">
				<li id="program_img"><img src="/images/50/chall.jpg" width="193" height="113"></li>
				<li id="program_info">
					<ul id="ul_program_info">
						<li id="program_info_1"><img src="/images/50/icon_point1.gif" width="5" height="13"> <strong>챌린지퀴즈챔프</strong></li>
						<li id="program_info_2"></li>
						<li id="program_info_3"><img src="/images/50/52-time.gif" width="64" height="21"> <strong>50분</strong> / <a href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</a></li>
						<li id="program_info_4"><img src="/images/50/52-charge.gif" width="64" height="21"> PD : 현동협, 작가:이희진, jesse son</li>
						<li id="program_info_5"><img src="/images/50/52-master.gif" width="64" height="21"> 김연송, 리사켈리</li>
					</ul>
				</li>
			</ul>
		</li>
		<li id="program_right"><img src="/images/50/52-mid_right.gif" width=13 height=147></li>
	</ul>
</div>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (31,1,0,'kctvjeju12 kctvjeju12[ra9801@kctvjeju.com] (☎ )',1,79761,null,'/ch_guide/chanel.asp',to_date('07/09/06','RR/MM/DD'),to_date('07/09/10','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (32,1,0,'kctvjeju12 kctvjeju12[ra9801@kctvjeju.com] (☎ )',1,16744,null,null,to_date('07/09/06','RR/MM/DD'),to_date('07/09/10','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (252,0,3,'kctvjeju12 kctvjeju12[ra9801@kctvjeju.com] (☎ )',0,0,null,'252',to_date('08/09/17','RR/MM/DD'),to_date('08/09/17','RR/MM/DD'),'kctvjeju12',0,'<IMG height=115 src="/images/1/2/7/topimg22.jpg" width=670> ');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (263,0,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/vod/jongro.asp',to_date('08/12/17','RR/MM/DD'),to_date('08/12/22','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (269,3,1,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,'TALK',null,to_date('09/04/21','RR/MM/DD'),to_date('09/05/28','RR/MM/DD'),'kctvjeju12',0,'<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=13><IMG height=147 src="/images/50/52-mid_left.gif" width=13></TD>
<TD vAlign=center background=/images/50/52-mid_bg.gif>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD vAlign=top width=205><IMG height=113 src="/program/img/apt2.jpg" 
width=193></TD>
<TD vAlign=top>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD height=26><SPAN style="FONT-SIZE: 14px"><IMG height=13 hspace=5 
src="/images/50/icon_point1.gif" width=5 align=absMiddle vspace=5><STRONG>우리 
아파트로 오세요</STRONG></SPAN></TD></TR>
<TR>
<TD background=../images/50/52-line.gif height=2></TD></TR>
<TR>
<TD>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-time.gif" width=64 
vspace=3></TD>
<TD><STRONG><FONT color=#49aab0>30분 </FONT></STRONG>/ <A 
href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</A></TD></TR>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-charge.gif" width=64 
vspace=3></TD>
<TD><FONT color=#333333>&#8226; PD : 이태민&nbsp; </FONT></TD></TR>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-master.gif" width=64 
vspace=3></TD>
<TD><FONT color=#333333>일일리포터(아파트주민) 
</FONT></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
<TD width=13><IMG height=147 src="/images/50/52-mid_right.gif" 
width=13></TD></TR></TBODY></TABLE>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (56,3,4,'test test[test@test.co.kr] (☎ )',1,1208,'aaa','56',to_date('06/07/26','RR/MM/DD'),to_date('07/09/22','RR/MM/DD'),'admin',null,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (59,3,3,'. 관리자[test@test.test] (☎ )',1,23458,null,'59',to_date('06/08/03','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',1,'<div id="program_top">
	<ul>
		<li id="program_left"><img src="/images/50/52-mid_left.gif" width="13" height="147"></li>
		<li id="program_center">
			<ul id="ul_program_center">
				<li id="program_img"><img src="/program/img/race.jpg" width="193" height="113"></li>
				<li id="program_info">
					<ul id="ul_program_info">
						<li id="program_info_1"><img src="/images/50/icon_point1.gif" width="5" height="13"> <strong>KCTV레포츠 경마</strong></li>
						<li id="program_info_2"></li>
						<li id="program_info_3"><img src="/images/50/52-time.gif" width="64" height="21"> <strong>50분(주2회 수/목 방송)</strong> / <a href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</a></li>
						<li id="program_info_4"><img src="/images/50/52-charge.gif" width="64" height="21"> PD : 김정혁, 조정수</li>
						<li id="program_info_5"><img src="/images/50/52-master.gif" width="64" height="21"> 김연송, 양성주(경마전문가)</li>
					</ul>
				</li>
			</ul>
		</li>
		<li id="program_right"><img src="/images/50/52-mid_right.gif" width=13 height=147></li>
	</ul>
</div>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (271,3,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/program/schedule2.asp',to_date('09/05/11','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (272,3,1,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,'w_sc',null,to_date('09/05/11','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (270,3,3,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'270',to_date('09/05/08','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',0,'<div id="program_top">
	<ul>
		<li id="program_left"><img src="/images/50/52-mid_left.gif" width="13" height="147"></li>
		<li id="program_center">
			<ul id="ul_program_center">
				<li id="program_img"><img src="/program/img/tree2.gif" width="193" height="113"></li>
				<li id="program_info">
					<ul id="ul_program_info">
						<li id="program_info_1"><img src="/images/50/icon_point1.gif" width="5" height="13"> <strong>웰빙스토리 3色제주</strong></li>
						<li id="program_info_2"></li>
						<li id="program_info_3"><img src="/images/50/52-time.gif" width="64" height="21"> <strong>50분</strong> / <a href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</a></li>
						<li id="program_info_4"><img src="/images/50/52-charge.gif" width="64" height="21"> PD : 현승헌, 이태민</li>
						<li id="program_info_5"><img src="/images/50/52-master.gif" width="64" height="21"> 이현애</li>
					</ul>
				</li>
			</ul>
		</li>
		<li id="program_right"><img src="/images/50/52-mid_right.gif" width=13 height=147></li>
	</ul>
</div>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (278,0,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/product/dv_on.asp',to_date('09/07/07','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (282,3,3,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'282',to_date('09/07/29','RR/MM/DD'),to_date('09/09/15','RR/MM/DD'),'kctvjeju12',0,'<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=13><IMG height=147 src="/images/50/52-mid_left.gif" width=13></TD>
<TD vAlign=center background=/images/50/52-mid_bg.gif>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD vAlign=top width=205><IMG height=113 src="/program/img/bus2.jpg" width=193></TD>
<TD vAlign=top>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD height=26><SPAN style="FONT-SIZE: 14px"><IMG height=13 hspace=5 src="/images/50/icon_point1.gif" width=5 align=absMiddle vspace=5><STRONG>떴다 ! 해피버스&nbsp;</STRONG></SPAN></TD></TR>
<TR>
<TD background=../images/50/52-line.gif height=2></TD></TR>
<TR>
<TD>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-time.gif" width=64 vspace=3></TD>
<TD><STRONG><FONT color=#49aab0>40분</FONT></STRONG>/ <A href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</A> 
<TD></TD>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-charge.gif" width=64 vspace=3></TD>
<TD><FONT color=#333333>&#8226; PD : 현승헌&nbsp;&nbsp; &#8226; 작가 : 고인선&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </FONT></TD></TR>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-master.gif" width=64 vspace=3></TD>
<TD><FONT color=#333333>신연수</FONT></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
<TD width=13><IMG height=147 src="/images/50/52-mid_right.gif" width=13></TD></TR></TBODY></TABLE>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (111,3,3,'. 관리자[test@test.test] (☎ )',1,16471,null,'111',to_date('06/08/03','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',1,'<div id="program_top">
	<ul>
		<li id="program_left"><img src="/images/50/52-mid_left.gif" width="13" height="147"></li>
		<li id="program_center">
			<ul id="ul_program_center">
				<li id="program_img"><img src="/images/50/109-img.gif" width="193" height="113"></li>
				<li id="program_info">
					<ul id="ul_program_info">
						<li id="program_info_1"><img src="/images/50/icon_point1.gif" width="5" height="13"> <strong>국제자유도시 생활일본어 “곤니찌와 제주”</strong></li>
						<li id="program_info_2"></li>

						<li id="program_info_4"><img src="/images/50/52-charge.gif" width="64" height="21"> 담당: 담당: 현동협, 외주촬영: 위놉스</li>
						<li id="program_info_5"><img src="/images/50/52-master.gif" width="64" height="21"> 한효심, 카야유카리</li>
					</ul>
				</li>
			</ul>
		</li>
		<li id="program_right"><img src="/images/50/52-mid_right.gif" width=13 height=147></li>
	</ul>
</div>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (112,3,4,'test test[test@test.co.kr] (☎ )',1,2015,null,'112',to_date('06/07/29','RR/MM/DD'),to_date('09/04/14','RR/MM/DD'),'kctvjeju12',0,'<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=13><IMG height=147 src="/images/50/52-mid_left.gif" width=13></TD>
<TD vAlign=center background=/images/50/52-mid_bg.gif>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD vAlign=top width=205><IMG height=113 src="/images/50/109-img.gif" width=193></TD>
<TD vAlign=top>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD height=26><SPAN style="FONT-SIZE: 14px"><IMG height=13 hspace=5 src="/images/50/icon_point1.gif" width=5 align=absMiddle vspace=5><STRONG>국제자유도시 생활일본어 “곤니찌와 제주”</STRONG></SPAN></TD></TR>
<TR>
<TD background=../images/50/52-line.gif height=2></TD></TR>
<TR>
<TD>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-charge.gif" width=64 vspace=3></TD>
<TD><FONT color=#333333>&#8226; 담당: 현동협&nbsp; &#8226; 외주촬영: CG BOX</FONT></TD></TR>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-master.gif" width=64 vspace=3></TD>
<TD>임창규, 아오야마 치요코</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
<TD width=13><IMG height=147 src="/images/50/52-mid_right.gif" width=13></TD></TR></TBODY></TABLE><BR>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (154,7,2,'나우엔터 관리자[shinda@nowenter.co.kr] (☎ ..)',0,0,null,'/member/find.asp',to_date('06/08/10','RR/MM/DD'),null,'admin',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (153,7,2,'나우엔터 관리자[shinda@nowenter.co.kr] (☎ ..)',0,0,null,'/member/modify.asp',to_date('06/08/10','RR/MM/DD'),null,'admin',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (156,7,2,'나우엔터 관리자[shinda@nowenter.co.kr] (☎ ..)',0,0,null,'/member/secession.asp',to_date('06/08/11','RR/MM/DD'),null,'admin',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (202,5,1,'나우엔터 관리자[shinda@nowenter.co.kr] (☎ ..)',1,85534,'cableqa',null,to_date('06/08/17','RR/MM/DD'),null,'admin',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (148,6,1,'. 관리자[test@test.test] (☎ )',1,37206,'jobinfo',null,to_date('06/08/02','RR/MM/DD'),to_date('06/10/24','RR/MM/DD'),'admin',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (204,6,2,'나우엔터 관리자[shinda@nowenter.co.kr] (☎ ..)',1,13681,null,'/company/story.asp',to_date('06/08/17','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (205,6,2,'나우엔터 관리자[shinda@nowenter.co.kr] (☎ ..)',1,5524,null,'/company/event.asp',to_date('06/08/17','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (206,0,2,'편성제작국 관리자[webmaster@kctvjeju.com] (☎ 064-741-7728)',1,15318,null,'/product/on_cash.asp',to_date('06/08/25','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (228,3,3,'kctvjeju12 kctvjeju12[ra9801@kctvjeju.com] (☎ )',0,0,null,'228',to_date('07/12/13','RR/MM/DD'),to_date('09/05/28','RR/MM/DD'),'kctvjeju12',0,'<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=13><IMG height=147 src="/images/50/52-mid_left.gif" width=13></TD>
<TD vAlign=center background=/images/50/52-mid_bg.gif>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD vAlign=top width=205><IMG height=113 src="/program/img/gak3.jpg" 
width=193></TD>
<TD vAlign=top>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD height=26><SPAN style="FONT-SIZE: 14px"><IMG height=13 hspace=5 
src="/images/50/icon_point1.gif" width=5 align=absMiddle vspace=5><STRONG>각설이의 
세상만사&nbsp;</STRONG></SPAN></TD></TR>
<TR>
<TD background=../images/50/52-line.gif height=2></TD></TR>
<TR>
<TD>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-time.gif" width=64 
vspace=3></TD>
<TD><STRONG><FONT color=#49aab0>40분</FONT></STRONG>/ <a href="/contents/index2.asp?muid=235&pmuid=50">편성표 바로가기</a></TD></TR>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-charge.gif" width=64 
vspace=3></TD>
<TD><FONT color=#333333>&#8226; PD : 현승헌&nbsp;&nbsp; </FONT></TD></TR>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-master.gif" width=64 
vspace=3></TD>
<TD><FONT color=#333333>신연수(제주어 
진행)</FONT></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
<TD width=13><IMG height=147 src="/images/50/52-mid_right.gif" 
width=13></TD></TR></TBODY></TABLE>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (235,3,2,'kctvjeju12 kctvjeju12[ra9801@kctvjeju.com] (☎ )',0,0,null,'/program/schedule.asp',to_date('08/06/18','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (248,3,2,'kctvjeju12 kctvjeju12[ra9801@kctvjeju.com] (☎ )',0,0,null,'/vod/intro.html',to_date('08/09/16','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (249,3,3,'kctvjeju12 kctvjeju12[ra9801@kctvjeju.com] (☎ )',0,0,null,null,to_date('08/09/16','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (262,0,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/vod/dv_list.asp',to_date('08/12/17','RR/MM/DD'),to_date('08/12/19','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (66,3,4,'test test[test@test.co.kr] (☎ )',1,1737,null,'66',to_date('06/07/29','RR/MM/DD'),to_date('07/04/20','RR/MM/DD'),'admin1',0,'<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=13><IMG height=147 src="/images/50/52-mid_left.gif" width=13></TD>
<TD vAlign=center background=/images/50/52-mid_bg.gif>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD vAlign=top width=205><IMG height=113 src="/images/50/61-img.gif" width=193></TD>
<TD vAlign=top>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD height=26><SPAN style="FONT-SIZE: 14px"><IMG height=13 hspace=5 src="/images/50/icon_point1.gif" width=5 align=absMiddle vspace=5><STRONG>뮤직 5 </STRONG></SPAN></TD></TR>
<TR>
<TD background=../images/50/52-line.gif height=2></TD></TR>
<TR>
<TD>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-time.gif" width=64 vspace=3></TD>
<TD><STRONG><FONT color=#49aab0>60분</FONT></STRONG>/ (수) 13:10, 17:30, 20:30, 00:00, 03:20 <BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (토) 13:10, 16:50, 20:30, 00:00, 03:20</TD></TR>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-charge.gif" width=64 vspace=3></TD>
<TD><FONT color=#333333>&#8226; PD :강방석 &#8226; 작가:김경순</FONT></TD></TR>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-master.gif" width=64 vspace=3></TD>
<TD><FONT color=#333333>강경필</FONT></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
<TD width=13><IMG height=147 src="/images/50/52-mid_right.gif" width=13></TD></TR></TBODY></TABLE>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (110,3,0,'. 관리자[test@test.test] (☎ )',1,13330,null,null,to_date('06/08/03','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',1,'<div id="program_top">
	<ul>
		<li id="program_left"><img src="/images/50/52-mid_left.gif" width="13" height="147"></li>
		<li id="program_center">
			<ul id="ul_program_center">
				<li id="program_img"><img src="/images/50/109-img.gif" width="193" height="113"></li>
				<li id="program_info">
					<ul id="ul_program_info">
						<li id="program_info_1"><img src="/images/50/icon_point1.gif" width="5" height="13"> <strong>국제자유도시 생활일본어 “곤니찌와 제주”</strong></li>
						<li id="program_info_2"></li>

						<li id="program_info_4"><img src="/images/50/52-charge.gif" width="64" height="21"> 담당: 담당: 현동협, 외주촬영: 위놉스</li>
						<li id="program_info_5"><img src="/images/50/52-master.gif" width="64" height="21"> 한효심, 카야유카리</li>
					</ul>
				</li>
			</ul>
		</li>
		<li id="program_right"><img src="/images/50/52-mid_right.gif" width=13 height=147></li>
	</ul>
</div>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (218,0,0,'kctvjeju12 kctvjeju12[ra9801@kctvjeju.com] (☎ )',1,45036,null,null,to_date('07/09/03','RR/MM/DD'),to_date('08/10/14','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (230,3,4,'kctvjeju12 kctvjeju12[ra9801@kctvjeju.com] (☎ )',1,1953,null,'230',to_date('08/02/14','RR/MM/DD'),to_date('09/05/28','RR/MM/DD'),'kctvjeju12',0,'<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=13><IMG height=147 src="/images/50/52-mid_left.gif" width=13></TD>
<TD vAlign=center background=/images/50/52-mid_bg.gif>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD vAlign=top width=205><IMG height=113 src="/program/img/gak3.jpg" 
width=193></TD>
<TD vAlign=top>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD height=26><SPAN style="FONT-SIZE: 14px"><IMG height=13 hspace=5 
src="/images/50/icon_point1.gif" width=5 align=absMiddle vspace=5><STRONG>각설이의 
세상만사&nbsp;</STRONG></SPAN></TD></TR>
<TR>
<TD background=../images/50/52-line.gif height=2></TD></TR>
<TR>
<TD>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-time.gif" width=64 
vspace=3></TD>
<TD><STRONG><FONT color=#49aab0>40분</FONT></STRONG>/ <a href="/contents/index2.asp?muid=235&pmuid=50">편성표 바로가기</a></TD></TR>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-charge.gif" width=64 
vspace=3></TD>
<TD><FONT color=#333333>&#8226; PD : 현승헌&nbsp;&nbsp; </FONT></TD></TR>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-master.gif" width=64 
vspace=3></TD>
<TD><FONT color=#333333>신연수(제주어 
진행)</FONT></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
<TD width=13><IMG height=147 src="/images/50/52-mid_right.gif" 
width=13></TD></TR></TBODY></TABLE>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (231,4,2,'kctvjeju12 kctvjeju12[ra9801@kctvjeju.com] (☎ )',0,0,null,'/popup/maria.html',to_date('08/03/20','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (237,3,0,'kctvjeju12 kctvjeju12[ra9801@kctvjeju.com] (☎ )',1,888,null,null,to_date('08/07/14','RR/MM/DD'),to_date('08/07/14','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (239,4,3,'kctvjeju12 kctvjeju12[ra9801@kctvjeju.com] (☎ )',0,0,null,'239',to_date('08/09/16','RR/MM/DD'),to_date('08/09/16','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (240,4,2,'kctvjeju12 kctvjeju12[ra9801@kctvjeju.com] (☎ )',0,0,null,'/vod/intro.html',to_date('08/09/16','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (243,3,3,'kctvjeju12 kctvjeju12[ra9801@kctvjeju.com] (☎ )',0,0,null,'243',to_date('08/09/16','RR/MM/DD'),to_date('08/09/16','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (254,0,2,'kctvjeju12 kctvjeju12[ra9801@kctvjeju.com] (☎ )',0,0,null,'/product/price.html',to_date('08/10/06','RR/MM/DD'),to_date('08/10/06','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (258,3,3,'kctvjeju12 kctvjeju12[ra9801@kctvjeju.com] (☎ )',1,300,null,'258',to_date('08/10/27','RR/MM/DD'),to_date('12/10/08','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (259,5,2,'kctvjeju12 kctvjeju12[ra9801@kctvjeju.com] (☎ )',0,0,null,'/custom/hurry.html',to_date('08/10/31','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (276,0,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/product/dvi_price.asp',to_date('09/06/05','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (312,3,3,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'312',to_date('09/11/27','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',0,'<div id="program_top">
	<ul>
		<li id="program_left"><img src="/images/50/52-mid_left.gif" width="13" height="147"></li>
		<li id="program_center">
			<ul id="ul_program_center">
				<li id="program_img"><img src="/program/img/chi3.jpg" width="193" height="113"></li>
				<li id="program_info">
					<ul id="ul_program_info">
						<li id="program_info_1"><img src="/images/50/icon_point1.gif" width="5" height="13"> <strong>챌린지퀴즈챔프</strong></li>
						<li id="program_info_2"></li>
						<li id="program_info_3"><img src="/images/50/ch_time.gif" width="64" height="21"> <strong>10분 토~월 / 10分. 土~月</strong> / <a href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</a></li>
						<li id="program_info_4"><img src="/images/50/ch_charge.gif" width="64" height="21"> PD : PD :조정수 / 曺征秀</li>
						<li id="program_info_5"><img src="/images/50/ch_master.gif" width="64" height="21"> 文紅</li>
					</ul>
				</li>
			</ul>
		</li>
		<li id="program_right"><img src="/images/50/52-mid_right.gif" width=13 height=147></li>
	</ul>
</div>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (207,5,0,'. 관리자[test@test.test] (☎ )',1,2712,null,null,to_date('06/09/30','RR/MM/DD'),to_date('06/10/02','RR/MM/DD'),'admin1',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (209,5,0,'. 관리자[test@test.test] (☎ )',1,2705,null,null,to_date('06/09/30','RR/MM/DD'),to_date('06/10/02','RR/MM/DD'),'admin1',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (210,5,0,'. 관리자[test@test.test] (☎ )',1,2499,null,null,to_date('06/09/30','RR/MM/DD'),to_date('06/09/30','RR/MM/DD'),'admin1',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (64,3,4,'test test[test@test.co.kr] (☎ )',1,4404,null,'64',to_date('06/07/29','RR/MM/DD'),to_date('07/04/20','RR/MM/DD'),'admin1',0,'<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=13><IMG height=147 src="/images/50/52-mid_left.gif" width=13></TD>
<TD vAlign=center background=/images/50/52-mid_bg.gif>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD vAlign=top width=205><IMG height=113 src="/images/50/61-img.gif" width=193></TD>
<TD vAlign=top>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD height=26><SPAN style="FONT-SIZE: 14px"><IMG height=13 hspace=5 src="/images/50/icon_point1.gif" width=5 align=absMiddle vspace=5><STRONG>뮤직 5 </STRONG></SPAN></TD></TR>
<TR>
<TD background=../images/50/52-line.gif height=2></TD></TR>
<TR>
<TD>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-time.gif" width=64 vspace=3></TD>
<TD><STRONG><FONT color=#49aab0>60분</FONT></STRONG>/ (수) 13:10, 17:30, 20:30, 00:00, 03:20 <BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (토) 13:10, 16:50, 20:30, 00:00, 03:20</TD></TR>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-charge.gif" width=64 vspace=3></TD>
<TD><FONT color=#333333>&#8226; PD :강방석 &#8226; 작가:김경순</FONT></TD></TR>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-master.gif" width=64 vspace=3></TD>
<TD><FONT color=#333333>강경필</FONT></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
<TD width=13><IMG height=147 src="/images/50/52-mid_right.gif" width=13></TD></TR></TBODY></TABLE>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (88,3,4,'test test[test@test.co.kr] (☎ )',1,1613,null,'88',to_date('06/07/29','RR/MM/DD'),to_date('09/01/14','RR/MM/DD'),'kctvjeju12',0,'<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=13><IMG height=147 src="/images/50/52-mid_left.gif" width=13></TD>
<TD vAlign=center background=/images/50/52-mid_bg.gif>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD vAlign=top width=205><IMG height=113 src="/images/50/86-img.gif" width=193></TD>
<TD vAlign=top>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD height=26><SPAN style="FONT-SIZE: 14px"><IMG height=13 hspace=5 src="/images/50/icon_point1.gif" width=5 align=absMiddle vspace=5><STRONG>문화스페셜</STRONG></SPAN></TD></TR>
<TR>
<TD background=../images/50/52-line.gif height=2></TD></TR>
<TR>
<TD>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-time.gif" width=64 vspace=3></TD>
<TD><STRONG><FONT color=#49aab0>50분</FONT></STRONG>/(화) 13:10, 17:30, 20:30, 00:00, 03:20<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(일) 10:00, 14:50, 19:10, 00:10, 05:10</TD></TR>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-charge.gif" width=64 vspace=3></TD>
<TD><FONT color=#333333>&#8226; PD 현승헌 / CAM 한경엽, 부강언, 정승원</FONT></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
<TD width=13><IMG height=147 src="/images/50/52-mid_right.gif" width=13></TD></TR></TBODY></TABLE><BR><BR>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (79,3,3,'. 관리자[test@test.test] (☎ )',1,1,null,null,to_date('06/08/03','RR/MM/DD'),null,'admin3',1,'<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=13><IMG height=147 src="/images/50/52-mid_left.gif" width=13></TD>
<TD vAlign=center background=/images/50/52-mid_bg.gif>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD vAlign=top width=205><IMG height=113 src="/images/50/76-img.gif" 
width=193></TD>
<TD vAlign=top>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD height=26><SPAN style="FONT-SIZE: 14px"><IMG height=13 hspace=5 
src="/images/50/icon_point1.gif" width=5 align=absMiddle vspace=5><STRONG>열린TV 
열린광장 </STRONG></SPAN></TD></TR>
<TR>
<TD background=../images/50/52-line.gif height=2></TD></TR>
<TR>
<TD>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-time.gif" width=64 
vspace=3></TD>
<TD><STRONG><FONT color=#49aab0>50분</FONT></STRONG>/ (수) 09:20, 12:30, 16:00, 
19:30, 23:30, 05:40<BR>(토) 09:20, 12:30, 16:20, 19:30, 23:30, 05:40</TD></TR>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-charge.gif" width=64 
vspace=3></TD>
<TD><FONT color=#333333>&#8226; PD 김정혁 / CAM 한경엽, 부강언, 
초록물고기</FONT></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
<TD width=13><IMG height=147 src="/images/50/52-mid_right.gif" 
width=13></TD></TR></TBODY></TABLE><BR>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (84,3,4,'test test[test@test.co.kr] (☎ )',1,1549,null,'84',to_date('06/07/29','RR/MM/DD'),to_date('08/01/02','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (87,3,3,'. 관리자[test@test.test] (☎ )',1,13138,null,'87',to_date('06/08/03','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',1,'<div id="program_top">
	<ul>
		<li id="program_left"><img src="/images/50/52-mid_left.gif" width="13" height="147"></li>
		<li id="program_center">
			<ul id="ul_program_center">
				<li id="program_img"><img src="/images/50/86-img.gif" width="193" height="113"></li>
				<li id="program_info">
					<ul id="ul_program_info">
						<li id="program_info_1"><img src="/images/50/icon_point1.gif" width="5" height="13"> <strong>열린TV광장</strong></li>
						<li id="program_info_2"></li>
						<li id="program_info_3"><img src="/images/50/52-time.gif" width="64" height="21"> <strong>50분</strong> / <a href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</a></li>
						<li id="program_info_4"><img src="/images/50/52-charge.gif" width="64" height="21"> PD : 현동협, 이태민 / CAM 한경엽, 부강언, 정승원 </li>
					</ul>
				</li>
			</ul>
		</li>
		<li id="program_right"><img src="/images/50/52-mid_right.gif" width=13 height=147></li>
	</ul>
</div>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (275,0,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/product/dvi_intro.asp',to_date('09/06/05','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (279,3,3,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'279',to_date('09/07/27','RR/MM/DD'),to_date('09/10/08','RR/MM/DD'),'kctvjeju12',0,'<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=13><IMG height=147 src="/images/50/52-mid_left.gif" width=13></TD>
<TD vAlign=center background=/images/50/52-mid_bg.gif>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD vAlign=top width=205><IMG height=113 src="/program/img/tree2.gif" width=193></TD>
<TD vAlign=top>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD height=26><SPAN style="FONT-SIZE: 14px"><IMG height=13 hspace=5 src="/images/50/icon_point1.gif" width=5 align=absMiddle vspace=5><STRONG>웰빙스토리 3色제주</STRONG></SPAN></TD></TR>
<TR>
<TD background=../images/50/52-line.gif height=2></TD></TR>
<TR>
<TD>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-time.gif" width=64 vspace=3></TD>
<TD><FONT color=#49aab0><STRONG>50분 </STRONG><FONT color=#333333>/ <A href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</A></FONT><STRONG> </STRONG></FONT></FONT></TD></TR>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-charge.gif" width=64 vspace=3></TD>
<TD><FONT color=#333333>&#8226;&nbsp; PD :&nbsp;현승헌, 이태민&nbsp;&nbsp;&nbsp;&#8226;작가 : 고인선</FONT></TD></TR>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-master.gif" width=64 vspace=3></TD>
<TD><FONT color=#333333>이현애</FONT></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
<TD width=13><IMG height=147 src="/images/50/52-mid_right.gif" width=13></TD></TR></TBODY></TABLE><BR>
<TABLE>
<TBODY>
<TR>
<TD><IMG height=66 src="/program/img/olle.gif" width=495></TD></TR></TBODY></TABLE>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (302,4,2,'편성제작국 관리자[webmaster@kctvjeju.com] (☎ 064-741-7728)',0,0,null,'/popup/sarah.html',to_date('09/11/16','RR/MM/DD'),to_date('09/11/16','RR/MM/DD'),'admin',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (309,3,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/program/research.asp',to_date('09/11/21','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (313,0,2,'편성제작국 관리자[webmaster@kctvjeju.com] (☎ 064-741-7728)',0,0,null,'/product/dv_on_remote.asp',to_date('09/12/07','RR/MM/DD'),null,'admin',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (316,6,0,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,null,to_date('10/02/05','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (317,3,1,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,'ch4',null,to_date('10/03/17','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (318,4,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/popup/myhert.html',to_date('10/05/12','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (320,6,1,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,'notice',null,to_date('10/06/22','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (323,5,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/SmartPhone/SmartPhone_iphone.html',to_date('10/06/29','RR/MM/DD'),to_date('10/07/13','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (325,5,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/SmartPhone/SmartPhone_om.html',to_date('10/06/29','RR/MM/DD'),to_date('10/07/13','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (225,4,2,'kctvjeju12 kctvjeju12[ra9801@kctvjeju.com] (☎ )',0,0,null,'/popup/concert.html',to_date('07/11/26','RR/MM/DD'),to_date('09/07/28','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (96,3,3,'test test[test@test.co.kr] (☎ )',1,2089,null,'96',to_date('06/07/29','RR/MM/DD'),to_date('07/10/02','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (99,3,0,'. 관리자[test@test.test] (☎ )',1,12676,null,null,to_date('06/08/03','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',1,'<div id="program_top">
	<ul>
		<li id="program_left"><img src="/images/50/52-mid_left.gif" width="13" height="147"></li>
		<li id="program_center">
			<ul id="ul_program_center">
				<li id="program_img"><img src="/images/50/99-img.gif" width="193" height="113"></li>
				<li id="program_info">
					<ul id="ul_program_info">
						<li id="program_info_1"><img src="/images/50/icon_point1.gif" width="5" height="13"> <strong>6mm시청자세상</strong></li>
						<li id="program_info_2"></li>
						<li id="program_info_3"><img src="/images/50/52-time.gif" width="64" height="21"> <strong>50분</strong> / <a href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</a></li>
						<li id="program_info_4"><img src="/images/50/52-charge.gif" width="64" height="21"> PD : KCV제주방송 </li>
					</ul>
				</li>
			</ul>
		</li>
		<li id="program_right"><img src="/images/50/52-mid_right.gif" width=13 height=147></li>
	</ul>
</div>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (100,3,3,'. 관리자[test@test.test] (☎ )',1,9019,null,'100',to_date('06/08/03','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',1,'<div id="program_top">
	<ul>
		<li id="program_left"><img src="/images/50/52-mid_left.gif" width="13" height="147"></li>
		<li id="program_center">
			<ul id="ul_program_center">
				<li id="program_img"><img src="/images/50/99-img.gif" width="193" height="113"></li>
				<li id="program_info">
					<ul id="ul_program_info">
						<li id="program_info_1"><img src="/images/50/icon_point1.gif" width="5" height="13"> <strong>6mm시청자세상</strong></li>
						<li id="program_info_2"></li>
						<li id="program_info_3"><img src="/images/50/52-time.gif" width="64" height="21"> <strong>50분</strong> / <a href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</a></li>
						<li id="program_info_4"><img src="/images/50/52-charge.gif" width="64" height="21"> PD : KCV제주방송 </li>
					</ul>
				</li>
			</ul>
		</li>
		<li id="program_right"><img src="/images/50/52-mid_right.gif" width=13 height=147></li>
	</ul>
</div>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (142,6,1,'편성제작국 관리자[webmaster@kctvjeju.com] (☎ 064-741-7728)',0,0,'jobqa',null,to_date('06/11/09','RR/MM/DD'),null,'admin',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (222,3,3,'kctvjeju12 kctvjeju12[ra9801@kctvjeju.com] (☎ )',0,0,null,null,to_date('07/10/02','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (227,3,0,'kctvjeju12 kctvjeju12[ra9801@kctvjeju.com] (☎ )',0,0,null,null,to_date('07/12/13','RR/MM/DD'),to_date('09/05/28','RR/MM/DD'),'kctvjeju12',0,'<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=13><IMG height=147 src="/images/50/52-mid_left.gif" width=13></TD>
<TD vAlign=center background=/images/50/52-mid_bg.gif>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD vAlign=top width=205><IMG height=113 src="/program/img/gak3.jpg" width=193></TD>
<TD vAlign=top>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD height=26><SPAN style="FONT-SIZE: 14px"><IMG height=13 hspace=5 src="/images/50/icon_point1.gif" width=5 align=absMiddle vspace=5><STRONG>각설이의 세상만사&nbsp;</STRONG></SPAN></TD></TR>
<TR>
<TD background=../images/50/52-line.gif height=2></TD></TR>
<TR>
<TD>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-time.gif" width=64 vspace=3></TD>
<TD><STRONG><FONT color=#49aab0>40분</FONT></STRONG>/ <A href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</A>
<TD></TD>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-charge.gif" width=64 vspace=3></TD>
<TD><FONT color=#333333>&#8226; PD : 현승헌&nbsp;&nbsp; </FONT></TD></TR>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-master.gif" width=64 vspace=3></TD>
<TD><FONT color=#333333>신연수(제주어 진행)</FONT></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
<TD width=13><IMG height=147 src="/images/50/52-mid_right.gif" width=13></TD></TR></TBODY></TABLE>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (103,3,3,'. 관리자[test@test.test] (☎ )',1,18580,null,'103',to_date('06/08/03','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',1,'<div id="program_top">
	<ul>
		<li id="program_left"><img src="/images/50/52-mid_left.gif" width="13" height="147"></li>
		<li id="program_center">
			<ul id="ul_program_center">
				<li id="program_img"><img src="/images/50/102-img.gif" width="193" height="113"></li>
				<li id="program_info">
					<ul id="ul_program_info">
						<li id="program_info_1"><img src="/images/50/icon_point1.gif" width="5" height="13"> <strong>국제자유도시 생활영어 “ Hi, Jeju"</strong></li>
						<li id="program_info_2"></li>
						<li id="program_info_3"><img src="/images/50/52-time.gif" width="64" height="21"> <strong>50분</strong> / <a href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</a></li>
						<li id="program_info_4"><img src="/images/50/52-charge.gif" width="64" height="21"> PD : 담당: 현동협, 외주촬영: 위놉스 </li>
						<li id="program_info_5"><img src="/images/50/52-master.gif" width="64" height="21"> 홍미선, Wojcieh</li>
					</ul>
				</li>
			</ul>
		</li>
		<li id="program_right"><img src="/images/50/52-mid_right.gif" width=13 height=147></li>
	</ul>
</div>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (104,3,4,'test test[test@test.co.kr] (☎ )',1,2196,null,'104',to_date('06/07/29','RR/MM/DD'),to_date('09/05/28','RR/MM/DD'),'kctvjeju12',0,'<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=13><IMG height=147 src="/images/50/52-mid_left.gif" width=13></TD>
<TD vAlign=center background=/images/50/52-mid_bg.gif>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD vAlign=top width=205><IMG height=113 src="/images/50/102-img.gif" width=193></TD>
<TD vAlign=top>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD height=26><SPAN style="FONT-SIZE: 14px"><IMG height=13 hspace=5 src="/images/50/icon_point1.gif" width=5 align=absMiddle vspace=5><STRONG>국제자유도시 생활영어 “ Hi, Jeju"</STRONG></SPAN></TD></TR>
<TR>
<TD background=../images/50/52-line.gif height=2></TD></TR>
<TR>
<TD>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-charge.gif" width=64 vspace=3></TD>
<TD><FONT color=#333333>&#8226; 담당: 현동협 &#8226; 외주촬영: 유니즈커뮤니케이션</FONT></TD></TR>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-master.gif" width=64 vspace=3></TD>
<TD>양세정, Wojcieh&nbsp;</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
<TD width=13><IMG height=147 src="/images/50/52-mid_right.gif" width=13></TD></TR></TBODY></TABLE><BR>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (107,3,3,'. 관리자[test@test.test] (☎ )',1,9350,null,'107',to_date('06/08/03','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',1,'<div id="program_top">
	<ul>
		<li id="program_left"><img src="/images/50/52-mid_left.gif" width="13" height="147"></li>
		<li id="program_center">
			<ul id="ul_program_center">
				<li id="program_img"><img src="/images/50/105-img.gif" width="193" height="113"></li>
				<li id="program_info">
					<ul id="ul_program_info">
						<li id="program_info_1"><img src="/images/50/icon_point1.gif" width="5" height="13"> <strong>국제자유도시 생활중국어 “ 니하오, Jeju"</strong></li>
						<li id="program_info_2"></li>

						<li id="program_info_4"><img src="/images/50/52-charge.gif" width="64" height="21"> 담당: 현동협, 외주촬영: 초록물고기</li>
						<li id="program_info_5"><img src="/images/50/52-master.gif" width="64" height="21"> 이영석, 김행철</li>
					</ul>
				</li>
			</ul>
		</li>
		<li id="program_right"><img src="/images/50/52-mid_right.gif" width=13 height=147></li>
	</ul>
</div>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (108,3,4,'test test[test@test.co.kr] (☎ )',1,1777,null,'108',to_date('06/07/29','RR/MM/DD'),to_date('09/04/14','RR/MM/DD'),'kctvjeju12',0,'<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=13><IMG height=147 src="/images/50/52-mid_left.gif" width=13></TD>
<TD vAlign=center background=/images/50/52-mid_bg.gif>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD vAlign=top width=205><IMG height=113 src="/images/50/105-img.gif" width=193></TD>
<TD vAlign=top>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD height=26><SPAN style="FONT-SIZE: 14px"><IMG height=13 hspace=5 src="/images/50/icon_point1.gif" width=5 align=absMiddle vspace=5><STRONG>국제자유도시 생활중국어 “ 니하오, Jeju"</STRONG></SPAN></TD></TR>
<TR>
<TD background=../images/50/52-line.gif height=2></TD></TR>
<TR>
<TD>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-charge.gif" width=64 vspace=3></TD>
<TD><FONT color=#333333>&#8226; 담당: 현동협&nbsp; &#8226; 외주촬영: 초록물고기</FONT></TD></TR>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-master.gif" width=64 vspace=3></TD>
<TD>신의경, 쑨 민</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
<TD width=13><IMG height=147 src="/images/50/52-mid_right.gif" width=13></TD></TR></TBODY></TABLE><BR>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (106,3,0,'. 관리자[test@test.test] (☎ )',1,13079,null,null,to_date('06/08/03','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',1,'<DIV id=program_top>
<UL>
<LI id=program_left><IMG src="/images/50/52-mid_left.gif" width=13 height=147> 
<LI id=program_center>
<UL id=ul_program_center>
<LI id=program_img><IMG src="/images/50/105-img.gif" width=193 height=113> 
<LI id=program_info>
<UL id=ul_program_info>
<LI id=program_info_1><IMG src="/images/50/icon_point1.gif" width=5 height=13> <STRONG>국제자유도시 생활중국어 “ 니하오, Jeju"</STRONG> 
<LI id=program_info_2>
<LI id=program_info_4><IMG src="/images/50/52-charge.gif" width=64 height=21> 담당: 현동협, 외주촬영: 초록물고기 
<LI id=program_info_5><IMG src="/images/50/52-master.gif" width=64 height=21> 이영석, 김행철 </LI></UL></LI></UL>
<LI id=program_right><IMG src="/images/50/52-mid_right.gif" width=13 height=147> </LI></UL></DIV>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (251,0,0,'kctvjeju12 kctvjeju12[ra9801@kctvjeju.com] (☎ )',0,0,null,null,to_date('08/09/16','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (281,3,0,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,null,to_date('09/07/29','RR/MM/DD'),to_date('09/09/15','RR/MM/DD'),'kctvjeju12',0,'<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=13><IMG height=147 src="/images/50/52-mid_left.gif" width=13></TD>
<TD vAlign=center background=/images/50/52-mid_bg.gif>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD vAlign=top width=205><IMG height=113 src="/program/img/bus2.jpg" width=193></TD>
<TD vAlign=top>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD height=26><SPAN style="FONT-SIZE: 14px"><IMG height=13 hspace=5 src="/images/50/icon_point1.gif" width=5 align=absMiddle vspace=5><STRONG>떴다 ! 해피버스&nbsp;</STRONG></SPAN></TD></TR>
<TR>
<TD background=../images/50/52-line.gif height=2></TD></TR>
<TR>
<TD>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-time.gif" width=64 vspace=3></TD>
<TD><STRONG><FONT color=#49aab0>40분</FONT></STRONG>/ <A href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</A> 
<TD></TD>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-charge.gif" width=64 vspace=3></TD>
<TD><FONT color=#333333>&#8226; PD : 현승헌&nbsp; &#8226; 작가 : 고인선&nbsp;&nbsp; </FONT></TD></TR>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-master.gif" width=64 vspace=3></TD>
<TD><FONT color=#333333>신연수</FONT></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
<TD width=13><IMG height=147 src="/images/50/52-mid_right.gif" width=13></TD></TR></TBODY></TABLE>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (285,3,0,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,null,to_date('09/08/18','RR/MM/DD'),to_date('10/07/05','RR/MM/DD'),'kctvjeju12',0,'<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=13><IMG height=147 src="/images/50/52-mid_left.gif" width=13></TD>
<TD vAlign=center background=/images/50/52-mid_bg.gif>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD vAlign=top width=205><IMG height=113 src="/program/img/golf3.jpg" width=193></TD>
<TD vAlign=top>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD height=26><SPAN style="FONT-SIZE: 14px"><IMG height=13 hspace=5 src="/images/50/icon_point1.gif" width=5 align=absMiddle vspace=5><STRONG>KCTV배 동호회&nbsp;골프최강전&nbsp;</STRONG></SPAN></TD></TR>
<TR>
<TD background=../images/50/52-line.gif height=2></TD></TR>
<TR>
<TD>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-time.gif" width=64 vspace=3></TD>
<TD><STRONG><FONT color=#49aab0>50분</FONT></STRONG>/ <A href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</A> 
<TD></TD>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-charge.gif" width=64 vspace=3></TD>
<TD><FONT color=#333333>&#8226; PD :&nbsp;김정혁 </FONT></TD></TR>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-master.gif" width=64 vspace=3></TD>
<TD><FONT color=#333333>김성홍, 김영찬</FONT></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
<TD width=13><IMG height=147 src="/images/50/52-mid_right.gif" width=13></TD></TR></TBODY></TABLE>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (203,5,1,'나우엔터 관리자[shinda@nowenter.co.kr] (☎ ..)',1,46557,'cablefq',null,to_date('06/08/17','RR/MM/DD'),to_date('09/11/12','RR/MM/DD'),'kctvjeju12',0,'<IMG height=77 src="/images/126/topimg3.gif" width=491 border=0> ');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (324,5,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/SmartPhone/SmartPhone_Android.html',to_date('10/06/29','RR/MM/DD'),to_date('10/07/13','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (328,4,1,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,'CH4',null,to_date('10/06/29','RR/MM/DD'),to_date('10/07/02','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (322,5,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/SmartPhone/SmartPhone.html',to_date('10/06/28','RR/MM/DD'),to_date('10/07/13','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (33,1,0,'kctvjeju12 kctvjeju12[ra9801@kctvjeju.com] (☎ )',1,8050,null,null,to_date('07/09/07','RR/MM/DD'),to_date('07/09/21','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (123,4,2,'kctvjeju12 kctvjeju12[ra9801@kctvjeju.com] (☎ )',1,3656,null,'/vr/vr2.asp',to_date('07/09/07','RR/MM/DD'),to_date('07/09/07','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (244,4,3,'kctvjeju12 kctvjeju12[ra9801@kctvjeju.com] (☎ )',0,0,null,null,to_date('08/09/16','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (220,4,2,'kctvjeju12 kctvjeju12[ra9801@kctvjeju.com] (☎ )',0,0,null,'/cabledic/list.asp',to_date('07/09/11','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (253,0,2,'kctvjeju12 kctvjeju12[ra9801@kctvjeju.com] (☎ )',0,0,null,'/product/block.html',to_date('08/10/06','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (284,3,3,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'284',to_date('09/08/10','RR/MM/DD'),to_date('10/07/05','RR/MM/DD'),'kctvjeju12',0,'<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=13><IMG height=147 src="/images/50/52-mid_left.gif" width=13></TD>
<TD vAlign=center background=/images/50/52-mid_bg.gif>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD vAlign=top width=205><IMG height=113 src="/program/img/golf3.jpg" width=193></TD>
<TD vAlign=top>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD height=26><SPAN style="FONT-SIZE: 14px"><IMG height=13 hspace=5 src="/images/50/icon_point1.gif" width=5 align=absMiddle vspace=5><STRONG>KCTV배 동호회&nbsp;골프최강전&nbsp;</STRONG></SPAN></TD></TR>
<TR>
<TD background=../images/50/52-line.gif height=2></TD></TR>
<TR>
<TD>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-time.gif" width=64 vspace=3></TD>
<TD><STRONG><FONT color=#49aab0>50분</FONT></STRONG>/ <A href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</A> 
<TD></TD>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-charge.gif" width=64 vspace=3></TD>
<TD><FONT color=#333333>&#8226; PD :&nbsp;김정혁 </FONT></TD></TR>
<TR>
<TD width=75><IMG height=21 hspace=3 src="/images/50/52-master.gif" width=64 vspace=3></TD>
<TD><FONT color=#333333>김성홍, 김영찬</FONT></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
<TD width=13><IMG height=147 src="/images/50/52-mid_right.gif" width=13></TD></TR></TBODY></TABLE>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (327,4,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/kctvN/Intro.html',to_date('10/06/29','RR/MM/DD'),to_date('10/07/02','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (330,3,3,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'330',to_date('10/07/05','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',0,'<div id="program_top">
	<ul>
		<li id="program_left"><img src="/images/50/52-mid_left.gif" width="13" height="147"></li>
		<li id="program_center">
			<ul id="ul_program_center">
				<li id="program_img"><img src="/program/img/vod_program2.jpg" width="193" height="113"></li>
				<li id="program_info">
					<ul id="ul_program_info">
						<li id="program_info_1"><img src="/images/50/icon_point1.gif" width="5" height="13"> <strong>추천! VOD가 좋다</strong></li>
						<li id="program_info_2"></li>
						<li id="program_info_3"><img src="/images/50/52-time.gif" width="64" height="21"> <strong>40분</strong> / <a href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</a></li>
						<li id="program_info_4"><img src="/images/50/52-charge.gif" width="64" height="21"> PD : 차민규</li>
						<li id="program_info_5"><img src="/images/50/52-master.gif" width="64" height="21"> 조정수, 김연송</li>
					</ul>
				</li>
			</ul>
		</li>
		<li id="program_right"><img src="/images/50/52-mid_right.gif" width=13 height=147></li>
	</ul>
</div>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (331,5,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/SmartPhone/SmartPhone_Android2.html',to_date('10/07/13','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (334,3,3,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'334',to_date('10/07/16','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',0,'<div id="program_top">
	<ul>
		<li id="program_left"><img src="/images/50/52-mid_left.gif" width="13" height="147"></li>
		<li id="program_center">
			<ul id="ul_program_center">
				<li id="program_img"><img src="/program/img/family2.jpg" width="193" height="113"></li>
				<li id="program_info">
					<ul id="ul_program_info">
						<li id="program_info_1"><img src="/images/50/icon_point1.gif" width="5" height="13"> <strong>좌충우돌 승마패밀리</strong></li>
						<li id="program_info_2"></li>
						<li id="program_info_3"><img src="/images/50/52-time.gif" width="64" height="21"> <strong>30분</strong> / <a href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</a></li>
						<li id="program_info_4"><img src="/images/50/52-charge.gif" width="64" height="21"> PD : PD : 김정혁</li>
						<li id="program_info_5"><img src="/images/50/52-master.gif" width="64" height="21"> 김성홍, 노종순, 정진숙, 현숙희, 김성룡</li>
					</ul>
				</li>
			</ul>
		</li>
		<li id="program_right"><img src="/images/50/52-mid_right.gif" width=13 height=147></li>
	</ul>
</div>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (213,3,0,'. 관리자[test@test.test] (☎ )',1,20077,null,null,to_date('07/07/07','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',1,'<div id="program_top">
	<ul>
		<li id="program_left"><img src="/images/50/52-mid_left.gif" width="13" height="147"></li>
		<li id="program_center">
			<ul id="ul_program_center">
				<li id="program_img"><img src="/images/50/chall.jpg" width="193" height="113"></li>
				<li id="program_info">
					<ul id="ul_program_info">
						<li id="program_info_1"><img src="/images/50/icon_point1.gif" width="5" height="13"> <strong>챌린지퀴즈챔프</strong></li>
						<li id="program_info_2"></li>
						<li id="program_info_3"><img src="/images/50/52-time.gif" width="64" height="21"> <strong>50분</strong> / <a href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</a></li>
						<li id="program_info_4"><img src="/images/50/52-charge.gif" width="64" height="21"> PD : 현동협, 작가:이희진, jesse son</li>
						<li id="program_info_5"><img src="/images/50/52-master.gif" width="64" height="21"> 김연송, 리사켈리</li>
					</ul>
				</li>
			</ul>
		</li>
		<li id="program_right"><img src="/images/50/52-mid_right.gif" width=13 height=147></li>
	</ul>
</div>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (354,3,3,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'354',to_date('11/07/07','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',0,'<div id="program_top">
	<ul>
		<li id="program_left"><img src="/images/50/52-mid_left.gif" width="13" height="147"></li>
		<li id="program_center">
			<ul id="ul_program_center">
				<li id="program_img"><img src="/program/img/rain2.jpg" width="193" height="113"></li>
				<li id="program_info">
					<ul id="ul_program_info">
						<li id="program_info_1"><img src="/images/50/icon_point1.gif" width="5" height="13"> <strong>래인보우 제주</strong></li>
						<li id="program_info_2"></li>
						<li id="program_info_3"><img src="/images/50/52-time.gif" width="64" height="21"> <strong>50분</strong> / <a href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</a></li>
						<li id="program_info_4"><img src="/images/50/52-charge.gif" width="64" height="21"> PD : 이태민</li>
						<li id="program_info_5"><img src="/images/50/52-master.gif" width="64" height="21"> 이현애, 조정수, 신소영</li>
					</ul>
				</li>
			</ul>
		</li>
		<li id="program_right"><img src="/images/50/52-mid_right.gif" width=13 height=147></li>
	</ul>
</div>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (353,3,0,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,null,to_date('11/07/07','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',1,'<div id="program_top">
	<ul>
		<li id="program_left"><img src="/images/50/52-mid_left.gif" width="13" height="147"></li>
		<li id="program_center">
			<ul id="ul_program_center">
				<li id="program_img"><img src="/program/img/rain2.jpg" width="193" height="113"></li>
				<li id="program_info">
					<ul id="ul_program_info">
						<li id="program_info_1"><img src="/images/50/icon_point1.gif" width="5" height="13"> <strong>래인보우 제주</strong></li>
						<li id="program_info_2"></li>
						<li id="program_info_3"><img src="/images/50/52-time.gif" width="64" height="21"> <strong>50분</strong> / <a href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</a></li>
						<li id="program_info_4"><img src="/images/50/52-charge.gif" width="64" height="21"> PD : 이태민</li>
						<li id="program_info_5"><img src="/images/50/52-master.gif" width="64" height="21"> 이현애, 조정수, 신소영</li>
					</ul>
				</li>
			</ul>
		</li>
		<li id="program_right"><img src="/images/50/52-mid_right.gif" width=13 height=147></li>
	</ul>
</div>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (363,6,0,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',1,906,null,null,to_date('12/07/07','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (260,0,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/product/cleani.asp',to_date('08/12/08','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (292,3,1,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,'idea',null,to_date('09/10/20','RR/MM/DD'),to_date('09/10/21','RR/MM/DD'),'kctvjeju12',0,'
<P><IMG height=298 src="/program/img/idea.gif" width=648 border=0></P>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (293,0,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/product/dv_on_intro.asp',to_date('09/10/27','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (296,3,3,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'296',to_date('09/11/05','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',0,'<div id="program_top">
	<ul>
		<li id="program_left"><img src="/images/50/52-mid_left.gif" width="13" height="147"></li>
		<li id="program_center">
			<ul id="ul_program_center">
				<li id="program_img"><img src="/program/img/olle2.jpg" width="193" height="113"></li>
				<li id="program_info">
					<ul id="ul_program_info">
						<li id="program_info_1"><img src="/images/50/icon_point1.gif" width="5" height="13"> <strong>바람의 길 제주올레</strong></li>
						<li id="program_info_2"></li>
						<li id="program_info_3"><img src="/images/50/52-time.gif" width="64" height="21"> <strong>50분</strong> / <a href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</a></li>
						<li id="program_info_4"><img src="/images/50/52-charge.gif" width="64" height="21"> PD : 현승헌</li>

					</ul>
				</li>
			</ul>
		</li>
		<li id="program_right"><img src="/images/50/52-mid_right.gif" width=13 height=147></li>
	</ul>
</div>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (82,3,3,'. 관리자[test@test.test] (☎ )',1,8687,null,'82',to_date('06/08/03','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',1,'<div id="program_top">
	<ul>
		<li id="program_left"><img src="/images/50/52-mid_left.gif" width="13" height="147"></li>
		<li id="program_center">
			<ul id="ul_program_center">
				<li id="program_img"><img src="/program/img/cli_doctor2.gif" width="193" height="113"></li>
				<li id="program_info">
					<ul id="ul_program_info">
						<li id="program_info_1"><img src="/images/50/icon_point1.gif" width="5" height="13"> <strong>Talk Talk TV닥터</strong></li>
						<li id="program_info_2"></li>
						<li id="program_info_3"><img src="/images/50/52-time.gif" width="64" height="21"> <strong>30분</strong> / <a href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</a></li>
						<li id="program_info_4"><img src="/images/50/52-charge.gif" width="64" height="21"> PD : 현동협</li>
						<li id="program_info_5"><img src="/images/50/52-master.gif" width="64" height="21"> 신소영</li>
					</ul>
				</li>
			</ul>
		</li>
		<li id="program_right"><img src="/images/50/52-mid_right.gif" width=13 height=147></li>
	</ul>
</div>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (336,3,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/pro_view/list_test.asp',to_date('10/09/03','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (337,5,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/popup/stop.html',to_date('10/09/30','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (340,0,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/vod/vod_new.asp?sector=01',to_date('10/11/09','RR/MM/DD'),to_date('10/11/15','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (344,5,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/popup/Jeju_World.html',to_date('11/01/20','RR/MM/DD'),to_date('11/01/20','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (345,0,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/vod/Vod_Intro.asp',to_date('11/02/09','RR/MM/DD'),to_date('11/02/09','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (365,3,0,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',1,5826,null,null,to_date('12/07/20','RR/MM/DD'),to_date('12/10/23','RR/MM/DD'),'kctvjeju12',1,'<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD width=13><IMG src="/images/50/52-mid_left.gif" width=13 height=147></TD>
<TD vAlign=center background=/images/50/52-mid_bg.gif>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD vAlign=top width=205><IMG alt="" align=absMiddle src="/upload/htmlarea/cms/12623581619.jpg"></TD>
<TD vAlign=top>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD height=26><SPAN style="FONT-SIZE: 14px"><IMG hspace=5 vspace=5 align=absMiddle src="/images/50/icon_point1.gif" width=5 height=13><STRONG>자카와 호야의 자전거식객</STRONG></SPAN></TD></TR>
<TR>
<TD height=2 background=../images/50/52-line.gif></TD></TR>
<TR>
<TD>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD width=75><IMG hspace=3 vspace=3 src="/images/50/52-time.gif" width=64 height=21></TD>
<TD><STRONG><FONT color=#49aab0>(목) 09:50, 18:10</FONT></STRONG><STRONG><FONT color=#49aab0>&nbsp;</FONT></STRONG>/ <A href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</A></TD></TR>
<TR>
<TD width=75><IMG hspace=3 vspace=3 src="/images/50/52-charge.gif" width=64 height=21></TD>
<TD><FONT color=#333333>&#8226; PD :&nbsp;이태민 </FONT></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
<TD width=13><IMG src="/images/50/52-mid_right.gif" width=13 height=147></TD></TR></TBODY></TABLE>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (366,3,3,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',1,4767,null,'366',to_date('12/07/20','RR/MM/DD'),to_date('12/08/30','RR/MM/DD'),'kctvjeju12',1,'<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD width=13><IMG src="/images/50/52-mid_left.gif" width=13 height=147></TD>
<TD vAlign=center background=/images/50/52-mid_bg.gif>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD vAlign=top width=205><IMG alt="" align=absMiddle src="/upload/htmlarea/cms/12623581619.jpg"></TD>
<TD vAlign=top>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD height=26><SPAN style="FONT-SIZE: 14px"><IMG hspace=5 vspace=5 align=absMiddle src="/images/50/icon_point1.gif" width=5 height=13><STRONG>자카와 호야의 자전거식객</STRONG></SPAN></TD></TR>
<TR>
<TD height=2 background=../images/50/52-line.gif></TD></TR>
<TR>
<TD>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD width=75><IMG hspace=3 vspace=3 src="/images/50/52-time.gif" width=64 height=21></TD>
<TD><STRONG><FONT color=#49aab0>(목) 09:50, 18:10</FONT></STRONG><STRONG><FONT color=#49aab0>&nbsp;</FONT></STRONG>/ <A href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</A></TD></TR>
<TR>
<TD width=75><IMG hspace=3 vspace=3 src="/images/50/52-charge.gif" width=64 height=21></TD>
<TD><FONT color=#333333>&#8226; PD :&nbsp;이태민 </FONT></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
<TD width=13><IMG src="/images/50/52-mid_right.gif" width=13 height=147></TD></TR></TBODY></TABLE>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (367,3,4,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',1,2463,null,'367',to_date('12/07/20','RR/MM/DD'),to_date('12/07/25','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (368,3,4,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',1,1716,null,'368',to_date('12/07/25','RR/MM/DD'),to_date('12/07/27','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (369,3,4,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',1,2781,null,null,to_date('12/07/25','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (373,4,0,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',1,94,null,null,to_date('12/09/21','RR/MM/DD'),to_date('12/09/21','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (306,0,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',1,52,null,'/promise/use.html',to_date('12/10/26','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (304,0,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',1,69,null,'/promise/use_cable.html',to_date('12/10/26','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (305,0,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',1,33,null,'/promise/use_phone.html',to_date('12/10/26','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (308,0,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',1,43,null,'/promise/use.html',to_date('12/10/26','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (338,5,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/popup/kohyunsu.html',to_date('10/10/28','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (277,3,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/program/zone.asp',to_date('09/06/29','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (335,3,0,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,null,to_date('10/07/26','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',0,'<div id="program_top">
	<ul>
		<li id="program_left"><img src="/images/50/52-mid_left.gif" width="13" height="147"></li>
		<li id="program_center">
			<ul id="ul_program_center">
				<li id="program_img"><img src="/program/img/vod_program2.jpg" width="193" height="113"></li>
				<li id="program_info">
					<ul id="ul_program_info">
						<li id="program_info_1"><img src="/images/50/icon_point1.gif" width="5" height="13"> <strong>추천! VOD가 좋다</strong></li>
						<li id="program_info_2"></li>
						<li id="program_info_3"><img src="/images/50/52-time.gif" width="64" height="21"> <strong>40분</strong> / <a href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</a></li>
						<li id="program_info_4"><img src="/images/50/52-charge.gif" width="64" height="21"> PD : 차민규</li>
						<li id="program_info_5"><img src="/images/50/52-master.gif" width="64" height="21"> 조정수, 김연송</li>
					</ul>
				</li>
			</ul>
		</li>
		<li id="program_right"><img src="/images/50/52-mid_right.gif" width=13 height=147></li>
	</ul>
</div>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (349,6,2,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',0,0,null,'/help/bill_custom.asp',to_date('11/04/19','RR/MM/DD'),null,'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (361,6,0,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',1,385,null,null,to_date('12/07/07','RR/MM/DD'),to_date('12/07/07','RR/MM/DD'),'kctvjeju12',0,null);
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (371,3,0,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',1,627,null,null,to_date('12/08/09','RR/MM/DD'),to_date('12/08/09','RR/MM/DD'),'kctvjeju12',1,'<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD width=13><IMG src="/images/50/52-mid_left.gif" width=13 height=147></TD>
<TD vAlign=center background=/images/50/52-mid_bg.gif>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD vAlign=top width=205><IMG alt="" align=absMiddle 
src="/upload/htmlarea/cms/33228615844.jpg"></TD>
<TD vAlign=top>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD height=26><SPAN style="FONT-SIZE: 14px"><IMG hspace=5 vspace=5 
align=absMiddle src="/images/50/icon_point1.gif" width=5 height=13><STRONG>인사이드 
제주</STRONG></SPAN></TD></TR>
<TR>
<TD height=2 background=../images/50/52-line.gif></TD></TR>
<TR>
<TD>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
<TBODY>
<TR>
<TD width=75><IMG hspace=3 vspace=3 src="/images/50/52-time.gif" width=64 
height=21></TD>
<TD><STRONG><FONT color=#49aab0>10 ~ 20분</FONT></STRONG><STRONG><FONT 
color=#49aab0>&nbsp;</FONT></STRONG>/ <A 
href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</A></TD></TR>
<TR>
<TD width=75><IMG hspace=3 vspace=3 src="/images/50/52-charge.gif" width=64 
height=21></TD>
<TD><FONT color=#333333>&#8226; PD 
:&nbsp;강문관</FONT></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
<TD width=13><IMG src="/images/50/52-mid_right.gif" width=13 
height=147></TD></TR></TBODY></TABLE>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (372,3,3,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',1,1138,null,'372',to_date('12/08/09','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',1,'<div id="program_top">
	<ul>
		<li id="program_left"><img src="/images/50/52-mid_left.gif" width="13" height="147"></li>
		<li id="program_center">
			<ul id="ul_program_center">
				<li id="program_img"><img src="/upload/htmlarea/cms/33228615844.jpg" width="193" height="113"></li>
				<li id="program_info">
					<ul id="ul_program_info">
						<li id="program_info_1"><img src="/images/50/icon_point1.gif" width="5" height="13"> <strong>인사이드 제주</strong></li>
						<li id="program_info_2"></li>
						<li id="program_info_3"><img src="/images/50/52-time.gif" width="64" height="21"> <strong>10 ~ 20분</strong> / <a href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</a></li>
						<li id="program_info_4"><img src="/images/50/52-charge.gif" width="64" height="21"> PD : 강문관</li>
					</ul>
				</li>
			</ul>
		</li>
		<li id="program_right"><img src="/images/50/52-mid_right.gif" width=13 height=147></li>
	</ul>
</div>');
Insert into KCTV2.CM_CONTENTS (CMCT_CMME_UID,CMCT_FRAME_ID,CMCT_TYPE,CMCT_CHARGE,CMCT_IS_HIT,CMCT_HIT,CMCT_BOARD_ID,CMCT_EXEFILE,CMCT_REGDATE,CMCT_MODIFYDATE,CMCT_ADAD_ID,CMCT_AHEAD_TYPE,CMCT_AHEAD_CONTENTS) values (375,3,3,'kctvjeju12 KCTV[ra9801@kctvjeju.com] (☎ )',1,351,null,'375',to_date('12/10/08','RR/MM/DD'),to_date('12/10/31','RR/MM/DD'),'kctvjeju12',0,'<div id="program_top">
	<ul>
		<li id="program_left"><img src="/images/50/52-mid_left.gif" width="13" height="147"></li>
		<li id="program_center">
			<ul id="ul_program_center">
				<li id="program_img"><img src="/images/program/lovecable2.png" width="193" height="113"></li>
				<li id="program_info">
					<ul id="ul_program_info">
						<li id="program_info_1"><img src="/images/50/icon_point1.gif" width="5" height="13"> <strong>러브케이블 데이</strong></li>
						<li id="program_info_2"></li>
						<li id="program_info_3"><img src="/images/50/52-time.gif" width="64" height="21"> <strong>40분</strong> / <a href="/contents/index2.asp?muid=235&amp;pmuid=50">편성표 바로가기</a></li>
						<li id="program_info_4"><img src="/images/50/52-charge.gif" width="64" height="21"> PD : 김정혁</li>
						<li id="program_info_5"><img src="/images/50/52-master.gif" width="64" height="21"> 김지환</li>
					</ul>
				</li>
			</ul>
		</li>
		<li id="program_right"><img src="/images/50/52-mid_right.gif" width=13 height=147></li>
	</ul>
</div>');
--------------------------------------------------------
--  DDL for Index PK_CM_CONTENTS
--------------------------------------------------------

  CREATE UNIQUE INDEX "KCTV2"."PK_CM_CONTENTS" ON "KCTV2"."CM_CONTENTS" ("CMCT_CMME_UID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table CM_CONTENTS
--------------------------------------------------------

  ALTER TABLE "KCTV2"."CM_CONTENTS" ADD CONSTRAINT "PK_CM_CONTENTS" PRIMARY KEY ("CMCT_CMME_UID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "KCTV2"."CM_CONTENTS" MODIFY ("CMCT_CMME_UID" NOT NULL ENABLE);
 
  ALTER TABLE "KCTV2"."CM_CONTENTS" MODIFY ("CMCT_FRAME_ID" NOT NULL ENABLE);
 
  ALTER TABLE "KCTV2"."CM_CONTENTS" MODIFY ("CMCT_TYPE" NOT NULL ENABLE);
 
  ALTER TABLE "KCTV2"."CM_CONTENTS" MODIFY ("CMCT_IS_HIT" NOT NULL ENABLE);
 
  ALTER TABLE "KCTV2"."CM_CONTENTS" MODIFY ("CMCT_HIT" NOT NULL ENABLE);
 
  ALTER TABLE "KCTV2"."CM_CONTENTS" MODIFY ("CMCT_REGDATE" NOT NULL ENABLE);
 
  ALTER TABLE "KCTV2"."CM_CONTENTS" MODIFY ("CMCT_ADAD_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table CM_CONTENTS
--------------------------------------------------------

  ALTER TABLE "KCTV2"."CM_CONTENTS" ADD CONSTRAINT "FK_CM_CONTENTS01" FOREIGN KEY ("CMCT_CMME_UID")
	  REFERENCES "KCTV2"."CM_MENU" ("CMME_UID") ON DELETE CASCADE ENABLE;
