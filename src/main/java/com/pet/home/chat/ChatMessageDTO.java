package com.pet.home.chat;

public class ChatMessageDTO {
	
	private String roomNum;
	private String messageId;
	private String message;
	private String userName;
	private String email;
	private int unReadCount;
	private int sessionCount;
	
	public ChatMessageDTO() {
		// TODO Auto-generated constructor stub
		super();
	}
	
	public ChatMessageDTO(String roomNum, String messageId, String message, String userName, String email, int unReadCount,
            int sessionCount) {
		super();
        this.roomNum = roomNum;
        this.messageId = messageId;
        this.message = message;
        this.userName = userName;
        this.email = email;
        this.unReadCount = unReadCount;
        this.sessionCount = sessionCount;
    }

	public String getRoomNum() {
		return roomNum;
	}

	public void setRoomNum(String roomNum) {
		this.roomNum = roomNum;
	}

	public String getMessageId() {
		return messageId;
	}

	public void setMessageId(String messageId) {
		this.messageId = messageId;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getUnReadCount() {
		return unReadCount;
	}

	public void setUnReadCount(int unReadCount) {
		this.unReadCount = unReadCount;
	}

	public int getSessionCount() {
		return sessionCount;
	}

	public void setSessionCount(int sessionCount) {
		this.sessionCount = sessionCount;
	}
	
	@Override
    public String toString() {
        return "ChatMessage [roomNum=" + roomNum + ", messageId=" + messageId + ", message=" + message + ", userName=" + userName
                + ", email=" + email + ", unReadCount=" + unReadCount + ", sessionCount=" + sessionCount + "]";
    }
	
	
}
