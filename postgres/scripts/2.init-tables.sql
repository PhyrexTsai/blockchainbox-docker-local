CREATE TABLE IF NOT EXISTS TransactionData (
	txId serial primary key,
	txHash text,
	transactionHash text,
	data text, -- json format
	dataHash text,
	status text, -- UNAPPROVED, APPROVING, APPROVED, FAILED
	network text, -- testnet, public, other network
	txTimestamp timestamp with time zone,
	updateTimestamp timestamp with time zone,
	blockNumber bigint,
	blockHash text,
	fromAddress text,
	gas integer
);

ALTER TABLE TransactionData
  OWNER TO root;

CREATE TABLE IF NOT EXISTS SearchTransaction (
	id serial primary key,
	txHash text,
	status text,
	network text,
	createTimestamp timestamp with time zone,
	fromAddress text,
	gas bigint,
	gasUsed bigint
);

ALTER TABLE SearchTransaction
  OWNER TO root;

CREATE TABLE IF NOT EXISTS Contract (
	id serial primary key,
	name text,
	bytecode text,
	createTimestamp timestamp with time zone
);

ALTER TABLE Contract
  OWNER TO root;

CREATE TABLE IF NOT EXISTS EventType (
	id serial primary key,
	name text,
	contractId integer -- Contract.id
);

ALTER TABLE EventType
  OWNER TO root;

CREATE TABLE IF NOT EXISTS EventData (
	id serial primary key,
	event text,
	eventData text,
	eventTimestamp timestamp with time zone,
	eventType text -- foriegn key of EventType.id
);

ALTER TABLE EventData
  OWNER TO root;

CREATE TABLE IF NOT EXISTS EventFilter (
	id serial primary key,
	register text,
	rule text, -- json 定義 contract & event
	available boolean,
	createTimestamp timestamp with time zone
);

ALTER TABLE EventFilter
  OWNER TO root;
