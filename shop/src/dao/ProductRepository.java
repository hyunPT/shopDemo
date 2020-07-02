package dao;

import java.util.ArrayList;

import dto.Product;

public class ProductRepository {
	private ArrayList<Product> Top = new ArrayList<Product>();
	private ArrayList<Product> Pants = new ArrayList<Product>();
	private ArrayList<Product> Outer = new ArrayList<Product>();
	private ArrayList<Product> Shose = new ArrayList<Product>();
	private ArrayList<Product> Accessories = new ArrayList<Product>();
	
	
	private static ProductRepository instance = new ProductRepository();
	
	/*
	 * public ProductRepository() { Product top1 = new Product("P1000","상의1",15000);
	 * top1.setDescription("상의1 상품설명"); top1.setCategory("top"); top1.setUnits(100);
	 * top1.setColor("3 color"); top1.setSize("2 size"); top1.setUnits(100);
	 * top1.setFilename("top_banner.jpg");
	 * 
	 * Product top2 = new Product("P1002","상의2",13000);
	 * top2.setDescription("상의2 상품설명"); top2.setCategory("top"); top2.setUnits(100);
	 * top2.setColor("3 color"); top2.setSize("2 size"); top2.setUnits(100);
	 * top2.setFilename("top_banner.jpg");
	 * 
	 * Product top3 = new Product("P1003","상의3",10000);
	 * top3.setDescription("상의3 상품설명"); top3.setCategory("top"); top3.setUnits(100);
	 * top3.setColor("3 color"); top3.setSize("2 size"); top3.setUnits(100);
	 * top3.setFilename("top_banner.jpg");
	 * 
	 * Product top4 = new Product("P1004","상의4",8000);
	 * top4.setDescription("상의4 상품설명"); top4.setCategory("top");
	 * top4.setUnitsInStock(100); top4.setColor("3 color"); top4.setSize("2 size");
	 * top4.setUnits(100); top4.setFilename("top_banner.jpg");
	 * 
	 * 
	 * 
	 * Product pants1 = new Product("P2000","하의1",15000);
	 * pants1.setDescription("하의1 상품설명"); pants1.setCategory("pants");
	 * pants1.setUnitsInStock(100); pants1.setColor("2 color");
	 * pants1.setSize("2 size"); pants1.setUnits(110);
	 * pants1.setFilename("pants_banner.jpg");
	 * 
	 * Product pants2 = new Product("P2002","하의2",13000);
	 * pants2.setDescription("하의2 상품설명"); pants2.setCategory("pants");
	 * pants2.setUnitsInStock(100); pants2.setColor("2 color");
	 * pants2.setSize("2 size"); pants2.setUnits(110);
	 * pants2.setFilename("pants_banner.jpg");
	 * 
	 * Product pants3 = new Product("P2003","하의4",10000);
	 * pants3.setDescription("하의4 상품설명"); pants3.setCategory("pants");
	 * pants3.setUnitsInStock(100); pants3.setColor("2 color");
	 * pants3.setSize("2 size"); pants3.setUnits(110);
	 * pants3.setFilename("pants_banner.jpg");
	 * 
	 * Product pants4 = new Product("P2004","하의4",8000);
	 * pants4.setDescription("상의4 상품설명"); pants4.setCategory("pants");
	 * pants4.setUnitsInStock(100); pants4.setColor("2 color");
	 * pants4.setSize("2 size"); pants4.setUnits(110);
	 * pants4.setFilename("pants_banner.jpg");
	 * 
	 * 
	 * 
	 * 
	 * Product outer1 = new Product("P3000","겉옷",15000);
	 * outer1.setDescription("겉옷 상품설명"); outer1.setCategory("outer");
	 * outer1.setUnitsInStock(100); outer1.setColor("4 color");
	 * outer1.setSize("3 size"); outer1.setUnits(120);
	 * outer1.setFilename("outer_banner.jpg");
	 * 
	 * Product outer2 = new Product("P3002","겉옷2",13000);
	 * outer2.setDescription("겉옷2 상품설명"); outer2.setCategory("outer");
	 * outer2.setUnitsInStock(100); outer2.setColor("4 color");
	 * outer2.setSize("2 size"); outer2.setUnits(120);
	 * outer2.setFilename("outer_banner.jpg");
	 * 
	 * Product outer3 = new Product("P3003","겉옷3",10000);
	 * outer3.setDescription("겉옷3 상품설명"); outer3.setCategory("outer");
	 * outer3.setUnitsInStock(100); outer3.setColor("4 color");
	 * outer3.setSize("2 size"); outer3.setUnits(120);
	 * outer3.setFilename("outer_banner.jpg");
	 * 
	 * Product outer4 = new Product("P3004","겉옷4",8000);
	 * outer4.setDescription("겉옷4 상품설명"); outer4.setCategory("outer");
	 * outer4.setUnitsInStock(100); outer4.setColor("4 color");
	 * outer4.setSize("2 size"); outer4.setUnits(120);
	 * outer4.setFilename("outer_banner.jpg");
	 * 
	 * 
	 * 
	 * 
	 * Product shose1 = new Product("P4000","신발",15000);
	 * shose1.setDescription("신발 상품설명"); shose1.setCategory("shose");
	 * shose1.setUnitsInStock(100); shose1.setColor("1 color");
	 * shose1.setSize("1 size"); shose1.setUnits(130);
	 * shose1.setFilename("shose_banner.jpg");
	 * 
	 * Product shose2 = new Product("P4002","신발2",13000);
	 * shose2.setDescription("신발2 상품설명"); shose2.setCategory("shose");
	 * shose2.setUnitsInStock(100); shose2.setColor("1 color");
	 * shose2.setSize("1 size"); shose2.setUnits(130);
	 * shose2.setFilename("shose_banner.jpg");
	 * 
	 * Product shose3 = new Product("P4003","신발3",10000);
	 * shose3.setDescription("신발3 상품설명"); shose3.setCategory("shose");
	 * shose3.setUnitsInStock(100); shose3.setColor("1 color");
	 * shose3.setSize("1 size"); shose3.setUnits(130);
	 * shose3.setFilename("shose_banner.jpg");
	 * 
	 * Product shose4 = new Product("P4004","신발4",8000);
	 * shose4.setDescription("신발4 상품설명"); shose4.setCategory("shose");
	 * shose4.setUnitsInStock(100); shose4.setColor("1 color");
	 * shose4.setSize("1 size"); shose4.setUnits(130);
	 * shose4.setFilename("shose_banner.jpg");
	 * 
	 * 
	 * 
	 * Product accessories1 = new Product("P5000","악세서리",15000);
	 * accessories1.setDescription("악세서리 상품설명");
	 * accessories1.setCategory("accessories"); accessories1.setUnitsInStock(100);
	 * accessories1.setColor("5 color"); accessories1.setSize("4 size");
	 * accessories1.setUnits(140);
	 * accessories1.setFilename("accessories_banner.jpg");
	 * 
	 * Product accessories2 = new Product("P5002","악세서리2",13000);
	 * accessories2.setDescription("악세서리2 상품설명");
	 * accessories2.setCategory("accessories"); accessories2.setUnitsInStock(100);
	 * accessories2.setColor("5 color"); accessories2.setSize("4 size");
	 * accessories2.setUnits(140);
	 * accessories2.setFilename("accessories_banner.jpg");
	 * 
	 * Product accessories3 = new Product("P5003","악세서리3",10000);
	 * accessories3.setDescription("악세서리3 상품설명");
	 * accessories3.setCategory("accessories"); accessories3.setUnitsInStock(100);
	 * accessories3.setColor("5 color"); accessories3.setSize("4 size");
	 * accessories3.setUnits(140);
	 * accessories3.setFilename("accessories_banner.jpg");
	 * 
	 * Product accessories4 = new Product("P4004","악세서리4",8000);
	 * accessories4.setDescription("악세서리4 상품설명");
	 * accessories4.setCategory("accessories"); accessories4.setUnitsInStock(100);
	 * accessories4.setColor("5 color"); accessories4.setSize("4 size");
	 * accessories4.setUnits(140);
	 * accessories4.setFilename("accessories_banner.jpg");
	 * 
	 */
		
		
		
		
		/*
		 * Top.add(top1); Top.add(top2); Top.add(top3); Top.add(top4);
		 */
		
