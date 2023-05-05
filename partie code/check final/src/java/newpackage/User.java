/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

/**
 *
 * @author HP
 */
public class User {
    int id;
    String name;
    String email;
    String password;
            public User(int id,String name,String email,String password){
                         this.id=id;
                         this.name=name;
                         this.email=email;
                         this.password=password;
            }
            public void setId(int id){
               this.id=id;
            }
            public void setName(String name){
               this.name=name;
            }
            public void setEmail(String email){
               this.email=email;
            }
            public void setPassword(String password){
               this.password=password;
            }
            public int getId(){
               return id;
            }
            public String getName(){
               return name;
            }
            public String sgetEmail(){
               return email;
            }
            public String getPassword(){
               return password;
            }
}
