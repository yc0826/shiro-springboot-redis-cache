package com.platform.api.auth.service;


import com.platform.api.auth.entity.Organization;

import java.util.List;

/**
 * @ClassName: OrganizationService
 * @Description: 组织
 */
public interface OrganizationService {


    Organization createOrganization(Organization organization);

    Organization updateOrganization(Organization organization);

    void deleteOrganization(Long organizationId);

    Organization findOne(Long organizationId);

    List<Organization> findAll();

    Object findAllWithExclude(Organization excludeOraganization);

    void move(Organization source, Organization target);
}
