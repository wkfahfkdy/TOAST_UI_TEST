package co.kjm.gridPrj.vo;

public class GridVO {
	
	private String fileId;
	private String career;
	private String age;
	private String salary_desired;
	
	public String getFileId() {
		return fileId;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getSalary_desired() {
		return salary_desired;
	}
	public void setSalary_desired(String salary_desired) {
		this.salary_desired = salary_desired;
	}
	
	@Override
	public String toString() {
		return "GridVO [fileId=" + fileId + ", career=" + career + ", age=" + age + ", salary_desired=" + salary_desired
				+ "]";
	}
	
}
