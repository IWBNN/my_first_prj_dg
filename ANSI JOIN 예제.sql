create table board_user
(
    id        int auto_increment primary key,
    user_name VARCHAR(20) not null,
    location  varchar(10) not null
);
select *
from board_user;
create table post
(
    id            int auto_increment primary key,
    board_user_id int,
    posted_at     datetime default now(),
    content       varchar(255)
);
select *
from post;

insert into board_user (user_name, location)
VALUES ('sorbet0231', '서울'),
       ('landia92', '서울'),
       ('sungwoo7180', '울산'),
       ('msak1234', '런던'),
       ('yeup1022', '로마'),
       ('nucon84', '로마');
insert into post (board_user_id, content)
values (1, '안녕하세요 방갑습니다.'),
       (2, '저는 2번 유저입니다.'),
       (3, '일기입니다.'),
       (4, '방명록입니다.'),
       (5, '이것은 오늘 아침 뉴스 요약입니다.'),
       (2, '오늘의 날씨 안내합니다.'),
       (4, '오늘의 교통 정보입니다.'),
       (5, '즐거운 주말 보내세요.'),
       (1, '아직 화요일입니다.'),
       (2, '곧 개강입니다.');
select *
from post;

select *
from board_user
         INNER join post p
                    on board_user.id = p.board_user_id;

select *
from board_user
         left join post p
                   on board_user.id = p.board_user_id;

insert into post (board_user_id, content)
values (10, '안녕하세요 반갑습니다. 10번입니다'),
       (15, '저는 15번 유저입니다.');

select *
from board_user
right join post p
on board_user.id = p.board_user_id;

-- mysql 에서는 full outer join 지원 안함
-- union 집합연산을 사용해서 full outer join 구현 가능

-- NATURAL JOIN
-- 동일한 목적의 테이블인데, 컬럼 구성이 다소 다른 테이블

create table private_info1
(
    id   int primary key auto_increment,
    name varchar(20),
    age  int
    -- 등등~~
);
create table private_info2
(
    id      int primary key auto_increment,
    name    varchar(20),
    address varchar(50)
);
insert into private_info1 (name, age)
values ('user1', 10),
       ('user2', 11),
       ('user3', 12),
       ('user4', 15),
       ('user5', 20),
       ('user6', 21),
       ('user7', 30),
       ('user8', 35),
       ('user9', 50),
       ('user10', 99);
insert into private_info2 (name, address)
VALUES ('user1', 'my home'),
       ('user2', 'my office'),
       ('user3', 'my hotel'),
       ('user4', 'my apartment'),
       ('user5', 'my yard'),
       ('user6', 'my sky'),
       ('user7', 'my seoul'),
       ('user8', 'my back ground'),
       ('user9', 'my playground'),
       ('user10', 'nowhere');

select *
from private_info1
         natural join private_info2;

create table private_info3
(
    id                   int primary key auto_increment,
    name                 varchar(20),
    insurance_registered boolean
);

insert into private_info3 (name, insurance_registered)
values ('user1', TRUE),
       ('user10', FALSE),
       ('user2', TRUE),
       ('user3', TRUE),
       ('user4', TRUE),
       ('user5', TRUE),
       ('user6', FALSE),
       ('user7', FALSE),
       ('user8', FALSE),
       ('user9', FALSE);

select * from private_info1 as p1
inner join private_info3 as p3
using (name);

create table device (
    device_name varchar(20),
    disk_size int
);

create table color_option (
    color_name varchar(10)
);

insert into device values
    ('Galaxy S24', 1024),
    ('Galaxy S24', 512),
    ('Galaxy S24', 256),
    ('iPhone 15', 1024),
    ('iPhone 15', 512),
    ('iPhone 15', 256);
insert into color_option values
    ('black'),
    ('blue'),
    ('white');

select *
from device
cross join color_option;

create table staff (
    id int primary key auto_increment,
    name varchar(20),
    job varchar(20),
    salary int,
    supervisor_id int -- self join key
);

insert into staff (name, job, salary, supervisor_id) values
    ('staff1', '백엔드', 8500, null),
    ('staff2', '인프라', 7500, null),
    ('staff3', '보안', 7000, 1),
    ('staff4', '프론트', 7200, 1),
    ('staff5', '데이터분석가', 8500, 2),
    ('staff6', '데이터엔지니어', 8000, 2),
    ('staff7', '데브옵스', 7800, 2),
    ('staff8', '유지보수', 6800, 10),
    ('staff9', 'QA', 6500, 10),
    ('staff10', 'PM', 7000, null);

select s1.id, s1.name, s1.supervisor_id, s2.name
FROM staff s1
         inner join staff s2
                   on s1.supervisor_id = s2.id;

select s1.id, s1.name, s1.supervisor_id, s2.name
FROM staff s1
left join staff s2
on s1.supervisor_id = s2.id;

# select s1.id, s1.name, s1.supervisor_id, s2.name supervisor.name
# FROM staff s1
#          right join staff s2
#                     on s1.supervisor_id = s2.id;

