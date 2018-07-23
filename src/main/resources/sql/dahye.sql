drop table rentals cascade constraints;

--ȸ�� ���̺�
CREATE TABLE member(
num NUMBER CONSTRAINT member_num_pk PRIMARY KEY,
id VARCHAR2(100) UNIQUE NOT NULL,
nickname VARCHAR2(100) UNIQUE NOT NULL,
password VARCHAR2(100) NOT NULL,
realname VARCHAR2(100) NOT NULL,
postnum VARCHAR2(10) NOT NULL,
address VARCHAR2(200) NOT NULL,
addressdetail VARCHAR2(100) NOT NULL,
email VARCHAR2(100) NOT NULL,
emaildomain VARCHAR2(100) NOT NULL,
phone VARCHAR2(15) NOT NULL,
registdate DATE NOT NULL
);

-- �ּҿ��� '��,��' ���̺�
CREATE TABLE sido(
num NUMBER CONSTRAINT sido_num_pk PRIMARY KEY,
name VARCHAR2(20) NOT NULL
);

-- �ּҿ��� '��,��,��' ���̺�
CREATE TABLE sigungugungu(
num NUMBER CONSTRAINT sigungugungu_num_pk PRIMARY KEY,
name VARCHAR2(20) NOT NULL,
sido NUMBER CONSTRAINT sigungugungu_sido_fk REFERENCES sido(num) NOT NULL
);

drop table rentals;
drop table sigungu;
drop table do;

-- ���� �뿩 ���̺�
CREATE TABLE rentals(
num NUMBER CONSTRAINT rentals_num_pk PRIMARY KEY,
member_num NUMBER CONSTRAINT rental_writer_fk REFERENCES member(num) NOT NULL,
writer VARCHAR(100) NOT NULL,
address varchar2(400) NOT NULL,
title varchar2(100) NOT NULL,
sido NUMBER CONSTRAINT rentals_sido_fk REFERENCES sido(num) NOT NULL,
sigungu NUMBER CONSTRAINT rentals_sigungu_fk REFERENCES sigungu(num) NOT NULL,
area number NOT NULL,
price NUMBER NOT NULL,
content VARCHAR2(4000) NOT NULL,
lat NUMBER,
lng NUMBER
);

drop table rentals;
drop table rentalfiles;
member_num NUMBER CONSTRAINT rental_writer_fk REFERENCES member(num) NOT NULL,

-- ���� ���̺�
CREATE TABLE rentalfiles(
num NUMBER CONSTRAINT rental_files_num_pk PRIMARY KEY,
board_num NUMBER CONSTRAINT rental_board_num REFERENCES rentals(num) NOT NULL,			-- �� ���̺��� �Խñ� ��ȣ
filename1 VARCHAR2(200) NOT NULL,
filename2 VARCHAR2(200) ,
filename3 VARCHAR2(200) ,
filename4 VARCHAR2(200) ,
filepath1 VARCHAR2(200) NOT NULL,
filepath2 VARCHAR2(200) ,
filepath3 VARCHAR2(200) ,
filepath4 VARCHAR2(200) 
);

drop sequence do_num_seq;
drop sequence sigungu_num_seq;

CREATE SEQUENCE mem_num_seq
start with 1
increment by 1

CREATE SEQUENCE sido_num_seq
start with 1
increment by 1

CREATE SEQUENCE sigungu_num_seq
start with 1
increment by 1

CREATE SEQUENCE rental_num_seq
start with 1
increment by 1

CREATE SEQUENCE file_num_seq
start with 1
increment by 1

-------------------------------------------------------------------------------------

select * from member;

select * from RENTALS;

select * from sido;

select * from sigungu order by sido;

