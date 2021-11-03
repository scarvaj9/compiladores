/*Definir el paquete*/
package analizador3;
import java.util.ArrayList;
%%
%class Lexer
%line
%column

// Se definen dos variables públicas

%{

public String errlex="";
public ArrayList<Token> ts = new ArrayList<Token>();

%}

// Alfabetos

a= [a-zA-Z]
n = [0-9]
s= "_"
x = [\n\t\r ]

// Expresiones

num="-"?{n}+
real ="-"?{n}+"."{n}+
id = {a}({a}|{n}|{s})*
cad = "'"({a}|{n}|{s}|" ")* "'"
com = "#" ({a}|{n}|{s}|" ")+
%%

{num}  {ts.add(new Token("Entero ",yytext()));}
{real}  {ts.add(new Token("Real ",yytext()));}
{id}  {ts.add(new Token("Identificador ",yytext()));}
{cad}  {ts.add(new Token("Cadena ",yytext()));}
{com} {}
{x}  {}
.  {errlex+=("\n Error Lexico, en linea : "+ (yyline+1)+" , "+(yycolumn+1)+ "caracter no valido "+yytext());}