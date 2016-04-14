package com.itubuzz.validators;
/**
 * International Technological University, San Jose
 * created on : 03/05/2016
 * @author Kavya
 */
public class EMailIdValidator {
    
	/**
	 * method : validateUserEmailId(String eMailId, String userType)
	 * @param eMailId
	 * @param userType
	 * @return boolean
	 * @author Kavya
	 */
	
	public static boolean validateUserEmailId(String eMailId, String userType){
		boolean eMailVal = false;
		if((!(eMailId.equalsIgnoreCase("sample@itu.com")) && userType.equalsIgnoreCase("currentStudent") || userType.equalsIgnoreCase("faculty") )){
		
		String eMail1 = "itu.com";
		String[] email2 = eMailId.split("\\@");
		System.out.println("Email id is : "+email2[1]);
		String lowerCaseChars = "(.*[a-z].*)";
		String numbers = "(.*[0-9].*)";
		boolean matchesSpecialChar = validateEmailSpecialCharacters(eMailId);
		boolean matchesNumbers = eMailId.matches(numbers );
                 if(eMailId.toLowerCase().matches(lowerCaseChars ) && matchesSpecialChar || matchesNumbers){
					if(email2[1].matches(eMail1)){
					eMailVal = true;
					}
				}
                 
	}
		
		return eMailVal;
	}
	
	public static boolean validateOtherEmail(String emailId, String userType){
		
	boolean value = false;
	if((!(emailId.equalsIgnoreCase("sample@example.com"))) && userType.equalsIgnoreCase("alumni")){
		String  values = "(.*[.com,.org,.net,.int,.edu,.gov,.mil,.co,.in])";
		
		String lowerCaseChars = "(.*[a-z].*)";
		String numbers = "(.*[0-9].*) ";
		if(emailId.endsWith(values) &&  emailId.toLowerCase().matches(lowerCaseChars) && validateEmailSpecialCharacters(emailId) || emailId.matches(numbers)){
				value = true;
			}
    }
	return value;
	}
	
	private static boolean validateEmailSpecialCharacters(String emailId){
		boolean message = false;
		String specialChars = "(.*[,~,!,#,$,%,^,&,*,(,),-,=,+,[,{,],},|,;,:,<,>,/,?].*$)";
		  if(emailId.matches(specialChars)){
			  message = false;
		  }
		  else{
			  message=true;
		  }
		return message;
	}
}
