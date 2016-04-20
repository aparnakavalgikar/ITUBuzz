package com.itubuzz.valueobjects;

public class AnswerVO {

		public long answer_id;
		public String answer_text;
		public long immparent_id;
		public int question_id;
		public int log_user_id;
		public String log_user_name;
		public long answer_number;
		
		
	
		public long getAnswer_number() {
			return answer_number;
		}

		public void setAnswer_number(long answer_number) {
			this.answer_number = answer_number;
		}

		public String getLog_user_name() {
			return log_user_name;
		}

		public void setLog_user_name(String log_user_name) {
			this.log_user_name = log_user_name;
		}

		public long getanswer_id() {
			return answer_id;
		}
		
		public void setanswer_id(long answer_id) {
			this.answer_id = answer_id;
		}
		
		public String getanswer_text() {
			return answer_text;
		}
		
		public void setanswer_text(String answer_text) {
			this.answer_text = answer_text;
		}

		public long getimmparent_id() {
			return immparent_id;
		}
		
		public void setimmparent_id(long immparent_id) {
			this.immparent_id = log_user_id;
		}

		public int getquestion_id() {
			return question_id;
		}
		
		public void setquestion_id(int log_user_id) {
			this.question_id = log_user_id;
		}

		public int getLog_user_id() {
			return log_user_id;
		}
		
		public void setLog_user_id(int log_user_id) {
			this.log_user_id = log_user_id;
		}

}