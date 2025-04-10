package org.techlms.demoitest.dto.utilDTO;

public class NoticeBoardDTO {

    private int noticeId;
    private byte[] noticeData;
    private String noticeName;
    private String noticeTitle;
    private String createdDate;

    public NoticeBoardDTO(int noticeId, String noticeName, byte[] noticeData , String noticeTitle, String createdDate) {
        this.noticeId = noticeId;
        this.noticeName = noticeName;
        this.noticeData = noticeData;
        this.noticeTitle = noticeTitle;
        this.createdDate = createdDate;
    }

    public int getNoticeId() {
        return noticeId;
    }

    public byte[] getNoticeData() {
        return noticeData;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public String getNoticeName() {
        return noticeName;
    }

    public String getNoticeTitle() {
        return noticeTitle;
    }
}
