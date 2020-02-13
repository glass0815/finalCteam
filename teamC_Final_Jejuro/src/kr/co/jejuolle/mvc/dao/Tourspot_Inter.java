package kr.co.jejuolle.mvc.dao;

import java.util.List;

import kr.co.jejuolle.mvc.vo.TourLikeVO;
import kr.co.jejuolle.mvc.vo.TourPickVO;
import kr.co.jejuolle.mvc.vo.TourSpotVO;

public interface Tourspot_Inter {
	public List<TourSpotVO> tourspotlist();

	// 관광지 상세보기
	public TourSpotVO tourspotDetail(int tNo);

	// 관광지 좋아요
	public void tourspotLike(TourLikeVO tlikevo);

	// 관광지 좋아요 체크
	public int LikeCheck(TourLikeVO tlikevo);

	// 관광지 찜하기
	public void tourspotPick(TourPickVO tpickvo);

	// 관광지 찜하기 체크
	public int PickCheck(TourPickVO tpickvo);

	//관광지 조회수 증가
	public void tourspotHit(int tNo);
}
