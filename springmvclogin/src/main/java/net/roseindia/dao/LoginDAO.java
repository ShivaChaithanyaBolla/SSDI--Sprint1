package net.roseindia.dao;
/*
@Author: Chaithanya
*/
import net.roseindia.model.*;

public interface LoginDAO{    
       public boolean checkLogin(String userName, String userPassword);
}