package team.swcome.donong.dto;



import javax.annotation.Resource;


@Resource
public class RentalDTO {
	
	private int num;		//κ²μκΈ? κ³ μ λ²νΈ
	private int member_num;	//??±? κ³ μ λ²νΈ
	private String writer;	//κ²μκΈ? ??±? ?΄λ¦?
	private String title;	//κ²μκΈ? ? λͺ?
	private String address;	//??¬μ§?
	private int sido; 		//?
	private int sigungu;	//?
	private int area;		//λ©΄μ 
	private int price;		//???λ£?
	private String content;	//κ²μκΈ? ?΄?©
	private float lat;		//??
	private float lng;		//κ²½λ
	private String path;	//????΄λ―Έμ? κ²½λ‘

	
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public int getArea() {
		return area;
	}
	public void setArea(int area) {
		this.area = area;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getSido() {
		return sido;
	}
	public void setSido(int sido) {
		this.sido = sido;
	}
	public int getSigungu() {
		return sigungu;
	}
	public void setSigungu(int sigungu) {
		this.sigungu = sigungu;
	}
	public float getLat() {
		return lat;
	}
	public void setLat(float lat) {
		this.lat = lat;
	}
	public float getLng() {
		return lng;
	}
	public void setLng(float lng) {
		this.lng = lng;
	}
	

}
