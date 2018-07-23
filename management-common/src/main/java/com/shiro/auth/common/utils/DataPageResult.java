package com.shiro.auth.common.utils;

import java.io.Serializable;
import java.util.List;

public class DataPageResult<T> implements Serializable {
    private static final long serialVersionUID = 2072294810665039407L;
    private Integer page;
    private Long total;

    private List<T> rows;

    public DataPageResult(List<T> t, Integer page, Long total) {
        this.rows = t;
        this.page = page;
        this.total = total;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Long getTotal() {
        return total;
    }

    public void setTotal(Long total) {
        this.total = total;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> t) {
        this.rows = t;
    }
}