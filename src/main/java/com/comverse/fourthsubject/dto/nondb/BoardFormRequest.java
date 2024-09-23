package com.comverse.fourthsubject.dto.nondb;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardFormRequest {
	private int boId;
	private String boTitle;
	private String boWriter;
	private int boCtg;
	private String boPinned;
	private String boReplyable;
	private String boWriting;
	private String boContent;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date exposeStart;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date exposeEnd;
	private List<MultipartFile> boAttach;
	private MultipartFile boThumbnail;
	private List<Integer> selectedSavedAttach;
}
