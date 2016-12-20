CREATE TABLE IF NOT EXISTS TransactionData (
	txHash text primary key,
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

CREATE TABLE IF NOT EXISTS SearchTransaction (
	id integer primary key,
	txHash text,
	status text,
	network text,
	createTimestamp timestamp with time zone,
	fromAddress text,
	gas bigint,
	gasUsed bigint
);

CREATE TABLE IF NOT EXISTS Contract (
	id integer primary key,
	name text,
	bytecode text,
	createTimestamp timestamp with time zone
);

CREATE TABLE IF NOT EXISTS EventType (
	id integer primary key,
	name text,
	contractId integer -- Contract.id
);

CREATE TABLE IF NOT EXISTS EventData (
	id integer primary key,
	event text,
	eventData text,
	eventTimestamp timestamp with time zone,
	eventType text -- foriegn key of EventType.id
);

CREATE TABLE IF NOT EXISTS EventFilter (
	id integer primary key,
	register text,
	rule text, -- json 定義 contract & event
	available boolean,
	createTimestamp timestamp with time zone
);