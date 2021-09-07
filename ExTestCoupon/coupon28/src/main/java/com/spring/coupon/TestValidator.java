package com.spring.coupon;

import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.spring.coupon.domain.WriteDTO;


public class TestValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return WriteDTO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		System.out.println("validate()");
		WriteDTO dto = (WriteDTO)target;
		
		String name = dto.getName();
		String kind = dto.getKind();
		String sno = dto.getSno();
		boolean chk_kind = true;
		boolean chk_sno = true;
		
		if(kind.trim().equals("정기권") || kind.trim().equals("할인권")) {
			chk_kind = false;
		}
		if(Pattern.matches("^\\w{4}-\\w{2}-\\w{2}$", sno)) {
			chk_sno = false;
		}
		
		
		if(name == null || name.trim().isEmpty()) {
			System.out.println("쿠폰이름 에러 : 반드시 입력해 주세요");
			errors.rejectValue("name", "emptyName");
		} 
		if (name.trim().length() > 15) {
			System.out.println("쿠폰이름 에러 : 15자 이내로 입력해 주세요");
			errors.rejectValue("name", "tooLongName");
		}
		
		if(chk_kind) {
			System.out.println("쿠폰 종류 에러 : [정기권], [할인권] 중에서 입력해 주세요");
			errors.rejectValue("kind", "kindError");
		}
		if(chk_sno) {
			System.out.println("쿠폰 일련번호 에러 : ####-##-## 형식으로 입력해 주세요 (알파벳, 숫자)");
			errors.rejectValue("sno", "snoError");
		}
		
		

	}

}
