/*Definir el paquete*/
package analizadorProyecto;
import java.util.ArrayList;
import java_cup.runtime.*;
%%
%unicode
%class Lexer
%line
%column
%cup

// Se definen dos variables públicas

%{

public String errlex="";
public ArrayList<Token> ts = new ArrayList<Token>();
public Symbol symbol(int type){
    return new Symbol(type,yyline,yycolumn);

    }
%}

// Alfabetos

a = [a-zA-Z]
n = [0-9]
s = "_"
c = [-=%#]
x = [\n\t\r]

// Expresiones

num="-"?{n}+
real ="-"?{n}+"."{n}+
tipoEntero ="Entero "
//variable = {a}*(","{a})?
tipoReal ="Real " //{a}*(","{a})?
variables = {a}*","{a}+
id = {a}({a}|{n}|{s})*
cad = "'"({a}|{n}|{s}|{c}|" ")* "'"
com = ("#"|"//")({a}|{n}|{s}|" ")+
op="+"|"-"|"/"|"*"
eq = "="
ol = "|"|"&"
or = "<" |"<="| ">="|"=="|"!="|">"
pd = ")"
pi = "("
p_coma=";"
coma=","

inicio = "Programa"|"programa"|"PROGRAMA"
fin = "FinPrograma"
leer = "Leer"|"LEER"|"leer"
escri = "Escribir"

si = "Si"|"si"|"SI"
enton = "Entonces"|"ENTONCES"|"entonces"
sino = "Sino"|"sino"|"SINO"
finsi = "FinSi"|"finsi"|"FINSI"

mientras ="Mientras"|"mientras"|"MIENTRAS"
finmien = "FinMientras"|"finmientras"|"FINMIENTRAS"|"Finmientras"

para = "Para"|"para"|"PARA"
hasta = "hasta"|"Hasta"|"HASTA"
paso = "PASO"|"Paso"|"paso"
finpara = "Finpara"|"finPara"|"FinPara"|"FINPARA"|"finpara"


%%

// token reservadas
{inicio} {ts.add(new Token("Inicio programa ",yytext()));return symbol(sym.inicio);}
{fin} {ts.add(new Token("Fin Programa ",yytext()));return symbol(sym.fin);}
{leer} {ts.add(new Token("Entrada de datos ",yytext()));return symbol(sym.leer);}
{escri} {ts.add(new Token("salida de datos ",yytext()));return symbol(sym.escri);}

{si} {ts.add(new Token("Condicion Si ",yytext()));return symbol(sym.si);}
{enton} {ts.add(new Token("Acciones por verdadero ",yytext()));return symbol(sym.enton);}
{sino} {ts.add(new Token("Acciones por falso ",yytext()));return symbol(sym.sino);}
{finsi} {ts.add(new Token("Fin condicion Si ",yytext()));return symbol(sym.finsi);}

{mientras} {ts.add(new Token("Palabra reservada ", yytext()));return symbol(sym.mientras);}
{finmien} {ts.add(new Token("Palabra reservada ", yytext()));return symbol(sym.finmien);}
"hacer" {ts.add(new Token("Palabra reservada ", yytext()));return symbol(sym.hacer);}

{para} {ts.add(new Token("Condicion Para",yytext()));return symbol(sym.para);}
{hasta} {ts.add(new Token("Condicion final ",yytext()));return symbol(sym.hasta);}
{paso} {ts.add(new Token("Condicion final ",yytext()));return symbol(sym.paso);}
{finpara} {ts.add(new Token("Fin condicion para ",yytext()));return symbol(sym.finpara);}

// token tipos variables 

{tipoEntero} {ts.add(new Token("Variables tipo Entero ",yytext()));return symbol(sym.tipoEntero);}
{tipoReal} {ts.add(new Token("Variables tipo Real",yytext()));return symbol(sym.tipoReal);}
{variables} {ts.add(new Token("Variables prueba",yytext()));return symbol(sym.variables);}


// token operaciones

{eq} {ts.add(new Token("Igual ",yytext()));return symbol(sym.eq);}
{op} {ts.add(new Token("operador",yytext()));return symbol(sym.op);}
{ol} {ts.add(new Token("operador logico ", yytext()));return symbol(sym.ol);}
{or} {ts.add(new Token("Op. relacional ", yytext()));return symbol(sym.or);}
{pd} {ts.add(new Token("parentesis derecho ",yytext()));return symbol(sym.pd);}
{pi} {ts.add(new Token("parentesis izquierdo ",yytext()));return symbol(sym.pi);}

// token alfa numerico 

{coma} {ts.add(new Token("Coma ", yytext()));return symbol(sym.coma);}
{num} {ts.add(new Token("Numero ", yytext()));return symbol(sym.num);}
{real}  {ts.add(new Token("Real ",yytext()));return symbol(sym.real);}
{id} {ts.add(new Token("Identificador ", yytext()));return symbol(sym.id);}
{cad}  {ts.add(new Token("Cadena ",yytext()));return symbol(sym.cad);}
{p_coma}  {ts.add(new Token("Punto y coma",yytext()));return symbol(sym.p_coma);}
{com} {}
{x}  {}
.  {errlex+=("\n Error Lexico, en linea : "+ (yyline+1)+" , "+(yycolumn+1)+ "caracter no valido "+yytext());}