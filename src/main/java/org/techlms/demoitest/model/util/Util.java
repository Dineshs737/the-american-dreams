package org.techlms.demoitest.model.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Util {
    public static boolean isValidEmail(String email) {

        // Regular expression to match valid email formats
        String emailRegex = """
                ^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@
                (?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$""";

        // Compile the regex
        Pattern p = Pattern.compile(emailRegex);

        // Check if email matches the pattern
        return email != null && p.matcher(email).matches();
    }



    public static boolean isValidPhoneNumber(String phoneNumber) {
        //validate phone number
        final String PHONE_REGEX = "^\\+([0-9\\-]?){9,11}[0-9]$";
        final Pattern pattern = Pattern.compile(PHONE_REGEX);
        final Matcher matcher = pattern.matcher(phoneNumber);
        return matcher.matches();

    }
}
