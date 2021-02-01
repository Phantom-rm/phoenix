CREATE TABLE "trouble" (
	"id" int IDENTITY(1,1) NOT NULL,
	"geo" geography NOT NULL,
	"dat" date NOT NULL,
	"info" varchar(100) NOT NULL,
	"contact_id" int NOT NULL,
	"status_id" int NOT NULL,
	CONSTRAINT "trouble_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "contact" (
	"id" int IDENTITY(1,1) NOT NULL,
	"name" varchar(50) NOT NULL,
	"phone" varchar(15) NOT NULL,
	"mail" varchar(50) NOT NULL,
	CONSTRAINT "contact_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "status_log" (
	"id" int IDENTITY(1,1) NOT NULL,
	"status" varchar(100) NOT NULL,
	CONSTRAINT "status_log_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "trouble_histori" (
	"id" int IDENTITY(1,1) NOT NULL,
	"dat" date NOT NULL,
	"status" varchar(100) NOT NULL,
	"id_trouble" int NOT NULL,
	"human_id" int NOT NULL,
	"human_contact" int NOT NULL,
	CONSTRAINT "trouble_histori_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "human" (
	"id" int IDENTITY(1,1) NOT NULL,
	"fio" varchar(100) NOT NULL,
	CONSTRAINT "human_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "trouble" ADD CONSTRAINT "trouble_fk0" FOREIGN KEY ("id") REFERENCES "trouble"("id");
ALTER TABLE "trouble" ADD CONSTRAINT "trouble_fk1" FOREIGN KEY ("contact_id") REFERENCES "contact"("id");
ALTER TABLE "trouble" ADD CONSTRAINT "trouble_fk2" FOREIGN KEY ("status_id") REFERENCES "status_log"("Id");



ALTER TABLE "trouble_histori" ADD CONSTRAINT "trouble_histori_fk0" FOREIGN KEY ("id") REFERENCES "trouble"("id");
ALTER TABLE "trouble_histori" ADD CONSTRAINT "trouble_histori_fk1" FOREIGN KEY ("human_id") REFERENCES "human"("id");


