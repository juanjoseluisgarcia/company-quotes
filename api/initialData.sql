CREATE TABLE company (
    Id UUId PRIMARY KEY DEFAULT gen_random_uuId(),
    Name TEXT NOT NULL,
    Exchange TEXT NOT NULL,
    Ticker TEXT NOT NULL,
    Isin VARCHAR(12) NOT NULL UNIQUE CHECK (Isin ~ '^[A-Z]{2}.*'),
    Website TEXT
);


INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('99297292-2a33-4179-bc98-e388118b712d', 'Oceanic Airlines', 'LSE', 'KMWY', 'DEHRMBDC36K3', 'http://www.oceanicairlines.co');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('bfe35615-152a-4e11-a91e-a728ac0c12be', 'Onyx Corporation', 'NYSE', 'JTLN', 'AURZ6OLXWQ52', 'http://www.onyxcorporation.co');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('c10a5dc7-5c31-4110-9b71-92887b5f7956', 'Polaris Systems', 'NYSE', 'CFBI', 'AULXVYMK1433', 'http://www.polarissystems.co');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('3a52b726-5331-486b-9519-387164b7c26c', 'Oscorp', 'TSE', 'DKRIX', 'USAD2NP5X2C0', 'http://www.oscorp.co');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('989ff92b-0b5d-4c39-b3e8-f44d9641eec4', 'QuantumSoft', 'NYSE', 'ESU', 'CHH450F2LUQ8', 'http://www.quantumsoft.co');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('92c21049-9fef-4c4e-b451-2044b234943f', 'Infinity Works', 'Euronext', 'WMNXC', 'IE6ZQL3HBZQ9', 'http://www.infinityworks.co');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('91accc45-7e8a-4c7b-8e2a-ae7a1205177c', 'Soylent Corp', 'TSE', 'DBIJQ', 'CHLUIFZCHR47', 'http://www.soylentcorp.org');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('cc73cff6-a669-4590-8a36-aa3caaab543d', 'Phoenix Enterprises', 'ASX', 'DRRX', 'CAVVXNZZ4LE9', 'http://www.phoenixenterprises.io');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('2a9bcf84-4499-4503-9066-33692cf3622d', 'ThorneTech', 'HKEX', 'FNX', 'USHBVYMU7SC9', 'http://www.thornetech.net');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('28dcbbb4-206b-4127-99f3-aaf9c302dd4b', 'Synapse Inc', 'Deutsche Börse', 'XZQ', 'JPSKV7RRWEQ0', 'http://www.synapseinc.co');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('3d332046-1383-4b89-aaec-2a4f2b55db6b', 'Solaris Group', 'HKEX', 'JFDXG', 'FRGI6I6O1M68', 'http://www.solarisgroup.net');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('c7b8b4de-0a3b-4f10-863f-554204d998a4', 'Stark Industries', 'HKEX', 'JHTM', 'FRA08IN3U4Z7', 'http://www.starkindustries.com');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('41f25cb7-ea5f-4729-922d-c5dd97efa6b8', 'Nakatomi Trading', 'TSE', 'VPA', 'DE8LZ0T6LJ01', 'http://www.nakatomitrading.org');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('37b9e99d-5844-46cc-b39c-12e267ad2164', 'Wayne Enterprises', 'Tokyo Stock Exchange', 'SKGCR', 'NLQVDDYYKC78', 'http://www.wayneenterprises.io');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('10421973-3200-48c8-b4c0-67f2bf142bc0', 'Halcyon Genetics', 'NYSE', 'RXG', 'CH9RA1W7IN94', 'http://www.halcyongenetics.org');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('9285421b-0fce-49dc-8be4-c92a9f48a355', 'Orbital Ltd', 'Deutsche Börse', 'UYE', 'CHN0TZHY84P5', 'http://www.orbitalltd.com');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('5afe07a1-b206-4000-be37-33f6831208c3', 'Zorg Industries', 'Deutsche Börse', 'KWV', 'AUWNCUP1EZR1', 'http://www.zorgindustries.io');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('d035f4c9-fdac-4d47-907a-42848234e006', 'Celestix', 'Tokyo Stock Exchange', 'OHXQ', 'CA7IVC62A780', 'http://www.celestix.org');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('e83a1e70-e78c-4d7d-a208-edccbacf3ad4', 'OmniCorp', 'Tokyo Stock Exchange', 'PKV', 'CH2JR12LZMQ1', 'http://www.omnicorp.org');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('bc498862-afec-47c8-9e2c-0533814f1b42', 'Black Mesa', 'NYSE', 'PJMS', 'DENM75MPSS16', 'http://www.blackmesa.org');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('f09c7f80-45f4-47c3-8299-923932930d0c', 'Bluth Company', 'Deutsche Börse', 'GYV', 'GBQQLGKF5FD9', 'http://www.bluthcompany.com');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('c1c6da53-c5f8-439c-8b25-018bc999711b', 'Sterling Cooper', 'HKEX', 'EKBLH', 'CAD355ILKJD4', 'http://www.sterlingcooper.io');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('7c665ae9-1e0d-4258-b094-3fc5ab4b6e7a', 'Gekko & Co', 'LSE', 'NFP', 'IE1NPX4P6T44', 'http://www.gekko&co.net');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('d2afcf26-7150-4854-85ea-acefc47bed3a', 'Cyberdyne Systems', 'Euronext', 'GJBHB', 'CAWC5Y05PJ38', 'http://www.cyberdynesystems.io');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('fec2c0da-9996-4f5f-a5a3-d3f3a2363743', 'RadialX', 'LSE', 'AMBJV', 'NL1UTZFH6RQ0', 'http://www.radialx.org');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('7d751148-59b0-4665-a439-438297855991', 'Helix Corp', 'TSE', 'IJOUM', 'CHFIE9A6SEV2', 'http://www.helixcorp.com');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('df1a4fdc-8b86-42ab-be76-6abf96b17828', 'Cogs Inc', 'TSE', 'KKH', 'AU0PXZ313KE1', 'http://www.cogsinc.com');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('9dd4e5d2-a1e4-47da-ae9a-2620682fa26b', 'Virtucon', 'LSE', 'NRNR', 'NLN36L1IZ6J0', 'http://www.virtucon.io');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('50c7a94b-5ced-406f-8e70-0f14631be117', 'PulseCore', 'LSE', 'EGX', 'FRNONW3BINV5', 'http://www.pulsecore.org');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('3544c0f8-cb7f-4a1e-b582-9e91705c2479', 'Pied Piper', 'LSE', 'NRZ', 'CHPTH3A32CT0', 'http://www.piedpiper.org');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('54372731-e8e0-452c-a815-a6ddace9f8d1', 'FusionPoint', 'ASX', 'YCMJ', 'GB3RJDW8TQC0', 'http://www.fusionpoint.org');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('7b032df1-e94c-4e7e-94df-73d794e4f042', 'AstraNova', 'Euronext', 'HAH', 'USX7COIR3MZ5', 'http://www.astranova.io');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('45c0ef95-e8fa-43c0-868f-8b538da739cd', 'FutureTech', 'ASX', 'UGW', 'CAS7N6XNLO37', 'http://www.futuretech.net');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('d4a78de0-636b-45d2-9d48-cfad45d5eb9a', 'EchoWorks', 'TSE', 'WHPB', 'NL6GA6BD7OZ9', 'http://www.echoworks.net');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('c2786caa-d8d8-41b0-bc4e-83ab1c0089e4', 'Tyrell Corporation', 'Deutsche Börse', 'PUU', 'USRDCO4BPXT3', 'http://www.tyrellcorporation.net');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('5a6f1391-315d-4f35-ae91-900b774572c5', 'Vandelay Industries', 'ASX', 'SDQ', 'DEOLO2DF53C7', 'http://www.vandelayindustries.io');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('f6bc3e50-e899-48c0-99ca-6dbc7438ebba', 'LexCorp', 'NASDAQ', 'ULV', 'AU01XWDJR1A8', 'http://www.lexcorp.co');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('c535e57c-70a3-4415-a492-cb62c699ccb1', 'Initech', 'Euronext', 'KLOMP', 'CAYFW9Z2IXF6', 'http://www.initech.com');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('5812f101-4010-4572-8147-bde7fa37cfc8', 'Rich Industries', 'NYSE', 'RQOMU', 'AUQG903Z1RE4', 'http://www.richindustries.com');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('6f2f4028-1c4b-4a8d-9a74-aa2dd48440d8', 'NeoTech Systems', 'NYSE', 'UBB', 'JPX9QP4X3WG2', 'http://www.neotechsystems.io');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('94e28d30-3834-47b3-aa86-e1dbd87e9469', 'Aperture Science', 'Euronext', 'CIM', 'GB389DLE42U3', 'http://www.aperturescience.com');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('fe6a7066-478f-4ff5-8c17-7e2f5d788112', 'Zephyr Inc', 'ASX', 'MIHCX', 'CAMS8H4GLA85', 'http://www.zephyrinc.net');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('1351101b-a894-4f88-bf55-963af42d10f4', 'Vertex Solutions', 'ASX', 'QIII', 'CAPFVB7ZHV51', 'http://www.vertexsolutions.org');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('0b7b9f4a-6587-4f72-b5c5-a48541dda683', 'Monsters Inc.', 'LSE', 'YOCXF', 'AU01F7FCALY1', 'http://www.monstersinc..com');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('547c62e4-3694-40a8-a30b-02c7f4810703', 'Dunder Mifflin', 'HKEX', 'VOCF', 'CAE1H2GDDY38', 'http://www.dundermifflin.co');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('d81610ee-062e-4350-9a82-d2d48a6a0410', 'Vortex Group', 'Euronext', 'HNV', 'CH390SUQNFC1', 'http://www.vortexgroup.io');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('770c5e75-a8df-4a1b-bc0d-96d9b62ee0cf', 'Echelon Dynamics', 'Deutsche Börse', 'XOCK', 'IEQLF31Q7862', 'http://www.echelondynamics.io');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('05d350bb-17a3-42bb-8a25-fead43f4886b', 'Prestige WorldwIde', 'NYSE', 'KTE', 'CAIJLB1M0NE9', 'http://www.prestigeworldwIde.net');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('a2e2a346-e9c0-496a-bd1f-09febcee1b1c', 'Everbyte', 'LSE', 'AZPE', 'NLZ4TNFXAWO4', 'http://www.everbyte.org');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('067c5f16-18dc-4b20-b222-10d2d831a6ec', 'Duff Beer', 'HKEX', 'UQKN', 'DE4CUXW1U749', 'http://www.duffbeer.io');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('8302f387-20e0-45ef-ada0-a0a7860a32d2', 'Wonka Industries', 'TSE', 'XUZ', 'NLM6G5C3Y9S8', 'http://www.wonkaindustries.co');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('6c4945fc-6f09-4844-9640-1f942db7fe9f', 'NovaTek', 'HKEX', 'SDZ', 'AUALK6BAZG52', 'http://www.novatek.co');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('68fd55b3-ecc6-457d-a369-13d0bbfd59ed', 'Gringotts Bank', 'Tokyo Stock Exchange', 'VWOIV', 'GBQELWYIJ912', 'http://www.gringottsbank.io');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('58fd85f1-346b-4044-bae7-ad4323c501bd', 'Vanta Ltd', 'NYSE', 'PZIJR', 'CHO0PAM9NAL3', 'http://www.vantaltd.net');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('a4a5b538-ee88-43ba-bbf7-094a742b9e75', 'Parallax Corp', 'Deutsche Börse', 'JWPAH', 'JPW4W2V2RTF5', 'http://www.parallaxcorp.com');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('a8e1a71f-62c3-4820-8005-c9b7a19d8270', 'Acme Corp', 'Tokyo Stock Exchange', 'XLWF', 'NL4GXSO510A0', 'http://www.acmecorp.com');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('c215981f-a7dc-4629-a2eb-a8913d5d7650', 'Massive Dynamic', 'NASDAQ', 'MJNE', 'GB1PVRVKW4A7', 'http://www.massivedynamic.com');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('547f175a-73f9-44dd-8d51-f4bb90e96c5b', 'Hooli', 'Tokyo Stock Exchange', 'PXK', 'JPZC6EWB3KF8', 'http://www.hooli.com');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('85e7b729-547a-415e-b842-3ba76dcd22b3', 'Nimbus Co', 'NYSE', 'DRH', 'CHE2MWUIZGU5', 'http://www.nimbusco.org');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('315a1454-4ee3-4c7b-928f-bfa8dca12fb5', 'Globex Corporation', 'LSE', 'GOU', 'DE0TWUBJC8Z4', 'http://www.globexcorporation.org');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('5042ebf1-2e96-4e43-8e49-aa3d59058b79', 'Ignite Labs', 'HKEX', 'UHTBN', 'DEFTVK3H1HI7', 'http://www.ignitelabs.org');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('aba3f3a2-4b1b-44b3-93f4-a9c22daf2fad', 'Stormax', 'ASX', 'GDWQ', 'CH3VK07TIW48', 'http://www.stormax.net');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('0a56973f-7090-458e-bdd1-d40207253c45', 'Umbrella Corp', 'Deutsche Börse', 'QUUB', 'USX06BIUQCH8', 'http://www.umbrellacorp.org');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('31c70048-7b38-4bfe-989d-e3cf3fd833f5', 'Skyline Motors', 'HKEX', 'THKYL', 'NLEKQTWS0TK1', 'http://www.skylinemotors.com');
INSERT INTO company (Id, Name, Exchange, Ticker, Isin, Website) VALUES ('bda68e09-4959-4794-972e-0ab3e8606a1f', 'Crux Systems', 'Euronext', 'MOSW', 'FREEXU2VFER4', 'http://www.cruxsystems.net');

