package com.pet.home.util;

import java.io.File;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManager {
	
	
	//saver 파일 저장
	public String saveFile(ServletContext servletContext, String path,MultipartFile multipartFile) throws Exception{
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
