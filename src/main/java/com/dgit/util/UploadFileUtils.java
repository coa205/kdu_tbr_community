package com.dgit.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {
	//file의 폴더와 이름을 리턴한다.
	public static String uploadFile(String uploadPath, String originalName, byte[] fileDate) throws IOException{
		UUID uid = UUID.randomUUID();
		String dataPath = calcPath(uploadPath);
		String savedName = dataPath + "/" + uid.toString() + "_" + originalName;
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileDate, target);
		
		String thumbName = makeThumbnail(uploadPath, dataPath, uid.toString() + "_" + originalName);
		
		return thumbName;// /2017/06/03/aaa.jpg
	}
	
	private static String calcPath(String uploadPath){
		Calendar cal = Calendar.getInstance();
		String yearPath = "/" + cal.get(Calendar.YEAR);
		String monthPath = String.format("%s/%02d", yearPath, cal.get(Calendar.MONTH) + 1);
		String datePath = String.format("%s/%02d/%02d", yearPath, cal.get(Calendar.MONTH) + 1,
				cal.get(Calendar.DATE));
		
		makeDir(uploadPath, yearPath, monthPath, datePath);
		
		return datePath;
	}
	
	private static void makeDir(String uploadPath, String... paths){
		System.out.println(uploadPath);
		for(String path : paths){
			File dirPath = new File(uploadPath + path);
			if(!dirPath.exists()){
				dirPath.mkdirs();
			}
		}
	}
	
	private static String makeThumbnail(String uploadpath, String datePath, String filename) throws IOException{
		String originalFilename = uploadpath + "/" + datePath + "/" + filename;
		BufferedImage sourceImg = ImageIO.read(new File(uploadpath + "/" + datePath + "/" + filename));
		
		BufferedImage destImg = Scalr.resize(sourceImg, 
											Scalr.Method.AUTOMATIC,
											Scalr.Mode.FIT_TO_HEIGHT,
											100);
		
		String thumbFileName = uploadpath + "/" + datePath + "/s_" + filename;
		File newFile = new File(thumbFileName);
		String formatName = filename.substring(filename.lastIndexOf(".")+1);//확장자
		
		//Thumbnail 경로/파일 이름에 resizing된 이미지를 넣는다.
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		
		return datePath + "/s_" + filename;
	}
}
