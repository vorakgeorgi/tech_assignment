CREATE TABLE `user` (
	`id` bigint NOT NULL AUTO_INCREMENT UNIQUE,
	`name` TEXT NOT NULL,
	`email` TEXT NOT NULL,
	`password` TEXT NOT NULL,
	`age` smallint NOT NULL,
	`gender` enum NOT NULL,
	`interests` TEXT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `item` (
	`id` bigint NOT NULL AUTO_INCREMENT UNIQUE,
	`name` TEXT NOT NULL,
	`category` int NOT NULL,
	`description` TEXT NOT NULL,
	`brand` int NOT NULL,
	`price` double NOT NULL,
	`price_currency` char(3) NOT NULL,
	`weight` double NOT NULL,
	`unit` enum NOT NULL,
	`vendor` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `category` (
	`id` bigint NOT NULL AUTO_INCREMENT UNIQUE,
	`name` TEXT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `brand` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`name` TEXT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `vendor` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`name` TEXT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `store` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`items` int NOT NULL,
	`count` double NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `orders` (
	`id` int NOT NULL AUTO_INCREMENT,
	`user_id` int NOT NULL,
	`status` enum NOT NULL,
	`address` TEXT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `product_orders` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`orders_id` bigint NOT NULL,
	`items_id` bigint NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `shopping cart` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`user_id` bigint NOT NULL,
	`item_id` bigint NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `item` ADD CONSTRAINT `item_fk0` FOREIGN KEY (`category`) REFERENCES `category`(`id`);

ALTER TABLE `item` ADD CONSTRAINT `item_fk1` FOREIGN KEY (`brand`) REFERENCES `brand`(`id`);

ALTER TABLE `item` ADD CONSTRAINT `item_fk2` FOREIGN KEY (`vendor`) REFERENCES `vendor`(`id`);

ALTER TABLE `store` ADD CONSTRAINT `store_fk0` FOREIGN KEY (`items`) REFERENCES `item`(`id`);

ALTER TABLE `orders` ADD CONSTRAINT `orders_fk0` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`);

ALTER TABLE `product_orders` ADD CONSTRAINT `product_orders_fk0` FOREIGN KEY (`orders_id`) REFERENCES `orders`(`id`);

ALTER TABLE `product_orders` ADD CONSTRAINT `product_orders_fk1` FOREIGN KEY (`items_id`) REFERENCES `item`(`id`);

ALTER TABLE `shopping cart` ADD CONSTRAINT `shopping cart_fk0` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`);

ALTER TABLE `shopping cart` ADD CONSTRAINT `shopping cart_fk1` FOREIGN KEY (`item_id`) REFERENCES `item`(`id`);

