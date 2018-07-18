package team.swcome.donong.dto;

import javax.annotation.Resource;

@Resource
public class RentalDTO {
	
	private int num;		//�Խñ� ������ȣ
	private String title;	//�Խñ� ����
	private String address;	//������
	private String addr_do; //��
	private String addr_si;	//��
	private int price;		//�Ӵ��
	private String content;	//�Խñ� ����
	private int lat;		//����
	private int lng;		//�浵
	
	
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
	public String getAddr_do() {
		return addr_do;
	}
	public void setAddr_do(String addr_do) {
		this.addr_do = addr_do;
	}
	public String getAddr_si() {
		return addr_si;
	}
	public void setAddr_si(String addr_si) {
		this.addr_si = addr_si;
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
	public int getLat() {
		return lat;
	}
	public void setLat(int lat) {
		this.lat = lat;
	}
	public int getLng() {
		return lng;
	}
	public void setLng(int lng) {
		this.lng = lng;
	}

}