select * from files;
----------------------------------------------------------------
insert into sido values (sido_num_seq.nextval, '������');
insert into sido values (sido_num_seq.nextval, '��⵵');
insert into sido values (sido_num_seq.nextval, '��󳲵�');
insert into sido values (sido_num_seq.nextval, '���ֱ����� ');
insert into sido values (sido_num_seq.nextval, '�뱸������');
insert into sido values (sido_num_seq.nextval, '����������');
insert into sido values (sido_num_seq.nextval, '�λ걤����');
insert into sido values (sido_num_seq.nextval, '����Ư����');
insert into sido values (sido_num_seq.nextval, '��걤����');
insert into sido values (sido_num_seq.nextval, '��õ������');
insert into sido values (sido_num_seq.nextval, '����ϵ�');
insert into sido values (sido_num_seq.nextval, '��û�ϵ�');
----------------------------------------------------------------
insert into sigungu values (sigungu_num_seq.nextval, '��õ��', 1);
insert into sigungu values (sigungu_num_seq.nextval, '���ֽ�', 1);
insert into sigungu values (sigungu_num_seq.nextval, '������', 1);
insert into sigungu values (sigungu_num_seq.nextval, '���ؽ�', 1);
insert into sigungu values (sigungu_num_seq.nextval, '�¹��', 1);
insert into sigungu values (sigungu_num_seq.nextval, '���ʽ�', 1);
insert into sigungu values (sigungu_num_seq.nextval, '��ô��', 1);
insert into sigungu values (sigungu_num_seq.nextval, 'ȫõ��', 1);
insert into sigungu values (sigungu_num_seq.nextval, 'Ⱦ����', 1);
insert into sigungu values (sigungu_num_seq.nextval, '������', 1);
----------------------------------------------------------------
insert into sigungu values (sigungu_num_seq.nextval, '������', 2);
insert into sigungu values (sigungu_num_seq.nextval, '������', 2);
insert into sigungu values (sigungu_num_seq.nextval, '�����ν�', 2);
insert into sigungu values (sigungu_num_seq.nextval, '�Ⱦ��', 2);
insert into sigungu values (sigungu_num_seq.nextval, '��õ��', 2);
insert into sigungu values (sigungu_num_seq.nextval, '�����', 2);
insert into sigungu values (sigungu_num_seq.nextval, '���ý�', 2);
insert into sigungu values (sigungu_num_seq.nextval, '����õ��', 2);
insert into sigungu values (sigungu_num_seq.nextval, '�Ȼ��', 2);
insert into sigungu values (sigungu_num_seq.nextval, '����', 2);
insert into sigungu values (sigungu_num_seq.nextval, '��õ��', 2);
insert into sigungu values (sigungu_num_seq.nextval, '�����ֽ�', 2);
insert into sigungu values (sigungu_num_seq.nextval, '�����', 2);
insert into sigungu values (sigungu_num_seq.nextval, '�����', 2);
insert into sigungu values (sigungu_num_seq.nextval, '������', 2);
insert into sigungu values (sigungu_num_seq.nextval, '�ǿս�', 2);
insert into sigungu values (sigungu_num_seq.nextval, '�ϳ���', 2);
insert into sigungu values (sigungu_num_seq.nextval, '���ν�', 2);
insert into sigungu values (sigungu_num_seq.nextval, '����', 2);
insert into sigungu values (sigungu_num_seq.nextval, '��õ��', 2);
----------------------------------------------------------------
insert into sigungu values (sigungu_num_seq.nextval, 'â����', 3);
insert into sigungu values (sigungu_num_seq.nextval, '���ֽ�', 3);
insert into sigungu values (sigungu_num_seq.nextval, '�뿵��', 3);
insert into sigungu values (sigungu_num_seq.nextval, '��õ��', 3);
insert into sigungu values (sigungu_num_seq.nextval, '���ؽ�', 3);
insert into sigungu values (sigungu_num_seq.nextval, '�о��', 3);
insert into sigungu values (sigungu_num_seq.nextval, '������', 3);
insert into sigungu values (sigungu_num_seq.nextval, '����', 3);
insert into sigungu values (sigungu_num_seq.nextval, '�Ƿɱ�', 3);
insert into sigungu values (sigungu_num_seq.nextval, '�Ծȱ�', 3);
insert into sigungu values (sigungu_num_seq.nextval, 'â�籺', 3);
insert into sigungu values (sigungu_num_seq.nextval, '����', 3);
----------------------------------------------------------------
insert into sigungu values (sigungu_num_seq.nextval, '����', 4);
insert into sigungu values (sigungu_num_seq.nextval, '����', 4);
insert into sigungu values (sigungu_num_seq.nextval, '����', 4);
insert into sigungu values (sigungu_num_seq.nextval, '�ϱ�', 4);
insert into sigungu values (sigungu_num_seq.nextval, '���걸', 4);
----------------------------------------------------------------
insert into sigungu values (sigungu_num_seq.nextval, '�߱�', 5);
insert into sigungu values (sigungu_num_seq.nextval, '����', 5);
insert into sigungu values (sigungu_num_seq.nextval, '����', 5);
insert into sigungu values (sigungu_num_seq.nextval, '����', 5);
insert into sigungu values (sigungu_num_seq.nextval, '�ϱ�', 5);
insert into sigungu values (sigungu_num_seq.nextval, '������', 5);
insert into sigungu values (sigungu_num_seq.nextval, '�޼���', 5);
insert into sigungu values (sigungu_num_seq.nextval, '�޼���', 5);
----------------------------------------------------------------
insert into sigungu values (sigungu_num_seq.nextval, '�߱�', 6);
insert into sigungu values (sigungu_num_seq.nextval, '����', 6);
insert into sigungu values (sigungu_num_seq.nextval, '����', 6);
insert into sigungu values (sigungu_num_seq.nextval, '������', 6);
insert into sigungu values (sigungu_num_seq.nextval, '�����', 6);
----------------------------------------------------------------
insert into sigungu values (sigungu_num_seq.nextval, '�߱�', 7);
insert into sigungu values (sigungu_num_seq.nextval, '����', 7);
insert into sigungu values (sigungu_num_seq.nextval, '����', 7);
insert into sigungu values (sigungu_num_seq.nextval, '����', 7);
insert into sigungu values (sigungu_num_seq.nextval, '�ϱ�', 7);
insert into sigungu values (sigungu_num_seq.nextval, '������', 7);
insert into sigungu values (sigungu_num_seq.nextval, '�λ�����', 7);
insert into sigungu values (sigungu_num_seq.nextval, '������', 7);
insert into sigungu values (sigungu_num_seq.nextval, '�ؿ�뱸', 7);
insert into sigungu values (sigungu_num_seq.nextval, '���ϱ�', 7);
insert into sigungu values (sigungu_num_seq.nextval, '������', 7);
----------------------------------------------------------------
insert into sigungu values (sigungu_num_seq.nextval, '���α�', 8);
insert into sigungu values (sigungu_num_seq.nextval, '�߱�', 8);
insert into sigungu values (sigungu_num_seq.nextval, '��걸', 8);
insert into sigungu values (sigungu_num_seq.nextval, '������', 8);
insert into sigungu values (sigungu_num_seq.nextval, '������', 8);
insert into sigungu values (sigungu_num_seq.nextval, '���빮��', 8);
insert into sigungu values (sigungu_num_seq.nextval, '�߶���', 8);
insert into sigungu values (sigungu_num_seq.nextval, '���ϱ�', 8);
insert into sigungu values (sigungu_num_seq.nextval, '���ϱ�', 8);
insert into sigungu values (sigungu_num_seq.nextval, '������', 8);
insert into sigungu values (sigungu_num_seq.nextval, '�����', 8);
insert into sigungu values (sigungu_num_seq.nextval, '����', 8);
insert into sigungu values (sigungu_num_seq.nextval, '���빮��', 8);
insert into sigungu values (sigungu_num_seq.nextval, '������', 8);
insert into sigungu values (sigungu_num_seq.nextval, '��õ��', 8);
insert into sigungu values (sigungu_num_seq.nextval, '������', 8);
insert into sigungu values (sigungu_num_seq.nextval, '���α�', 8);
insert into sigungu values (sigungu_num_seq.nextval, '��õ��', 8);
insert into sigungu values (sigungu_num_seq.nextval, '��������', 8);
insert into sigungu values (sigungu_num_seq.nextval, '���۱�', 8);
insert into sigungu values (sigungu_num_seq.nextval, '���Ǳ�', 8);
insert into sigungu values (sigungu_num_seq.nextval, '���ʱ�', 8);
----------------------------------------------------------------
insert into sigungu values (sigungu_num_seq.nextval, '�߱�', 9);
insert into sigungu values (sigungu_num_seq.nextval, '����', 9);
insert into sigungu values (sigungu_num_seq.nextval, '����', 9);
insert into sigungu values (sigungu_num_seq.nextval, '�ϱ�', 9);
insert into sigungu values (sigungu_num_seq.nextval, '���ֱ�', 9);
----------------------------------------------------------------
insert into sigungu values (sigungu_num_seq.nextval, '���ֽ�', 11);
insert into sigungu values (sigungu_num_seq.nextval, '�����', 11);
insert into sigungu values (sigungu_num_seq.nextval, '�ͻ��', 11);
insert into sigungu values (sigungu_num_seq.nextval, '������', 11);
insert into sigungu values (sigungu_num_seq.nextval, '������', 11);
insert into sigungu values (sigungu_num_seq.nextval, '������', 11);
insert into sigungu values (sigungu_num_seq.nextval, '���ֱ�', 11);
insert into sigungu values (sigungu_num_seq.nextval, '���ȱ�', 11);
insert into sigungu values (sigungu_num_seq.nextval, '���ֱ�', 11);
insert into sigungu values (sigungu_num_seq.nextval, '�����', 11);
insert into sigungu values (sigungu_num_seq.nextval, '�ӽǱ�', 11);
insert into sigungu values (sigungu_num_seq.nextval, '��â��', 11);
----------------------------------------------------------------
insert into sigungu values (sigungu_num_seq.nextval, '�߱�', 10);
insert into sigungu values (sigungu_num_seq.nextval, '����', 10);
insert into sigungu values (sigungu_num_seq.nextval, '����Ȧ��', 10);
insert into sigungu values (sigungu_num_seq.nextval, '������', 10);
insert into sigungu values (sigungu_num_seq.nextval, '������', 10);
insert into sigungu values (sigungu_num_seq.nextval, '����', 10);
insert into sigungu values (sigungu_num_seq.nextval, '��籸', 10);
insert into sigungu values (sigungu_num_seq.nextval, '����', 10);
insert into sigungu values (sigungu_num_seq.nextval, '��ȭ��', 10);
insert into sigungu values (sigungu_num_seq.nextval, '������', 10);
----------------------------------------------------------------
insert into sigungu values (sigungu_num_seq.nextval, 'û�ֽ�', 12);
insert into sigungu values (sigungu_num_seq.nextval, '���ֽ�', 12);
insert into sigungu values (sigungu_num_seq.nextval, '��õ��', 12);
insert into sigungu values (sigungu_num_seq.nextval, '������', 12);
insert into sigungu values (sigungu_num_seq.nextval, '��õ��', 12);
insert into sigungu values (sigungu_num_seq.nextval, '������', 12);
insert into sigungu values (sigungu_num_seq.nextval, '����', 12);
insert into sigungu values (sigungu_num_seq.nextval, '��õ��', 12);
insert into sigungu values (sigungu_num_seq.nextval, '���걺', 12);
insert into sigungu values (sigungu_num_seq.nextval, '������', 12);
insert into sigungu values (sigungu_num_seq.nextval, '�ܾ籺', 12);
----------------------------------------------------------------



