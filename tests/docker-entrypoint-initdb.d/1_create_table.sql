create database in_system;
\c in_system
create schema nfc;


CREATE SEQUENCE seq_user;
CREATE SEQUENCE seq_company;
CREATE SEQUENCE seq_engineer;		


-- -- タグ読み込み履歴
create table tag_read_history (
  history_no integer not null
  , menu_no integer
  , tag_id varchar(200)
  , created_id varchar(100)
  , updated_id varchar(100)
  , created_at timestamp default NOW()
  , updated_at timestamp default NOW()
  , constraint tag_read_history_PKC primary key (history_no)
) ;


-- タグリスト
create table nfc.tag_list (
  tag_id integer not null
  , place_id varchar(100)
  , created_id varchar(100)
  , updated_id varchar(100)
  , created_at timestamp default NOW()
  , updated_at timestamp default NOW()
  , constraint tag_list_PKC primary key (tag_id)
) ;


-- NFCメニュー画面
create table nfc.menu (
  menu_no integer not null
  , type varchar(2)
  , sort integer default 0
  , name varchar(50)
  , value varchar(100)
  , innerhtml text
  , created_id varchar(100)
  , updated_id varchar(100)
  , created_at timestamp default NOW()
  , updated_at timestamp default NOW()
  , constraint menu_PKC primary key (menu_no)
) ;


-- 受注明細
create table juchu_meisai (
  juchu_id integer not null
  , rireki_no integer not null
  , meisai_no integer not null
  , engineer_id integer
  , sagyou_start_date timestamp
  , sagyou_end_date timestamp
  , kousuu integer
  , kihon_getsugaku integer
  , shiharai_kingaku integer
  , gengaku_tanka integer
  , chouka_tanka integer
  , bikou varchar
  , status char(1) default '0' not null
  , created_id varchar(100)
  , updated_id varchar(100)
  , created_at timestamp default NOW()
  , updated_at timestamp default NOW()
  , constraint juchu_meisai_PKC primary key (juchu_id,rireki_no,meisai_no)
) ;


-- 提案
create table teian_meisai (
  teian_id integer not null
  , meisai_no integer not null
  , engineer_id integer not null
  , subject varchar(200)
  , message text
  , name1 varchar(100) not null
  , name2 varchar(100)
  , kana1 varchar(100) not null
  , kana2 varchar(100)
  , initial varchar(5)
  , birthdate varchar(200)
  , email varchar(200)
  , gender varchar(1)
  , station varchar(100)
  , tankin varchar(100)
  , kadou_tsuki varchar(100)
  , eigyo varchar(100)
  , shozoku_code varchar(1) not null
  , shozoku_memo text
  , eigyo_memo text
  , created_id varchar(100)
  , updated_id varchar(100)
  , created_at timestamp default NOW()
  , updated_at timestamp default NOW()
  , constraint teian_meisai_PKC primary key (teian_id,meisai_no)
) ;


-- 受注
create table juchu (
  juchu_id integer not null
  , rireki_no integer not null
  , juchu_no varchar(100) not null
  , juchu_date timestamp
  , o_juchu_id integer
  , o_rireki_no integer
  , company_id integer not null
  , kenmei varchar(100)
  , shiharai_site integer
  , shiharai_site_memo varchar(100)
  , keiyaku_type varchar(10)
  , nounyu_bukken varchar(100)
  , nounyu_kijitsu timestamp
  , nounyu_basho varchar(100)
  , kenshu_houhou varchar(100)
  , shiharai_jouken varchar(100)
  , tousha_sekininsha varchar(20)
  , kisha_tantousha varchar(20)
  , chiteki_zaisanken varchar(100)
  , shiharaigaku_santei varchar(20)
  , kijun_jikan varchar(50)
  , jikan_tanka_santei varchar(100)
  , goukei integer
  , bikou varchar
  , tokki_jikou varchar
  , status char(1) default '0' not null
  , created_id varchar(100)
  , updated_id varchar(100)
  , created_at timestamp default NOW()
  , updated_at timestamp default NOW()
  , constraint juchu_PKC primary key (juchu_id,rireki_no)
) ;


-- 請求明細
create table seikyu_detail (
  seikyu_detail_id integer not null
  , seikyu_id integer not null
  , rireki_no integer not null
  , engineer_id integer
  , total_kadou_jikan integer
  , kijungai_kadou_jikan integer
  , kijun_gaku integer
  , kijungai_gaku integer
  , goukei integer
  , koutsuhi integer
  , bikou varchar
  , status char(1) default '0' not null
  , created_id varchar(100)
  , updated_id varchar(100)
  , created_at timestamp default NOW()
  , updated_at timestamp default NOW()
  , constraint seikyu_detail_PKC primary key (seikyu_detail_id,seikyu_id,rireki_no)
) ;


