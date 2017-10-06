package com.shxt.modual.privilege.domain;

import java.util.List;

public class Privilege {
	private String id;
	private String name;
	private String url;
	private Integer level;
	private String parent_id;
	
	private List<Privilege> childs;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public String getParent_id() {
		return parent_id;
	}

	public void setParent_id(String parent_id) {
		this.parent_id = parent_id;
	}

	public List<Privilege> getChilds() {
		return childs;
	}

	public void setChilds(List<Privilege> childs) {
		this.childs = childs;
	}

	@Override
	public String toString() {
		return "Privilege [id=" + id + ", name=" + name + ", url=" + url + ", level=" + level + ", parent_id="
				+ parent_id + ", childs=" + childs + "]";
	}
	
	
}
