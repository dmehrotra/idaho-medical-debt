create table county (
	id SERIAL primary key,
	name text unique not null
);
create table plaintiffs (
	id SERIAL primary key,
	name text unique not null
);
create table cases (
	county_id smallint not null references county(id),
	plaintiff_id smallint not null references plaintiffs(id),
	filed date,
	status text,
	defendant text,
	case_number text primary key,
	judge text
);

create table judgements (
	id SERIAL primary key,
	case_number text not null references cases(case_number),
	judgement_amount decimal(12,2),
	judgement_type text,
	judgement_date date
);

create table warrants(
	id SERIAL primary key,
	case_number text not null references cases(case_number),
	issued date,
	reason text,
	bond_amount decimal(12,2),
	defendant text
);
create table warrants_returned(
	id SERIAL primary key,
	case_number text not null references cases(case_number),
	defendant text,
	returned date,
	reason text
);

INSERT INTO plaintiffs (name) VALUES ('Medical Recovery Services') ON CONFLICT (NAME) DO NOTHING;
INSERT INTO plaintiffs (name) VALUES ('Bonneville Billing') ON CONFLICT (NAME) DO NOTHING;




