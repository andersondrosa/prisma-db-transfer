// require("dotenv").config();
const { PrismaClient } = require("@prisma/client");
const fs = require("fs");
const path = require("path");

const prisma = new PrismaClient();

async function restoreTable(tableName) {
  let chunkIndex = 0;
  let filePath = path.resolve(
    __dirname,
    `dumps/${tableName}_${chunkIndex}.json`
  );

  while (fs.existsSync(filePath)) {
    console.log("load.. " + filePath + " ...");
    const data = JSON.parse(fs.readFileSync(filePath, "utf8"));
    for (const record of data) {
      await prisma[tableName].create({ data: record });
    }
    chunkIndex += 500;
    filePath = path.resolve(
      __dirname,
      `dumps/${tableName}_${chunkIndex}.json`
    );
  }
}

async function main() {
  const tables = [
    "admin",
    "application",
    "client",
    "database",
    "dbserver",
    "user",
    "website",
  ];
  for (const table of tables) {
    await restoreTable(table);
  }
  await prisma.$disconnect();
}

main()
  .then(() => console.log("Restauracao completa"))
  .catch((e) => {
    console.error(e);
    prisma.$disconnect();
  });
