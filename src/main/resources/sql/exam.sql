insert into member
values (mem_num_seq.nextval, 'dahye', 'dada', '1234', '�̴���', 123456, '��⵵ ��õ�� ���̱�', '�ݰ���Ƽ�� 111-111', 'dahye3059', 'naver.com', '010-2350-3059', sysdate);

select * from member;

select * from RENTALS;

insert into RENTALS
values (rental_num_seq.nextval, 1, '�̴���', '��⵵ ��õ�� ���̱� �� 226-11', '��⵵', '��õ��', 2400, );

select * from RENTALFILES

select * from RENTALFILES;

select num, id, nickname, realname, postnum, address, addressdetail, email, emaildomain, phone, registdate
		from member 
		where num = 2
		
select * from rentalFiles;

	INSERT INTO rentals
  	VALUES (rental_num_seq.nextval, 2, '�̴���', '���ѹα� ��⵵ ��õ��', '��⵵ ��õ��', 
  		    2, 15, 2400, 10000000, '��Ұ����ƿ�^^', 24, 24);
  		    
  		    SELECT max(num) 
  		FROM rentals
  		WHERE member_num = 2

CREATE SEQUENCE rental_num_seq
start with 1
increment by 1  	

select * from sido;
select * from sigungu;

select num
from sido
where name like '%������%'

select * from RENTALS;

select sido.num, sigungu.num
from sido , sigungu
where sido.name = '��⵵'
and sigungu.name = '��õ��';

SELECT sido.num as sido, sigungu.num as sigunu
	FROM sido , sigungu
	WHERE sido.name = '��⵵'
	AND sigungu.name = '��õ��';
	
	SELECT sido.num as sido
	FROM sido
	WHERE sido.name like '%��⵵%'	
  		    
	delete from rentals cascade constraints;
  		    
 SELECT max(num) 
  		FROM rentals
  		WHERE member_num = 2 		    
  		    