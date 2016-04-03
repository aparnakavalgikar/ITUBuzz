package com.itubuzz.valueobjects;

public class ReplyVO {
  
	public long reply_id;
	public String reply_text;
	public long immparent_id;
	public int post_id;
	public int log_user_id;
	
	public long getReply_id() {
		return reply_id;
	}
	public void setReply_id(long reply_id) {
		this.reply_id = reply_id;
	}
	public String getReply_text() {
		return reply_text;
	}
	public void setReply_text(String reply_text) {
		this.reply_text = reply_text;
	}
	public long getimmparent_id() {
		return immparent_id;
	}
	public void immparent_id(long immparent_id) {
		this.immparent_id = immparent_id;
	}
	public int getpost_id() {
		return post_id;
	}
	public void setpost_id(int post_id) {
		this.post_id = post_id;
	}
	
	public int getLog_user_id() {
		return log_user_id;
	}
	
	public void setLog_user_id(int log_user_id) {
		this.log_user_id = log_user_id;
	}	
}
