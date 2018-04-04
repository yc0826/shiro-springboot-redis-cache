package com.babysky.management;

/**
 * @author YangChao
 */
public class Application {

    public static void main(String[] args) {
        String path = Application.class.getProtectionDomain().getCodeSource().getLocation().getPath();
        String workingdirectory =  path.substring(1, path.lastIndexOf("/target/"));
        System.setProperty("user.dir", workingdirectory);
        com.alibaba.dubbo.container.Main.main(args);
    }
}