-- 請求
create table seikyu (
  seikyu_id integer not null
  , rireki_no integer not null
  , seikyu_no varchar(100) not null
  , seikyu_date timestamp
  , company_id integer
  , seikyu_kingaku integer
  , furikomi_kijitsu timestamp
  , moto_yuubin_no varchar(20)
  , moto_address varchar(100)
  , moto_company_name varchar(100)
  , moto_phone_no varchar(20)
  , moto_fax_no varchar(20)
  , kenmei varchar(100)
  , shoukei integer
  , koutsuhi integer
  , shouhizei integer
  , goukei integer
  , furikomi_bank_name varchar(100)
  , furikomi_shiten_name varchar(100)
  , furikomi_kouza_shubetsu varchar(20)
  , furikomi_kouza_no varchar(20)
  , furikomi_kouza_meigi varchar(100)
  , bikou varchar
  , status char(1) default '0' not null
  , created_id varchar(100)
  , updated_id varchar(100)
  , created_at timestamp default NOW()
  , updated_at timestamp default NOW()
  , constraint seikyu_PKC primary key (seikyu_id,rireki_no)
) ;


-- 顧客案件
create table company_anken (
  anken_id integer not null
  , teian_id integer not null
  , company_id integer not null
  , anken_naiyou text
  , tankin varchar(100)
  , kadou_tsuki varchar(100)
  , created_id varchar(100)
  , updated_id varchar(100)
  , created_at timestamp default NOW()
  , updated_at timestamp default NOW()
  , constraint company_anken_PKC primary key (anken_id)
) ;



-- -- ユーザ権限
create table user_grant (
  user_id varchar(100) not null
  , grant_id varchar(1) not null
  , grant_code varchar(1) not null
  , created_id varchar(100)
  , updated_id varchar(100)
  , created_at timestamp default NOW()
  , updated_at timestamp default NOW()
  , constraint user_grant_PKC primary key (user_id,grant_id)
) ;



-- 機能権限
create table exec_grant (
  grant_id varchar(6) default '0' not null
  , grant_name varchar(100) not null
  , status char(1) default '0' not null
  , created_id varchar(100)
  , updated_id varchar(100)
  , created_at timestamp default NOW()
  , updated_at timestamp default NOW()
  , constraint exec_grant_PKC primary key (grant_id)
) ;



-- 提案
create table teian (
  teian_id integer not null
  , eigyo_memo text
  , created_id varchar(100)
  , updated_id varchar(100)
  , created_at timestamp default NOW()
  , updated_at timestamp default NOW()
  , constraint teian_PKC primary key (teian_id)
) ;



-- 提案履歴
create table teian_history (
  teian_id integer not null
  , company_id integer not null
  , eigyo_id integer not null
  , memo text
  , result varchar(1)
  , error text
  , created_id varchar(100)
  , updated_id varchar(100)
  , created_at timestamp default NOW()
  , updated_at timestamp default NOW()
  , constraint teian_history_PKC primary key (teian_id,company_id,eigyo_id)
) ;



-- 提案NG
create table entry_ng (
  company_id integer not null
  , engineer_id integer not null
  , memo text
  , status char(1) default '0' not null
  , created_id varchar(100)
  , updated_id varchar(100)
  , created_at timestamp default NOW()
  , updated_at timestamp default NOW()
  , constraint entry_ng_PKC primary key (company_id,engineer_id)
) ;



-- メール送信先リスト
create table mail_send_list (
  send_id integer default '0' not null
  , atesaki varchar(6) not null
  , address varchar(200) not null
  , status char(1) default '0' not null
  , created_id varchar(100)
  , updated_id varchar(100)
  , created_at timestamp default NOW()
  , updated_at timestamp default NOW()
  , constraint mail_send_list_PKC primary key (send_id)
) ;



-- エンジニアスキル管理
create table engineer_skill (
  engineer_id integer not null
  , skill_id integer not null
  , category varchar(4)
  , skill_code varchar(4)
  , skill_level varchar(4)
  , skill_tsuki integer
  , skill_memo text
  , status char(1) default '0' not null
  , created_id varchar(100)
  , updated_id varchar(100)
  , created_at timestamp default NOW()
  , updated_at timestamp default NOW()
  , constraint engineer_skill_PKC primary key (engineer_id,skill_id)
) ;


