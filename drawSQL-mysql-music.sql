CREATE TABLE `Media`(
    `media_id` BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `article_id` BIGINT NULL,
    `file_type` VARCHAR(20) NULL,
    `file_url` VARCHAR(255) NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT 'DEFAULT CURRENT_TIMESTAMP'
);
CREATE TABLE `Articles`(
    `article_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(255) NULL,
    `content` LONGTEXT NULL,
    `author_id` BIGINT NULL,
    `category_id` BIGINT NULL,
    `status` ENUM('') NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT 'DEFAULT CURRENT_TIMESTAMP',
    `column_8` BIGINT NOT NULL
);
CREATE TABLE `MusicCategories`(
    `category_id` BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) NULL,
    `description` MEDIUMTEXT NOT NULL
);
CREATE TABLE `Users`(
    `user_id` BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) NULL,
    `e-mail` VARCHAR(100) NULL,
    `password_hash` VARCHAR(255) NULL,
    `role` ENUM('') NOT NULL,
    `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP
);
ALTER TABLE
    `Users` ADD UNIQUE `users_e_mail_unique`(`e-mail`);
CREATE TABLE `Comments`(
    `comment_id` BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `article_id` BIGINT NULL,
    `user_id` BIGINT NULL,
    `content` LONGTEXT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT 'DEFAULT CURRENT_TIMESTAMP',
    `column_6` BIGINT NOT NULL
);
ALTER TABLE
    `Media` ADD CONSTRAINT `media_article_id_foreign` FOREIGN KEY(`article_id`) REFERENCES `Articles`(`author_id`);
ALTER TABLE
    `Comments` ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `Users`(`user_id`);
ALTER TABLE
    `Comments` ADD CONSTRAINT `comments_article_id_foreign` FOREIGN KEY(`article_id`) REFERENCES `Articles`(`author_id`);
ALTER TABLE
    `Articles` ADD CONSTRAINT `articles_category_id_foreign` FOREIGN KEY(`category_id`) REFERENCES `MusicCategories`(`category_id`);
ALTER TABLE
    `Articles` ADD CONSTRAINT `articles_author_id_foreign` FOREIGN KEY(`author_id`) REFERENCES `Users`(`user_id`);