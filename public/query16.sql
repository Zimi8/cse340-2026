
--CREATE TABLE public.organization (
--    organization_id SERIAL PRIMARY KEY,
--    name VARCHAR(150) NOT NULL,
--    description TEXT NOT NULL,
--    contact_email VARCHAR(255) NOT NULL,
--    logo_filename VARCHAR(255) NOT NULL
--);


INSERT INTO public.organization (name, description, contact_email, logo_filename)
VALUES 
('BrightFuture Builders', 'A nonprofit focused on improving community infrastructure through sustainable construction projects.', 'info@brightfuturebuilders.org', 'brightfuture-logo.png'),
('GreenHarvest Growers', 'An urban farming collective promoting food sustainability and education in local neighborhoods.', 'contact@greenharvest.org', 'greenharvest-logo.png'),
('UnityServe Volunteers', 'A volunteer coordination group supporting local charities and service initiatives.', 'hello@unityserve.org', 'unityserve-logo.png');

CREATE TABLE public.project (
    project_id SERIAL PRIMARY KEY,
    organization_id INT NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(150) NOT NULL,
    date DATE NOT NULL,
    CONSTRAINT fk_organization
        FOREIGN KEY(organization_id) 
        REFERENCES public.organization(organization_id)
        ON DELETE CASCADE
);

INSERT INTO public.project (organization_id, title, description, location, date)
VALUES 
(1, 'Eco-Pavilion Construction', 'Building a community pavilion using 100% recycled materials.', 'Community Center South', '2026-06-10'),
(1, 'Green Roof Installation', 'Adding sustainable insulation and urban gardens to local roofs.', 'Public Library Downtown', '2026-07-15'),
(1, 'Solar Panel Assembly', 'Installing community solar grids for lower-income residential blocks.', 'Lanús Sector 4', '2026-08-22'),
(1, 'Rainwater Collection Setup', 'Building filtration systems to harvest rainwater for local parks.', 'North District Park', '2026-09-05'),
(1, 'Accessible Ramp Initiative', 'Retrofitting public spaces with eco-friendly wheelchair ramps.', 'Historical Town Hall', '2026-10-12'),
(2, 'Neighborhood Compost Drive', 'Setting up community organic waste bins and education booths.', 'East Plaza', '2026-06-18'),
(2, 'Hydroponic System Workshop', 'Teaching vertical farming techniques for small urban indoor spaces.', 'Community Center North', '2026-07-20'),
(2, 'Seed Distribution Fair', 'Handing out native vegetable seeds and planting starter kits.', 'Central Market', '2026-08-11'),
(2, 'School Garden Initiative', 'Creating an educational greenhouse and vegetable patch with students.', 'Primary School N10', '2026-09-19'),
(2, 'Autumn Harvest Festival', 'A community market to share and trade locally grown produce.', 'Growers Collective Lot', '2026-11-02'),
(3, 'Food Bank Sorting Day', 'Organizing and packing non-perishable goods for local families.', 'Unity Warehouse', '2026-06-25'),
(3, 'Elderly Care Tech Help', 'Volunteers teaching digital literacy and video-calling basics to seniors.', 'Senior Living Center', '2026-07-30'),
(3, 'Park Clean-up & Paint', 'Restoring local playgrounds, painting benches, and cleaning trails.', 'Centenario Park', '2026-08-14'),
(3, 'Winter Clothing Drive', 'Collecting and distributing jackets and blankets for vulnerable groups.', 'St. Marys Hall', '2026-05-20'),
(3, 'Community Soup Kitchen Shift', 'Preparing and serving hot meals for neighborhood residents.', 'Unity Kitchen', '2026-09-27');