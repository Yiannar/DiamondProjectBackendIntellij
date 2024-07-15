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
    PRIMARY KEY (`reviewID`)
    FOREIGN KEY (`userID`) REFERENCES `userProfile`(`userID`)
);




-- Seed data for the profile table
INSERT INTO profile (first_name, last_name, email, password, birth_date, gender, address, zipCode)
VALUES
    ('John', 'Doe', 'john.doe@example.com', 'password123', '1990-01-15', 'Male', '123 Main St', 12345),
    ('Jane', 'Smith', 'jane.smith@example.com', 'password456', '1985-05-20', 'Female', '456 Elm St', 67890);

-- Seed data for the products table
INSERT INTO products (product_no, shape, image, carat, color, clarity, cut, price, is_reported, user_id)
VALUES
    (1001, 'Princess', 'https://res.cloudinary.com/dwjrv71xr/image/upload/v1676013180/download_afso6t.jpg', 1.03, 'D', 'IF', 'Excellent', 2700.00, true, 1),
    (1002, 'Round', 'https://res.cloudinary.com/dwjrv71xr/image/upload/v1676013180/round-diamond_gi6tf7.jpg', 1.02, 'I', 'VS1', 'Ideal', 5000.00, true, 1),
    (1003, 'Cushion', 'https://res.cloudinary.com/dwjrv71xr/image/upload/v1676013180/cushion-diamond_tdo0gx.jpg', 1.01, 'I', 'VVS2', 'Very Good', 3000.00, true, 1),
    (1004, 'Pear', 'https://res.cloudinary.com/dwjrv71xr/image/upload/v1676013180/pear-diamond_wzcmq5.jpg', 0.40, 'J', 'SI1', 'Good', 417.00, true, 1),
    (1005, 'Emerald', 'https://res.cloudinary.com/dwjrv71xr/image/upload/v1676013180/emerald-diamond_jtxw7y.jpg', 1.006, 'J', 'VS2', 'Very Good', 2945.20, true, 1),
    (1006, 'Asscher', 'https://res.cloudinary.com/dwjrv71xr/image/upload/v1676013180/asscher-diamond_fty9on.jpg', 0.640, 'K', 'VS2', 'Very Good', 881.69, true, 1),
    (1007, 'Oval', 'https://res.cloudinary.com/dwjrv71xr/image/upload/v1676013180/oval-diamond_zlsijd.jpg', 0.23, 'F', 'VVS1', 'Very Good', 322.00, true, 1),
    (1008, 'Marquise', 'https://res.cloudinary.com/dwjrv71xr/image/upload/v1676013180/marquise-diamond_knardq.jpg', 0.30, 'E', 'VS2', 'Very Good', 759.00, true, 1),
    (1009, 'Radiant', 'https://res.cloudinary.com/dwjrv71xr/image/upload/v1676013180/radiant-diamond_co0ey5.jpg', 0.32, 'G', 'IF', 'Very Good', 441.00, true, 1),
    (1010, 'Heart', 'https://res.cloudinary.com/dwjrv71xr/image/upload/v1676013180/heart-diamond_yjbfls.jpg', 5.36, 'D', 'FL', 'Very Good', 4078.48, true, 1);


INSERT INTO orders (user_id, order_date, total_amount)
VALUES
    (1, '2023-08-01', 1500.00),
    (2, '2023-08-02', 3200.00);


INSERT INTO orderItems (order_id, product_id, quantity, item_price, user_id)
VALUES
    (1, 1, 1, 1500.00, 1),
    (2, 2, 1, 2000.00, 2),
    (2, 3, 2, 2400.00, 2);


