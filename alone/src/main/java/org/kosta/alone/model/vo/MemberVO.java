package org.kosta.alone.model.vo;

public class MemberVO {
	private String id;
	private String password;
	private String name;
	private String nickName;
	private String tel;
	private String authority;
	private int enabled;
	
	public MemberVO() {
		super();
	}
	
	

	public MemberVO(String id, String password, String name, String nickName, String tel) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.nickName = nickName;
		this.tel = tel;
	}

	public MemberVO(String id, String password, String name, String nickName, String tel,String authority,int enabled) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.nickName = nickName;
		this.tel = tel;
		this.authority=authority;
		this.enabled = enabled;
	}



	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", name=" + name + ", nickName=" + nickName + ", tel="
				+ tel + ", authority=" + authority + ", enabled=" + enabled + "]";
	}
	


	
}
