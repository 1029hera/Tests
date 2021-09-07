package com.spring.coupon.domain;

public class WriteDTO {
	private Integer cid;
	private String name;
	private String kind;
	private String sno;
	
	public WriteDTO() {
		super();
	}
	
	public WriteDTO(Integer cid, String name, String kind, String sno) {
		super();
		this.cid = cid;
		this.name = name;
		this.kind = kind;
		this.sno = sno;
		System.out.printf("WriteDTO(%d, %s, %s, %s) 객체 생성\n", cid, name, kind, sno);
	}

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}
	
	
	
}
