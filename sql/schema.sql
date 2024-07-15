DROP DATABASE IF EXISTS diamondsTable;
CREATE DATABASE  IF NOT EXISTS diamondsTable;

USE diamondsTable;

CREATE TABLE `userProfile`(
   `id` INTEGER NOT NULL AUTO_INCREMENT,
   `firstName`VARCHAR(50) NOT NULL,
   `lastName` VARCHAR(50) NOT NULL,
   `email`VARCHAR(100) NOT NULL,
   `password`VARCHAR(50) NOT NULL,
   `birthDate` DATE NOT NULL,
   `gender` VARCHAR (10) NOT NULL,
   `address` VARCHAR(50) NOT NULL,
   `zipCode` INTEGER,
   `phone` VARCHAR(12) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `products`(
    `productID` INTEGER NOT NULL AUTO_INCREMENT,
    `productNum` INTEGER UNIQUE NOT NULL,
    `shape` VARCHAR(20) NOT NULL,
    `image` VARCHAR(200),
    `carat` INTEGER DEFAULT 0 NOT NULL,
    `color` VARCHAR(50) NOT NULL,
    `clarity` VARCHAR(50) NOT NULL,
    `cut` VARCHAR(50) NOT NULL,
    `price` DOUBLE NOT NULL DEFAULT 0,
    `isReported` BOOLEAN,
    `userID` INTEGER,
    PRIMARY KEY (`productID`),
    FOREIGN KEY (`userID`) REFERENCES `userProfile`(`id`)
);

CREATE TABLE `orders`(
    `orderID` INTEGER NOT NULL AUTO_INCREMENT,
    `orderDate` DATE NOT NULL,
    `totalAmount` DOUBLE NOT NULL DEFAULT 0,
     PRIMARY KEY (`orderID`),
     FOREIGN KEY (`userID`) REFERENCES `userProfile`(`id`)
);

CREATE TABLE `orderItems`(
    `itemID` INTEGER NOT NULL AUTO_INCREMENT,
    `quantity` INTEGER NOT NULL DEFAULT 1,
    `itemPrice` DOUBLE NOT NULL,
    `userID` INTEGER NOT NULL,
    `productID` INTEGER NOT NULL,
    `orderID` INTEGER NOT NULL,
     PRIMARY KEY (`itemID`),
     FOREIGN KEY (`userID`) REFERENCES `userProfile`(`id`),
     FOREIGN KEY (`productID`) REFERENCES `products`(`productID`),
     FOREIGN KEY (`orderID`) REFERENCES `orders`(`orderID`)
);

CREATE TABLE `reviews`(
    `reviewID` INTEGER NOT NULL AUTO_INCREMENT,
    `reviewer` VARCHAR(50),
    `title` VARCHAR(50),
    `content`VARCHAR(300),
    `userID` INTEGER NOT NULL,
    `rating` INTEGER CHECK (rating >= 0 AND rating <= 5),
    `diamondID` INTEGER REFERENCES `products`(`productID`) ON DELETE CASCADE,
    FOREIGN KEY (`userID`) REFERENCES `userProfile`(`userID`)
);