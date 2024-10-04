package com.comverse.fourthsubject.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
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
import com.comverse.fourthsubject.dto.ReplyDto;
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
	//서버 로컬에 저장된 첨부파일 다운로드
	public ResponseEntity<?> boardDownloadAttachFile(int boId, int attachId) throws IOException {
		BoardAttachDto boAttach = boardDao.selectBoardAttachByAttachId(attachId);
		if(boAttach != null) {
			String boardDir = uploadDir + "/attach/" +boId;
			Path filePath = Paths.get(boardDir).resolve(boAttach.getAttachName()).normalize();
			Resource rsc = new UrlResource(filePath.toUri());
			
			if(rsc.exists()) {
				String contentType = Files.probeContentType(filePath);
	            if (contentType == null) {
	                contentType = "application/octet-stream"; // 기본값으로 바이너리 파일 처리
	            }
	            
	            String fileName = new String(boAttach.getAttachOName().getBytes("UTF-8"), "ISO-8859-1");
	            return ResponseEntity.ok()
	                .contentType(MediaType.parseMediaType(contentType))
	                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + fileName + "\"") // 다운로드를 위한 헤더
	                .body(rsc);
			}
		}
		return ResponseEntity.status(HttpStatus.NOT_FOUND).body("File not exists");
	}
	// 게시판 생성하기
	@Transactional
	public void createBoard(int boCtg, BoardFormRequest boardForm) throws IOException {
		
		//게시물 내용 저장----------------------
		BoardDto board = settingBoardFromBoardForm(boCtg, boardForm);
		board.setHitCnt(0);
		boardDao.insertBoard(board);
		
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
		board.setBoId(boardForm.getBoId());
		board.setBoCtg(boCtg);
		
		if(boardForm.getBoWriter() != null) {
			board.setBoWriter(authDao.selectAdminByAdminId(boardForm.getBoWriter()).getAdmNo());
		}
		
		board.setBoTitle(boardForm.getBoTitle());
		board.setBoPinned(boardForm.getBoPinned() != null && boardForm.getBoPinned().equals("on"));
		board.setBoReplyable(boardForm.getBoReplyable() != null && boardForm.getBoReplyable().equals("on"));
		board.setBoWriting(boardForm.getBoWriting() != null && boardForm.getBoWriting().equals("on"));
		board.setExposeStart(boardForm.getExposeStart());
		board.setExposeEnd(boardForm.getExposeEnd());
		board.setContent(boardForm.getBoContent());
		
		if(boardForm.getBoThumbnail() != null && !boardForm.getBoThumbnail().isEmpty()) {
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
			
			//파일을 지정된 경로로 저장 /download-attach/{boId}/{fileName}
			Files.copy(mf.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
			
			BoardAttachDto boardAttach = new BoardAttachDto();
			boardAttach.setBoId(boId);
			boardAttach.setAttachName(fileName);
			boardAttach.setAttachOName(oName);
			boardAttach.setAttachType(type);
			log.info(boardAttach.toString());
			
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
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		if(board.getExposeStart() != null) {
			board.setExposeStartSdf(sdf.format(board.getExposeStart()));
		}
		if(board.getExposeEnd() != null) {
			board.setExposeEndSdf(sdf.format(board.getExposeEnd()));
		}
		 
		model.addAttribute("boCtg", boCtg);
		model.addAttribute("boWriter", admin.getAdmId());
		model.addAttribute("board", board);
	}
	//게시글 내용 조회
	public ResponseEntity<?> getBoardContent(int boId) {
		BoardDto board = boardDao.selectBoardDetailByBoId(boId);
		if(board != null && !board.getContent().isEmpty()) {
			return ResponseEntity.ok(board.getContent());
		}
		return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
	}
	//게시글 수정하기
	@Transactional
	public void editBoardDetail(BoardFormRequest boardForm) throws IOException {
		//게시물 정보 수정하기
		BoardDto board = settingBoardFromBoardForm(boardForm.getBoCtg(), boardForm);
		boardDao.updateBoardDetail(board);
		log.info(boardForm.toString());
		
		//썸네일 저장하기
		//게시물 파일 저장----------------------
		//게시물 파일 저장 경로
		String attachDir = uploadDir+"/attach";
		//폴더 경로
		Path folderPath = Paths.get(attachDir, board.getBoId()+"");
		
		//썸네일 파일 저장하기
		if(boardForm.getBoThumbnail() != null && !boardForm.getBoThumbnail().isEmpty()) {
			saveBoardThumbnailFile(folderPath, boardForm.getBoThumbnail());
		}
		//첨부파일 삭제하기
		if(boardForm.getSelectedSavedAttach() != null && !boardForm.getSelectedSavedAttach().isEmpty()) {
			boardDao.deleteBoardAttach(board.getBoId(), boardForm.getSelectedSavedAttach());
		}
		//첨부파일 저장하기
		if(boardForm.getBoAttach() != null && !boardForm.getBoAttach().isEmpty()) {
			saveBoardAttachFile(folderPath, board.getBoId(), boardForm);
		}		
	}
	//엑셀 파일 다운로드
	public XSSFWorkbook getBoardWorkBook(int boCtg) {
		
		BoardCtgDto boardCtg = boardCtgDao.selectBoardCtgDetail(boCtg);
		List<BoardDto> boardList = boardDao.selectBoardListForExcel(boCtg);
		
		XSSFWorkbook workbook = new XSSFWorkbook();
		Sheet sheet = workbook.createSheet(boardCtg.getCtgName());
		
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Row dscrptn = sheet.createRow(0);
		dscrptn.createCell(4).setCellValue("기준 일자");
		dscrptn.createCell(5).setCellValue(sdf.format(now));
		
		Row headerRow = sheet.createRow(1);
		headerRow.createCell(0).setCellValue("ID");
		headerRow.createCell(1).setCellValue("Title");
		headerRow.createCell(2).setCellValue("Register_Date");
		headerRow.createCell(3).setCellValue("Is_Expose");
		headerRow.createCell(4).setCellValue("Expose_Start");
		headerRow.createCell(5).setCellValue("Expose_End");
		headerRow.createCell(6).setCellValue("Attach_Cnt");
		
		int rowIdx = 2;
		for(BoardDto board : boardList) {
			Row row = sheet.createRow(rowIdx++);
			row.createCell(0).setCellValue(board.getBoId());
			row.createCell(1).setCellValue(board.getBoTitle());
			row.createCell(2).setCellValue(sdf.format(board.getRegDate()));
			row.createCell(3).setCellValue(!board.isBoWriting() && (board.getExposeStart() == null || now.after(board.getExposeStart())) && (board.getExposeEnd() == null || now.before(board.getExposeEnd())) ? "노출" : "비노출");
			if(board.getExposeStart() != null) {
				row.createCell(4).setCellValue(sdf.format(board.getExposeStart()));
			} else {
				row.createCell(4).setCellValue("미지정");
			}
			if(board.getExposeEnd() != null) {
				row.createCell(5).setCellValue(sdf.format(board.getExposeEnd()));
			} else {
				row.createCell(5).setCellValue("미지정");
			}
			row.createCell(6).setCellValue(board.getAttachCnt());
		}
		
		return workbook;
	}
	
	//사용자 화면에서의 게시글 목록 가져오기
	public void getBoardListForUser(int boCtg, String pageNo, Model model) {
		
		if(pageNo == null || pageNo.isBlank()) {
			pageNo = "1";
		}
		BoardCtgDto ctg = boardCtgDao.selectBoardCtgDetail(boCtg);
		
		int totalRows = boardDao.selectRowCntForUser(boCtg);
		Pager pager = new Pager(10, 10, totalRows, Integer.parseInt(pageNo));
		
		List<BoardDto> boardList = boardDao.selectBoardListForUser(boCtg, pager);
		
		List<BoardDto> pinnedBoardList = boardDao.selectPinnedBoardListForUser(boCtg);
		
		Date compDate = null;
		if(ctg.isNewExpose()) {
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.DATE, -ctg.getExposePeriod());
			
			compDate = cal.getTime();
		}
		
		model.addAttribute("compDate", compDate);
		model.addAttribute("ctg", ctg);
		model.addAttribute("pager", pager);
		model.addAttribute("boardList", boardList);
		model.addAttribute("pinned", pinnedBoardList);
		
	}
	
	//사용자 화면에서의 게시글 상세 가져오기
	@Transactional
	public void getBoardDetailForUser(int boCtg, String boId, Model model) {
		
		BoardCtgDto ctg = boardCtgDao.selectBoardCtgDetail(boCtg);
		BoardDto board = boardDao.selectBoardDetailByBoId(Integer.parseInt(boId));
		if(board != null) {
			List<BoardAttachDto> boardAttach = boardDao.selectBoardAttachListByBoId(board.getBoId());
			board.setBoAttachList(boardAttach);
		}
		
		List<ReplyDto> replyList = boardDao.selectReplyListByBoId(Integer.parseInt(boId));
		
		Map<String, BoardDto> preNext = new HashMap<>();
		
		BoardDto preBoard = boardDao.selectPreBoardByBoId(boCtg, Integer.parseInt(boId));
		BoardDto nextBoard = boardDao.selectNextBoardByBoId(boCtg, Integer.parseInt(boId));
		
		boardDao.updateBoardHitCnt(Integer.parseInt(boId));
		
		preNext.put("pre", preBoard);
		preNext.put("next", nextBoard);
		
		model.addAttribute("ctg", ctg);
		model.addAttribute("board", board);
		model.addAttribute("preNext", preNext);
		model.addAttribute("replyList", replyList);
	}
	//댓글 작성하기
	public ResponseEntity<?> writeBoardReply(ReplyDto reply) {
		boardDao.insertBoardReply(reply);
		return ResponseEntity.ok(null);
	}
	//댓글 삭제하기
	public ResponseEntity<?> deleteBoardReply(ReplyDto rqReply) {
		ReplyDto reply = boardDao.selectReplyDetail(rqReply.getReplyId());
		if(reply.getAnonPw().equals(rqReply.getAnonPw())) {
			boardDao.updateReplyEnabled(rqReply);
			return ResponseEntity.ok(true);
		} else {
			return ResponseEntity.ok(false);
		}
	}
}
