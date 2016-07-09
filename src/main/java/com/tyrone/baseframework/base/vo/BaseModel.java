package com.tyrone.baseframework.base.vo;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.Transient;

@MappedSuperclass
public class BaseModel implements Serializable {
    private static final long serialVersionUID = 1L;
    public static final String DEL_FLAG_VALID = "1";
    public static final String DEL_FLAG_INVALID = "2";
    @Id
    private String uuid;

    private Integer status;

    private String createTime;

    private String createUserId;
    
    private String deleteTime;
    
    private String deleteUserId;
    
    private String remarks;
    @Transient
    private Map<String, Integer> mapCondition = new HashMap<String, Integer>();
    @Transient
    private String sortName = "uuid";

    @Transient
    private String sortType = "desc";

    public BaseModel() {
    }

    public String getSortName() {
        return this.sortName;
    }

    public void setSortName(String sortName) {
        this.sortName = sortName;
    }

    public String getSortType() {
        return this.sortType;
    }

    public void setSortType(String sortType) {
        this.sortType = sortType;
    }

    public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getCreateUserId() {
		return createUserId;
	}

	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}

	public String getDeleteTime() {
		return deleteTime;
	}

	public void setDeleteTime(String deleteTime) {
		this.deleteTime = deleteTime;
	}

	public String getDeleteUserId() {
		return deleteUserId;
	}

	public void setDeleteUserId(String deleteUserId) {
		this.deleteUserId = deleteUserId;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getUuid() {
        return this.uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public Map<String, Integer> getMapCondition() {
        return mapCondition;
    }

    public void setMapCondition(Map<String, Integer> mapCondition) {
        this.mapCondition = mapCondition;
    }

    public int hashCode() {
        int result = 1;
        result = 31 * result + (this.uuid == null ? 0 : this.uuid.hashCode());
        return result;
    }

    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        BaseModel other = (BaseModel) obj;
        if (this.uuid == null) {
            if (other.uuid != null)
                return false;
        } else if (!this.uuid.equals(other.uuid))
            return false;
        return true;
    }

	@Override
	public String toString() {
		return "BaseModel [uuid=" + uuid + ", status=" + status
				+ ", createTime=" + createTime + ", createUserId="
				+ createUserId + ", deleteTime=" + deleteTime
				+ ", deleteUserId=" + deleteUserId + ", remarks=" + remarks
				+ ", mapCondition=" + mapCondition + ", sortName=" + sortName
				+ ", sortType=" + sortType + "]";
	}

   
}
