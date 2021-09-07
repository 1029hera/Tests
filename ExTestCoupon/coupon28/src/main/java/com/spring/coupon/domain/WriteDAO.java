package com.spring.coupon.domain;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface WriteDAO {
	List<WriteDTO> select();
	
	int insert(WriteDTO dto);
	int insert(String name, String kind, String sno);
	
	List<WriteDTO> selectByCid(int cid);
	
	int update(WriteDTO dto);
	
	int update(int cid, @Param("a") WriteDTO dto);
	
	int deleteByCid(int cid);
	
	WriteDTO searchByName(String name);
}
