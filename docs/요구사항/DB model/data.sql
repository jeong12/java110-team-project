-- 기본회원
INSERT INTO memb (mno,id,email,password,name,nik,phot,cdt,genre1,genre2,genre3,yn,memo)
VALUES(1,'m01','m01@test.com','1111','aaa','A','photo1',now(),'ballad','rock','jazz','N','abcdefghijklmnop');
INSERT INTO memb (mno,id,email,password,name,nik,phot,cdt,genre1,genre2,genre3,yn,memo)
VALUES(2,'m02','m02@test.com','1111','bbb','B','photo2',now(),'rock','jazz','r&b','N','abcdefghijklmnop');
INSERT INTO memb (mno,id,email,password,name,nik,phot,cdt,genre1,genre2,genre3,yn,memo)
VALUES(3,'m03','m03@test.com','1111','ccc','C','photo3',now(),'ballad','rock','jazz','N','abcdefghijklmnop');
INSERT INTO memb (mno,id,email,password,name,nik,phot,cdt,genre1,genre2,genre3,yn,memo)
VALUES(4,'m04','m04@test.com','1111','ddd','D','photo4',now(),'jazz','rock','ballad','N','abcdefghijklmnop');
INSERT INTO memb (mno,id,email,password,name,nik,phot,cdt,genre1,genre2,genre3,yn,memo)
VALUES(5,'m05','m05@test.com','1111','eee','E','photo5',now(),'ballad','rock','jazz','N','abcdefghijklmnop');
INSERT INTO memb (mno,id,email,password,name,nik,phot,cdt,genre1,genre2,genre3,yn,memo)
VALUES(6,'m06','m06@test.com','1111','fff','F','photo6',now(),'r&b','rock','jazz','N','abcdefghijklmnop');
INSERT INTO memb (mno,id,email,password,name,nik,phot,cdt,genre1,genre2,genre3,yn,memo)
VALUES(7,'m07','m07@test.com','1111','ggg','G','photo7',now(),'rap','rock','jazz','N','abcdefghijklmnop');
INSERT INTO memb (mno,id,email,password,name,nik,phot,cdt,genre1,genre2,genre3,yn,memo)
VALUES(8,'m08','m08@test.com','1111','hhh','H','photo8',now(),'ballad','rock','jazz','N','abcdefghijklmnop');

-- 버스커 가입
insert into busk(bno, name, genre, city, tel, inst, phot, avi1, avi2, per) values (1,'무스비', 'jazz', 'seoul', '010-1234-5678','piano','phot1','avi1','avi2','y');
insert into busk(bno, name, genre, city, tel, inst, strm, intro, phot, avi1, avi2, per, lcnt) values (3, '고양이','발라드','서울','1111-1111','리코더','https://www.youtube.com/watch?v=D3ZFtSoWtRc','안냐세요','photo3','avi3','avi3-2','y',321);
insert into busk(bno, name, genre, city, tel, inst, phot, avi1, avi2, per) values (7,'Halls', 'jazz', 'seoul', '010-1234-5678','piano','phot1','avi1','avi2','y');
insert into busk(bno, name, genre, city, tel, phot, avi1, avi2, per) VALUES(5,'스무쓰','발라드','강남','010-1234-1234','mandarine.jsp','www.naver.com','www.daum.net','n');

-- 버스커홍보
insert into busk_board(bbno, titl, genre, city, cnt, sdt, edt, tel1, cdt, phot, bno) values (1,'강원도 산울림', 'rock', '강원', 5,'2018-11-06','2018-11-09','010-1234-5678',now(),'phot1',1);
insert into busk_board(bbno, titl, genre, city, cnt, sdt, edt, tel1, tel2, etc, cdt, phot, bno) values (3,'수원가요','밴드','수원시',6,'2018-11-03','2018-11-05','010-1111-1111','010-1111-1111','많이와주3','2018-11-02 18:00:00','photo3',3);
insert into busk_board(bbno, titl, genre, city, cnt, sdt, edt, tel1, cdt, phot, bno) values (7,'부산에왔어요', 'jazz', 'busan', 5,'2018-11-06','2018-11-09','010-1234-5678',now(),'phot1',7);
insert into busk_board(bbno, titl, genre, city, cnt, sdt, edt, tel1, cdt, phot, bno) values(5,'부산에왔어요', 'jazz', 'busan', 5,'2018-11-06','2018-11-09','010-1234-5678',now(),'phot1',5);

