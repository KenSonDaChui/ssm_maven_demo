---------------------------------------------------
-- Export file for user SSM                      --
-- Created by hardheaded on 2018/10/17, 15:20:56 --
---------------------------------------------------

spool sql.log

prompt
prompt Creating table MEMBER
prompt =====================
prompt
create table SSM.MEMBER
(
  ID       VARCHAR2(32) default SYS_GUID() not null,
  NAME     VARCHAR2(20),
  NICKNAME VARCHAR2(20),
  PHONENUM VARCHAR2(20),
  EMAIL    VARCHAR2(20)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SSM.MEMBER
  add primary key (ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PRODUCT
prompt ======================
prompt
create table SSM.PRODUCT
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
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SSM.PRODUCT
  add primary key (ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SSM.PRODUCT
  add constraint PRODUCT unique (ID, PRODUCTNUM)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ORDERS
prompt =====================
prompt
create table SSM.ORDERS
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
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SSM.ORDERS
  add primary key (ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SSM.ORDERS
  add unique (ORDERNUM)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SSM.ORDERS
  add foreign key (PRODUCTID)
  references SSM.PRODUCT (ID);
alter table SSM.ORDERS
  add foreign key (MEMBERID)
  references SSM.MEMBER (ID);

prompt
prompt Creating table TRAVELLER
prompt ========================
prompt
create table SSM.TRAVELLER
(
  ID              VARCHAR2(32) default SYS_GUID() not null,
  NAME            VARCHAR2(20),
  SEX             VARCHAR2(20),
  PHONENUM        VARCHAR2(20),
  CREDENTIALSTYPE INTEGER,
  CREDENTIALSNUM  VARCHAR2(50),
  TRAVELLERTYPE   INTEGER
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SSM.TRAVELLER
  add primary key (ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ORDER_TRAVELLER
prompt ==============================
prompt
create table SSM.ORDER_TRAVELLER
(
  ORDERID     VARCHAR2(32) not null,
  TRAVELLERID VARCHAR2(32) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SSM.ORDER_TRAVELLER
  add primary key (ORDERID, TRAVELLERID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SSM.ORDER_TRAVELLER
  add foreign key (ORDERID)
  references SSM.ORDERS (ID);
alter table SSM.ORDER_TRAVELLER
  add foreign key (TRAVELLERID)
  references SSM.TRAVELLER (ID);

prompt
prompt Creating table PERMISSION
prompt =========================
prompt
create table SSM.PERMISSION
(
  ID             VARCHAR2(32) default SYS_GUID() not null,
  PERMISSIONNAME VARCHAR2(50),
  URL            VARCHAR2(50)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SSM.PERMISSION
  add primary key (ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ROLE
prompt ===================
prompt
create table SSM.ROLE
(
  ID       VARCHAR2(32) default SYS_GUID() not null,
  ROLENAME VARCHAR2(50),
  ROLEDESC VARCHAR2(50)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SSM.ROLE
  add primary key (ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ROLE_PERMISSION
prompt ==============================
prompt
create table SSM.ROLE_PERMISSION
(
  PERMISSIONID VARCHAR2(32) not null,
  ROLEID       VARCHAR2(32) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SSM.ROLE_PERMISSION
  add primary key (PERMISSIONID, ROLEID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SSM.ROLE_PERMISSION
  add foreign key (PERMISSIONID)
  references SSM.PERMISSION (ID);
alter table SSM.ROLE_PERMISSION
  add foreign key (ROLEID)
  references SSM.ROLE (ID);

prompt
prompt Creating table SYSLOG
prompt =====================
prompt
create table SSM.SYSLOG
(
  ID            VARCHAR2(32) default SYS_GUID(),
  VISITTIME     NUMBER,
  USERNAME      VARCHAR2(50),
  IP            VARCHAR2(30),
  URL           VARCHAR2(50),
  EXECUTIONTIME TIMESTAMP(6),
  METHOD        VARCHAR2(200)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table USERS
prompt ====================
prompt
create table SSM.USERS
(
  ID       VARCHAR2(32) default SYS_GUID() not null,
  EMAIL    VARCHAR2(50) not null,
  USERNAME VARCHAR2(50),
  PASSWORD VARCHAR2(100),
  PHONENUM VARCHAR2(20),
  STATUS   INTEGER
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SSM.USERS
  add primary key (ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SSM.USERS
  add unique (EMAIL)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table USERS_ROLE
prompt =========================
prompt
create table SSM.USERS_ROLE
(
  USERID VARCHAR2(32) not null,
  ROLEID VARCHAR2(32) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SSM.USERS_ROLE
  add primary key (USERID, ROLEID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table SSM.USERS_ROLE
  add foreign key (USERID)
  references SSM.USERS (ID);
alter table SSM.USERS_ROLE
  add foreign key (ROLEID)
  references SSM.ROLE (ID);


spool off
