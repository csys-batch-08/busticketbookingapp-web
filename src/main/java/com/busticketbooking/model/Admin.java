package com.busticketbooking.model;

import java.util.Objects;

public class Admin {

	private int adminId;
	private String adminName;
	private long adminContact;
	private String adminPassword;
	private String adminEmail;
	
	public Admin() {
		super();
	}

	public Admin(String adminPassword, String adminEmail) {
		super();
		this.adminPassword = adminPassword;
		this.adminEmail = adminEmail;
	}


	public int getAdminId() {
		return adminId;
	}

	public String getAdminName() {
		return adminName;
	}

	public long getAdminContact() {
		return adminContact;
	}

	public String getAdminPassword() {
		return adminPassword;
	}

	public String getAdminEmail() {
		return adminEmail;
	}

	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public void setadminContact(long adminContact) {
		this.adminContact = adminContact;
	}

	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}

	public void setAdminEmail(String adminEmail) {
		this.adminEmail = adminEmail;
	}

	@Override
	public String toString() {
		return "Admin [adminId=" + adminId + ", adminName=" + adminName + ", adminContact=" + adminContact
				+ ", adminPassword=" + adminPassword + ", adminEmail=" + adminEmail + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(adminEmail, adminId, adminName, adminPassword, adminContact);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Admin other = (Admin) obj;
		return Objects.equals(adminEmail, other.adminEmail) && adminId == other.adminId
				&& Objects.equals(adminName, other.adminName) && Objects.equals(adminPassword, other.adminPassword)
				&& adminContact == other.adminContact;
	}

	
	
	
	
}
