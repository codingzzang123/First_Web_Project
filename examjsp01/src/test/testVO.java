package test;

public class testVO {
	String name;
	String img;
	String imgcode;
	public testVO() {}
	public testVO(String name, String img, String imgcode) {
		super();
		this.name = name;
		this.img = img;
		this.imgcode = imgcode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getImgcode() {
		return imgcode;
	}
	public void setImgcode(String imgcode) {
		this.imgcode = imgcode;
	}
	
	
}
