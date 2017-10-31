package com.platform.service.impl.auth;

import com.platform.api.auth.service.OrganizationService;
import com.platform.dao.auth.IOrganizationDao;
import com.platform.api.auth.entity.Organization;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName: OrganizationServiceImpl
 * @Description: 组织
 */
@Service("organizationService")
public class OrganizationServiceImpl implements OrganizationService {
    /* @Autowired
     private OrganizationDao organizationDao;*/
    @Autowired
    private IOrganizationDao organizationDao;

    @Override
    public Organization createOrganization(Organization organization) {
        organizationDao.insertSelective(organization);
        return organization;
    }

    @Override
    public Organization updateOrganization(Organization organization) {
        organizationDao.updateByPrimaryKeySelective(organization);
        return organization;
    }

    @Override
    public void deleteOrganization(Long id) {
        organizationDao.deleteByPrimaryKey(id);
    }

    @Override
    public Organization findOne(Long organizationId) {
        return organizationDao.selectByPrimaryKey(organizationId);
    }

    @Override
    public List<Organization> findAll() {
        return organizationDao.selectAll();
    }

    @Override
    public List<Organization> findAllWithExclude(Organization excludeOraganization) {
        Map<String, Object> map = new HashMap<>();
        map.put("id", excludeOraganization.getId());
        map.put("parentIds", excludeOraganization.makeSelfAsParentIds());

        return organizationDao.selectAllWithExclude(map);
    }

    @Override
    public void move(Organization source, Organization target) {
        Map<String, Object> mapOne = new HashMap<>();
        mapOne.put("parentId", target.getId());
        mapOne.put("parentIds", target.getParentIds());
        mapOne.put("id", source.getId());
        organizationDao.moveStepOne(mapOne);

        Map<String, Object> mapTwo = new HashMap<>();
        mapTwo.put("targetParentIds", target.makeSelfAsParentIds());
        mapTwo.put("sourceParentIds", source.makeSelfAsParentIds());
        organizationDao.moveStepTwo(mapTwo);

    }
}
