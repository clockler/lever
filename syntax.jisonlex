digit                       [0-9]
ident                       [a-zA-Z_][a-zA-Z_0-9]*

%%

\s+                         /* skip whitespace */
"//".*                      /* ignore comment */
"/*"[\w\W]*?"*/"            /* ignore comment */

"..."                       return yytext;
".."                        return yytext;
"::"                        return yytext;

"=="                        return yytext;
"!="                        return yytext;
"$="                        return yytext;
"!$="                       return yytext;
"||"                        return yytext;
"&&"                        return yytext;
"<="                        return yytext;
">="                        return yytext;
"<"                         return yytext;
">"                         return yytext;
"+"                         return yytext;
"-"                         return yytext;
"*"                         return yytext;
"/"                         return yytext;
"%"                         return yytext;

"=>"                        return yytext;
"="                         return yytext;
"("                         return yytext;
")"                         return yytext;
"["                         return yytext;
"]"                         return yytext;
"{"                         return yytext;
"}"                         return yytext;
"<"                         return yytext;
">"                         return yytext;
":"                         return yytext;
"."                         return yytext;
";"                         return yytext;
","                         return yytext;
"@"                         return yytext;
"SPC"                       return yytext;
"TAB"                       return yytext;
"NL"                        return yytext;

"!"                         return yytext;
"~"                         return yytext;

"scoped"                    return 'scoped';
"fn"                        return 'fn';
"new"                       return 'new';
"class"                     return 'class';
"return"                    return 'return';
"break"                     return 'break';
"continue"                  return 'continue';
"if"                        return 'if';
"else"                      return 'else';
"for"                       return 'for';
"in"                        return 'in';
"loop"                      return 'loop';
"while"                     return 'while';
"package"                   return 'package';
"active"                    return 'active';
"datablock"                 return 'datablock';

{digit}+                    return 'integer';
{digit}+"."{digit}+         return 'float';
"\""[\w\W]*?"\""            return 'string';
"'"[\w\W]*?"'"              return 'tagged_string';
"true"|"false"              return 'boolean';
"$"{ident}                  return 'var_global';
{ident}"!"                  return 'macro_name';
{ident}                     return 'var_local';
"`"[^`]*"`"                 return 'ts_fence';

.                           return 'ROBOCOP';
<<EOF>>                     return 'EOF';
