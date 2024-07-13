const { PrismaClient } = require("@prisma/client");
const fs = require("fs");

const prisma = new PrismaClient();

async function backupTable(tableName) {
  let skip = 0;
  const take = 500;
  let hasMoreData = true;

  while (hasMoreData) {
    console.log(skip + " ...");
    const data = await prisma[tableName].findMany({
      skip,
      take,
    });

    if (data.length === 0) {
      hasMoreData = false;
    } else {
      fs.writeFileSync(
        `./dumps/${tableName}_${skip}.json`,
        JSON.stringify(data, null, 2)
      );
      skip += take;
    }
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
    console.log(`Backuping table '${table}' ...`);
    await backupTable(table);
  }
  await prisma.$disconnect();
}

main()
  .then(() => console.log("Backup completo"))
  .catch((e) => {
    console.log("error!");
    console.error(e);
    prisma.$disconnect();
  });
