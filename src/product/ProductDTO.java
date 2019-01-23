package product;

public class ProductDTO {
	
	private String id;
	private String product_name;
	private String product_explain;
	private int price;
	
	public ProductDTO(String id, String product_name, String product_explain, int price) {
		super();
		this.id = id;
		this.product_name = product_name;
		this.product_explain = product_explain;
		this.price = price;
	}
	
	public ProductDTO() {
		super();
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_explain() {
		return product_explain;
	}
	public void setProduct_explain(String product_explain) {
		this.product_explain = product_explain;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
}//클래스 끝
