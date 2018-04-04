package com.babysky.management.common.utils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.babysky.management.common.Constants;
import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.Map;

/**
 * @author YangChao
 */
public class BaiduMapUtil {

    public static Map<String, Object> getGpsInfoByGeocoding(String location, String city) {
        Map<String, Object> map = new HashMap<>(3);
        map.put("status", 1);
        try {
            String url = "http://api.map.baidu.com/geocoder/v2/";
            Map<String, String> param = new HashMap<>();
            param.put("address", location);
            if (StringUtils.hasText(city)) {
                param.put("city", city);
            }
            param.put("ret_coordtype", "gcj02ll");
            param.put("output", "json");
            param.put("ak", Constants.BAIDU_API_KEY);
            String json = HttpTookit.doGet(url, param);
            JSONObject obj = JSON.parseObject(json);
            map.put("status", obj.get("status"));
            if ("0".equals(obj.get("status").toString())) {
                JSONObject resultObj = obj.getJSONObject("result");
                JSONObject ponintObje = resultObj.getJSONObject("location");
                map.put("lng", ponintObje.get("lng"));
                map.put("lat", ponintObje.get("lat"));
                return map;
            }
        } catch (Exception e) {
            map.put("errorMsg", e.getMessage());
            return map;
        }
        return map;
    }

}
