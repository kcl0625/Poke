package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import config.Config;
import member.MemberDTO;

public class OrderDAO {
	Connection con = null;
	String sql = null;
	PreparedStatement pstmt = null;
	
	public void setOrder(String no, ArrayList<OrderDTO> orderArr, MemberDTO memberDto, String id, String date, String payment, String isPaid, int totPrice, String depositor, int week) {
		try {
			con = Config.getConnection();
			sql = "insert into poke.order(no, name, id, zip, add1, add2, tel, payment, totprice, ispaid, date, depositor, email) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, no);
			pstmt.setString(2, memberDto.getName());
			pstmt.setString(3, id);
			pstmt.setString(4, memberDto.getZip());
			pstmt.setString(5, memberDto.getAdd1());
			pstmt.setString(6, memberDto.getAdd2());
			pstmt.setString(7, memberDto.getTel());
			pstmt.setString(8, payment);
			pstmt.setInt(9, totPrice);
			pstmt.setString(10, isPaid);
			pstmt.setString(11, date);
			pstmt.setString(12, depositor);
			pstmt.setString(13, memberDto.getEmail());
			
			pstmt.executeUpdate();

			sql = "insert into ordereditem(no, type, name, ingre, day, quantity, price, week) values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			for(int i=0;i<orderArr.size();i++) {
				OrderDTO orderDto = orderArr.get(i);
				
				pstmt.setString(1, no);
				pstmt.setString(2, orderDto.getType());
				pstmt.setString(3, orderDto.getName());
				pstmt.setString(4, orderDto.getIngre());
				pstmt.setString(5, orderDto.getDay());
				pstmt.setInt(6, orderDto.getQuantity());
				pstmt.setInt(7, orderDto.getPrice());
				pstmt.setInt(8, week);
				
				pstmt.executeUpdate();
			}
			
			sql = "delete from poke.cart where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public OrderDTO getPokeOrder(String id) { //마이페이지에서 메뉴 주문 정보 불러오기
		OrderDTO pokeOrder = new OrderDTO();
		try {
			con = Config.getConnection();
			sql = "select * from ordereditem where type = 'poke' having no = (select no from poke.order where id = ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			ArrayList<ItemDTO> pokeArr = new ArrayList<ItemDTO>();
			
			while(rs.next()) {
				ItemDTO dto = new ItemDTO();
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getInt("price"));
				dto.setIngre(rs.getString("ingre"));
				dto.setDay(rs.getString("day"));
				pokeArr.add(dto);
				
				sql = "select name, filename from poke where name = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, rs.getString("name"));
				ResultSet rs2 = pstmt.executeQuery();
				
				while(rs2.next()) {
					if(rs.getString("name").equals(rs2.getString("name")))
						dto.setFilename(rs2.getString("filename"));
				}
				pokeOrder.setWeek(rs.getInt("week"));
			}
			pokeOrder.setPoke(pokeArr);
			rs.close();
			pstmt.close();
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return pokeOrder;
	}
	public ArrayList<ItemDTO> getEtcOrder(String id) {
		ArrayList<ItemDTO> etcArr = new ArrayList<ItemDTO>();
		try {
			con = Config.getConnection();
			sql = "select * from ordereditem where type = 'etc' having no = (select no from poke.order where id = ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ItemDTO dto = new ItemDTO();
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getInt("price"));
				dto.setQuantity(rs.getInt("quantity"));
				etcArr.add(dto);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return etcArr;
	}
}
