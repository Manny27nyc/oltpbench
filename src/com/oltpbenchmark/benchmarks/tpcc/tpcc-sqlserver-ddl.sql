--  DROP EXISTING TABLES
IF OBJECT_ID('WAREHOUSE') IS NOT NULL DROP TABLE WAREHOUSE;
IF OBJECT_ID('STOCK') IS NOT NULL DROP TABLE STOCK;
IF OBJECT_ID('ORDER_LINE') IS NOT NULL DROP TABLE ORDER_LINE;
IF OBJECT_ID('OORDER') IS NOT NULL DROP TABLE OORDER;
IF OBJECT_ID('NEW_ORDER') IS NOT NULL DROP TABLE NEW_ORDER;
IF OBJECT_ID('ITEM') IS NOT NULL DROP TABLE ITEM;
IF OBJECT_ID('HISTORY') IS NOT NULL DROP TABLE HISTORY;
IF OBJECT_ID('DISTRICT') IS NOT NULL DROP TABLE DISTRICT;
IF OBJECT_ID('CUSTOMER') IS NOT NULL DROP TABLE CUSTOMER;

-- CREATE TABLES

CREATE TABLE [dbo].[WAREHOUSE](
	[W_ID] [INT] NOT NULL,
	[W_YTD] [DECIMAL](12, 2) NOT NULL,
	[W_TAX] [DECIMAL](4, 4) NOT NULL,
	[W_NAME] [VARCHAR](10) NOT NULL,
	[W_STREET_1] [VARCHAR](20) NOT NULL,
	[W_STREET_2] [VARCHAR](20) NOT NULL,
	[W_CITY] [VARCHAR](20) NOT NULL,
	[W_STATE] [CHAR](2) NOT NULL,
	[W_ZIP] [CHAR](9) NOT NULL,
	PRIMARY KEY (W_ID)
);

CREATE TABLE [dbo].[STOCK](
	[S_W_ID] [INT] NOT NULL,
	[S_I_ID] [INT] NOT NULL,
	[S_QUANTITY] [DECIMAL](4, 0) NOT NULL,
	[S_YTD] [DECIMAL](8, 2) NOT NULL,
	[S_ORDER_CNT] [INT] NOT NULL,
	[S_REMOTE_CNT] [INT] NOT NULL,
	[S_DATA] [VARCHAR](50) NOT NULL,
	[S_DIST_01] [CHAR](24) NOT NULL,
	[S_DIST_02] [CHAR](24) NOT NULL,
	[S_DIST_03] [CHAR](24) NOT NULL,
	[S_DIST_04] [CHAR](24) NOT NULL,
	[S_DIST_05] [CHAR](24) NOT NULL,
	[S_DIST_06] [CHAR](24) NOT NULL,
	[S_DIST_07] [CHAR](24) NOT NULL,
	[S_DIST_08] [CHAR](24) NOT NULL,
	[S_DIST_09] [CHAR](24) NOT NULL,
	[S_DIST_10] [CHAR](24) NOT NULL,
	PRIMARY KEY (S_W_ID,S_I_ID)
);

CREATE TABLE [dbo].[ORDER_LINE](
	[OL_W_ID] [INT] NOT NULL,
	[OL_D_ID] [INT] NOT NULL,
	[OL_O_ID] [INT] NOT NULL,
	[OL_NUMBER] [INT] NOT NULL,
	[OL_I_ID] [INT] NOT NULL,
	[OL_DELIVERY_D] [SMALLDATETIME] NULL,
	[OL_AMOUNT] [DECIMAL](6, 2) NOT NULL,
	[OL_SUPPLY_W_ID] [INT] NOT NULL,
	[OL_QUANTITY] [DECIMAL](2, 0) NOT NULL,
	[OL_DIST_INFO] [CHAR](24) NOT NULL,
	PRIMARY KEY (OL_W_ID,OL_D_ID,OL_O_ID,OL_NUMBER)
); 

