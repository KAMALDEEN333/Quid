-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "public";

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "full_name" TEXT,
    "owner_address" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "mission_drafts" (
    "id" SERIAL NOT NULL,
    "owner_address" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "data" JSONB NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "mission_drafts_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "User_owner_address_key" ON "User"("owner_address");

-- CreateIndex
CREATE INDEX "mission_drafts_owner_address_updated_at_idx" ON "mission_drafts"("owner_address", "updated_at");

-- AddForeignKey
ALTER TABLE "mission_drafts" ADD CONSTRAINT "mission_drafts_owner_address_fkey" FOREIGN KEY ("owner_address") REFERENCES "User"("owner_address") ON DELETE RESTRICT ON UPDATE CASCADE;

