package org.techlms.demoitest;

public class SessionManager {

    private static SessionManager instance;
    private String username;
    private int userid;
    private String role;


    public SessionManager() {}

    // create SessionMange object for current login user
    public static SessionManager getInstance() {
        if (instance == null) {
            instance = new SessionManager();
        }
        return  instance;
    }

    // set Session values
    public void  setUser(int userid  , String username , String role) {
        this.userid = userid;
        this.username = username;
        this.role = role;
    }


    public int getUserid(){
        return this.userid;
    }
    public String getRole(){
        return this.role;
    }
    public String getUsername(){
        return this.username;
    }

    // remove user from sessionManager
    public void logout(){
        instance =  null;
    }
}
