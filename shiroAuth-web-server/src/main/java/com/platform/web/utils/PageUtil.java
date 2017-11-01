package com.platform.web.utils;

/**
 * @ClassName: PageUtil
 * @Description: 分页
 */
public class PageUtil {
    public static final int pageSize = 10;//每页条数

    public static int initPageParmMap(int pageNo) {
        return (pageNo - 1) * pageSize;
    }

    public static Integer initPageCount(Integer count) {
        return (count + pageSize - 1) / pageSize;

    }
}
