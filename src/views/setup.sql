-- Organization Table --
CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);
-- Insert sample data: Organizations --
INSERT INTO organization (name, description, contact_email, logo_filename)
VALUES
    ('BrightFuture Builders', 'A nonprofit focused on improving community infrastructure through sustainable construction projects.', 'info@brightfuturebuilders.org', 'brightfuture-logo.png'),
    ('GreenHarvest Growers', 'An urban farming collective promoting food sustainability and education in local neighborhoods.', 'contact@greenharvest.org', 'greenharvest-logo.png'),
    ('UnityServe Volunteers', 'A volunteer coordination group supporting local charities and service initiatives.', 'hello@unityserve.org', 'unityserve-logo.png');
-- Project Table --
CREATE TABLE project (
    project_id      SERIAL PRIMARY KEY,
    organization_id INTEGER NOT NULL,
    title           VARCHAR(200) NOT NULL,
    description     TEXT NOT NULL,
    location        VARCHAR(255) NOT NULL,
    date            DATE NOT NULL,
    CONSTRAINT fk_project_organization
        FOREIGN KEY (organization_id)
        REFERENCES organization (organization_id)
        ON DELETE CASCADE
);

-- Insert sample data: Projects --
INSERT INTO project (organization_id, title, description, location, date) VALUES
(1, 'Solar-Powered Bus Stop Installation',
 'Installing shaded, solar-powered bus shelters to improve community transportation access.',
 'Davenport, FL', '2026-10-05'),
(1, 'Affordable Housing Repair Day',
 'Providing structural repairs, weatherproofing, and safety upgrades for low-income homes.',
 'Haines City, FL', '2026-10-12'),
(1, 'Sustainable Playground Rebuild',
 'Rebuilding a local playground using recycled materials and eco-friendly construction methods.',
 'Winter Haven, FL', '2026-10-19'),
(1, 'Community Center Renovation',
 'Upgrading flooring, lighting, and accessibility features at a neighborhood community center.',
 'Lakeland, FL', '2026-10-26'),
(1, 'Green Roof Demonstration Project',
 'Constructing a small-scale green roof to educate residents on sustainable building practices.',
 'Clermont, FL', '2026-11-02'),
 (2, 'Urban Micro-Farm Setup',
 'Creating compact, high-yield garden plots for families to grow fresh produce at home.',
 'Orlando, FL', '2026-10-07'),
(2, 'Composting & Soil Health Workshop',
 'Teaching residents how to compost effectively and improve soil quality for gardening.',
 'Kissimmee, FL', '2026-10-14'),
(2, 'Community Orchard Planting',
 'Planting fruit trees in public spaces to support long-term food access.',
 'Poinciana, FL', '2026-10-21'),
(2, 'Farm-to-Food Pantry Harvest Day',
 'Harvesting and packaging fresh produce for local food pantries.',
 'Celebration, FL', '2026-10-28'),
(2, 'Sustainable Irrigation Demo Build',
 'Installing a low-cost drip irrigation system to demonstrate water-efficient farming.',
 'Orlando, FL', '2026-11-04'),
 (3, 'Mobile Wellness Outreach',
 'Providing basic health screenings and wellness education to underserved neighborhoods.',
 'Auburndale, FL', '2026-10-09'),
(3, 'Youth Empowerment Workshop',
 'Hosting confidence-building activities and mentorship sessions for local teens.',
 'Davenport, FL', '2026-10-16'),
(3, 'Community Meal Service',
 'Preparing and serving hot meals to families experiencing food insecurity.',
 'Lake Wales, FL', '2026-10-23'),
(3, 'Emergency Hygiene Kit Assembly',
 'Building hygiene kits for individuals affected by sudden hardship or displacement.',
 'Bartow, FL', '2026-10-30'),
(3, 'Veteran Support Appreciation Day',
 'Organizing a community event offering resources, recognition, and support for veterans.',
 'Winter Haven, FL', '2026-11-06');

-- Category Table --
CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    name        VARCHAR(100) NOT NULL UNIQUE,
    date_added  DATE NOT NULL DEFAULT CURRENT_DATE
);

-- Insert data Categories --
INSERT INTO category (name) VALUES
    ('Environmental'),
    ('Educational'),
    ('Community Service'),
    ('Health and Wellness');

-- Project Category Table --
CREATE TABLE project_category (
    project_id  INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    PRIMARY KEY (project_id, category_id),
    CONSTRAINT fk_project_category_project
        FOREIGN KEY (project_id)
        REFERENCES project (project_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_project_category_category
        FOREIGN KEY (category_id)
        REFERENCES category (category_id)
        ON DELETE CASCADE
);

-- Insert sample data project category associations --
INSERT INTO project_category (project_id, category_id) VALUES
    (1, 1), (1, 3),
    (2, 3),
    (3, 1), (3, 3),
    (4, 3),
    (5, 1), (5, 2),
    (6, 1),
    (7, 1), (7, 2),
    (8, 1), (8, 3),
    (9, 3), (9, 4),
    (10, 1), (10, 2),
    (11, 4),
    (12, 2), (12, 3),
    (13, 3), (13, 4),
    (14, 4), (14, 3),
    (15, 3), (15, 4);