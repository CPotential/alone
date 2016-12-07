package org.kosta.alone.model.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class UploadFileVO {
	private List<MultipartFile> file; // 파일 업로드를 위한 변수

	public List<MultipartFile> getFile() {
		return file;
	}

	public void setFile(List<MultipartFile> file) {
		this.file = file;
	}

	@Override
	public String toString() {
		return "UploadFileVO [file=" + file + "]";
	}
}
