package kr.co.jejuolle.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jejuolle.mvc.vo.HouseVO;
import kr.co.jejuolle.mvc.vo.TourSpotVO;

@Repository
public class Tourspot_Dao {

	@Autowired
	private SqlSessionTemplate ss;


	public List<TourSpotVO> tourspotlist() {
		return ss.selectList("tourspot.tourspotlist");
	}
}
