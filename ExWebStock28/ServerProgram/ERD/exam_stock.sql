
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

-- ������
CREATE SEQUENCE exam_stock_seq;

INSERT INTO EXAM_STOCK (pid, name, info, stock) VALUES (EXAM_STOCK_SEQ.nextval, '�հ���', '���۵��� �հ���! ��ȫ�� �հ���!', 50);

-- ��ȸ
SELECT 
	pid "��ǰID", name "��ǰ��", info "��ǰ�Ұ�", stock "��ǰ���", regdate "�����"
FROM exam_stock;

