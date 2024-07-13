-- CreateTable
CREATE TABLE "user" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(300),
    "email" VARCHAR(100),
    "pass" VARCHAR(100),
    "thumb" VARCHAR(100),
    "active" INTEGER,
    "data" JSONB,
    "tags" JSONB,
    "created_at" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMP(0),

    CONSTRAINT "user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "application" (
    "id" INTEGER NOT NULL,
    "code" VARCHAR(8),
    "name" VARCHAR(300),
    "type" VARCHAR(12),
    "thumb" VARCHAR(1000),
    "active" BOOLEAN NOT NULL DEFAULT false,
    "data" JSONB,
    "observations" TEXT,
    "user_id" INTEGER,
    "client_id" INTEGER,
    "tags" JSONB,
    "created_at" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMP(0),
    "source" JSONB,
    "source_id" INTEGER,

    CONSTRAINT "application_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "client" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(300),
    "email" VARCHAR(100),
    "phone" VARCHAR(20),
    "cpf" VARCHAR(20),
    "cnpj" VARCHAR(20),
    "thumb" VARCHAR(1000),
    "data" JSONB,
    "status" VARCHAR(20),
    "tags" JSONB,
    "fulltext" TEXT,
    "observations" TEXT,
    "active" INTEGER,
    "location" JSONB,
    "contact" JSONB,
    "user_id" INTEGER,
    "created_at" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMP(0),
    "source" JSONB,

    CONSTRAINT "client_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "dbserver" (
    "name" TEXT NOT NULL,
    "label" TEXT,
    "host" VARCHAR(200),
    "status" VARCHAR(20),
    "data" JSONB,
    "token" VARCHAR(200),
    "observations" TEXT,
    "user_id" INTEGER,
    "tags" JSONB,
    "created_at" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMP(0),

    CONSTRAINT "dbserver_pkey" PRIMARY KEY ("name")
);

-- CreateTable
CREATE TABLE "database" (
    "name" TEXT NOT NULL,
    "model" VARCHAR(16),
    "status" VARCHAR(16),
    "server" VARCHAR(30),
    "db_host" VARCHAR(200),
    "db_port" INTEGER,
    "db_user" VARCHAR(200),
    "db_pass" VARCHAR(200),
    "db_name" VARCHAR(200),
    "db_url" VARCHAR(16),
    "data" JSONB,
    "observations" TEXT,
    "user_id" INTEGER,
    "client_id" INTEGER,
    "app_id" INTEGER,
    "dbserver_id" INTEGER,
    "tags" JSONB,
    "dbserver" VARCHAR(100),
    "created_at" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMP(0),

    CONSTRAINT "database_pkey" PRIMARY KEY ("name")
);

-- CreateTable
CREATE TABLE "admin" (
    "name" TEXT NOT NULL,
    "repo" VARCHAR(300),
    "version" VARCHAR(10),
    "database" VARCHAR(100),
    "domain" VARCHAR(300),
    "active" BOOLEAN NOT NULL DEFAULT false,
    "data" JSONB,
    "env" JSONB,
    "observations" TEXT,
    "user_id" INTEGER,
    "client_id" INTEGER,
    "app_id" INTEGER,
    "source_id" INTEGER,
    "source" JSONB,
    "tags" JSONB,
    "secret" VARCHAR(64),
    "created_at" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMP(0),

    CONSTRAINT "admin_pkey" PRIMARY KEY ("name")
);

-- CreateTable
CREATE TABLE "website" (
    "name" TEXT NOT NULL,
    "title" VARCHAR(300),
    "repo" VARCHAR(300),
    "version" VARCHAR(10),
    "domain" VARCHAR(100),
    "database" VARCHAR(100),
    "active" BOOLEAN NOT NULL DEFAULT false,
    "data" JSONB,
    "env" JSONB,
    "observations" TEXT,
    "user_id" INTEGER,
    "client_id" INTEGER,
    "app_id" INTEGER,
    "tags" JSONB,
    "secret" VARCHAR(64),
    "created_at" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP,
    "modified_at" TIMESTAMP(0),

    CONSTRAINT "website_pkey" PRIMARY KEY ("name")
);

-- CreateIndex
CREATE UNIQUE INDEX "user_uniq" ON "user"("id");

-- CreateIndex
CREATE UNIQUE INDEX "application_uniq" ON "application"("id");

-- CreateIndex
CREATE UNIQUE INDEX "client_uniq" ON "client"("id");

-- CreateIndex
CREATE UNIQUE INDEX "dbserver_uniq" ON "dbserver"("name");

-- CreateIndex
CREATE UNIQUE INDEX "db_uniq" ON "database"("name");

-- CreateIndex
CREATE UNIQUE INDEX "admin_uniq" ON "admin"("name");

-- CreateIndex
CREATE UNIQUE INDEX "website_uniq" ON "website"("name");
