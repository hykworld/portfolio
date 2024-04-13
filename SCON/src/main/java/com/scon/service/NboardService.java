package com.scon.service;

import java.util.List;

import com.scon.domain.Criteria;
import com.scon.domain.FileVO;
import com.scon.domain.NboardVO;

public interface NboardService {
	//목록
	public List<NboardVO> getList();
	
	//등록
	public void register(NboardVO board);
	
	//상세보기
	public NboardVO get(Long bno);
	
	//삭제
	public boolean remove(Long bno);
	
	//수정
	public boolean modify(NboardVO board);
	
	//전체글 수
	public int getTotal(Criteria cri);
	
	//목록 with paging
	public List<NboardVO> getList(Criteria cri);
	public List<NboardVO> getListCategory(Criteria cri ,String ccode);
	
	//사진올리기
	public void saveFile(FileVO vo);
	
	//순위 처리
	public List<NboardVO> getIT();
	public List<NboardVO> getAI();
	public List<NboardVO> getSPACE();
	public List<NboardVO> getNATURE();
	
	public void updateReadCount(Long bno);
//	public List<NboardVO> getWeek();
//	public List<NboardVO> getMonth();
	boolean checkPassword(String inputPassword);
}
