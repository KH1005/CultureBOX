package validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import culture.member.login.MemberModel;

public class MemberValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		// 유효성검사하려는 model이 Validation가능한지 여부를 확인하고 가능하면 검사시작
		return MemberModel.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		MemberModel member = (MemberModel)target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "MEMBER_ID", "MEMBER_ID");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "MEMBER_PASSWORD", "MEMBER_PASSWORD");
		
		// 비밀번호가 일치하지 않는다면
		if(member.getMEMBER_PASSWORD().equals(member.getMEMBER_PASSWORD2()) == false){
			errors.rejectValue("MEMBER_PASSWORD2", "MEMBER_PASSWORD2");
		}
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "MEMBER_NAME", "MEMBER_NAME");
		ValidationUtils.rejectIfEmpty(errors, "MEMBER_EMAIL", "MEMBER_EMAIL");
	}
	
}
