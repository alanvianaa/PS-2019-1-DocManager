/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.Serializable;
import javax.inject.Inject;
import javax.inject.Named;
import negocio.Usuario;

@Named  
public class Perfil implements Serializable{
    
    @Inject
    private Login login;

    public Usuario getUser() {
        return login.getUser();
    }
    


}
