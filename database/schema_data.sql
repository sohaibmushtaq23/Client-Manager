-- Insert 10 clients
INSERT INTO tbl_clients 
    (ClientCode, CompanyName, Industry, Email, Phone, Website, Country, City, Address, IsActive, CreditLimit, CreatedAt)
VALUES
    ('ACME001', 'Acme Corporation', 'Manufacturing', 'info@acme.com', '+1-555-0100', 'https://acme.com', 'USA', 'New York', '123 Business Ave', 1, 50000.00, GETDATE()),
    ('GLOB002', 'Globex', 'Technology', 'contact@globex.com', '+44-20-7946-0123', 'https://globex.com', 'UK', 'London', '456 Tech Park', 1, 75000.00, GETDATE()),
    ('INIT003', 'Initech', 'Technology', 'support@initech.com', '+1-555-0200', 'https://initech.com', 'USA', 'Austin', '789 Software Blvd', 1, 60000.00, GETDATE()),
    ('UMB004', 'Umbrella Corporation', 'Healthcare', 'research@umbrella.com', '+81-3-1234-5678', 'https://umbrella.com', 'Japan', 'Tokyo', '1-2-3 Roppongi', 1, 120000.00, GETDATE()),
    ('STARK005', 'Stark Industries', 'Defense', 'ceo@stark.com', '+1-555-0300', 'https://starkindustries.com', 'USA', 'Malibu', '10880 Malibu Point', 1, 200000.00, GETDATE()),
    ('WAYNE006', 'Wayne Enterprises', 'Technology', 'info@wayne.com', '+1-555-0400', 'https://wayne.com', 'USA', 'Gotham', '1007 Mountain Drive', 1, 180000.00, GETDATE()),
    ('OSCORP007', 'Oscorp', 'Research', 'contact@oscorp.com', '+1-555-0500', 'https://oscorp.com', 'USA', 'New York', '1 Oscorp Tower', 1, 95000.00, GETDATE()),
    ('CYBER008', 'Cyberdyne Systems', 'Robotics', 'info@cyberdyne.com', '+1-555-0600', 'https://cyberdyne.com', 'USA', 'Los Angeles', '742 Park Avenue', 1, 85000.00, GETDATE()),
    ('TYRELL009', 'Tyrell Corporation', 'Biotechnology', 'info@tyrell.com', '+1-555-0700', 'https://tyrell.com', 'USA', 'Los Angeles', '123 Eco Park', 1, 110000.00, GETDATE()),
    ('BNL010', 'Buy n Large', 'Conglomerate', 'hello@bnl.com', '+1-555-0800', 'https://bnl.com', 'Global', 'Metropolis', '1 BnL Plaza', 1, 250000.00, GETDATE());

-- Client 1: Acme Corporation
INSERT INTO tbl_client_contacts 
    (IDClient, FirstName, LastName, Designation, Email, Mobile, Gender, BirthDate, IsPrimary, Notes, CreatedAt)
VALUES
    (1, 'John', 'Doe', 'Sales Manager', 'john.doe@acme.com', '+1-555-1001', 'Male', '1980-05-15', 1, 'Primary sales contact', GETDATE()),
    (1, 'Jane', 'Smith', 'Accountant', 'jane.smith@acme.com', '+1-555-1002', 'Female', '1985-08-22', 0, NULL, GETDATE()),
    (1, 'Bob', 'Johnson', 'IT Support', 'bob.johnson@acme.com', '+1-555-1003', 'Male', '1990-11-02', 0, NULL, GETDATE());

-- Client 2: Globex
INSERT INTO tbl_client_contacts 
    (IDClient, FirstName, LastName, Designation, Email, Mobile, Gender, BirthDate, IsPrimary, Notes, CreatedAt)
VALUES
    (2, 'Alice', 'Brown', 'CTO', 'alice.brown@globex.com', '+44-7700-900123', 'Female', '1978-03-10', 1, 'Technical lead', GETDATE()),
    (2, 'Charlie', 'Davis', 'Developer', 'charlie.davis@globex.com', '+44-7700-900124', 'Male', '1988-07-19', 0, NULL, GETDATE());

-- Client 3: Initech
INSERT INTO tbl_client_contacts 
    (IDClient, FirstName, LastName, Designation, Email, Mobile, Gender, BirthDate, IsPrimary, Notes, CreatedAt)
VALUES
    (3, 'Peter', 'Gibbons', 'Developer', 'peter.gibbons@initech.com', '+1-555-2001', 'Male', '1975-09-12', 1, 'Primary contact', GETDATE()),
    (3, 'Michael', 'Bolton', 'QA', 'michael.bolton@initech.com', '+1-555-2002', 'Male', '1980-12-05', 0, NULL, GETDATE()),
    (3, 'Samir', 'Nagheenanajar', 'Developer', 'samir@initech.com', '+1-555-2003', 'Male', '1982-02-20', 0, NULL, GETDATE());

-- Client 4: Umbrella Corporation
INSERT INTO tbl_client_contacts 
    (IDClient, FirstName, LastName, Designation, Email, Mobile, Gender, BirthDate, IsPrimary, Notes, CreatedAt)