-- 무대 사용 요청
insert into busk_req(brno, bno, cdt, flag) values (1,1,'2018-11-06 12:00:00','1');
insert into busk_req(brno, bno, cont, cdt, flag) values (3,3,'꼭하고싶습니다','2018-11-05 18:00:00','1');
insert into busk_req(brno, bno, cdt, flag) values (7,7,'2018-11-10 18:00:00','1');
insert into busk_req(brno, bno, cdt, flag) values (8,7,'2018-11-11 18:00:00','2');
insert into busk_req(brno, bno, cont, cdt, flag) VALUES(5,5,'버스커하고싶어연',now(),'2');

-- 사진 게시글
insert into phot(pbno, cont, cdt, bno) values (1,'여수에왔어영',now(),1);
insert into phot(pbno, cont, cdt, bno) values (3,'울산에왔어영','2018-11-05 18:00:00',3);
insert into phot(pbno, cont, cdt, bno) values (7,'부산에왔어영',now(),7);
insert into phot(pbno, cont, cdt, bno) values (5,'부산에왔어영',now(),5);

-- 동영상 게시글
insert into avi(abno, titl, cont, cdt, stm, bno) values (1,'통영에왔어영','커버곡입니당?',now(),'https://youtu.be/QtEgWwxX7CU',7);
insert into avi(abno, titl, cont, cdt, stm, bno) values (3,'블랙넛','part2',now(),'https://www.youtube.com/watch?v=1JOOPAhcZ2w&has_verified=1',7);
insert into avi(abno, titl, cont, cdt, stm, bno) values (7,'부산에왔어영','뭐뭐불렀을까여?',now(),'https://youtu.be/QtEgWwxX7CU',7);
insert into avi(abno, titl, cont, lcnt, cdt, stm, bno) values(5,'강남에서.avi','오늘강남에서 공연했어연',5,now(),'www.naver.com',5);

-- 버스커 개인스케쥴
insert into per_sche(psno, sdt, edt, addr, y, x, bno) values (1,'2018-11-07 20:00:00','2018-11-08 22:00:00', '홍대',37.4941,127.028,7);
insert into per_sche(psno, sdt, edt, addr, y, x, bno) values (3,'2018-11-03 15:00:00','2018-11-03 16:00:00','서울시',37.494051,127.027803,3);
insert into per_sche(psno, sdt, edt, addr, y, x, bno) values (7,'2018-11-10 18:00:00','2018-11-10 20:00:00', '강남',337.4941,127.028,7);
insert into per_sche(psno, sdt, edt, addr, y, x, bno) values (5,'2018-11-10 18:00:00','2018-11-10 20:00:00', '강남',37.49451745440951,127.02797915373789,5);

-- 제공자가입
insert into sup(sno, name, bas_addr, postno, det_addr, genre, capa, tel, per, x, y) values (2,'그라운드','서울특별시 마포구 서교동','04417','370-28','ballad',30,'010-1245-5678','y',37.552560,126.919404);
insert into sup(sno, name, bas_addr, postno, det_addr, genre, capa, tel, per, etc, x, y ) values (4,'황진이','서울특별시 서초구','06621','서초대로74길 33','밴드',300,'010-1111-111','n','동동주1잔에 금전1만원',37.494609,127.027562); 
insert into sup(sno, name, bas_addr, postno, det_addr, genre, capa, tel, per, x, y) values (8,'한남동','서울특별시 한남동','04417','726-348','ballad',50,'010-1245-5678','y',37.537094,127.005470);
insert into sup(sno, name, bas_addr, postno, det_addr, genre, capa, tel, per, x, y) values (6,'비트캠프','서울특별시 서초구','04417','726-348','ballad',50,'010-1245-5678','y',37.49451745440951,127.02797915373789);


-- 제공자가입사진
insert into stag_phot(spno, phot, sno) values (2, 'phot1',2);
insert into stag_phot(spno, phot, sno) values (4, 'phot4',4);
insert into stag_phot(spno, phot, sno) values (8, 'phot1',8);
insert into stag_phot(spno, phot, sno) values (6, 'phot6_1',6);

-- 무대스케쥴
insert into stag_sche(ssno, sdt, edt, flag, sno) values (2,'2018-11-05 18:00:00','2018-11-08 21:00:00','1',2);
insert into stag_sche(ssno, sdt, edt, flag, sno) values (4,'2018-11-08 18:00:00','2018-11-08 19:00:00','1',4);
insert into stag_sche(ssno, sdt, edt, flag, sno) values (8,'2018-11-10 18:00:00','2018-11-10 19:00:00','1',8);
insert into stag_sche(ssno, sdt, edt, flag, sno) values (7,'2018-11-11 18:00:00','2018-11-11 19:00:00','2',8);
insert into stag_sche(ssno, sdt, edt, flag, sno) values (6,'2018-11-10 18:00:00','2018-11-10 19:00:00','2',6);


