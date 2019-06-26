package controller;

import com.sun.mail.imap.IMAPStore;
import java.io.IOException;
import javax.annotation.PostConstruct;
import javax.faces.application.NavigationHandler;
import javax.faces.context.FacesContext;
import javax.inject.Inject;
import javax.inject.Named;

@Named
public class DashBoard {
    
    private int qtdElaboracao;
    private int qtdVerificacao;
    private int qtdAprovacao;
       
    @Inject
    private Login login; //chama dos dados do login que está na SESSION para esse Bean

    @PostConstruct
    public void init() throws IOException {
        this.qtdElaboracao = 9;
        this.qtdVerificacao = 10; 
        this.qtdAprovacao = 12;    
    }
    
    public int getQtdElaboracao() {
        
        return qtdElaboracao;
    }

    public int getQtdVerificacao() {
              
        return qtdVerificacao;
    }

    public int getQtdAprovacao() {
        
        return qtdAprovacao;
    }
    
    
    
}
