
package  org.kosta.alone.model.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class UploadFileVO {
	private String userInfo;
	private MultipartFile mainFile; // 파일업로드를 위한 변수 
	private List<MultipartFile> file;
	public String getUserInfo() {
		return userInfo;
	}
	public void setUserInfo(String userInfo) {
		this.userInfo = userInfo;
	}
	public List<MultipartFile> getFile() {
		return file;
	}
	public void setFile(List<MultipartFile> file) {
		this.file = file;
	}
	public MultipartFile getMainFile() {
		return mainFile;
	}
	public void setMainFile(MultipartFile mainFile) {
		this.mainFile = mainFile;
	}
	@Override
	public String toString() {
		return "UploadFileVO [userInfo=" + userInfo + ", mainFile=" + mainFile + ", file=" + file + "]";
	}
	
}

	
