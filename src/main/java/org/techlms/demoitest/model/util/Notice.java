package org.techlms.demoitest.model.util;

public class Notice {
    private int noticeId;
    private String adminUsername;
    private String noticeName;
    private String noticeTitle;
    private byte[] noticeData; // LONGBLOB is represented as a byte array
    private String CreateDate;
    private String updatedDate;

    public Notice(){

    }

    public Notice(String adminUsername, String noticeTitle, byte[] noticeData) {
        this.adminUsername = adminUsername;
        this.noticeTitle = noticeTitle;
        this.noticeData = noticeData;
    }

    public Notice(String noticeTitle, byte[] noticeData) {
        this.noticeTitle = noticeTitle;
        this.noticeData = noticeData;
    }

    // Constructor, getters, and setters
    public Notice(int noticeId, String adminUsername, String noticeName, String noticeTitle, byte[] noticeData, String createDate, String updatedDate) {
        this.noticeId = noticeId;
        this.adminUsername = adminUsername;
        this.noticeName = noticeName;
        this.noticeTitle = noticeTitle;
        this.noticeData = noticeData;
        this.CreateDate = createDate;
        this.updatedDate = updatedDate;
    }

    // Getters and Setters for all fields (auto-generated)
    public int getNoticeId() {
        return noticeId;
    }

    public void setNoticeId(int noticeId) {
        this.noticeId = noticeId;
    }

    public String getAdminUsername() {
        return adminUsername;
    }

    public void setAdminUsername(String adminUsername) {
        this.adminUsername = adminUsername;
    }

    public String getNoticeName() {
        return noticeName;
    }

    public void setNoticeName(String noticeName) {
        this.noticeName = noticeName;
    }

    public String getNoticeTitle() {
        return noticeTitle;
    }

    public void setNoticeTitle(String noticeTitle) {
        this.noticeTitle = noticeTitle;
    }

    public byte[] getNoticeData() {
        return noticeData;
    }

    public void setNoticeData(byte[] noticeData) {
        this.noticeData = noticeData;
    }

    public String getCreateDate() {
        return CreateDate;
    }

    public void setCreateDate(String createDate) {
        CreateDate = createDate;
    }

    public String getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(String updatedDate) {
        this.updatedDate = updatedDate;
    }
}


