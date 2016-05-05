--------------------------------------------------------
--  ������ ������ - �ݿ���-11��-16-2012   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table SCHEDULE
--------------------------------------------------------

  CREATE TABLE "KCTV2"."SCHEDULE" 
   (	"PK_DATE" VARCHAR2(10 BYTE), 
	"PK_TIME" VARCHAR2(5 BYTE), 
	"PROGRAM" VARCHAR2(100 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into KCTV2.SCHEDULE
SET DEFINE OFF;
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-10','07:50','�߱��� ����');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-10','08:00','������ �ð�������');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-10','08:40','�ó׸�������');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-10','09:00','KCTV 9�� ����');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-10','09:20','�ǰ������̾�Ƽ �ø���');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-10','10:15','KCTV Ư�� ��õ������ ���');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-10','11:00','KCTV 11�� ����');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-10','11:20','JDC �۷ι� ��ī����');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-10','12:10','�ý�');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-10','13:00','����Ȧ PP �����');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-10','13:50','��õ VOD�� ����');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-10','14:30','����� �ǽ�');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-10','15:00','������ VOD Ư����ȭ');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-10','16:50','�ó׸�������');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-10','17:10','������ �ð�������');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-10','17:50','�ڸ��� �� �ŷ�Ʈ');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-10','19:00','KCTV �ָ� ����');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-10','19:10','�߱��� ����');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-10','19:20','�ε��ť ��');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-10','19:50','KCTV Ư�� ��õ������ ���');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-10','20:40','JDC �۷ι� ��ī����');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-10','21:30','KCTV �ָ� ����');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-10','21:40','�߱��� ����');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-10','21:50','��������');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-10','22:00','����������');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-10','22:10','�۷ι� ç���� ����è��');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-10','23:00','KCTV �ָ�����');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-10','23:10','�߱��� ����');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-10','23:20','������ VOD Ư����ȭ');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-11','01:10','�ڸ��� �� �ŷ�Ʈ');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-11','02:20','�ε��ť ��');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-11','02:50','��õ VOD�� ����');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-11','03:30','������ VOD Ư����ȭ');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-11','05:30','������ �ð�������');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-11','06:10','�ǰ������̾�Ƽ �ø���');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-11','07:00','KCTV����');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-11','07:40','English News KCTV');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-11','08:00','������ǽ�');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-11','08:30','��Ȱ�ܱ���');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-11','09:00','KCTV����');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-11','09:20','������ �ð�������');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-11','10:10','JDC�۷ι���ī����');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-11','11:00','KCTV����');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-11','11:20','�������߰輮 �渶');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-11','12:10','PP�����');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-11','13:00','KCTV����');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-11','13:20','�ε��ť ��');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-11','13:50','��õ! VOD�� ����');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-11','14:30','��Ȱ�ܱ���');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-11','15:00','KCTV����');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-11','15:20','JDC�۷ι���ī����');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-11','16:10','�������߰輮 �渶');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-11','17:00','KCTV����');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-11','17:20','������ �ð�������');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-11','18:10','�ó׸�������');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-11','19:00','KCTV���մ���');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-11','19:30','KCTV English News');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-11','19:50','PP�����');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-11','20:40','JDC�۷ι���ī����');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-11','21:30','KCTV���մ���');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-11','22:00','KCTV English News');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-11','22:20','��õ!VOD�� ����');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-11','23:00','KCTV���մ���');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-11','23:30','KCTV English News');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-11','23:50','PP�����');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-12','00:40','JDC�۷ι���ī����');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-12','01:30','��õ!VOD������');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-12','02:10','KCTV�������渶');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-12','03:00','PP�����');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-12','03:50','JDC�۷ι���ī����');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-12','04:40','KCTV�������渶');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-12','05:30','���α׷� �ð�����');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-12','05:40','��Ȱ�ܱ���');
Insert into KCTV2.SCHEDULE (PK_DATE,PK_TIME,PROGRAM) values ('2012-10-12','06:10','�������');
--------------------------------------------------------
--  DDL for Index SCHEDULE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "KCTV2"."SCHEDULE_PK" ON "KCTV2"."SCHEDULE" ("PK_DATE", "PK_TIME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table SCHEDULE
--------------------------------------------------------

  ALTER TABLE "KCTV2"."SCHEDULE" ADD CONSTRAINT "SCHEDULE_PK" PRIMARY KEY ("PK_DATE", "PK_TIME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "KCTV2"."SCHEDULE" MODIFY ("PK_DATE" NOT NULL ENABLE);
 
  ALTER TABLE "KCTV2"."SCHEDULE" MODIFY ("PK_TIME" NOT NULL ENABLE);
 
  ALTER TABLE "KCTV2"."SCHEDULE" MODIFY ("PROGRAM" NOT NULL ENABLE);

