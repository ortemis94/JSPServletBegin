package chap05.oracle;

import java.sql.SQLException;
import java.util.List;

public interface InterPersonDAO {

	// 개인성향을 입력해주는 추상메서드(미완성메서드) ==> INSERT
	int personRegister(PersonDTO psdto) throws SQLException;

	// tbl_person_interest 테이블에 저장된 모든 행들을 select 해주는 메서드
	List<PersonDTO> selectALL() throws SQLException;

	// tbl_person_interest 테이블에 저장된 특정 1개행만 select 해주는 메서드 
	PersonDTO selectOne(String seq) throws SQLException;

	// 등록된 개인성향을 수정하여 저장하는 메서드
	int personUpdate(PersonDTO psdto) throws SQLException;
	
	
	
}
