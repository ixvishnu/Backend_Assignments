create table warehouses (
    warehouse_id int not null identity(1,1),
    w_name varchar(120) not null,
    address varchar(max) not null,
    city varchar(80) not null,
    total_capacity int not null,
    status varchar(10) not null default 'active',
    created_at datetime not null default getdate(),

    constraint pk_warehouses primary key (warehouse_id),
    constraint chk_capacity check (total_capacity > 0),
    constraint chk_warehouse_status check (status in ('active','inactive'))
);

create table zones (
    zone_id int not null identity(1,1),
    warehouse_id int not null,
    zone_code varchar(20) not null,
    z_name varchar(100) not null,

    constraint pk_zones primary key (zone_id),
    constraint fk_zones_wh foreign key (warehouse_id) references warehouses(warehouse_id),
    constraint uq_zone_code unique (warehouse_id, zone_code)
);

create table racks (
    rack_id int not null identity(1,1),
    zone_id int not null,
    rack_code varchar(20) not null,

    constraint pk_racks primary key (rack_id),
    constraint fk_racks_zone foreign key (zone_id) references zones(zone_id),
    constraint uq_rack_code unique (zone_id, rack_code)
);

create table bins (
    bin_id int not null identity(1,1),
    rack_id int not null,
    bin_code varchar(20) not null,
    max_capacity int not null,

    constraint pk_bins primary key (bin_id),
    constraint fk_bins_rack foreign key (rack_id) references racks(rack_id),
    constraint uq_bin_code unique (rack_id, bin_code),
    constraint chk_bin_capacity check (max_capacity > 0)
);

create table users (
    user_id int not null identity(1,1),
    usr_name varchar(100) not null,
    role varchar(60) not null,
    email varchar(150) not null,
    created_at datetime not null default getdate(),

    constraint pk_users primary key (user_id),
    constraint uq_users_email unique (email)
);

create table shipments (
    shipment_id int not null identity(1,1),
    reference_code varchar(60) not null,
    description varchar(max),
    created_at datetime not null default getdate(),

    constraint pk_shipments primary key (shipment_id),
    constraint uq_reference_code unique (reference_code)
);

create table shipment_bin_allocations (
    allocation_id int not null identity(1,1),
    shipment_id int not null,
    bin_id int not null,
    allocated_at datetime not null default getdate(),
    is_active bit not null default 1,

    constraint pk_allocations primary key (allocation_id),
    constraint fk_alloc_shipment foreign key (shipment_id) references shipments(shipment_id),
    constraint fk_alloc_bin foreign key (bin_id) references bins(bin_id)
);

create table stock_movements (
    movement_id int not null identity(1,1),
    shipment_id int not null,
    bin_id int not null,
    performed_by int not null,
    movement_type varchar(3) not null,
    quantity int not null,
    reason varchar(100),
    moved_at datetime not null default getdate(),

    constraint pk_movements primary key (movement_id),
    constraint fk_mov_shipment foreign key (shipment_id) references shipments(shipment_id),
    constraint fk_mov_bin foreign key (bin_id) references bins(bin_id),
    constraint fk_mov_user foreign key (performed_by) references users(user_id),
    constraint chk_movement_type check (movement_type in ('IN','OUT')),
    constraint chk_quantity check (quantity > 0)
);

create table warehouse_transfers (
    transfer_id int not null identity(1,1),
    shipment_id int not null,
    from_warehouse_id int not null,
    to_warehouse_id int not null,
    transfer_date datetime not null default getdate(),
    status varchar(15) not null default 'in_transit',
    notes varchar(max),

    constraint pk_transfers primary key (transfer_id),
    constraint fk_tr_shipment foreign key (shipment_id) references shipments(shipment_id),
    constraint fk_tr_from_wh foreign key (from_warehouse_id) references warehouses(warehouse_id),
    constraint fk_tr_to_wh foreign key (to_warehouse_id) references warehouses(warehouse_id),
    constraint chk_transfer_status check (status in ('in_transit','completed','cancelled')),
    constraint chk_diff_warehouse check (from_warehouse_id <> to_warehouse_id)
);

select * from warehouses;
select * from zones;
select * from racks;
select * from bins;
select * from users;
select * from shipments;
select * from shipment_bin_allocations;
select * from stock_movements;
select * from warehouse_transfers;

