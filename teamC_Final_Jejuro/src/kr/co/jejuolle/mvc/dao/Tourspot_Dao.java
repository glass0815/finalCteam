package kr.co.jejuolle.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.jejuolle.mvc.vo.TourLikeVO;
import kr.co.jejuolle.mvc.vo.TourPickVO;
import kr.co.jejuolle.mvc.vo.TourSpotVO;

@Repository
public class Tourspot_Dao implements Tourspot_Inter {

	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public List<TourSpotVO> tourspotlist() {
		return ss.selectList("tourspot.tourspotlist");
	}

	// 관광지 상세보기
	@Override
	public TourSpotVO tourspotDetail(int tNo) {
		return ss.selectOne("tourspot.tourspotDetail", tNo);
	}

	// 관광지 좋아요
	@Override
	public void tourspotLike(TourLikeVO tlikevo) {
		ss.insert("tourspot.tourspotLike", tlikevo);
	}

	// 관광지 좋아요 체크
	@Override
	public int LikeCheck(TourLikeVO tlikevo) {
		return ss.selectOne("tourspot.likecheck", tlikevo);
	}

	// 관광지 찜하기
	@Override
	public void tourspotPick(TourPickVO tpickvo) {
		ss.insert("tourspot.tourspotpick", tpickvo);
	}

	// 관광지 찜하기 체크
	@Override
	public int PickCheck(TourPickVO tpickvo) {
		return ss.selectOne("tourspot.pickcheck", tpickvo);
	}

	//관광지 조회수 증가
	@Override
	public void tourspotHit(int tNo) {
		ss.update("tourspot.tourHit", tNo);
	}

}
