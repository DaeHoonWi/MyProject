package member.service;

import java.util.Map;

public class JoinRequest {
	
	private String id;
	private String name;
	private String password;
	private String confirmPassword;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	
	public boolean isPasswordEqualToConfirm(){							//password가 null이 아니고, password와 confirmPassword가 동일하면 true 리턴
		return password != null && password.equals(confirmPassword);
	}
	
	public void validate(Map<String, Boolean> errors){
		checkEmpty(errors, id, "id");
		checkEmpty(errors, name, "name");
		checkEmpty(errors, password, "password");
		checkEmpty(errors, confirmPassword, "confirmPassword");
		if(!errors.containsKey("confirmPassword")){					//confirmPassword가 포함하고 있는 errors값이 false일 경우(confirmPassword의 입력값이 있는경우)
			if(!isPasswordEqualToConfirm()){						//아래 반복문 실행
				errors.put("notMatch", Boolean.TRUE);				//
			}														//
		}															//
	}
	
	private void checkEmpty(Map<String, Boolean> errors, String value, String fieldName){	//value가 값이 없는 경우 errors맵 객체의 fieldName키에 TRUE를 값으로 추가한다.
		if(value == null || value.isEmpty())												//
			errors.put(fieldName, Boolean.TRUE);											//
	}
}
