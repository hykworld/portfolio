package com.scon.mapper;

import java.util.List;

import com.scon.domain.Criteria;
import com.scon.domain.FileVO;
import com.scon.domain.NboardVO;

public interface NboardMapper {
	//목록
	  // 게시판의 모든 글을 조회하는 메서드입니다
	public List<NboardVO> getList();
	
	//페이징처리 LIST타입으로
	// 페이징 처리를 포함하여 게시판의 글 목록을 조회하는 메서드입니다.
    // Criteria 객체를 통해 페이지 번호, 페이지당 표시되는 게시글 수 등의 정보를 전달받습니다.
	public List<NboardVO> getListWithPaging(Criteria cri);
	public List<NboardVO> getListCategory(Criteria cri);
	
	
	//등록
	// 새로운 게시글을 등록하는 메서드입니다.
    // BoardVO 객체를 매개변수로 전달받아 데이터베이스에 새로운 레코드를 추가합니다.
	public void insert(NboardVO board);
	
	//등록 . key값 구하기
	public Integer insertSelectkey(NboardVO board);
	
	//상세보기
	public NboardVO read(Long bno);
	
	//글삭제 성공시 1로 나옴
	public int delete(Long bno);
	
	//글수정 성공시 1로 나옴
	public int update(NboardVO board);
	
	//글갯수 카운트 (갯수로 나옴)
	public int getTotalCount(Criteria cri);
	
	
	//파일업로드//어케쓸지 모르겟음
	public void saveFile(FileVO vo);

	//순위처리	
	public List<NboardVO> getIT();
	public List<NboardVO> getAI();
	public List<NboardVO> getSPACE();
	public List<NboardVO> getNATURE();
	
	//조회수 올리기
	public void updateReadCount(Long bno);
	
//	public List<NboardVO> getWeek();
//	public List<NboardVO> getMonth();
	
}
