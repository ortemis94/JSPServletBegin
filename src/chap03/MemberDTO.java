package chap03;

import java.text.SimpleDateFormat;
import java.util.*;

public class MemberDTO {

	private String name;	// 성명
	private String jubun;	// 주민번호
	
	public MemberDTO() {}
	
	public MemberDTO(String name, String jubun) {
		this.name = name;
		this.jubun = jubun;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getJubun() {
		return jubun;
	}
	public void setJubun(String jubun) {
		this.jubun = jubun;
	}

	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	// 1. 성별을 알아오는 메서드 생성하기
	public String getGender() {
		
		String n = this.jubun.substring(6,7);
		
		if (n.equals("1") || n.equals("3")) { // 주민번호 7번째 자리가 1이거나 3이면
			return "남";
		}else {								  // 주민번호 7번째 자리가 1과 3이 아니면
			return "여";
		}
	}

	// 2. 나이를 알아오는 메서드 생성하기
	public int getAge() {
		
		// 현재년도를 알아와야 한다.
		/*
		Date now = new Date(); 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		int currentYear = Integer.parseInt(sdf.format(now));
		*/
		
		Calendar now = Calendar.getInstance(); // 현재날짜와 시간을 얻어온다.
		int currentYear = now.get(Calendar.YEAR); // 현재 년도를 얻어온다.
		/*
		String n = jubun.substring(6, 7); // 1 또는 2라면 1900년대 생, 
		     							  // 3 또는 4라면 2000년대생이다.
		 */
		int age = Integer.parseInt(this.jubun.substring(0,2)); // 주민번호에서 출생년도 2자리를 얻어오는 것이다.
		
	/*
		if (n.equals("1") || n.equals("2")) age += 1900; 
		else age += 2000;
	*/
		
		if (age < 50) age += 2000;
		else age += 1900;
		
		return currentYear - age + 1;
	}
	
}
