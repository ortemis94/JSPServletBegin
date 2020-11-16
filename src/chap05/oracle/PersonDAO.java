package chap05.oracle;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class PersonDAO implements InterPersonDAO {

	private DataSource ds; // DataSource ds는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public PersonDAO() {
		try {
			Context initContext = new InitialContext();
		    Context envContext  = (Context)initContext.lookup("java:/comp/env");
		    ds = (DataSource)envContext.lookup("jdbc/jspbegin_oracle");
		}catch(NamingException e) {
			e.printStackTrace();
		}

	}// end of public PersonDAO() {}---------------------------------------------------
	
	private void close() {
	      try {
	         if(rs != null)    {rs.close(); rs=null;}
	         if(pstmt != null) {pstmt.close(); pstmt=null;}
	         if(conn != null)  {conn.close(); conn=null;}
	      } catch(SQLException e) {
	         e.printStackTrace();
	      }
	}// end of private void close() {}--------------------------------------
	
	
	// 개인성향을 입력해주는 추상메서드(미완성메서드) ==> INSERT
	@Override // 재정의
	public int personRegister(PersonDTO psdto) throws SQLException{
		
		int n = 0;
		
		try {
			conn = ds.getConnection();
			
			// conn.setAutoCommit(true); // 오토커밋(기본값)
			// conn.setAutoCommit(false); // 수동커밋
			
			String sql = " INSERT INTO tbl_person_interest(seq, name, school, color, food) "
					+ " VALUES(person_seq.NEXTVAL, ?, ?, ?, ?) ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, psdto.getName());
			pstmt.setString(2, psdto.getSchool());
			pstmt.setString(3, psdto.getColor());
			pstmt.setString(4, psdto.getStrFood());
			
			n = pstmt.executeUpdate();
			
		}finally {
			close();
		}
		
		return n;
	}// end of public int personRegister(PersonDTO psdto) throws SQLException{}------------------------

	
	// tbl_person_interest 테이블에 저장된 모든 행들을 select 해주는 메서드
	@Override
	public List<PersonDTO> selectALL() throws SQLException {

		List<PersonDTO> personList = new ArrayList<>();
		
		try {
			
			conn = ds.getConnection();
			
			String sql = "SELECT seq, name, school, color, food, to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS registerday\n"+
					"FROM tbl_person_interest\n"+
					"ORDER BY seq";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery(); // 조회되는 모든 행들이 rs에 담김.
			
			while(rs.next()) {
				PersonDTO psdto = new PersonDTO();
				
				psdto.setSeq(rs.getInt(1));
				psdto.setName(rs.getString(2));
				psdto.setSchool(rs.getString(3));
				psdto.setColor(rs.getString(4));
				psdto.setFood(rs.getString(5).split("\\, "));
				psdto.setRegisterday(rs.getString(6));
				
				personList.add(psdto);
			}// end of while(rs.next()) {}-------------------------------------------------------
	
		} finally {
			close();
		}
		return personList;
	}// end of public List<PersonDTO> selectALL() throws SQLException {}---------------------

	
	// tbl_person_interest 테이블에 저장된 특정 1개행만 select 해주는 메서드 
	@Override
	public PersonDTO selectOne(String seq) throws SQLException {

		PersonDTO psdto = null; // 만일 존재하지 않는 유저라면 null값으로 그대로 보내기 위해 null로 초기화.
		
		try {
			conn = ds.getConnection();
			
			String sql = "SELECT seq, name, school, color, food, to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS registerday\n"+
					"FROM tbl_person_interest\n"+
					"WHERE seq = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, seq);
			
			rs = pstmt.executeQuery(); // 조회되는 행이 rs에 담김.
			
			if(rs.next()) {
				psdto = new PersonDTO(); // 유저 정보가 존재한다면 PersonDTO 객체 생성. 
				
				psdto.setSeq(rs.getInt(1));
				psdto.setName(rs.getString(2));
				psdto.setSchool(rs.getString(3));
				psdto.setColor(rs.getString(4));
				psdto.setFood(rs.getString(5).split("\\, "));
				psdto.setRegisterday(rs.getString(6));
			}// end of while(rs.next()) {}-------------------------------------------------------

		} finally {
			close();
		}
		
		return psdto;
		
	}// end of public PersonDTO selectOne(String seq) throws SQLException {}--------------------

	
	// 등록된 개인성향을 수정하여 저장하는 메서드
	@Override
	public int personUpdate(PersonDTO psdto) throws SQLException {
		
		int n = 0;
		
		if (psdto != null) {
			
			try {
				conn = ds.getConnection();
				
				String sql = "UPDATE tbl_person_interest SET name=?, school=?, color=?, food=?\n"+
						"WHERE seq=?";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, psdto.getName());
				pstmt.setString(2, psdto.getSchool());
				pstmt.setString(3, psdto.getColor());
				pstmt.setString(4, psdto.getStrFood());
				pstmt.setInt(5, psdto.getSeq());
				
				n = pstmt.executeUpdate();
				
			} finally {
				close();
			}
			
		}// end of if (psdto != null) {}----------------------
		
		return n;
	}// end of public PersonDTO update(String seq) throws SQLException {}-----------------------------





}
