SHOW USER;
-- USER이(가) "SYS"입니다.

CREATE USER jspbegin_user IDENTIFIED BY cclass;
-- User JSPBEGIN_USER이(가) 생성되었습니다.

GRANT CONNECT, RESOURCE, CREATE VIEW, UNLIMITED TABLESPACE TO jspbegin_user;
-- Grant을(를) 성공했습니다.

SHOW USER;
-- USER이(가) "JSPBEGIN_USER"입니다.

drop table tbl_person_interest purge; 
CREATE TABLE tbl_person_interest (
    seq     NUMBER
   ,name    VARCHAR2(20)
   ,school  VARCHAR2(20)
   ,color   VARCHAR2(20)
   ,food    VARCHAR2(80)
   ,registerday DATE DEFAULT sysdate
   ,CONSTRAINT PK_tbl_person_interest PRIMARY KEY(seq)
);

drop sequence person_seq;

CREATE SEQUENCE person_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE;
-- Sequence PERSON_SEQ이(가) 생성되었습니다.


SELECT seq, name, school, color, food, to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS registerday 
FROM tbl_person_interest
ORDER BY seq;

String sql = "SELECT seq, name, school, color, food, to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS registerday\n"+
"FROM tbl_person_interest\n"+
"ORDER BY seq";
-- java용 sql 

SELECT * FROM TAB;

UPDATE tbl_person_interest SET name=?, school=?, color=?, food=?
WHERE seq=?;

String sql = "UPDATE tbl_person_interest SET name=?, school=?, color=?, food=?\n"+
"WHERE seq=?";
-- java용 sql 







