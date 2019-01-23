package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;
import com.sun.org.apache.regexp.internal.recompile;

import product.DBConnectionMgr;

public class ProductDAO {

	DBConnectionMgr pool;
	Connection con;
	PreparedStatement ps;
	
	public ProductDAO() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public int insert(ProductDTO dto) {
		int rn = 0;
		try {
			con = pool.getConnection();
			String sql = "insert into product values(?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getProduct_name());
			ps.setString(3, dto.getProduct_explain());
			ps.setInt(4, dto.getPrice());
		
			
			rn = ps.executeUpdate();
			pool.freeConnection(con, ps);
			System.out.println(rn + "인서트성공");
			return rn;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(rn + "인서트실패");
			return rn;
		}
	}//상품등록 메서드 끝
	
	
	public int update(ProductDTO dto) {
		int rn = 0;
		try {
			con = pool.getConnection();
			String sql = "update product set product_explain =? , price = ? where id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getProduct_explain());
			ps.setInt(2, dto.getPrice());
			ps.setString(3, dto.getId());
			
			rn = ps.executeUpdate();
			pool.freeConnection(con, ps);
			System.out.println(rn + "업데이트성공");
			return rn;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(rn + "업데이트실패");
			return rn;
		}
	}//업데이트 메서드 끝
	
	
	public ArrayList<ProductDTO> select(String id) {
		try {
			con = pool.getConnection();
			String sql = "select * from product where id";
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			ArrayList<ProductDTO> list = new ArrayList<>();
			
			rs.next();
			id = rs.getString("id");
			String product_name = rs.getString("product_name");
			String product_explain = rs.getString("product_explain");
			int price = Integer.parseInt(rs.getString("price"));
			ProductDTO dto = new ProductDTO(id, product_name, product_explain, price);
			list.add(dto);
			
			
			pool.freeConnection(con, ps ,rs);
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}//아이디를 통한상품검색 메서드 끝
	
	public ArrayList<ProductDTO> selectAll() {
		try {
			con = pool.getConnection();
			String sql = "select * from product where id";
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			ArrayList<ProductDTO> list = new ArrayList<>();
			
			while(rs.next()){;
			String id = rs.getString("id");
			String product_name = rs.getString("product_name");
			String product_explain = rs.getString("product_explain");
			int price = Integer.parseInt(rs.getString("price"));
			ProductDTO dto = new ProductDTO(id, product_name, product_explain, price);
			list.add(dto);
			}
			
			pool.freeConnection(con, ps ,rs);
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}//아이디를 통한상품검색 메서드 끝
	
	public int delete(String id) {
		int rn = 0;
		try {
			con = pool.getConnection();
			String sql = "delete from product where id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rn = ps.executeUpdate();
			
			System.out.println(rn + "딜리트성공");
			return rn;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(rn + "딜리트실패");
			return rn;
		}
	}
	
	
	
}//클래스 끝
