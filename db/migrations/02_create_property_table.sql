CREATE TABLE property (id SERIAL PRIMARY KEY, name VARCHAR(60), description VARCHAR(160), cost INT);
ALTER TABLE property ADD COLUMN user_id INT;
ALTER TABLE property
ADD CONSTRAINT fk_user
FOREIGN KEY (user_id)
REFERENCES users(id)
;
ALTER TABLE property ADD COLUMN Christmas_week boolean DEFAULT TRUE;
ALTER TABLE property ADD COLUMN Thanksgiving_week boolean DEFAULT TRUE;
ALTER TABLE property ADD COLUMN Easter_week boolean DEFAULT TRUE;
