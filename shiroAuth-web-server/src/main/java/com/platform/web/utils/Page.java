package com.platform.web.utils;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName: Page
 * @Description: 分页
 */
public class Page {

    private int pageNo = 1;//页码，默认是第一页
    private int pageSize = 10;//每页显示的记录数，默认是10
    private int totalRecord;//总记录数
    private int totalPage;//总页数
    private List results;//对应的当前页记录
    private Map<String, Object> params = new HashMap<>();//其他的参数我们把它分装成数个Map对象
    private HttpServletRequest request;//

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(int totalRecord) {
        this.totalRecord = totalRecord;
        int totalPage = totalRecord % pageSize == 0 ? totalRecord / pageSize : totalRecord / pageSize + 1;
        this.setTotalPage(totalPage);
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public List getResults() {
        return results;
    }

    public void setResults(List results) {
        this.results = results;
    }

    public Map<String, Object> getParams() {
        return params;
    }

    public void setParams(Map<String, Object> params) {
        this.params = params;
    }

    public HttpServletRequest getRequest() {
        return request;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    @Override
    public String toString() {
        return "Page [pageNo=" + pageNo + ", pageSize=" +
                pageSize + ", results=" + results +
                ", totalPage=" + totalPage +
                ", totalRecord=" + totalRecord + "]";
    }

}
