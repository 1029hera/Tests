
/* Drop Tables */

DROP TABLE exam_coupon CASCADE CONSTRAINTS;

DROP SEQUENCE exam_coupon_seq;


/* Create Tables */

CREATE TABLE exam_coupon
(
	cid number NOT NULL,
	name varchar2(40) NOT NULL,
	kind varchar2(20) CHECK (kind IN ('정기권', '할인권')),
	sno varchar2(20),
	PRIMARY KEY (cid)
);

CREATE SEQUENCE exam_coupon_seq;

INSERT INTO exam_coupon VALUES (exam_coupon_seq.nextval, '워터파크 할인권', '할인권', '1234-ad-AB');
INSERT INTO exam_coupon VALUES (exam_coupon_seq.nextval, '워터파크 정기권', '정기권', 'asdf-12-Qa');


