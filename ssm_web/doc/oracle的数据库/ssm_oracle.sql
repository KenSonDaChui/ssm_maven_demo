prompt PL/SQL Developer import file
prompt Created on 2018年10月9日 by gangwang
set feedback off
set define off
prompt Dropping MEMBER...
drop table MEMBER cascade constraints;
prompt Dropping PRODUCT...
drop table PRODUCT cascade constraints;
prompt Dropping ORDERS...
drop table ORDERS cascade constraints;
prompt Dropping TRAVELLER...
drop table TRAVELLER cascade constraints;
prompt Dropping ORDER_TRAVELLER...
drop table ORDER_TRAVELLER cascade constraints;
prompt Dropping PERMISSION...
drop table PERMISSION cascade constraints;
prompt Dropping ROLE...
drop table ROLE cascade constraints;
prompt Dropping ROLE_PERMISSION...
drop table ROLE_PERMISSION cascade constraints;
prompt Dropping USERS...
drop table USERS cascade constraints;
prompt Dropping USERS_ROLE...
drop table USERS_ROLE cascade constraints;
prompt Creating MEMBER...
create table MEMBER
(
  ID       VARCHAR2(32) default SYS_GUID() not null,
  NAME     VARCHAR2(20),
  NICKNAME VARCHAR2(20),
  PHONENUM VARCHAR2(20),
  EMAIL    VARCHAR2(20)
)
;
alter table MEMBER
  add primary key (ID);

prompt Creating PRODUCT...
create table PRODUCT
(
  ID            VARCHAR2(32) default SYS_GUID() not null,
  PRODUCTNUM    VARCHAR2(50) not null,
  PRODUCTNAME   VARCHAR2(50),
  CITYNAME      VARCHAR2(50),
  DEPARTURETIME TIMESTAMP(6),
  PRODUCTPRICE  NUMBER,
  PRODUCTDESC   VARCHAR2(500),
  PRODUCTSTATUS INTEGER
)
;
alter table PRODUCT
  add primary key (ID);
alter table PRODUCT
  add constraint PRODUCT unique (ID, PRODUCTNUM);

prompt Creating ORDERS...
create table ORDERS
(
  ID          VARCHAR2(32) default SYS_GUID() not null,
  ORDERNUM    VARCHAR2(20) not null,
  ORDERTIME   TIMESTAMP(6),
  PEOPLECOUNT INTEGER,
  ORDERDESC   VARCHAR2(500),
  PAYTYPE     INTEGER,
  ORDERSTATUS INTEGER,
  PRODUCTID   VARCHAR2(32),
  MEMBERID    VARCHAR2(32)
)
;
alter table ORDERS
  add primary key (ID);
alter table ORDERS
  add unique (ORDERNUM);
alter table ORDERS
  add foreign key (PRODUCTID)
  references PRODUCT (ID);
alter table ORDERS
  add foreign key (MEMBERID)
  references MEMBER (ID);

prompt Creating TRAVELLER...
create table TRAVELLER
(
  ID              VARCHAR2(32) default SYS_GUID() not null,
  NAME            VARCHAR2(20),
  SEX             VARCHAR2(20),
  PHONENUM        VARCHAR2(20),
  CREDENTIALSTYPE INTEGER,
  CREDENTIALSNUM  VARCHAR2(50),
  TRAVELLERTYPE   INTEGER
)
;
alter table TRAVELLER
  add primary key (ID);

prompt Creating ORDER_TRAVELLER...
create table ORDER_TRAVELLER
(
  ORDERID     VARCHAR2(32) not null,
  TRAVELLERID VARCHAR2(32) not null
)
;
alter table ORDER_TRAVELLER
  add primary key (ORDERID, TRAVELLERID);
alter table ORDER_TRAVELLER
  add foreign key (ORDERID)
  references ORDERS (ID);
alter table ORDER_TRAVELLER
  add foreign key (TRAVELLERID)
  references TRAVELLER (ID);

prompt Creating PERMISSION...
create table PERMISSION
(
  ID             VARCHAR2(32) default SYS_GUID() not null,
  PERMISSIONNAME VARCHAR2(50),
  URL            VARCHAR2(50)
)
;
alter table PERMISSION
  add primary key (ID);

