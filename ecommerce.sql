-- brand table – Stores brand-related data
CREATE TABLE brand (
    brand_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    description TEXT
);
-- product_category table – Classifies products into categories (e.g., clothing, electronics)
CREATE TABLE product_category (
    product_category_id INT PRIMARY KEY AUTO_INCREMENT,
    category VARCHAR(255),
    description TEXT
);
-- product table – Stores general product details (name, brand, base price)
CREATE TABLE product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    base_price DECIMAL(10,2),
    brand_id INT,
    product_category_id INT,
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    FOREIGN KEY (product_category_id) REFERENCES product_category(product_category_id)
);
-- product_image table – Stores product image URLs or file references 
CREATE TABLE product_image (
    image_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    image_url VARCHAR(2083),
    alt_text VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);
--  color table – Manages available color options 
CREATE TABLE color (
    color_id INT PRIMARY KEY AUTO_INCREMENT,
    color_name VARCHAR(100),
    hex_code VARCHAR(7)
);
--  size_category table – Groups sizes into categories (e.g., clothing sizes, shoe sizes) 
CREATE TABLE size_category (
    size_category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);
 -- size_option table – Lists specific sizes (e.g., S, M, L, 42)
CREATE TABLE size_option (
    size_option_id INT PRIMARY KEY AUTO_INCREMENT,
    size_category_id INT,
    size VARCHAR(50),
    FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);
-- product_variation table – Links a product to its variations (e.g., size, color)
CREATE TABLE product_variation (
    product_variation_id INT PRIMARY KEY AUTO_INCREMENT,
    color_id INT,
    size_option_id INT,
    FOREIGN KEY (color_id) REFERENCES color(color_id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id)
);
--  product_item table – Represents purchasable items with specific variations
CREATE TABLE product_item (
    product_item_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    product_variation_id INT,
    stock_unit VARCHAR(100),
    stock_quantity INT,
    price DECIMAL(10,2),
    status VARCHAR(50),
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (product_variation_id) REFERENCES product_variation(product_variation_id)
);
-- attribute_category table – Groups attributes into categories (e.g., physical, technical)
CREATE TABLE attribute_category (
    attribute_category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100)
);
-- attribute_type table – Defines types of attributes (e.g., text, number, boolean)
CREATE TABLE attribute_type (
    attribute_type_id INT PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(100)
);
-- product_attribute table – Stores custom attributes (e.g., material, weight)
CREATE TABLE product_attribute (
    product_attribute_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    name VARCHAR(100),
    value VARCHAR(255),
    attribute_category_id INT,
    attribute_type_id INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id)
);