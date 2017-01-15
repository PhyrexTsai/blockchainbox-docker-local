CREATE TABLE IF NOT EXISTS Contract (
	id serial primary key,
	name text,
	sourceCode text,
	byteCode text,
	abi text,
	address text,
	createTimestamp timestamp with time zone
);

ALTER TABLE Contract
	OWNER TO root;

CREATE TABLE IF NOT EXISTS ContractEvent (
	id serial primary key,
	contractId integer, -- FK: Contract.id
	eventName text,
	eventParameters text,
	createTimestamp timestamp with time zone
);

ALTER TABLE ContractEvent
	OWNER TO root;

CREATE TABLE IF NOT EXISTS ContractFunction (
	id serial primary key,
	contractId integer, -- FK: Contract.id
	functionName text,
	functionParameters text,
	createTimestamp timestamp with time zone
);

ALTER TABLE ContractFunction
	OWNER TO root;

CREATE TABLE IF NOT EXISTS TransactionData (
	txId serial primary key,
	txHash text,
	transactionHash text,	-- which transactionHash
	data text, -- json format
	dataHash text,	-- will remove after refactor
	status text, -- UNCONFIRM, PENDING, CONFIRMED, FAILED
	network text, -- testnet, public, other network
	txTimestamp timestamp with time zone,
	updateTimestamp timestamp with time zone,
	blockNumber bigint,
	blockHash text,
	fromAddress text,
	gasUsed integer
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

CREATE TABLE IF NOT EXISTS EventData (
	id serial primary key,
	contractEventId integer,
	transactionHash text,	-- reference to transactionHash
	name text,	-- event name
	data text,	-- event data, transactionData.dataHash will belong here
	createTimestamp timestamp with time zone
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
