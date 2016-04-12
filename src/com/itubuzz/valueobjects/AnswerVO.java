package com.itubuzz.valueobjects;

public class AnswerVO {

		public long answer_id;
		public String answer_text;
		public long immparent_id;
		public int question_id;
		public int log_user_id;
	
		
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