		/*
		 * Pants.add(pants1); Pants.add(pants2); Pants.add(pants3); Pants.add(pants4);
		 * 
		 * Outer.add(outer1); Outer.add(outer2); Outer.add(outer3); Outer.add(outer4);
		 * 
		 * Shose.add(shose1); Shose.add(shose2); Shose.add(shose3); Shose.add(shose4);
		 * 
		 * Accessories.add(accessories1); Accessories.add(accessories2);
		 * Accessories.add(accessories3); Accessories.add(accessories4);
		 */
		
		
	/* } */
	
	
	public ArrayList<Product> getTopProduct(){
		return Top;
	}
	public ArrayList<Product> getPantsProduct(){
		return Pants;
	}
	public ArrayList<Product> getOuterProduct(){
		return Outer;
	}
	public ArrayList<Product> getShoseProduct(){
		return Shose;
	}
	public ArrayList<Product> getAccessoriesProduct(){
		return Accessories;
	}
	
	
	
	public Product getProductById(String productId) {
		Product productById = null;
		
		if(productId.substring(0,2).equals("P1")) {
			for(int i=0; i<Top.size(); i++ ) {
				Product top = Top.get(i);
				if(top != null && top.getProductId()!= null && top.getProductId().contentEquals(productId)) {
					productById = top;
					break;
				}
			}
		}
		
		else if(productId.substring(0,2).equals("P2")) {
			for(int i=0; i<Pants.size(); i++ ) {
				Product pants = Pants.get(i);
				if(pants != null && pants.getProductId()!= null && pants.getProductId().contentEquals(productId)) {
					productById = pants;
					break;
				}
			}
		}
		
		else if(productId.substring(0,2).equals("P3")) {
			for(int i=0; i<Outer.size(); i++ ) {
				Product outer = Outer.get(i);
				if(outer != null && outer.getProductId()!= null && outer.getProductId().contentEquals(productId)) {
					productById = outer;
					break;
				}
			}
		}
		
		else if(productId.substring(0,2).equals("P4")) {
			for(int i=0; i<Shose.size(); i++ ) {
				Product shose = Shose.get(i);
				if(shose != null && shose.getProductId()!= null && shose.getProductId().contentEquals(productId)) {
					productById = shose;
					break;
				}
			}
		}
		
		else if(productId.substring(0,2).equals("P5")) {
			for(int i=0; i<Accessories.size(); i++ ) {
				Product accessories = Accessories.get(i);
				if(accessories != null && accessories.getProductId()!= null && accessories.getProductId().contentEquals(productId)) {
					productById = accessories;
					break;
				}
			}
		}
		
		
		return productById;
	}
	
	public static ProductRepository getInstance() {
		return instance;
	}
	public void addProduct(Product product) {
		if(product.getProductId().substring(0, 2).equals("P1")) {
			Top.add(product);
		}
		else if(product.getProductId().substring(0, 2).equals("P2")) {
			Pants.add(product);
		}
		else if(product.getProductId().substring(0, 2).equals("P3")) {
			Outer.add(product);
		}
		else if(product.getProductId().substring(0, 2).equals("P4")) {
			Shose.add(product);
		}
		else if(product.getProductId().substring(0, 2).equals("P5")) {
			Accessories.add(product);
		}
		
	}
}
	
	

