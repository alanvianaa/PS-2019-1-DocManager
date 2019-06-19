package controller;

import javax.inject.Named;

@Named
public class DashBoard {
    
    private int qtdElaboracao;
    private int qtdVerificacao;
    private int qtdAprovacao;

    
    public int getQtdElaboracao() {
        this.qtdElaboracao = 9;
        return qtdElaboracao;
    }

    public int getQtdVerificacao() {
        this.qtdVerificacao = 10;       
        return qtdVerificacao;
    }

    public int getQtdAprovacao() {
        this.qtdAprovacao = 18;
        return qtdAprovacao;
    }
    
    
    
}
