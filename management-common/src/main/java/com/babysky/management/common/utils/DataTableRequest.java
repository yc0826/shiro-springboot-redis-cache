package com.babysky.management.common.utils;

/**
 * 分页查询页面请求对象<br>
 * 〈功能详细描述〉
 *
 * @author allways
 * @see [相关类/方法]（可选）
 * @since [产品/模块版本] （可选）
 */
public class DataTableRequest {
    /**
     * 请求标识
     */
    private int sEcho;
    /**
     * 每页开始数标
     */
    private int iDisplayStart;
    /**
     * 每页显示条数
     */
    private int iDisplayLength = 5;
    /**
     * 单排序列的下标
     */
    private int iSortCol_0;
    /**
     * 单排序列名
     */
    private String sortCol;
    /**
     * 单排序的方法
     */
    private String sSortDir_0;

    public int getsEcho() {
        return sEcho;
    }

    public void setsEcho(int sEcho) {
        this.sEcho = sEcho;
    }

    public int getiDisplayStart() {
        return iDisplayStart;
    }

    public void setiDisplayStart(int iDisplayStart) {
        this.iDisplayStart = iDisplayStart;
    }

    public int getiDisplayLength() {
        return iDisplayLength;
    }

    public void setiDisplayLength(int iDisplayLength) {
        this.iDisplayLength = iDisplayLength;
    }

    public int getiSortCol_0() {
        return iSortCol_0;
    }

    public void setiSortCol_0(int iSortCol_0) {
        this.iSortCol_0 = iSortCol_0;
    }

    public String getsSortDir_0() {
        return sSortDir_0;
    }

    public void setsSortDir_0(String sSortDir_0) {
        this.sSortDir_0 = sSortDir_0;
    }

    public int getCurrentPage() {
        if (this.getiDisplayLength() >= 1 && this.getiDisplayStart() >= 0) {
            return (this.getiDisplayStart() / this.getiDisplayLength()) + 1;
        } else {
            return 1;
        }
    }

    public void setCurrentPage(int currentPage) {
    }

    public String getSortCol() {
        return sortCol;
    }

    public void setSortCol(String sortCol) {
        this.sortCol = sortCol;
    }
}
