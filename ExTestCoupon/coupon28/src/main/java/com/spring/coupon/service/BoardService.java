package com.spring.coupon.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.coupon.domain.WriteDAO;
import com.spring.coupon.domain.WriteDTO;

@Service
public class BoardService {
	WriteDAO dao;
	
	// MyBatis
		private SqlSession sqlSession;
		
		@Autowired
		public void setSqlSession(SqlSession sqlSession) {
			this.sqlSession = sqlSession;
		}
		
		public BoardService() {
			super();
			System.out.println("BoardService()");
		}
		
		public List<WriteDTO> list(){
			dao = sqlSession.getMapper(WriteDAO.class);
			return dao.select();
		}
		
		public int write(WriteDTO dto) {
			dao = sqlSession.getMapper(WriteDAO.class);
			//return dao.insert(dto);
			
			int result = dao.insert(dto);
			System.out.println("생성된 cid " + dto.getCid());
			
			return result;
		}
		
		//@Transactional
				public List<WriteDTO> viewByCid(int cid){
					dao = sqlSession.getMapper(WriteDAO.class); 
					return dao.selectByCid(cid); 
				}
				
				public List<WriteDTO> selectByCid(int cid) {
					dao = sqlSession.getMapper(WriteDAO.class);
					return dao.selectByCid(cid); 
				}
				
				public int update(WriteDTO dto) {
					dao = sqlSession.getMapper(WriteDAO.class);
					return dao.update(dto.getCid(), dto);
				}
				
				public int deleteByCid(int cid) {
					dao = sqlSession.getMapper(WriteDAO.class); 
					return dao.deleteByCid(cid);				
				}

}
