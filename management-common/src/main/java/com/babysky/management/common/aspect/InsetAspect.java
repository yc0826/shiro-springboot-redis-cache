package com.babysky.management.common.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

/**
 * @ClassName: InsetAspect
 */
@Aspect
public class InsetAspect {

    @Before("execution(* com..service..*.insert*(..))")
    public void add(JoinPoint jp) throws Exception {
//        Object[] objects = jp.getArgs();
//        if (objects[0] instanceof BaseEntity) {
//            Date date = new Date();
//            ((BaseEntity) objects[0]).setFdid(UUID.getUUID());
//            ((BaseEntity) objects[0]).setCreatetime(date);
////			((BaseEntity) objects[0]).setCreatorid(UserUtil.getUserId());
//            ((BaseEntity) objects[0]).setUpdatetime(date);
////			((BaseEntity) objects[0]).setUpdatorid(UserUtil.getUserId());
//        }
    }

    @Before("execution(* com..service..*.update*(..))")
    public void update(JoinPoint jp) throws Exception {
//        Object[] objects = jp.getArgs();
//        if (objects[0] instanceof BaseEntity) {
//            Date date = new Date();
//            ((BaseEntity) objects[0]).setUpdatetime(date);
////			((BaseEntity) objects[0]).setUpdatorid(UserUtil.getUserId());
//        }
    }
}
