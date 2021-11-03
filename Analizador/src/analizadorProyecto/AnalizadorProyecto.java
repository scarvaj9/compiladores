/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package analizadorProyecto;

import java.io.File;
import java.io.FileReader;

/**
 *
 * @author SistemaInvestigacion
 */
public class AnalizadorProyecto {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try {
            String ruta = "src\\analizadorProyecto\\fuente.txt";
            String archivo = new File(ruta).getAbsolutePath();
            Lexer lex = new Lexer(new FileReader(archivo));
            lex.yylex(); // compilar
            
            if (lex.errlex.isEmpty()){
                System.out.println("Compilación correcta");
                System.out.println(lex.ts.toString());
            }
            else{
                System.err.println("Compilacion incorrecta");
                System.err.println(lex.errlex);
            }
                
        }catch(Exception e){
            System.err.println(e.getMessage());
            
        }
    }
    
}
