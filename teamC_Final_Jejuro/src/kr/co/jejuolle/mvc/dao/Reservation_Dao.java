package kr.co.jejuolle.mvc.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jejuolle.mvc.vo.RoomVO;
@Repository
public class Reservation_Dao implements Reservation_Inter {

	@Autowired
	private SqlSessionTemplate ss;
	
	@Override
	public RoomVO list_res(int rvNo) {
		return ss.selectOne("res.list_res", rvNo);
	}

}
