package com.busticketbooking.model;

import java.util.Objects;

public class Operator {

	private int operatorId;
	private String operatorName;
	private String operatorEmail;
	private long operatorContact;
	private int operatorAge;
	private String operatorStatus;
	
	public Operator() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public Operator(int operatorId, String operatorName, String operatorEmail, long operatorContact,
			int operatorAge) {
		super();
		this.operatorId = operatorId;
		this.operatorName = operatorName;
		this.operatorEmail = operatorEmail;
		this.operatorContact = operatorContact;
		this.operatorAge = operatorAge;
	}



	public Operator(String operatorName, String operatorEmail, long operatorContact,int operatorAge) {
		super();
		this.operatorName = operatorName;
		this.operatorEmail = operatorEmail;
		this.operatorContact = operatorContact;
		this.operatorAge = operatorAge;
	}

	
	
	public Operator(int operatorId, String operatorName, String operatorEmail, long operatorContact, int operatorAge,
			String operatorStatus) {
		super();
		this.operatorId = operatorId;
		this.operatorName = operatorName;
		this.operatorEmail = operatorEmail;
		this.operatorContact = operatorContact;
		this.operatorAge = operatorAge;
		this.operatorStatus = operatorStatus;
	}



	public String getOperatorStatus() {
		return operatorStatus;
	}

	public void setOperatorStatus(String operatorStatus) {
		this.operatorStatus = operatorStatus;
	}



	public int getOperatorId() {
		return operatorId;
	}

	public String getOperatorName() {
		return operatorName;
	}

	public String getOperatorEmail() {
		return operatorEmail;
	}

	public long getOperatorContact() {
		return operatorContact;
	}

	public int getOperatorAge() {
		return operatorAge;
	}

	public void setOperatorId(int operatorId) {
		this.operatorId = operatorId;
	}

	public void setOperatorName(String operatorName) {
		this.operatorName = operatorName;
	}

	public void setOperatorEmail(String operatorEmail) {
		this.operatorEmail = operatorEmail;
	}

	public void setOperatorContact(long operatorContact) {
		this.operatorContact = operatorContact;
	}

	public void setOperatorAge(int operatorAge) {
		this.operatorAge = operatorAge;
	}

	@Override
	public String toString() {
		return "Operator [operatorId=" + operatorId + ", operatorName=" + operatorName + ", operatorEmail="
				+ operatorEmail + ", operatorContact=" + operatorContact + ", operatorAge=" + operatorAge + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(operatorAge, operatorContact, operatorEmail, operatorId, operatorName);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Operator other = (Operator) obj;
		return operatorAge == other.operatorAge && operatorContact == other.operatorContact
				&& Objects.equals(operatorEmail, other.operatorEmail) && operatorId == other.operatorId
				&& Objects.equals(operatorName, other.operatorName);
	}
	
	
	
	
	
}
