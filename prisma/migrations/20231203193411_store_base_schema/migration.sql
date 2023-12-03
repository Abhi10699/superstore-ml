-- CreateTable
CREATE TABLE "tbl_users" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "uuid" TEXT NOT NULL,
    "firstname" TEXT NOT NULL,
    "lastname" TEXT,
    "username" TEXT,
    "gender" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "UserAddress" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "userId" INTEGER NOT NULL,
    "addressLine1" TEXT NOT NULL,
    "addressLine2" TEXT,
    "city" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "country" TEXT NOT NULL,
    "postalCode" TEXT NOT NULL,
    CONSTRAINT "UserAddress_userId_fkey" FOREIGN KEY ("userId") REFERENCES "tbl_users" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "tbl_products" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "puid" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "brandId" INTEGER,
    CONSTRAINT "tbl_products_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES "tbl_product_brand" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "tbl_product_brand" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "bid" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT
);

-- CreateTable
CREATE TABLE "tbl_product_reviews" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "reviewId" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,
    "productId" INTEGER NOT NULL,
    "rating" REAL NOT NULL,
    "text" TEXT,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "tbl_product_reviews_userId_fkey" FOREIGN KEY ("userId") REFERENCES "tbl_users" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "tbl_product_reviews_productId_fkey" FOREIGN KEY ("productId") REFERENCES "tbl_products" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "tbl_transactions" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "tuid" TEXT NOT NULL,
    "productId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL,
    CONSTRAINT "tbl_transactions_userId_fkey" FOREIGN KEY ("userId") REFERENCES "tbl_users" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "tbl_transactions_productId_fkey" FOREIGN KEY ("productId") REFERENCES "tbl_products" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "tbl_product_prices" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "prid" TEXT NOT NULL,
    "price" REAL NOT NULL,
    "productId" INTEGER NOT NULL,
    "effective_date" DATETIME NOT NULL,
    CONSTRAINT "tbl_product_prices_productId_fkey" FOREIGN KEY ("productId") REFERENCES "tbl_products" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
