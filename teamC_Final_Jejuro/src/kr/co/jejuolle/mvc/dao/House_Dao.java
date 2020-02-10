package kr.co.jejuolle.mvc.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jejuolle.mvc.vo.HouseVO;
import kr.co.jejuolle.mvc.vo.RoomVO;

@Repository
public class House_Dao {

	@Autowired
	private SqlSessionTemplate ss;
	
	
	public List<HouseVO> houselise() {
		return ss.selectList("house.houselist");
	}
	
	public List<RoomVO> room(int hNo){
		return ss.selectList("house.room", hNo);
	}
	
	public int roomCount(int hNo) {
		return ss.selectOne("house.roomCount", hNo);
	}
}