insert into warehouses(w_name, address, city, total_capacity, status)
values
('hyderabad warehouse', '12 nacharam industrial area', 'hyderabad', 500, 'active'),
('bangalore hub', '45 peenya phase 2', 'bangalore', 300, 'active'),
('chennai warehouse', '88 ambattur estate', 'chennai', 400, 'active'),
('pune hub', '23 bhosari midc', 'pune', 250, 'inactive'),
('mumbai warehouse', '7 dharavi link road', 'mumbai', 600, 'active'),
('delhi warehouse', '5 okhla phase 1', 'delhi', 450, 'active'),
('kolkata hub', '99 salt lake sector 5', 'kolkata', 380, 'inactive'),
('ahmedabad hub', '34 naroda industrial estate', 'ahmedabad', 320, 'active'),
('jaipur warehouse', '16 sitapura industrial area', 'jaipur', 270, 'active'),
('lucknow hub', '8 amausi industrial area', 'lucknow', 290, 'active');

select * from warehouses;


insert into zones(warehouse_id, zone_code, z_name)
values
(1, 'A', 'electronics'),
(1, 'B', 'clothing'),
(1, 'C', 'footwear'),
(2, 'A', 'furniture'),
(2, 'B', 'appliances'),
(3, 'A', 'Fresh Items'),
(3, 'B', 'dry goods'),
(4, 'A', 'bulk storage'),
(5, 'A', 'automotive parts'),
(6, 'A', 'stationery');

select * from zones;


insert into racks(zone_id, rack_code)
values
(1, 'R1'),
(1, 'R2'),
(2, 'R1'),
(2, 'R2'),
(3, 'R1'),
(4, 'R1'),
(5, 'R1'),
(6, 'R1'),
(7, 'R1'),
(8, 'R1');

select * from racks;


insert into bins(rack_id, bin_code, max_capacity)
values
(1, 'B01', 100),
(1, 'B02', 150),
(2, 'B01', 200),
(3, 'B01', 80),
(4, 'B01', 120),
(5, 'B01', 90),
(6, 'B01', 110),
(7, 'B01', 95),
(8, 'B01', 130),
(9, 'B01', 75);

select * from bins;


insert into users(usr_name, role, email)
values
('ravi kumar', 'warehouse manager', 'ravi.kumar@gmail.com'),
('sneha reddy', 'picker', 'sneha.reddy@gmail.com'),
('arjun nair', 'supervisor', 'arjun.nair@gmail.com'),
('pooja mehta', 'picker', 'pooja.mehta@gmail.com'),
('vikram rao', 'admin', 'vikram.rao@gmail.com'),
('anita sharma', 'picker', 'anita.sharma@gmail.com'),
('rahul verma', 'supervisor', 'rahul.verma@gmail.com'),
('priya iyer', 'picker', 'priya.iyer@gmail.com'),
('amit patel', 'warehouse manager', 'amit.patel@gmail.com'),
('kavitha nair', 'admin', 'kavitha.nair@gmail.com');

select * from users;


insert into shipments(reference_code, description)
values
('SHP-2026-001', 'samsung galaxy s24 batch'),
('SHP-2026-002', 'nike shoes summer collection'),
('SHP-2026-003', 'lg refrigerators'),
('SHP-2026-004', 'bosch washing machines'),
('SHP-2026-005', 'dell laptops q1 stock'),
('SHP-2026-006', 'hp printers office supply'),
('SHP-2026-007', 'asian paints drums'),
('SHP-2026-008', 'tata salt bulk order'),
('SHP-2026-009', 'amul dairy products'),
('SHP-2026-010', 'reliance jio routers batch');

insert into shipment_bin_allocations(shipment_id, bin_id, is_active)
values
(1, 2, 1),
(1, 3, 1),
(2, 4, 1),
(3, 5, 1),
(4, 6, 1),
(5, 7, 1),
(6, 8, 0),
(7, 9, 1),
(8, 10, 1),
(9, 11, 1);


select * from shipment_bin_allocations;

insert into stock_movements(shipment_id, bin_id, performed_by, movement_type, quantity, reason)
values
(1, 2, 1, 'IN', 200, 'inbound from samsung supplier'),
(1, 3, 2, 'IN', 300, 'overflow to second bin'),
(2, 4, 3, 'IN', 150, 'nike shoes received'),
(1, 2, 4, 'OUT', 50, 'dispatched to customer'),
(3, 5, 5, 'IN', 80, 'lg fridges inbound'),
(4, 6, 6, 'IN', 60, 'bosch machines received'),
(5, 7, 7, 'IN', 120, 'dell laptops inbound'),
(6, 8, 8, 'OUT', 30, 'hp printers dispatched'),
(7, 9, 9, 'IN', 200, 'asian paints drums received'),
(8, 2, 10, 'OUT', 100, 'tata salt dispatched to retail');

select * from stock_movements;


