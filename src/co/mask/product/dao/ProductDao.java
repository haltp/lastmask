package co.mask.product.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import co.mask.cart.vo.CartVo;
import co.mask.common.DAO;
import co.mask.product.vo.ProductVo;


public class ProductDao extends DAO{
	private PreparedStatement psmt;
	private ResultSet rs;
	
	//상품 전체조회
	public ArrayList<ProductVo> selectList() {
		ArrayList<ProductVo> list = new ArrayList<ProductVo>();
		ProductVo vo;
		
		String sql = "SELECT * FROM PRODUCT ORDER BY PRODUCTNUM DESC";
		try {
			psmt=conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				vo=new ProductVo();
				vo.setProductNum(rs.getInt("productNum"));
				vo.setProductName(rs.getString("productName"));
				vo.setProductQunt(rs.getInt("productQunt"));
				vo.setProductPrice(rs.getInt("productPrice"));
				vo.setProductSeller(rs.getString("productSeller"));
				vo.setImage(rs.getString("image"));
				list.add(vo);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}
	
	//best상품조회
	public ArrayList<ProductVo> selectBest() {
		ArrayList<ProductVo> list = new ArrayList<ProductVo>();
		ProductVo vo;
		
		String sql = "select * from(select * from sellchart s, product p where s.CHARTPRODUCTNUM = p.PRODUCTNUM  order by s.CHARTPRODUCTQUNT desc) where rownum <=4";
		try {
			psmt=conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				vo=new ProductVo();
				vo.setProductNum(rs.getInt("productNum"));
				vo.setProductName(rs.getString("productName"));
				vo.setProductQunt(rs.getInt("productQunt"));
				vo.setProductPrice(rs.getInt("productPrice"));
				vo.setProductSeller(rs.getString("productSeller"));
				vo.setImage(rs.getString("image"));
				list.add(vo);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}
	
	//판매자 상품조회
		public ArrayList<ProductVo> selectList2(ProductVo vo) {
			ArrayList<ProductVo> list = new ArrayList<ProductVo>();
			
			
			String sql = "SELECT * FROM PRODUCT where productseller=? ORDER BY PRODUCTNUM";
			try {
				psmt=conn.prepareStatement(sql);
				psmt.setString(1, vo.getMemberId());
				rs = psmt.executeQuery();
				while (rs.next()) {
					vo=new ProductVo();
					vo.setProductNum(rs.getInt("productNum"));
					vo.setProductName(rs.getString("productName"));
					vo.setProductQunt(rs.getInt("productQunt"));
					vo.setProductPrice(rs.getInt("productPrice"));
					vo.setProductSeller(rs.getString("productSeller"));
					vo.setImage(rs.getString("image"));
					list.add(vo);
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return list;
		}
		
	
	
	//상품 한건 조회
	public ProductVo select(ProductVo vo) {
		String sql = "SELECT* FROM PRODUCT WHERE PRODUCTNUM=?";
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setInt(1, vo.getProductNum());
			rs = psmt.executeQuery();
			if (rs.next()) {
				vo.setProductNum(rs.getInt("productNum"));
				vo.setProductName(rs.getString("productName"));
				vo.setProductQunt(rs.getInt("productQunt"));
				vo.setProductPrice(rs.getInt("productPrice"));
				vo.setProductSeller(rs.getString("productSeller"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
		
	
	//판매자 상품 등록
		public int insert(ProductVo vo) {
			int n=0;
			String sql="INSERT INTO PRODUCT VALUES(SEQ_PRODUCT.NEXTVAL,?,?,?,?,?)";
			
			try {
				psmt=conn.prepareStatement(sql);
				psmt.setString(1, vo.getProductName());
				psmt.setInt(2, vo.getProductQunt());
				psmt.setInt(3, vo.getProductPrice());
				psmt.setString(4, vo.getProductSeller());
				psmt.setString(5, vo.getImage());
				n=psmt.executeUpdate();
				
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return n;	
		}
	
	//판매자 상품 수정
	public int update(ProductVo vo) {
		int n=0;
		String sql="UPDATE PRODUCT SET PRODUCTNAME=?, PRODUCTQUNT=?, PRODUCTPRICE=? WHERE PRODUCTNUM=?";
		
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, vo.getProductName());
			psmt.setInt(2, vo.getProductQunt());
			psmt.setInt(3, vo.getProductPrice());
			psmt.setInt(4, vo.getProductNum());
			n=psmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return n;	
	}
	
	
	//판매자 상품 삭제
	public int delete(ProductVo vo) {
		int n=0;
		String sql="DELETE FROM PRODUCT WHERE PRODUCTSELLER IN ( SELECT M.MEMBERID FROM MEMBER M WHERE M.MEMBERID=?) AND PRODUCTNUM=?";
		
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, vo.getMemberId());
			psmt.setInt(2, vo.getProductNum());
			
			n=psmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return n;	
	}
	
	
	//관리자 상품 삭제
		public int deleteAdmin(ProductVo vo) {
			int n=0;
			String sql="";
			
			return n;
			
			
			
		}
	
		
		//재고 수량 감소
		public int amountMinus(ProductVo vo) {
			//UPDATE BOOK SET BCOUNT=BCOUNT-1 WHERE BOOKCODE=?
			int n = 0;
			String sql = "UPDATE PRODUCT SET PRODUCTQUNT=PRODUCTQUNT-? WHERE PRODUCTNUM=?";
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, vo.getAmount());
				psmt.setInt(2, vo.getProductNum());
				
				n = psmt.executeUpdate();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}finally {
				close();
			}
			return n;
		} 
		
		//재고 수량 증가
		public int amountPlus (ProductVo vo) {
			//UPDATE BOOK SET BCOUNT=BCOUNT-1 WHERE BOOKCODE=?
			int n = 0;
			String sql = "UPDATE PRODUCT SET PRODUCTQUNT=PRODUCTQUNT+? WHERE PRODUCTNUM=?";
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, vo.getAmount());
				psmt.setInt(2, vo.getProductNum());
				
				n = psmt.executeUpdate();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}finally {
				close();
			}
			return n;
		} 
	
	public int productUpDown(ProductVo vo) { //갯수 증가 감소
	      int n=0;
	      String sql="UPDATE PRODUCT SET PRODUCTQUNT=? WHERE PRODUCTNUM=?";
	      
	      try {
	         psmt=conn.prepareStatement(sql);
	         psmt.setInt(1, vo.getProductQunt());
	         psmt.setInt(2, vo.getProductNum());
	         n=psmt.executeUpdate();
	      }catch(SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close();
	      }
	      
	      return n;   
	   }
	
	public void close() { //close 메소드
		try {
			if(rs != null) rs.close();
			if(psmt != null) psmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
