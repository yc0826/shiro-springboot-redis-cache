package com.shiro.auth.common.utils;

import net.coobird.thumbnailator.Thumbnails;
import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;

//import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/**
 * Created by yangchao on 2015/9/11.
 * FTP上传下载工具类
 */
public class FtpUtils {
    /**
     * Description: 向FTP服务器上传文件
     *
     * @param path     FTP服务器保存目录
     * @param filename 上传到FTP服务器上的文件名
     * @param input    输入流
     * @return 成功返回true，否则返回false
     */
    public static boolean ftpUpload(String url, String loginName, String password, String path, String filename, InputStream input) throws Exception {
        boolean success = false;
        FTPClient ftp = new FTPClient();
        try {
            int reply;
            //连接FTP服务器
            //如果采用默认端口，可以使用ftp.connect(url)的方式直接连接FTP服务器
            ftp.setControlEncoding("utf-8");
            ftp.connect(url);
            ftp.login(loginName, password);//登录
            reply = ftp.getReplyCode();
            if (!FTPReply.isPositiveCompletion(reply)) {
                ftp.disconnect();
                return false;
            }
            String[] paths = path.split("/");
            ftp.setFileType(FTPClient.BINARY_FILE_TYPE);
            ftp.enterLocalPassiveMode();

            for (String s : paths) {
                boolean flag = ftp.changeWorkingDirectory(s);
                if (!flag) {
                    ftp.makeDirectory(s);
                    ftp.changeWorkingDirectory(s);
                }
            }

            ftp.storeFile(filename, input);

            input.close();
            ftp.logout();
            success = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ftp.isConnected()) {
                try {
                    ftp.disconnect();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return success;
    }

    /**
     * ftp下载
     *
     * @param remotePath ftp远程目录
     * @param fileName   文件名
     * @param response   HttpServletResponse
     */
    public static void ftpDownLoad(String url, String loginName, String password, String remotePath, String fileName, HttpServletResponse response) throws Exception {
        FTPClient ftp = new FTPClient();
        try {
            int reply;
            ftp.setControlEncoding("utf-8");
            ftp.connect(url);
            ftp.login(loginName, password);//登录
            ftp.setFileType(FTP.BINARY_FILE_TYPE);
            ftp.enterLocalPassiveMode();
            reply = ftp.getReplyCode();
            if (!FTPReply.isPositiveCompletion(reply)) {
                ftp.disconnect();
                return;
            }
            ftp.changeWorkingDirectory(remotePath);
            OutputStream is = response.getOutputStream();
            ftp.retrieveFile(fileName, is);
            is.close();
//            FTPFile[] fs = ftp.listFiles();
//            for (FTPFile ff : fs) {
//                if (ff.getName().equals(fileName)) {
//
//                    break;
//                }
//            }
            ftp.logout();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ftp.isConnected()) {
                try {
                    ftp.disconnect();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /**
     * ftp下载 图片根据需要的大小
     *
     * @param url             URL
     * @param loginName       登录名
     * @param password        密码
     * @param remotePath      ftp远程目录
     * @param fileName        文件名
     * @param width           图片宽度
     * @param height          图片高度
     * @param keepAspectRatio 保持宽高比
     * @throws Exception
     */
    public static byte[] getImageFromFtpAndDownload(String url, String loginName, String password, String remotePath, String fileName, int width, int height, boolean keepAspectRatio) throws Exception {
//
//        Thumbnails.of(new File("original.jpg"))
//                .size(160, 160)
//                .toFile(new File("thumbnail.jpg"));

        FTPClient ftp = new FTPClient();
        try {
            int reply;
            ftp.setControlEncoding("utf-8");
            ftp.connect(url);
            ftp.login(loginName, password);//登录
            ftp.setFileType(FTP.BINARY_FILE_TYPE);
            ftp.enterLocalPassiveMode();
            reply = ftp.getReplyCode();
            if (!FTPReply.isPositiveCompletion(reply)) {
                ftp.disconnect();
                return null;
            }
            ftp.changeWorkingDirectory(remotePath);
            byte[] b;
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            //ftp.retrieveFile(fileName, responseOutputStream);
            //如果不输入大小，默认图片大小显示
            if (width != 0 && height != 0) {
                Thumbnails.of(ftp.retrieveFileStream(fileName)).size(width, height).outputFormat("jpg").keepAspectRatio(keepAspectRatio).toOutputStream(byteArrayOutputStream);
            } else {
                ftp.retrieveFile(fileName, byteArrayOutputStream);
            }
            b = byteArrayOutputStream.toByteArray();
            byteArrayOutputStream.close();

            ftp.logout();
            return b;
        } catch (Exception e) {
//            logger.error(e);
            return null;
        } finally {
            if (ftp.isConnected()) {
                try {
                    ftp.disconnect();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /** 下载文件
     * @param url
     * @param loginName
     * @param password
     * @param remotePath
     * @param fileName
     * @return
     * @throws Exception
     */
    public static byte[] getFileFromFtpAndDownload(String url, String loginName, String password, String remotePath, String fileName) throws Exception {

        FTPClient ftp = new FTPClient();
        try {
            int reply;
            ftp.setControlEncoding("utf-8");
            ftp.connect(url);
            ftp.login(loginName, password);//登录
            ftp.setFileType(FTP.BINARY_FILE_TYPE);
            ftp.enterLocalPassiveMode();
            reply = ftp.getReplyCode();
            if (!FTPReply.isPositiveCompletion(reply)) {
                ftp.disconnect();
                return null;
            }
            ftp.changeWorkingDirectory(remotePath);
            byte[] b;
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            //ftp.retrieveFile(fileName, responseOutputStream);
            ftp.retrieveFile(fileName, byteArrayOutputStream);

            b = byteArrayOutputStream.toByteArray();
            byteArrayOutputStream.close();

            ftp.logout();
            return b;
        } catch (Exception e) {
//            logger.error(e);
            return null;
        } finally {
            if (ftp.isConnected()) {
                try {
                    ftp.disconnect();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
