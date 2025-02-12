# the-american-dreams
java project

<h3> functions </h3>

<h4>password Hashing</h4> 

 public static String passwordHashing(String pwd) throws NoSuchAlgorithmException{ // cryptographic hashing algorithms such as MD5, SHA-1, or SHA-256.
        //MD5
        //SHA-1
        //SHA-256


        MessageDigest messageDigest  = MessageDigest.getInstance("SHA-256"); //

        //pwd.getBytes() -> Converts the String input (pwd) into an array of bytes. Hashing algorithms work on byte arrays, not strings.
        //messageDigest.update()Adds the byte array to the digest computation. This prepares the data to be hashed.
        messageDigest.update(pwd.getBytes()); 
        
        //Completes the hashing process and returns the hash as a byte array (rbt).
        byte[]  rbt = messageDigest.digest();

        
        //Converting the Hash to a Hexadecimal String
        // Creates a StringBuilder object to efficiently build the final hashed string.
        StringBuilder sb = new StringBuilder();

        //Converts each byte  into a two digit hexadecimal string.
        for( byte b : rbt){

            // System.out.println(b);

            //Appends each formatted hexadecimal string to the StringBuilde
            sb.append(String.format("%02x",b));
        }

    //Converts the StringBuilder object into a String containing the full hexadecimal representation of the hashed password and return
       return sb.toString();

        
    }


<h4>password validation</h4>
    public static boolean passwordvalidation(String password){
        /*
        //       *.--->  (?=.*[0-9]): At least one digit (0-9).
        //       *.---> (?=.*[a-z]): At least one lowercase letter (a-z).
        //      *.---> (?=.*[A-Z]): At least one uppercase letter (A-Z).
        //      *.---> (?=.*[@#$%^&+=]): At least one special character from the set @#$%^&+=.
        //      *.---> (?=\\S+$): No spaces are allowed (\\S matches any non-whitespace character).
        //      *.---> .{8,}: The password must be at least 8 characters long.
         */
        String pattern = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}";
//
        // System.out.println(password.matches(pattern));

        //This prints true or false based on whether the password matches the regex pattern
          return password.matches(pattern) ;

    }



   
<h4>student validation</h4>
//
    public static boolean usernameValidation(String username) {
        // convert userName to lowerCase so this work dynamically
        String lowerCaseUsername =  username.toLowerCase();

        // Starts with 'tg', followed by exactly 4 digits.
        String pattern = "^tg\\d{4}$"; 

        //

        //This prints true or false based on whether the userName matches the regex pattern
        return lowerCaseUsername.matches(pattern);
        //
    }
    


    