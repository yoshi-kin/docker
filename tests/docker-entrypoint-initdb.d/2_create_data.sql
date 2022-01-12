-- 初期データ
insert into users(user_id, name, mail, password, init_flag, lock_flag, status) values('82', 'paiza', 'r.suzuki@offgrid.co.jp', 'pbkdf2:sha256:260000$LJycIHSaEItvnwbz$73625cb4c05b95a88137a4cda74d5c94bec49ba56f68191bc0c07842b7b986e3', '1', '0', '0');
insert into user_grant(user_id, grant_id, grant_code) values('82', '101', '2');
insert into user_grant(user_id, grant_id, grant_code) values('82', '102', '2');
insert into user_grant(user_id, grant_id, grant_code) values('82', '103', '2');
insert into user_grant(user_id, grant_id, grant_code) values('82', '201', '3');
insert into user_grant(user_id, grant_id, grant_code) values('82', '202', '3');
insert into user_grant(user_id, grant_id, grant_code) values('82', '203', '3');
insert into user_grant(user_id, grant_id, grant_code) values('82', '204', '3');