insert into warehouse_transfers(shipment_id, from_warehouse_id, to_warehouse_id, status, notes)
values
(1, 1, 2, 'completed', 'samsung phones moved to bangalore'),
(2, 2, 3, 'in_transit', 'nike shoes heading to chennai'),
(3, 3, 5, 'in_transit', 'lg fridges to mumbai'),
(4, 1, 4, 'completed', 'bosch machines moved to pune'),
(5, 5, 6, 'completed', 'dell laptops dispatched to delhi'),
(6, 6, 7, 'in_transit', 'hp printers going to kolkata'),
(7, 4, 8, 'cancelled', 'asian paints transfer cancelled'),
(8, 2, 9, 'completed', 'tata salt moved to jaipur'),
(9, 3, 10, 'in_transit', 'amul dairy to lucknow'),
(10, 1, 5, 'completed', 'jio routers to mumbai yard');

select * from warehouse_transfers;

select * from warehouses;
select * from zones;
select * from racks;
select * from bins;
select * from users;
select * from shipments;
select * from shipment_bin_allocations;
select * from stock_movements;
select * from warehouse_transfers;

/*List all warehouses along with the total number of shipments currently stored. 
List all bins in a warehouse along with their current occupancy. 
Find shipments that have moved between two warehouses. 
Retrieve shipments along with their last movement date and current bin location. 
List all shipments currently stored in inactive warehouses.*/

--Q1 List all warehouses along with the total number of shipments currently stored
select * from warehouses;
select * from zones;
select * from racks;
select * from bins;
select * from users;
select * from shipments;

select w.warehouse_id, w.w_name, count(distinct sp.shipment_id) as total_shipments
from warehouses w
join zones z on w.warehouse_id = z.warehouse_id
join racks r on z.zone_id = r.zone_id
join bins b on r.rack_id = b.rack_id
join shipment_bin_allocations sb on b.bin_id = sb.bin_id
join shipments sp on sb.shipment_id = sp.shipment_id
where sb.is_active = 1
group by w.warehouse_id, w.w_name;

--Q2 List all bins in a warehouse along with their current occupancy. 

select * from zones;
select * from racks;
select * from bins;
select * from users;
select * from shipments;
select * from shipment_bin_allocations;
select * from stock_movements;

select r.rack_id,b.bin_id, b.bin_code, b.max_capacity, 
sum(case when m.movement_type = 'IN' then m.quantity else 0 end) 
-
sum(case when m.movement_type = 'OUT' then m.quantity else 0 end) 
as current_occupied from  warehouses w
join zones z on w.warehouse_id = z.warehouse_id
join racks r on z.zone_id = r.zone_id
join bins b on r.rack_id = b.rack_id
join stock_movements m on b.bin_id = m.bin_id
group by r.rack_id,b.bin_id, b.bin_code, b.max_capacity;

--Q3 Find shipments that have moved between two warehouses. 

select * from shipments;
select * from warehouse_transfers;
select * from warehouses;

select sp.shipment_id, sp.reference_code, sp.description,
w1.w_name as from_warehouse,
w2.w_name as to_warehouse,
wt.transfer_date, wt.status
from shipments sp
join warehouse_transfers wt on sp.shipment_id = wt.shipment_id
join warehouses w1 on wt.from_warehouse_id = w1.warehouse_id
join warehouses w2 on wt.to_warehouse_id = w2.warehouse_id;

--Q4 Retrieve shipments along with their last movement date and current bin location. 

select * from warehouses;
select * from warehouse_transfers;

select * from shipments;
select * from shipment_bin_allocations;
select * from stock_movements;
select * from bins;

select sp.shipment_id,sp.reference_code,sb.bin_id as current_bin,b.bin_code, sp.description,max(m.moved_at) as last_move  from shipments sp
join shipment_bin_allocations sb on sp.shipment_id = sb.shipment_id
join stock_movements m on sb.shipment_id = m.shipment_id
join bins b on sb.bin_id = b.bin_id
where sb.is_active = 1
group by sp.shipment_id,sp.reference_code,sb.bin_id,b.bin_code,sp.description order by max(m.moved_at);

--Q5 List all shipments currently stored in inactive warehouses
select * from warehouses;
select * from zones;
select * from racks;
select * from bins;
select * from shipments;
select * from shipment_bin_allocations;

select sp.shipment_id, sp.reference_code, sp.description, w.w_name as warehouse_name, w.status
from warehouses w
join zones z on w.warehouse_id = z.warehouse_id
join racks r on z.zone_id = r.zone_id
join bins b on r.rack_id = b.rack_id
join shipment_bin_allocations sb on b.bin_id = sb.bin_id
join shipments sp on sb.shipment_id = sp.shipment_id
where w.status = 'inactive'
and sb.is_active = 1;