-- エンジニア管理
create table engineer (
  engineer_id integer not null
  , name1 varchar(100) not null
  , name2 varchar(100)
  , kana1 varchar(100) not null
  , kana2 varchar(100)
  , initial varchar(5)
  , birthdate varchar(200)
  , email varchar(200)
  , gender varchar(1)
  , station varchar(100)
  , tankin varchar(100)
  , kadou_tsuki varchar(100)
  , eigyo varchar(100)
  , shozoku_code varchar(1) not null
  , shozoku_memo text
  , eigyo_memo text
  , status char(1) default '0' not null
  , created_id varchar(100)
  , updated_id varchar(100)
  , created_at timestamp default NOW()
  , updated_at timestamp default NOW()
  , constraint engineer_PKC primary key (engineer_id)
) ;


-- 名称管理
create table item (
  item varchar(6) default '0' not null
  , key varchar(100) not null
  , value varchar(100)
  , sort int default 0
  , free jsonb not null
  , status char(1) default '0' not null
  , created_id varchar(100)
  , updated_id varchar(100)
  , created_at timestamp default NOW()
  , updated_at timestamp default NOW()
  , constraint item_PKC primary key (item,key)
) ;



-- 顧客営業
create table eigyo (
  company_id integer not null
  , eigyo_id integer not null
  , eigyo_code char(1) default '0'
  , name1 varchar(100) not null
  , name2 varchar(100)
  , kana1 varchar(100) not null
  , kana2 varchar(100)
  , email varchar(20)
  , phone varchar(20)
  , gaihyo text
  , anken char(1) default '0'
  , jinzai char(1) default '0'
  , status char(1) default '0' not null
  , created_id varchar(100)
  , updated_id varchar(100)
  , created_at timestamp default NOW()
  , updated_at timestamp default NOW()
  , constraint eigyo_PKC primary key (company_id,eigyo_id)
) ;



-- 顧客概評履歴
create table NEW_ENTITY1 (
  company_id integer not null
  , gaihyo_id integer not null
  , hyouka varchar(2)
  , gaihyo text
  , status char(1) default '0' not null
  , created_id varchar(100)
  , updated_id varchar(100)
  , created_at timestamp default NOW()
  , updated_at timestamp default NOW()
  , constraint NEW_ENTITY1_PKC primary key (company_id,gaihyo_id)
) ;



-- ログインユーザ
create table users (
  user_id varchar(100) not null
  , name varchar(100) not null
  , mail varchar(100) not null
  , password varchar(200) not null
  , remenber_token varchar(200)
  , init_flag varchar(1)
  , lock_flag varchar(1)
  , dummy_password varchar(200)
  , status varchar(1) not null
  , created_id varchar(100)
  , updated_id varchar(100)
  , created_at timestamp default NOW()
  , updated_at timestamp default NOW()
  , constraint users_PKC primary key (user_id)
) ;


-- 顧客
create table company (
  company_id integer not null
  , company_name varchar(100) not null
  , company_kana varchar(100)
  , company_ryaku varchar(100)
  , address varchar(200)
  , tel varchar(20)
  , fax varchar(20)
  , web varchar(200)
  , haken varchar(20)
  , hyouka varchar(2)
  , gaihyo text
  , mail varchar(100) not null
  , status char(1) default '0' not null
  , created_id varchar(100)
  , updated_id varchar(100)
  , created_at timestamp default NOW()
  , updated_at timestamp default NOW()
  , constraint company_PKC primary key (company_id)
) ;


-- 初期データ
insert into users(user_id, name, mail, password, init_flag, lock_flag, status) values('82', 'paiza', 'r.suzuki@offgrid.co.jp', 'pbkdf2:sha256:260000$LJycIHSaEItvnwbz$73625cb4c05b95a88137a4cda74d5c94bec49ba56f68191bc0c07842b7b986e3', '1', '0', '0');
insert into user_grant(user_id, grant_id, grant_code) values('82', '101', '2');
insert into user_grant(user_id, grant_id, grant_code) values('82', '102', '2');
insert into user_grant(user_id, grant_id, grant_code) values('82', '103', '2');
insert into user_grant(user_id, grant_id, grant_code) values('82', '201', '3');
insert into user_grant(user_id, grant_id, grant_code) values('82', '202', '3');
insert into user_grant(user_id, grant_id, grant_code) values('82', '203', '3');
insert into user_grant(user_id, grant_id, grant_code) values('82', '204', '3');