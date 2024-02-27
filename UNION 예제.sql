create table cat
(
    name  varchar(20),
    age   int,
    owner varchar(20),
    type  varchar(20)
);

create table dog
(
    name  varchar(20),
    age   int,
    owner varchar(20),
    type  varchar(20)
);
insert into cat
values ('도리', 3, 'SU', 'black cat'),
       ('코코로', 4, 'SU real gate', 'ramen store cat');

insert into dog
values ('dog1', 1, 'no master', 'jindo'),
       ('dog2', 2, 'recently born', 'shiva');

select *
from cat
union
select *
from dog;

create table animal
(
    name  varchar(20),
    age   int,
    owner varchar(20),
    type  varchar(20)
);

insert into animal
values ('도리', 3, 'SU', 'black cat'),
       ('코코로', 4, 'SU real gate', 'ramen store cat'),
       ('dog1', 1, 'no master', 'jindo'),
       ('dog2', 2, 'recently born', 'shiva');

select *
from cat
union
select *
from dog
union all
select *
from animal;

select *
from board_user
left join post p
on board_user.id = p.board_user_id
union
select *
from board_user
right join post p
on board_user.id = p.board_user_id;