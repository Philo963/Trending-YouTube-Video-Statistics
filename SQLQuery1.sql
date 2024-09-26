-- Create the 'Categories' table first
CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(255)
);

-- Create the 'Regions' table second
CREATE TABLE Regions (
    region_code VARCHAR(10) PRIMARY KEY,
    region_name VARCHAR(100)
);

-- Now create the 'Videos' table
CREATE TABLE Videos (
    video_id VARCHAR(50) PRIMARY KEY,
    title VARCHAR(255),
    channel_title VARCHAR(255),
    publish_time DATETIME,
    tags TEXT,
    category_id INT,
    region_code VARCHAR(10),
    description TEXT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id),
    FOREIGN KEY (region_code) REFERENCES Regions(region_code)
);

-- Finally, create the 'Engagement' table
CREATE TABLE Engagement (
    video_id VARCHAR(50),
    trending_date DATE,
    views BIGINT,
    likes BIGINT,
    dislikes BIGINT,
    comment_count BIGINT,
    FOREIGN KEY (video_id) REFERENCES Videos(video_id)
);


