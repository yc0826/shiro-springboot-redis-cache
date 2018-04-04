package com.babysky.management.common.utils;

import java.io.Serializable;
import java.util.List;

/**
 * dataTable返回对象<br>
 * 〈功能详细描述〉
 *
 * @author
 * @see [相关类/方法]（可选）
 * @since [产品/模块版本] （可选）
 */
public class DataTableResponse<T> implements Serializable {
    /**
     * 返回数据
     */
    private List<T> aaData;
    /**
     * 请求标识
     */
    private int sEcho;
    /**
     * 数据库中总共有多少条
     */
    private int iTotalRecords;
    /**
     * 数据库中查询过滤后有多少条记录,和iTotalRecords设置为相同
     */
    private int iTotalDisplayRecords;

    /**
     * 错误代码
     */
    private int code;
    /**
     * 错误信息
     */
    private String msg;

    public DataTableResponse() {
    }

    public DataTableResponse(int sEcho) {
        this.sEcho = sEcho;
    }

    public DataTableResponse(int sEcho, PaginationResult<T> prs) {
        this.sEcho = sEcho;
        this.aaData = prs.getRows();// 设置列表数据
        this.iTotalDisplayRecords = (int) prs.getTotal();// 设置总记录条数
        this.iTotalRecords = (int) prs.getTotal();// 设置总记录条数
    }

    public DataTableResponse(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public List<T> getAaData() {
        return aaData;
    }

    public void setAaData(List<T> aaData) {
        this.aaData = aaData;
    }

    public int getsEcho() {
        return sEcho;
    }

    public void setsEcho(int sEcho) {
        this.sEcho = sEcho;
    }

    public int getiTotalRecords() {
        return iTotalRecords;
    }

    public void setiTotalRecords(int iTotalRecords) {
        this.iTotalRecords = iTotalRecords;
    }

    public int getiTotalDisplayRecords() {
        return iTotalDisplayRecords;
    }

    public void setiTotalDisplayRecords(int iTotalDisplayRecords) {
        this.iTotalDisplayRecords = iTotalDisplayRecords;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