CREATE TABLE [dbo].[OORDER](
	[O_W_ID] [INT] NOT NULL,
	[O_D_ID] [INT] NOT NULL,
	[O_ID] [INT] NOT NULL,
	[O_C_ID] [INT] NOT NULL,
	[O_CARRIER_ID] [INT] NULL,
	[O_OL_CNT] [DECIMAL](2, 0) NOT NULL,
	[O_ALL_LOCAL] [DECIMAL](1, 0) NOT NULL,
	[O_ENTRY_D] [SMALLDATETIME] NULL,
	PRIMARY KEY (O_W_ID,O_D_ID,O_ID),
    UNIQUE (O_W_ID,O_D_ID,O_C_ID,O_ID)
);

CREATE TABLE [dbo].[NEW_ORDER](
	[NO_W_ID] [INT] NOT NULL,
	[NO_D_ID] [INT] NOT NULL,
	[NO_O_ID] [INT] NOT NULL,
	PRIMARY KEY (NO_W_ID,NO_D_ID,NO_O_ID)
);

CREATE TABLE [dbo].[ITEM](
	[I_ID] [INT] NOT NULL,
	[I_NAME] [VARCHAR](24) NOT NULL,
	[I_PRICE] [DECIMAL](5, 2) NOT NULL,
	[I_DATA] [VARCHAR](50) NOT NULL,
	[I_IM_ID] [INT] NOT NULL,
	PRIMARY KEY (I_ID)
);

CREATE TABLE [dbo].[HISTORY](
	[H_C_ID] [INT] NOT NULL,
	[H_C_D_ID] [INT] NOT NULL,
	[H_C_W_ID] [INT] NOT NULL,
	[H_D_ID] [INT] NOT NULL,
	[H_W_ID] [INT] NOT NULL,
	[H_DATE] [SMALLDATETIME] NULL,
	[H_AMOUNT] [DECIMAL](6, 2) NOT NULL,
	[H_DATA] [VARCHAR](24) NOT NULL
);

CREATE TABLE [dbo].[DISTRICT](
	[D_W_ID] [INT] NOT NULL,
	[D_ID] [INT] NOT NULL,
	[D_YTD] [DECIMAL](12, 2) NOT NULL,
	[D_TAX] [DECIMAL](4, 4) NOT NULL,
	[D_NEXT_O_ID] [INT] NOT NULL,
	[D_NAME] [VARCHAR](10) NOT NULL,
	[D_STREET_1] [VARCHAR](20) NOT NULL,
	[D_STREET_2] [VARCHAR](20) NOT NULL,
	[D_CITY] [VARCHAR](20) NOT NULL,
	[D_STATE] [CHAR](2) NOT NULL,
	[D_ZIP] [CHAR](9) NOT NULL,
	PRIMARY KEY (D_W_ID,D_ID)
);


CREATE TABLE [dbo].[CUSTOMER](
	[C_W_ID] [INT] NOT NULL,
	[C_D_ID] [INT] NOT NULL,
	[C_ID] [INT] NOT NULL,
	[C_DISCOUNT] [DECIMAL](4, 4) NOT NULL,
	[C_CREDIT] [CHAR](2) NOT NULL,
	[C_LAST] [VARCHAR](16) NOT NULL,
	[C_FIRST] [VARCHAR](16) NOT NULL,
	[C_CREDIT_LIM] [DECIMAL](12, 2) NOT NULL,
	[C_BALANCE] [DECIMAL](12, 2) NOT NULL,
	[C_YTD_PAYMENT] [REAL] NOT NULL,
	[C_PAYMENT_CNT] [INT] NOT NULL,
	[C_DELIVERY_CNT] [INT] NOT NULL,
	[C_STREET_1] [VARCHAR](20) NOT NULL,
	[C_STREET_2] [VARCHAR](20) NOT NULL,
	[C_CITY] [VARCHAR](20) NOT NULL,
	[C_STATE] [CHAR](2) NOT NULL,
	[C_ZIP] [CHAR](9) NOT NULL,
	[C_PHONE] [CHAR](16) NOT NULL,
	[C_SINCE] [SMALLDATETIME] NULL,
	[C_MIDDLE] [CHAR](2) NOT NULL,
	[C_DATA] [VARCHAR](500) NOT NULL,
	PRIMARY KEY (C_W_ID,C_D_ID,C_ID)
);

-- CREATE INDEXES
CREATE INDEX IDX_CUSTOMER_NAME ON [dbo].[CUSTOMER] (C_W_ID,C_D_ID,C_LAST,C_FIRST);
