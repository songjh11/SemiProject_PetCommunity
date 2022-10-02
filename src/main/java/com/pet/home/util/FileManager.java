package com.pet.home.util;

import java.io.File;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.pet.home.file.FileDTO;
import com.pet.home.sell.file.RvFileDTO;

@Component
public class FileManager {
	
	//file 삭제
	public boolean deleteFile(ServletContext servletContext, FileDTO fileDTO, String path) throws Exception{
		//1. 실제경로 받아오기
		String realPath = servletContext.getRealPath(path);
		System.out.println(realPath);
		//2. 파일 객체 생성
		File file = new File(realPath, fileDTO.getFileName());
		
		return file.delete();
	}
	
	//리뷰파일 삭제
	public boolean deleteFile(ServletContext servletContext, RvFileDTO rvFileDTO, String path) throws Exception{
		//1. 실제경로 받아오기
		String realPath = servletContext.getRealPath(path);
		System.out.println(realPath);
		//2. 파일 객체 생성
		File file = new File(realPath, rvFileDTO.getFileName());
		
		return file.delete();
	}
	
	//saver 파일 저장
	public String saveFile(ServletContext servletContext, String path, MultipartFile multipartFile) throws Exception{
		String realPath = servletContext.getRealPath(path);
		System.out.println("실제 경로:" + realPath);
		
		//2. 폴더(directory) 체크
		File file = new File(realPath);
		
		if(!file.exists()) {
			file.mkdirs();
		}
		
		//3. 저장할 파일명 생성
		String fileName = UUID.randomUUID().toString();
		fileName = fileName+"_"+multipartFile.getOriginalFilename();
		
		file = new File(file,fileName);
		multipartFile.transferTo(file);
		
		return fileName;
		
		
	}
}
