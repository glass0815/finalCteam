package kr.co.jejuolle.mvc.dao;

import java.util.List;

import kr.co.jejuolle.mvc.vo.HouseLikeVO;
import kr.co.jejuolle.mvc.vo.HousePickVO;
import kr.co.jejuolle.mvc.vo.HouseVO;
import kr.co.jejuolle.mvc.vo.ReservationVO;
import kr.co.jejuolle.mvc.vo.RoomVO;

public interface House_Inter {
	public List<HouseVO> houselise();
	public List<RoomVO> room(int hNo);
	public RoomVO roomDetail(int rNo);
	public void res_room(ReservationVO vo);
	public HouseVO houseDetail(int hNo);
	public void houseLike(HouseLikeVO hlikevo);
	public int LikeCheck(HouseLikeVO hlikevo);
	public void housePick(HousePickVO hpickvo);
	public int PickCheck(HousePickVO hpickvo);
	public void houseHit(int hNo);
}