INSERT INTO reviews (reviewer, title, content, rating, diamond_id, user_id)
VALUES
    ('Alice', 'Great Diamond!', 'I love this diamond!', 5, 1, 1),
    ('Bob', 'Amazing Service', 'The service was outstanding.', 5, 2, 1),
    ('Charlie', 'Beautiful', 'The diamond is stunning.', 4, 1, 2);



 INSERT INTO diamonds( product_no, shape ,image, carat , color , clarity , cut, price, is_reported ) VALUES
 ('Princess', 'https://res.cloudinary.com/dwjrv71xr/image/upload/v1676013180/download_afso6t.jpg',103, 'D', 'IF', 'Excellent', 270000, true),
 ('Round', 'https://res.cloudinary.com/dwjrv71xr/image/upload/v1676013180/round-diamond_gi6tf7.jpg',102, 'I', 'VS1', 'Ideal', 500000, true),
 ('Cushion', 'https://res.cloudinary.com/dwjrv71xr/image/upload/v1676013180/cushion-diamond_tdo0gx.jpg',101, 'I', 'VVS2', 'Very Good', 300000, true),
 ('Pear', 'https://res.cloudinary.com/dwjrv71xr/image/upload/v1676013180/pear-diamond_wzcmq5.jpg',040, 'J', 'SI1', 'Good', 41700, true),
 ('Emerald', 'https://res.cloudinary.com/dwjrv71xr/image/upload/v1676013180/emerald-diamond_jtxw7y.jpg',1006, 'J', 'VS2', 'Very Good', 294520, true),
 ('Asscher', 'https://res.cloudinary.com/dwjrv71xr/image/upload/v1676013180/asscher-diamond_fty9on.jpg',640, 'K', 'VS2', 'Very Good', 88169, true),
 ('Oval', 'https://res.cloudinary.com/dwjrv71xr/image/upload/v1676013180/oval-diamond_zlsijd.jpg',023, 'F', 'VVS1', 'Very Good', 32200, true),
 ('Marquise', 'https://res.cloudinary.com/dwjrv71xr/image/upload/v1676013180/marquise-diamond_knardq.jpg',030, 'E', 'VS2', 'Very Good', 75900, true),
 ('Radiant', 'https://res.cloudinary.com/dwjrv71xr/image/upload/v1676013180/radiant-diamond_co0ey5.jpg',032, 'G', 'IF', 'Very Good', 44100, true),
 ('Heart', 'https://res.cloudinary.com/dwjrv71xr/image/upload/v1676013180/heart-diamond_yjbfls.jpg',536, 'D', 'FL', 'Very Good', 407848, true);


 INSERT INTO reviews ( diamond_id, reviewer, title, content, rating) VALUES
 ('1', 'John', 'My Favorite', 'This diamond is such a great gift my wife loves it!', 5),
 ('2', 'Jane', 'My Favorite', 'I love this shape but I would like a better clarity!', 3),
 ('3', 'Maria', 'My Least Favorite', 'This diamond is okay but its just lacking something', 3),
 ('4', 'Juliana', 'I Love Going Here', 'It fits perfectly', 5),
 ('5', 'David', 'Cool Site', 'okay cool diamonds', 3),
 ('6', 'Mr. Mingo', 'So Helpful', 'I love the information on this diamond', 3),
 ('7', 'Alison', 'Best for gifts', 'I love it!', 4),
 ('8', 'Hannah', 'Insert Confetti Emoji Here', 'My sister loves this for her graduation!', 4),
 ('9', 'Gabi', 'My Friend Hannah', 'Gets a discount if I leave a positive review, so here it is', 5),
 ('10', 'Mary', 'My Favorite', 'Love the product shipping took long though', 3),
 ('1', 'Elizabeth', 'Fell in love', 'Loved!', 5),
 ('2', 'Jaden', 'Best for Valentines', 'Hopes my wife loves this', 5),
 ('3', 'Jasen', 'Wife hated shape', 'my wife hated it but the diamond was good quality', 2),
 ('4', 'Bryanna', 'Loved!', 'telling everybody', 5),
 ('5', 'Brittani', 'A lifesaver!','Fast shipping time', 4),
 ('6', 'Keisha', 'Insert Confetti Emoji Here', 'I survived 6 hours at the DMV!', 4),
 ('7', 'Devyn', 'Present for mom', 'my mom loved this gift!', 5),
 ('8', 'Evan', 'Engagement', 'Best engagment ring she said yes!', 5),
 ('9', 'Tiffany', 'Nice I suppose ', 'Not super impressed', 2),
 ('10', 'Cierra', 'Best gift to self', 'I am in love', 5);