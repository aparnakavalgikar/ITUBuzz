package com.itubuzz.validators;

public class EMailIdValidator {

	
	public static boolean validateUserEmailId(String eMailId, String userType){
		boolean eMailVal = false;
		if(userType.equalsIgnoreCase("currentStudent") || userType.equalsIgnoreCase("faculty") && eMailId != null){
		
		String eMail1 = "itu.com";
		String[] email2 = eMailId.split("\\@");
		System.out.println("Email id is : "+email2[1]);
	
		
			if(email2[1].equals(eMail1) && (!(email2[0].equalsIgnoreCase("sample"))))
				eMailVal = true;
			
			
		
	}
		
		return eMailVal;
	}
	
	
	
}
