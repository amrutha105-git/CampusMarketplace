package com.campus.dto;

public class Profile {
	
	private Integer profileId;
	
	private Integer userId;
	
	private String firstName;
	
	private String lastName;
	
	private long phNo;
	
	private String gender;
	
	private String profileImage;

	public Integer getProfileId() {
		return profileId;
	}

	public void setProfileId(Integer profileId) {
		this.profileId = profileId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public long getPhNo() {
		return phNo;
	}

	public void setPhNo(long phNo) {
		this.phNo = phNo;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}

	@Override
	public String toString() {
		return "Profile [profileId=" + profileId + ", userId=" + userId + ", firstName=" + firstName + ", lastName="
				+ lastName + ", phNo=" + phNo + ", gender=" + gender + ", profileImage=" + profileImage + "]";
	}
}