VALUES
    (4, 'Albert', 'Wesker', 'Director', 'a.wesker@umbrella.com', '+81-90-1234-5678', 'Male', '1960-01-01', 1, 'Primary', GETDATE()),
    (4, 'Jill', 'Valentine', 'Researcher', 'j.valentine@umbrella.com', '+81-90-8765-4321', 'Female', '1974-05-14', 0, NULL, GETDATE());

-- Client 5: Stark Industries
INSERT INTO tbl_client_contacts 
    (IDClient, FirstName, LastName, Designation, Email, Mobile, Gender, BirthDate, IsPrimary, Notes, CreatedAt)
VALUES
    (5, 'Tony', 'Stark', 'CEO', 'tony@stark.com', '+1-555-3001', 'Male', '1970-05-29', 1, 'Primary', GETDATE()),
    (5, 'Pepper', 'Potts', 'Executive Assistant', 'pepper@stark.com', '+1-555-3002', 'Female', '1978-09-18', 0, NULL, GETDATE()),
    (5, 'James', 'Rhodes', 'Military Liaison', 'rhodes@stark.com', '+1-555-3003', 'Male', '1968-10-06', 0, NULL, GETDATE());

-- Client 6: Wayne Enterprises
INSERT INTO tbl_client_contacts 
    (IDClient, FirstName, LastName, Designation, Email, Mobile, Gender, BirthDate, IsPrimary, Notes, CreatedAt)
VALUES
    (6, 'Bruce', 'Wayne', 'Owner', 'bruce@wayne.com', '+1-555-4001', 'Male', '1972-02-19', 1, 'Primary', GETDATE()),
    (6, 'Lucius', 'Fox', 'CEO', 'lucius.fox@wayne.com', '+1-555-4002', 'Male', '1955-11-30', 0, NULL, GETDATE()),
    (6, 'Alfred', 'Pennyworth', 'Butler', 'alfred@wayne.com', '+1-555-4003', 'Male', '1950-12-25', 0, NULL, GETDATE());

-- Client 7: Oscorp
INSERT INTO tbl_client_contacts 
    (IDClient, FirstName, LastName, Designation, Email, Mobile, Gender, BirthDate, IsPrimary, Notes, CreatedAt)
VALUES
    (7, 'Norman', 'Osborn', 'CEO', 'norman@oscorp.com', '+1-555-5001', 'Male', '1955-04-12', 1, 'Primary', GETDATE()),
    (7, 'Harry', 'Osborn', 'VP', 'harry@oscorp.com', '+1-555-5002', 'Male', '1980-06-24', 0, NULL, GETDATE()),
    (7, 'Dr. Curt', 'Connors', 'Lead Scientist', 'curt.connors@oscorp.com', '+1-555-5003', 'Male', '1965-01-15', 0, NULL, GETDATE());

-- Client 8: Cyberdyne Systems
INSERT INTO tbl_client_contacts 
    (IDClient, FirstName, LastName, Designation, Email, Mobile, Gender, BirthDate, IsPrimary, Notes, CreatedAt)
VALUES
    (8, 'Miles', 'Dyson', 'Head of Research', 'miles.dyson@cyberdyne.com', '+1-555-6001', 'Male', '1962-08-08', 1, 'Primary', GETDATE()),
    (8, 'Sarah', 'Connor', 'Security Consultant', 'sarah.connor@cyberdyne.com', '+1-555-6002', 'Female', '1965-10-10', 0, 'Not a fan', GETDATE());

-- Client 9: Tyrell Corporation
INSERT INTO tbl_client_contacts 
    (IDClient, FirstName, LastName, Designation, Email, Mobile, Gender, BirthDate, IsPrimary, Notes, CreatedAt)
VALUES
    (9, 'Eldon', 'Tyrell', 'CEO', 'eldon.tyrell@tyrell.com', '+1-555-7001', 'Male', '1940-03-21', 1, 'Primary', GETDATE()),
    (9, 'Rachael', 'Tyrell', 'Assistant', 'rachael@tyrell.com', '+1-555-7002', 'Female', '2016-02-14', 0, 'Replicant', GETDATE()),
    (9, 'Rick', 'Deckard', 'Blade Runner', 'rick.deckard@tyrell.com', '+1-555-7003', 'Male', '1955-01-01', 0, NULL, GETDATE());

-- Client 10: Buy n Large
INSERT INTO tbl_client_contacts 
    (IDClient, FirstName, LastName, Designation, Email, Mobile, Gender, BirthDate, IsPrimary, Notes, CreatedAt)
VALUES
    (10, 'Shelby', 'Forthright', 'CEO', 's.forthright@bnl.com', '+1-555-8001', 'Male', '1960-07-04', 1, 'Primary', GETDATE()),
    (10, 'Mary', 'Smith', 'Customer Relations', 'mary.smith@bnl.com', '+1-555-8002', 'Female', '1975-09-09', 0, NULL, GETDATE()),
    (10, 'John', 'Smith', 'Logistics', 'john.smith@bnl.com', '+1-555-8003', 'Male', '1978-11-11', 0, NULL, GETDATE());