prompt Creating ROLE...
create table ROLE
(
  ID       VARCHAR2(32) default SYS_GUID() not null,
  ROLENAME VARCHAR2(50),
  ROLEDESC VARCHAR2(50)
)
;
alter table ROLE
  add primary key (ID);

prompt Creating ROLE_PERMISSION...
create table ROLE_PERMISSION
(
  PERMISSIONID VARCHAR2(32) not null,
  ROLEID       VARCHAR2(32) not null
)
;
alter table ROLE_PERMISSION
  add primary key (PERMISSIONID, ROLEID);
alter table ROLE_PERMISSION
  add foreign key (PERMISSIONID)
  references PERMISSION (ID);
alter table ROLE_PERMISSION
  add foreign key (ROLEID)
  references ROLE (ID);

prompt Creating USERS...
create table USERS
(
  ID       VARCHAR2(32) default SYS_GUID() not null,
  EMAIL    VARCHAR2(50) not null,
  USERNAME VARCHAR2(50),
  PASSWORD VARCHAR2(50),
  PHONENUM VARCHAR2(20),
  STATUS   INTEGER
)
;
alter table USERS
  add primary key (ID);
alter table USERS
  add unique (EMAIL);

prompt Creating USERS_ROLE...
create table USERS_ROLE
(
  USERID VARCHAR2(32) not null,
  ROLEID VARCHAR2(32) not null
)
;
alter table USERS_ROLE
  add primary key (USERID, ROLEID);
alter table USERS_ROLE
  add foreign key (USERID)
  references USERS (ID);
alter table USERS_ROLE
  add foreign key (ROLEID)
  references ROLE (ID);

