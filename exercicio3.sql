CREATE TABLE "states" ( "id" SERIAL PRIMARY KEY, "name" TEXT NOT NULL);

CREATE TABLE "cities" ( "id" SERIAL PRIMARY KEY, "name" TEXT NOT NULL, "stateId" INTEGER NOT NULL REFERENCES "states"("id"));

CREATE TABLE "customers" ( "id" SERIAL PRIMARY KEY, "fullName" TEXT NOT NULL, "cpf" VARCHAR(11) NOT NULL UNIQUE, "email" TEXT NOT NULL UNIQUE, "password" TEXT NOT NULL);

CREATE TABLE "customerAddresses" ( "id" SERIAL PRIMARY KEY, "customerId" INTEGER NOT NULL REFERENCES "customers"("id"), "street" TEXT NOT NULL, "number" INTEGER NOT NULL, "complement" TEXT, "postalCode" INTEGER NOT NULL, "cityId" INTEGER NOT NULL REFERENCES "cities"("id"));

CREATE TABLE "customerPhone" ("id" SERIAL PRIMARY KEY, "customerId" INTEGER NOT NULL REFERENCES "customers" ("id"), "number" INTEGER NOT NULL UNIQUE, "type" TEXT);

CREATE TABLE "bankAccount" ("id" SERIAL PRIMARY KEY, "customerId" INTEGER NOT NULL REFERENCES "customers" ("id"), "accountNumber" INTEGER NOT NULL, "agency" INTEGER NOT NULL, "openDate" TIMESTAMP NOT NULL DEFAULT NOW(), "closeDate" TIMESTAMP);

CREATE TABLE "transactions" ("id" SERIAL PRIMARY KEY, "customerId" INTEGER NOT NULL REFERENCES "bankAccount" ("id"), "amount" INTEGER NOT NULL, "type" TEXT, "time" TIME NOT NULL, "description" TEXT, "cancelled" BOOL NOT NULL DEFAULT FALSE);

CREATE TABLE "creditCards" ("id" SERIAL PRIMARY KEY, "bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount" ("id"), "name" TEXT NOT NULL, "number" INTEGER NOT NULL, "securityCOde" INTEGER NOT NULL, "expirationMonth" INTEGER NOT NULL, "expirationYear" INTEGER NOT NULL, "password" TEXT NOT NULL, "limit" INTEGER);
