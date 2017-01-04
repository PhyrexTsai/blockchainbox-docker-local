## PostgreSQL

### Settings

```
-- access by default
psql -U postgres

-- create database and create user then grant all privileges, use command
psql -c "CREATE USER root WITH PASSWORD 'root';"

-- 
CREATE USER root WITH PASSWORD 'root';
CREATE DATABASE blockchainbox OWNER root ENCODING 'UTF-8';
GRANT ALL PRIVILEGES ON DATABASE "blockchainbox" to root;

-- now login using "root"
psql -U root -W -d blockchainbox

-- create table TransactionData
CREATE TABLE IF NOT EXISTS TransactionData (
	txId serial primary key,
	txHash text,
	data text, -- json format
	dataHash text,
	status text, -- UNAPPROVED, APPROVING, APPROVED, FAILED
	network text, -- testnet, public, other network
	txTimestamp timestamp with time zone,
	blockTimetamp timestamp with time zone,
	fromAddress text,
	gas bigint,
	gasUsed bigint
);

-- 這邊要記錄使用者查詢 transaction 的資訊
CREATE TABLE IF NOT EXISTS SearchTransaction (
	id integer primary key,
	txHash text,
	status text,
	network text,
	createTimestamp timestamp with time zone,
	fromAddress text
);

-- 這邊可以思考一下如果要做類似老師說的 Event 註冊，該怎麼訂

-- 註冊 Contract，目前應該只有會有一個 Proof of transaction 合約
CREATE TABLE IF NOT EXISTS Contract (
	id integer primary key,
	name text,
	bytecode text,
	createTimestamp timestamp with time zone
);

-- 定義各種 Event 的 Type
CREATE TABLE IF NOT EXISTS EventType (
	id integer primary key,
	name text,
	contractId integer -- Contract.id
);

-- 這邊要記錄 Event Listener 所收到的所有 Event
CREATE TABLE IF NOT EXISTS EventData (
	id integer primary key,
	event text,
	eventData text,
	eventTimestamp timestamp with time zone,
	eventType text -- foriegn key of EventType.id
);

-- 過濾 Event 的 Filter for customize
CREATE TABLE IF NOT EXISTS EventFilter (
	id integer primary key,
	register text,
	rule text, -- json 定義 contract & event
	available boolean,
	createTimestamp timestamp with time zone
);
```
