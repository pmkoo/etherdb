create database etherdb;

\c etherdb;

create table tokens (
    tkn serial not null primary key,
    address varchar(44) not null,
    name varchar(30) not null,
    symbol varchar(8) not null,
    decimals integer
);

grant select, insert, update on tokens to token;
grant select,  update on tokens_tkn_seq to token;

create table tokentransfers (
	transferid serial not null primary key,
	tokenid int not null,
	blocknumber int,
	blockhash varchar(70)  not null,
	index int,
	txhash varchar(70) unique not null,
    source varchar(44) not null,
    dest varchar(44) not null,
    "timestamp" integer,
    Amount varchar(44) not null
);

-- DROP TABLE public.tokentransfers;

CREATE TABLE tokentransfers
(
    transferid integer NOT NULL DEFAULT nextval('tokentransfers_transferid_seq'::regclass),
    tokenid integer NOT NULL,
    blocknumber integer,
    blockhash character varying(70) COLLATE pg_catalog."default" NOT NULL,
    index integer,
    txhash character varying(70) COLLATE pg_catalog."default" NOT NULL,
    source character varying(44) COLLATE pg_catalog."default" NOT NULL,
    dest character varying(44) COLLATE pg_catalog."default" NOT NULL,
    amount character varying(44) COLLATE pg_catalog."default" NOT NULL,
    "timestamp" integer,
    CONSTRAINT tokentransfers_pkey PRIMARY KEY (transferid),
    CONSTRAINT dup_txhash UNIQUE (txhash)
)

grant select, insert, update on tokentransfers to token;
grant select,  update on tokentransfers_transferid_seq to token;

create table addresses (
    id serial not null primary key,
    address varchar(44) not null,
    userid varchar(30) not null
);

grant select, insert, update on addresses to token;
grant select,  update on addresses_id_seq to token;


create table ethertransfers (
    transferid  serial not null primary key,
    blocknumber int,
    blockhash varchar(70)  not null,
    index int,
    txhash  varchar(70) unique not null,
    source varchar(44) not null,
    dest varchar(44) not null,
    amount  varchar(44) not null
);

grant select, insert, update on ethertransfers to token;
grant select,  update on ethertransfers_transferid_seq to token;

     