-- 무대사용요청스케줄
insert into busk_stag(ssno,brno) values (7,8);
insert into busk_stag(ssno,brno) values (6,5);

-- 사진 댓글
insert into phot_comt(pcno, cont, cdt, mno, pbno) values(5,'저희 공연 많이 와주세연',now(),5,5);

-- 동영상 댓글
insert into avi_comt(acno, cont, cdt, mno, abno) values(5,'저희 공연 많이 와주세연',now(),5,5);

-- 피드 사진
insert into feed_phot(fpno,phot,pbno) values (1,'aaa',1);
insert into feed_phot(fpno,phot,pbno) values (2,'bbb',1);
insert into feed_phot(fpno,phot,pbno) values (3,'ccc',1);

insert into feed_phot(fpno,phot,pbno) values (4,'ddd',3);
insert into feed_phot(fpno,phot,pbno) values (5,'eee',3);
insert into feed_phot(fpno,phot,pbno) values (6,'fff',3);

insert into feed_phot(fpno,phot,pbno) values (7,'ggg',5);
insert into feed_phot(fpno,phot,pbno) values (8,'hhh',5);
insert into feed_phot(fpno,phot,pbno) values (9,'iii',5);

insert into feed_phot(fpno,phot,pbno) values (10,'jjj',7);
insert into feed_phot(fpno,phot,pbno) values (11,'kkk',7);
insert into feed_phot(fpno,phot,pbno) values (12,'lll',7);

-- 상호명 컬럼에 값추가
UPDATE per_sche SET shopname='bitcamp'

-- 작성일, 인원 컬럼에 값추가
UPDATE per_sche SET cdt=now(), cnt=3

-- 버스킹 무대사용 요청 테이블에 인원컬럼 값추가
UPDATE busk_req SET cnt=3

-- 무대 스케줄
INSERT INTO stag_sche (sdt,edt,flag,sno)
VALUES ('2018-11-10 19:00:00','2018-11-10 20:00:00',2,6);

INSERT INTO stag_sche (sdt,edt,flag,sno)
VALUES ('2018-11-10 20:00:00','2018-11-10 21:00:00',2,6);

INSERT INTO stag_sche (sdt,edt,flag,sno)
VALUES ('2018-11-11 19:00:00','2018-11-11 20:00:00',2,8);

INSERT INTO stag_sche (sdt,edt,flag,sno)
VALUES ('2018-11-11 20:00:00','2018-11-11 21:00:00',2,8);

-- 무대사용 요청 스케줄
INSERT INTO busk_stag (ssno, brno)
VALUES (9,5);

INSERT INTO busk_stag (ssno, brno)
VALUES (10,5);

INSERT INTO busk_stag (ssno, brno)
VALUES (11,8);

INSERT INTO busk_stag (ssno, brno)
VALUES (12,8);

-- 버스커홍보 테이블 플래그값 추가
UPDATE busk_board SET flag=1;




/* 제공자 스케줄 미확정 데이터 */
insert into stag_sche(sdt,edt,flag,sno) VALUES('2018-11-10 10:00:00','2018-11-10 11:00:00',1,2);
insert into stag_sche(sdt,edt,flag,sno) VALUES('2018-11-10 11:00:00','2018-11-10 12:00:00',1,2);
insert into stag_sche(sdt,edt,flag,sno) VALUES('2018-11-10 12:00:00','2018-11-10 13:00:00',1,2);
insert into stag_sche(sdt,edt,flag,sno) VALUES('2018-11-10 13:00:00','2018-11-10 14:00:00',1,2);
insert into stag_sche(sdt,edt,flag,sno) VALUES('2018-11-02 11:00:00','2018-11-02 12:00:00',1,4);
insert into stag_sche(sdt,edt,flag,sno) VALUES('2018-11-02 12:00:00','2018-11-02 13:00:00',1,4);
insert into stag_sche(sdt,edt,flag,sno) VALUES('2018-11-02 13:00:00','2018-11-02 14:00:00',1,4);

/* 버스커 신청 미확정 데이터 */
insert into busk_req(bno,cont,cdt,flag,cnt) VALUES(5,'요청1테스트할게요1',now(),1,7);
insert into busk_req(bno,cont,cdt,flag,cnt) VALUES(5,'요청1테스트할게요2',now(),1,7);

/* 무대사용요청스케줄 미확정 데이터 */
insert into busk_stag VALUES(13,9);
insert into busk_stag VALUES(14,9);
insert into busk_stag VALUES(15,9);
insert into busk_stag VALUES(16,9);
insert into busk_stag VALUES(17,10);
insert into busk_stag VALUES(18,10);
insert into busk_stag VALUES(19,10);











