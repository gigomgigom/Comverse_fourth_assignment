package com.comverse.fourthsubject.dto;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class BizSchDto {
	private int schId;
	private int prId;
	private LocalDateTime prDate;
}
