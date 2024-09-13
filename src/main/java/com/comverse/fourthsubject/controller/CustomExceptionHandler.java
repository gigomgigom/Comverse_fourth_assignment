package com.comverse.fourthsubject.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.server.ResponseStatusException;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ControllerAdvice
public class CustomExceptionHandler {
	
	@ExceptionHandler(ResponseStatusException.class)
    public String handle400Errors(ResponseStatusException ex) {
        if (ex.getStatusCode().is4xxClientError()) {
            // 400번대 에러의 경우 처리
            return "/error/404"; // 에러 페이지 또는 JSON 반환 가능
        }
        return "error/500"; // 5xx 서버 에러 처리
    }
}
