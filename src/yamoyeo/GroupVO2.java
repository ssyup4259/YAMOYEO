package yamoyeo;

import java.io.File;

import org.springframework.web.multipart.MultipartFile;

public class GroupVO2 {

	private String group_id;
	private String group_name;
	private String interest;
	private MultipartFile image;
	private String memo;
	private String address;
	private String day;
	private String create_date;
	private int max_member;
	private int now_member;
	private String state;
	private String user_id;
	
	public GroupVO2() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public String getGroup_id() {
		return group_id;
	}

	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}

	public String getGroup_name() {
		return group_name;
	}

	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}

	public String getInterest() {
		return interest;
	}

	public void setInterest(String interest) {
		this.interest = interest;
	}

	public String getImage() {
		return image.getOriginalFilename();
	}
	public void setImage(MultipartFile image) {
		this.image = image;
		
		if(!image.isEmpty()){
			File file =  new File("C:/Users/user/workspace/yamo_final/WebContent/groupImg/"+image.getOriginalFilename());
			
			try{
				image.transferTo(file);
			}
			catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getCreate_date() {
		return create_date;
	}

	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}

	public int getMax_member() {
		return max_member;
	}

	public void setMax_member(int max_member) {
		this.max_member = max_member;
	}

	public int getNow_member() {
		return now_member;
	}

	public void setNow_member(int now_member) {
		this.now_member = now_member;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "GroupVO [group_id=" + group_id + ", group_name=" + group_name + ", interest=" + interest + ", image="
				+ image + ", memo=" + memo + ", address=" + address + ", day=" + day + ", create_date=" + create_date
				+ ", max_member=" + max_member + ", now_member=" + now_member + ", state=" + state + ", user_id="
				+ user_id + "]";
	}

	
	
}
