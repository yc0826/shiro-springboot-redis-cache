package com.platform.service.impl.auth;

import com.platform.api.auth.entity.App;
import com.platform.api.auth.service.AppService;
import com.platform.web.dao.auth.IAppDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @ClassName: AppServiceImpl
 * @Description: 应用
 */
@Service("appService")
public class AppServiceImpl implements AppService {

   /* @Autowired
    private AppDao appDao;*/

    @Autowired
    private IAppDao appDao;

    public App createApp(App app) {
        appDao.insertSelective(app);
        return app;
    }

    public App updateApp(App app) {
        appDao.updateByPrimaryKeySelective(app);
        return app;
    }

    public void deleteApp(Long appId) {
        appDao.deleteByPrimaryKey(appId);
    }

    @Override
    public App findOne(Long appId) {
        return appDao.selectByPrimaryKey(appId);

    }

    @Override
    public List<App> findAll() {
        return appDao.selectAll();
    }


    @Override
    public List<App> findPage(Map<String, Object> p) {
        return appDao.selectPage(p);
    }

    @Override
    public Long findAppIdByAppKey(String appKey) {
        return appDao.selectAppIdByAppKey(appKey);
    }
}
