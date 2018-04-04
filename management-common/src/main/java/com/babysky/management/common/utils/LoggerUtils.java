package com.babysky.management.common.utils;

import com.alibaba.dubbo.common.utils.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 */
public class LoggerUtils {
    /**
     * 是否开启Debug
     */
    private static boolean isDebug = LogManager.getLogger(LoggerUtils.class).isDebugEnabled();

    /**
     * Debug 输出
     *
     * @param clazz   目标.Class
     * @param message 输出信息
     */
    public static void debug(Class<?> clazz, String message) {
        if (!isDebug) return;
        Logger logger = LogManager.getLogger(clazz);
        logger.debug(message);
    }

    /**
     * Debug 输出
     *
     * @param clazz     目标.Class
     * @param fmtString 输出信息key
     * @param value     输出信息value
     */
    public static void fmtDebug(Class<?> clazz, String fmtString, Object... value) {
        if (!isDebug) return;
        if (StringUtils.isBlank(fmtString)) {
            return;
        }
        if (null != value && value.length != 0) {
            fmtString = String.format(fmtString, value);
        }
        debug(clazz, fmtString);
    }

    /**
     * Error 输出
     *
     * @param clazz   目标.Class
     * @param message 输出信息
     * @param e       异常类
     */
    public static void error(Class<?> clazz, String message, Exception e) {
        String parentClass = getParentClass();
        Logger logger = LogManager.getLogger(clazz);
        if (null == e) {
            logger.error(parentClass + message);
            return;
        }
        logger.error(parentClass + message, e);
    }

    /**
     * Error 输出
     *
     * @param clazz   目标.Class
     * @param message 输出信息
     */
    public static void error(Class<?> clazz, String message) {
        error(clazz, message, null);
    }

    /**
     * 异常填充值输出
     *
     * @param clazz     目标.Class
     * @param fmtString 输出信息key
     * @param e         异常类
     * @param value     输出信息value
     */
    public static void fmtError(Class<?> clazz, Exception e, String fmtString, Object... value) {
        if (StringUtils.isBlank(fmtString)) {
            return;
        }
        if (null != value && value.length != 0) {
            fmtString = String.format(fmtString, value);
        }
        error(clazz, fmtString, e);
    }

    /**
     * 异常填充值输出
     *
     * @param clazz     目标.Class
     * @param fmtString 输出信息key
     * @param value     输出信息value
     */
    public static void fmtError(Class<?> clazz,
                                String fmtString, Object... value) {
        if (StringUtils.isBlank(fmtString)) {
            return;
        }
        if (null != value && value.length != 0) {
            fmtString = String.format(fmtString, value);
        }
        error(clazz, fmtString);
    }

    public static String getParentClass() {
        try {
            StackTraceElement strack = new Throwable().getStackTrace()[2];
            String className = strack.getClassName().substring(strack.getClassName().lastIndexOf('.') + 1);
            String methodName = strack.getMethodName();
            methodName = methodName + ":" + strack.getLineNumber() + " ";
            return className + "." + methodName;
        } catch (Exception e1) {
            error(LoggerUtils.class, "输出日志时异常", e1);
            return "";
        }
    }
}
