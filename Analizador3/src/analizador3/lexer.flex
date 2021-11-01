/*Definir el paquete*/
package analizador3;
import java.util.ArrayList;
%%
%class Lexer
%line
%column
%unicode


// Se definen dos variables públicas

%{

public String errlex="";
public ArrayList<Token> ts = new ArrayList<Token>();

%}

// Alfabetos

a = [a-zA-Z]
n = [0-9]
s = "_"
g = [“”]
c = [-=%#]
x = [\n\t\r; ]

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
imp = '“'({a}|{n}|{c}|" ")+'”'

eq = "="
sum = "+"
res = "-"
mul = "*"
div = "/"
and = "&"
mayor = ">"
menor = "<"
parder = ")"
parizq = "("

inicio = "Programa "
fin = "FinPrograma"
leer = "Leer"
escri = "Escribir"

si = "Si"
enton = "Entonces"
sino = "Sino"
finsi = "FinSi"

mientras = "Mientras"
finmien = "FinMientras"

para = "Para"
hasta = "hasta"
finpara = "Finpara"


%%

// token condicionales
{inicio} {ts.add(new Token("Inicio programa ",yytext()));}
{fin} {ts.add(new Token("Fin Programa ",yytext()));}
{leer} {ts.add(new Token("Entrada de datos ",yytext()));}
{escri} {ts.add(new Token("salida de datos ",yytext()));}

{si} {ts.add(new Token("Condicion Si ",yytext()));}
{enton} {ts.add(new Token("Acciones por verdadero ",yytext()));}
{sino} {ts.add(new Token("Acciones por falso ",yytext()));}
{finsi} {ts.add(new Token("Fin condicion Si ",yytext()));}

{mientras} {ts.add(new Token("Condicion Mientras",yytext()));}
{finmien} {ts.add(new Token("Fin condicion Mientras ",yytext()));}

{para} {ts.add(new Token("Condicion Para",yytext()));}
{hasta} {ts.add(new Token("Condicion final ",yytext()));}
{finpara} {ts.add(new Token("Fin condicion para ",yytext()));}

// token tipos variables 

{tipoEntero} {ts.add(new Token("Variables tipo Entero ",yytext()));}
{tipoReal} {ts.add(new Token("Variables tipo Real",yytext()));}
{variables} {ts.add(new Token("Variables prueba",yytext()));}
//{variable} {ts.add(new Token("Variable prueba",yytext()));}

// token operaciones

{eq} {ts.add(new Token("Igual ",yytext()));}
{sum} {ts.add(new Token("Suma ",yytext()));}
{res} {ts.add(new Token("Resta ",yytext()));}
{mul} {ts.add(new Token("Multiplicacion ",yytext()));}
{div} {ts.add(new Token("Divicion ",yytext()));}
{and} {ts.add(new Token("And logico ",yytext()));}
{mayor} {ts.add(new Token("Mayor que ",yytext()));}
{menor} {ts.add(new Token("Menor que ",yytext()));}
{parder} {ts.add(new Token("parentesis derecho ",yytext()));}
{parizq} {ts.add(new Token("parentesis izquierdo ",yytext()));}

// token alfa numerico 

{imp}  {ts.add(new Token("Salida de texto ",yytext()));}
{num}  {ts.add(new Token("Entero ",yytext()));}
{real}  {ts.add(new Token("Real ",yytext()));}
{id}  {ts.add(new Token("Identificador ",yytext()));}
{cad}  {ts.add(new Token("Cadena ",yytext()));}
{com} {}
{x}  {}
.  {errlex+=("\n Error Lexico, en linea : "+ (yyline+1)+" , "+(yycolumn+1)+ "caracter no valido "+yytext());}