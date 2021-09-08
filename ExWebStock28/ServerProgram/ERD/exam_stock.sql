
/* Drop Tables */

DROP TABLE exam_stock CASCADE CONSTRAINTS;

DROP SEQUENCE exam_stock_seq;



/* Create Tables */

CREATE TABLE exam_stock
(
	pid number NOT NULL,
	name varchar2(20) NOT NULL,
	info clob,
	stock number DEFAULT 0 CHECK (stock >= 0),
	regdate date DEFAULT SYSDATE,
	PRIMARY KEY (pid)
);

-- 시퀀스
CREATE SEQUENCE exam_stock_seq;

INSERT INTO EXAM_STOCK (pid, name, info, stock) VALUES (EXAM_STOCK_SEQ.nextval, '왕감자', '동글동글 왕감자! 대홍단 왕감자!', 50);

-- 조회
SELECT 
	pid "제품ID", name "제품명", info "제품소개", stock "제품재고", regdate "등록일"
FROM exam_stock;

