package com.comverse.fourthsubject.service.admin;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.comverse.fourthsubject.dao.AuthDao;
import com.comverse.fourthsubject.dao.BoardCtgDao;
import com.comverse.fourthsubject.dao.BoardDao;
import com.comverse.fourthsubject.dto.AdminDto;
import com.comverse.fourthsubject.dto.BoardAttachDto;
import com.comverse.fourthsubject.dto.BoardCtgDto;
import com.comverse.fourthsubject.dto.BoardDto;
import com.comverse.fourthsubject.dto.nondb.BoardFormRequest;
import com.comverse.fourthsubject.dto.nondb.Pager;
import com.comverse.fourthsubject.dto.nondb.SearchIndex;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BoardService {
	
	@Autowired
	private BoardCtgDao boardCtgDao;
	@Autowired
	private BoardDao boardDao;
	@Autowired
	private AuthDao authDao;
	
	@Value("${spring.servlet.multipart.location}")
	private String uploadDir;
	
	//게시판 설정-------------------------------------------------------
	//---------------------------------------------------------------
	//목록 조회
	public List<BoardCtgDto> getBoardCtgList() {
		return boardCtgDao.selectBoardCtgList();
	}
	//상세 조회
	public BoardCtgDto getBoardCtgDetail(int ctgId) {
		return boardCtgDao.selectBoardCtgDetail(ctgId);
	}
	//생성
	public int createBoardCtg() {
		return boardCtgDao.insertBoardCtg();
	}
	//수정
	public int editBoardCtg(BoardCtgDto boardCtgDto) {
		return boardCtgDao.updateBoardCtgDetail(boardCtgDto);
	}
	//삭제
	public int removeBoardCtg(int ctgId) {
		return boardCtgDao.updateBoardCtgEnabled(ctgId);
	}
	//게시판 관리-------------------------------------------------------
	//---------------------------------------------------------------
	//게시판 목록 조회
	public void getBoardList(int boCtg, SearchIndex searchIndex, Model model) {
		
		int totalRows = boardDao.selectRowCnt(boCtg, searchIndex);
		Pager pager = new Pager(searchIndex.getRowsPerPage(), 5, totalRows, Integer.parseInt(searchIndex.getPageNo()));
		searchIndex.setPager(pager);
		log.info(searchIndex.getPager().toString());
		List<BoardDto> boardList = boardDao.selectBoardList(boCtg, searchIndex);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		if(searchIndex.getStartDate() != null) {
			searchIndex.setStartDateSdf(sdf.format(searchIndex.getStartDate()));
		}
		if(searchIndex.getEndDate() != null) {
			searchIndex.setEndDateSdf(sdf.format(searchIndex.getEndDate()));
		}
		model.addAttribute("searchIndex", searchIndex);
		model.addAttribute("boardList", boardList);
		model.addAttribute("boCtg", boCtg);
	}
	//게시판 업로드된 이미지 서버 로컬에 저장
	public String uploadImageFile(MultipartFile mf, int boCtg) throws IOException {
		//현재 일자
		String today = LocalDate.now().toString();
		//이미지파일 저장 경로
		String imageDir = uploadDir+"/image";
		
		//이름(현재일자) 폴더의 경로
		Path folderPath = Paths.get(imageDir, today);
		
		//폴더가 존재하는지 여부에 따라 폴더 생성여부 결정
		if(!Files.exists(folderPath)) {
			Files.createDirectories(folderPath);
		}
		
		//랜덤한 이름+파일초기이름
		String fileName = UUID.randomUUID().toString() + "_" + mf.getOriginalFilename();
		Path filePath = folderPath.resolve(fileName);
		
		//파일을 지정된 경로로 저장
		Files.copy(mf.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
		
		//다운로드 경로 생성
		String fileDownloadUrl = "/board/download-image/" + today + "/" + fileName;
		
		return fileDownloadUrl;
	}
	//서버 로컬에 저장된 이미지파일 다운로드
	public ResponseEntity<?> boardDownloadImage(String date, String fileName) throws IOException {
		String imageDir = uploadDir + "/image";
		
		Path filePath = Paths.get(imageDir).resolve(date).resolve(fileName).normalize();
		Resource rsc = new UrlResource(filePath.toUri());
		
		if(rsc.exists()) {
			return ResponseEntity.ok()
						.contentType(MediaType.parseMediaType(Files.probeContentType(filePath)))
						.body(rsc);
		} else {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
		}
	}
	//서버 로컬에 저장된 이미지파일 삭제
	public ResponseEntity<?> boardDeleteImage(String date, String fileName) throws IOException {
		String imageDir = uploadDir + "/image";
		
		Path filePath = Paths.get(imageDir).resolve(date).resolve(fileName).normalize();
		
		if(Files.exists(filePath)) {
			Files.delete(filePath);
			return ResponseEntity.ok("File deleted successfully");
		} else {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null); 
		}
	}
	//서버 로컬에 저장된 썸네일 파일 다운로드
	public ResponseEntity<?> boardDownloadThumbnailImage(int boId) throws IOException {
		BoardDto board = boardDao.selectBoardDetailByBoId(boId);
		if(board.getBoThumbnail() != null && !board.getBoThumbnail().equals("")) {
			String boardDir = uploadDir + "/attach/" + boId;
			Path filePath = Paths.get(boardDir).resolve(board.getBoThumbnail()).normalize();
			Resource rsc = new UrlResource(filePath.toUri());
			
			if(rsc.exists()) {
				return ResponseEntity.ok()
							.contentType(MediaType.parseMediaType(Files.probeContentType(filePath)))
							.body(rsc);
			}
		}		
		
		return ResponseEntity.status(HttpStatus.NOT_FOUND).body("No Image file");
	}
	// 게시판 생성하기
	@Transactional
	public void createBoard(int boCtg, BoardFormRequest boardForm) throws IOException {
		
		//게시물 내용 저장----------------------
		BoardDto board = settingBoardFromBoardForm(boCtg, boardForm);
		board.setHitCnt(0);
		boardDao.insertBoard(board);
		log.info(board.getBoId()+"");
		
		//게시물 파일 저장----------------------
		//게시물 파일 저장 경로
		String attachDir = uploadDir+"/attach";
		//폴더 경로
		Path folderPath = Paths.get(attachDir, board.getBoId()+"");
		//폴더가 존재하는지 여부에 따라 폴더 생성여부 결정
		if(!Files.exists(folderPath)) {
			Files.createDirectories(folderPath);
		}
		//썸네일 파일 저장하기
		if(boardForm.getBoThumbnail() != null && !boardForm.getBoThumbnail().isEmpty()) {
			saveBoardThumbnailFile(folderPath, boardForm.getBoThumbnail());
		}
		//첨부파일 저장하기
		if(boardForm.getBoAttach() != null && !boardForm.getBoAttach().isEmpty()) {
			saveBoardAttachFile(folderPath, board.getBoId(), boardForm);
		}
	}
	// BoardFormRequest객체에 있는 값을 BoardDto에 맞춰서 세팅해주기
	public BoardDto settingBoardFromBoardForm(int boCtg, BoardFormRequest boardForm) {
		BoardDto board = new BoardDto();
		board.setBoCtg(boCtg);
		board.setBoWriter(authDao.selectAdminByAdminId(boardForm.getBoWriter()).getAdmNo());
		board.setBoTitle(boardForm.getBoTitle());
		board.setBoPinned(boardForm.getBoPinned() != null && boardForm.getBoPinned().equals("on"));
		board.setBoReplyable(boardForm.getBoReplyable() != null && boardForm.getBoReplyable().equals("on"));
		board.setBoWriting(boardForm.getBoWriting() != null && boardForm.getBoWriting().equals("on"));
		board.setExposeStart(boardForm.getExposeStart());
		board.setExposeEnd(boardForm.getExposeEnd());
		board.setContent(boardForm.getBoContent());
		
		if(boardForm.getBoThumbnail() != null) {
			String oName = boardForm.getBoThumbnail().getOriginalFilename();
			board.setBoThumbnail("thumbnail."+oName.substring(oName.lastIndexOf(".")+1));
		}
		
		return board;
	}
	// Board 썸네일 이미지 파일을 서버 로컬에 업로드
	private void saveBoardThumbnailFile(Path folderPath, MultipartFile boThumbnail) throws IOException {
		String oName = boThumbnail.getOriginalFilename();
		//확장자명 붙여주기
		String fileName = "thumbnail."+oName.substring(oName.lastIndexOf(".")+1);
		
		Path filePath = folderPath.resolve(fileName);
		//파일을 지정된 경로로 저장
		Files.copy(boThumbnail.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
	}
	//Board 첨부파일들을 서버 로컬에 업로드
	private void saveBoardAttachFile(Path folderPath, int boId, BoardFormRequest boardForm) throws IOException {
		for(MultipartFile mf : boardForm.getBoAttach()) {
			String oName = mf.getOriginalFilename();
			String type = mf.getContentType();
			
			String fileName = UUID.randomUUID().toString() + "_" + oName;
			Path filePath = folderPath.resolve(fileName);
			
			//파일을 지정된 경로로 저장
			Files.copy(mf.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
			String fileDownloadUrl = "/admin/board/manage/" + boardForm.getBoCtg() + "/download-attach/" + boId + "/" + fileName;
			
			BoardAttachDto boardAttach = new BoardAttachDto();
			boardAttach.setBoId(boId);
			boardAttach.setAttachUrl(fileDownloadUrl);
			boardAttach.setAttachOName(oName);
			boardAttach.setAttachType(type);
			
			boardDao.insertBoardAttach(boardAttach);
		}
	}
	//게시글 상세조회
	public void getBoardDetail(int boCtg, SearchIndex searchIndex, Model model) {
		int boId = Integer.parseInt(searchIndex.getDetailId());
		BoardDto board = boardDao.selectBoardDetailByBoId(boId);
		List<BoardAttachDto> boardAttachList = boardDao.selectBoardAttachListByBoId(boId);
		board.setBoAttachList(boardAttachList);		
		AdminDto admin = authDao.selectManagerDetail(board.getBoWriter());
		
		model.addAttribute("boCtg", boCtg);
		model.addAttribute("boWriter", admin.getAdmId());
		model.addAttribute("board", board);
	}
}
