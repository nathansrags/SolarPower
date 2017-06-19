package com.solarpower.presentation.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "SECURITY_ROLE")
public class SecurityRole {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "SECURITY_ROLE_ID", unique = true, nullable = false)
	//@OneToMany(fetch = FetchType.LAZY, mappedBy = "USER_ROLES")
	private long security_role_id;

	@Column(name = "SECURITY_ROLE_NM", unique = true, length = 45)
	private String security_role_nm;

	@Column(name = "SECURITY_ROLE_CD", unique = true, length = 45)
	private String security_role_cd;

	@Column(name = "SECURITY_ROLE_TYPE", nullable = false, length = 90)
	private String security_role_desc;

	public long getSecurity_role_id() {
		return security_role_id;
	}

	public void setSecurity_role_id(long security_role_id) {
		this.security_role_id = security_role_id;
	}

	public String getSecurity_role_nm() {
		return security_role_nm;
	}

	public void setSecurity_role_nm(String security_role_nm) {
		this.security_role_nm = security_role_nm;
	}

	public String getSecurity_role_cd() {
		return security_role_cd;
	}

	public void setSecurity_role_cd(String security_role_cd) {
		this.security_role_cd = security_role_cd;
	}

	public String getSecurity_role_desc() {
		return security_role_desc;
	}

	public void setSecurity_role_desc(String security_role_desc) {
		this.security_role_desc = security_role_desc;
	}

}
