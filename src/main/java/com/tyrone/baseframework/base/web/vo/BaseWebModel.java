package com.tyrone.baseframework.base.web.vo;

import java.util.ArrayList;
import java.util.List;

public class BaseWebModel {
    private int pageShow = 2;

    private int nowPage = 1;

    private int totalNum = 0;

    private int totalPage = 1;

    private List rows = new ArrayList();

    public BaseWebModel() {
    }

    public int getFromNum() {
        return (getNowPage() - 1) * this.pageShow;
    }

    public List getRows() {
        return this.rows;
    }

    public void setRows(List rows) {
        this.rows = rows;
    }

    public int getPageShow() {
        return this.pageShow;
    }

    public void setPageShow(int pageShow) {
        this.pageShow = pageShow;
    }

    public int getNowPage() {
        if (this.nowPage <= 0) {
            this.nowPage = 1;
        }
        if (this.nowPage > getTotalPage()) {
            this.nowPage = getTotalPage();
        }
        return this.nowPage;
    }

    public void setNowPage(int nowPage) {
        this.nowPage = nowPage;
    }

    public int getTotalNum() {
        return this.totalNum;
    }

    public void setTotalNum(int totalNum) {
        this.totalNum = totalNum;
    }

    public int getTotalPage() {
        if (this.totalNum > 0) {
            return (int) Math.ceil(this.totalNum * 1.0D / this.pageShow);
        }
        return this.totalPage;
    }
}