prompt Disabling triggers for MEMBER...
alter table MEMBER disable all triggers;
prompt Disabling triggers for PRODUCT...
alter table PRODUCT disable all triggers;
prompt Disabling triggers for ORDERS...
alter table ORDERS disable all triggers;
prompt Disabling triggers for TRAVELLER...
alter table TRAVELLER disable all triggers;
prompt Disabling triggers for ORDER_TRAVELLER...
alter table ORDER_TRAVELLER disable all triggers;
prompt Disabling triggers for PERMISSION...
alter table PERMISSION disable all triggers;
prompt Disabling triggers for ROLE...
alter table ROLE disable all triggers;
prompt Disabling triggers for ROLE_PERMISSION...
alter table ROLE_PERMISSION disable all triggers;
prompt Disabling triggers for USERS...
alter table USERS disable all triggers;
prompt Disabling triggers for USERS_ROLE...
alter table USERS_ROLE disable all triggers;
prompt Disabling foreign key constraints for ORDERS...
alter table ORDERS disable constraint SYS_C008782;
alter table ORDERS disable constraint SYS_C008783;
prompt Disabling foreign key constraints for ORDER_TRAVELLER...
alter table ORDER_TRAVELLER disable constraint SYS_C008785;
alter table ORDER_TRAVELLER disable constraint SYS_C008786;
prompt Disabling foreign key constraints for ROLE_PERMISSION...
alter table ROLE_PERMISSION disable constraint SYS_C008796;
alter table ROLE_PERMISSION disable constraint SYS_C008797;
prompt Disabling foreign key constraints for USERS_ROLE...
alter table USERS_ROLE disable constraint SYS_C008792;
alter table USERS_ROLE disable constraint SYS_C008793;
prompt Loading MEMBER...
insert into MEMBER (ID, NAME, NICKNAME, PHONENUM, EMAIL)
values ('E61D65F673D54F68B0861025C69773DB', '张三', '小三', '18888888888', 'zs@163.com');
commit;
prompt 1 records loaded
prompt Loading PRODUCT...
insert into PRODUCT (ID, PRODUCTNUM, PRODUCTNAME, CITYNAME, DEPARTURETIME, PRODUCTPRICE, PRODUCTDESC, PRODUCTSTATUS)
values ('676C5BD1D35E429A8C2E114939C5685A', 'itcast-002', '北京三日游', '北京', to_timestamp('10-10-2018 10:10:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1200, '不错的旅行', 1);
insert into PRODUCT (ID, PRODUCTNUM, PRODUCTNAME, CITYNAME, DEPARTURETIME, PRODUCTPRICE, PRODUCTDESC, PRODUCTSTATUS)
values ('12B7ABF2A4C544568B0A7C69F36BF8B7', 'itcast-003', '上海五日游', '上海', to_timestamp('25-04-2018 14:30:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1800, '魔都我来了', 0);
insert into PRODUCT (ID, PRODUCTNUM, PRODUCTNAME, CITYNAME, DEPARTURETIME, PRODUCTPRICE, PRODUCTDESC, PRODUCTSTATUS)
values ('9F71F01CB448476DAFB309AA6DF9497F', 'itcast-001', '北京三日游', '北京', to_timestamp('10-10-2018 10:10:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1200, '不错的旅行', 1);
commit;
prompt 3 records loaded
prompt Loading ORDERS...
insert into ORDERS (ID, ORDERNUM, ORDERTIME, PEOPLECOUNT, ORDERDESC, PAYTYPE, ORDERSTATUS, PRODUCTID, MEMBERID)
values ('0E7231DC797C486290E8713CA3C6ECCC', '12345', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '676C5BD1D35E429A8C2E114939C5685A', 'E61D65F673D54F68B0861025C69773DB');
insert into ORDERS (ID, ORDERNUM, ORDERTIME, PEOPLECOUNT, ORDERDESC, PAYTYPE, ORDERSTATUS, PRODUCTID, MEMBERID)
values ('5DC6A48DD4E94592AE904930EA866AFA', '54321', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '676C5BD1D35E429A8C2E114939C5685A', 'E61D65F673D54F68B0861025C69773DB');
insert into ORDERS (ID, ORDERNUM, ORDERTIME, PEOPLECOUNT, ORDERDESC, PAYTYPE, ORDERSTATUS, PRODUCTID, MEMBERID)
values ('2FF351C4AC744E2092DCF08CFD314420', '67890', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
insert into ORDERS (ID, ORDERNUM, ORDERTIME, PEOPLECOUNT, ORDERDESC, PAYTYPE, ORDERSTATUS, PRODUCTID, MEMBERID)
values ('A0657832D93E4B10AE88A2D4B70B1A28', '98765', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
insert into ORDERS (ID, ORDERNUM, ORDERTIME, PEOPLECOUNT, ORDERDESC, PAYTYPE, ORDERSTATUS, PRODUCTID, MEMBERID)
values ('E4DD4C45EED84870ABA83574A801083E', '11111', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
insert into ORDERS (ID, ORDERNUM, ORDERTIME, PEOPLECOUNT, ORDERDESC, PAYTYPE, ORDERSTATUS, PRODUCTID, MEMBERID)
values ('96CC8BD43C734CC2ACBFF09501B4DD5D', '22222', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
insert into ORDERS (ID, ORDERNUM, ORDERTIME, PEOPLECOUNT, ORDERDESC, PAYTYPE, ORDERSTATUS, PRODUCTID, MEMBERID)
values ('55F9AF582D5A4DB28FB4EC3199385762', '33333', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');
insert into ORDERS (ID, ORDERNUM, ORDERTIME, PEOPLECOUNT, ORDERDESC, PAYTYPE, ORDERSTATUS, PRODUCTID, MEMBERID)
values ('CA005CF1BE3C4EF68F88ABC7DF30E976', '44444', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');
insert into ORDERS (ID, ORDERNUM, ORDERTIME, PEOPLECOUNT, ORDERDESC, PAYTYPE, ORDERSTATUS, PRODUCTID, MEMBERID)
values ('3081770BC3984EF092D9E99760FDABDE', '55555', to_timestamp('02-03-2018 12:00:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 2, '没什么', 0, 1, '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');
commit;
prompt 9 records loaded
prompt Loading TRAVELLER...
insert into TRAVELLER (ID, NAME, SEX, PHONENUM, CREDENTIALSTYPE, CREDENTIALSNUM, TRAVELLERTYPE)
values ('3FE27DF2A4E44A6DBC5D0FE4651D3D3E', '张龙', '男', '13333333333', 0, '123456789009876543', 0);
insert into TRAVELLER (ID, NAME, SEX, PHONENUM, CREDENTIALSTYPE, CREDENTIALSNUM, TRAVELLERTYPE)
values ('EE7A71FB6945483FBF91543DBE851960', '张小龙', '男', '15555555555', 0, '987654321123456789', 1);
commit;
prompt 2 records loaded
prompt Loading ORDER_TRAVELLER...
insert into ORDER_TRAVELLER (ORDERID, TRAVELLERID)
values ('0E7231DC797C486290E8713CA3C6ECCC', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
insert into ORDER_TRAVELLER (ORDERID, TRAVELLERID)
values ('2FF351C4AC744E2092DCF08CFD314420', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
insert into ORDER_TRAVELLER (ORDERID, TRAVELLERID)
values ('3081770BC3984EF092D9E99760FDABDE', 'EE7A71FB6945483FBF91543DBE851960');
insert into ORDER_TRAVELLER (ORDERID, TRAVELLERID)
values ('55F9AF582D5A4DB28FB4EC3199385762', 'EE7A71FB6945483FBF91543DBE851960');
insert into ORDER_TRAVELLER (ORDERID, TRAVELLERID)
values ('5DC6A48DD4E94592AE904930EA866AFA', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
insert into ORDER_TRAVELLER (ORDERID, TRAVELLERID)
values ('96CC8BD43C734CC2ACBFF09501B4DD5D', 'EE7A71FB6945483FBF91543DBE851960');
insert into ORDER_TRAVELLER (ORDERID, TRAVELLERID)
values ('A0657832D93E4B10AE88A2D4B70B1A28', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
insert into ORDER_TRAVELLER (ORDERID, TRAVELLERID)
values ('CA005CF1BE3C4EF68F88ABC7DF30E976', 'EE7A71FB6945483FBF91543DBE851960');
insert into ORDER_TRAVELLER (ORDERID, TRAVELLERID)
values ('E4DD4C45EED84870ABA83574A801083E', 'EE7A71FB6945483FBF91543DBE851960');
commit;
prompt 9 records loaded
prompt Loading PERMISSION...
prompt Table is empty
prompt Loading ROLE...
prompt Table is empty
prompt Loading ROLE_PERMISSION...
prompt Table is empty
prompt Loading USERS...
prompt Table is empty
prompt Loading USERS_ROLE...
prompt Table is empty
prompt Enabling foreign key constraints for ORDERS...
alter table ORDERS enable constraint SYS_C008782;
alter table ORDERS enable constraint SYS_C008783;
prompt Enabling foreign key constraints for ORDER_TRAVELLER...
alter table ORDER_TRAVELLER enable constraint SYS_C008785;
alter table ORDER_TRAVELLER enable constraint SYS_C008786;
prompt Enabling foreign key constraints for ROLE_PERMISSION...
alter table ROLE_PERMISSION enable constraint SYS_C008796;
alter table ROLE_PERMISSION enable constraint SYS_C008797;
prompt Enabling foreign key constraints for USERS_ROLE...
alter table USERS_ROLE enable constraint SYS_C008792;
alter table USERS_ROLE enable constraint SYS_C008793;
prompt Enabling triggers for MEMBER...
alter table MEMBER enable all triggers;
prompt Enabling triggers for PRODUCT...
alter table PRODUCT enable all triggers;
prompt Enabling triggers for ORDERS...
alter table ORDERS enable all triggers;
prompt Enabling triggers for TRAVELLER...
alter table TRAVELLER enable all triggers;
prompt Enabling triggers for ORDER_TRAVELLER...
alter table ORDER_TRAVELLER enable all triggers;
prompt Enabling triggers for PERMISSION...
alter table PERMISSION enable all triggers;
prompt Enabling triggers for ROLE...
alter table ROLE enable all triggers;
prompt Enabling triggers for ROLE_PERMISSION...
alter table ROLE_PERMISSION enable all triggers;
prompt Enabling triggers for USERS...
alter table USERS enable all triggers;
prompt Enabling triggers for USERS_ROLE...
alter table USERS_ROLE enable all triggers;
set feedback on
set define on
prompt Done.
