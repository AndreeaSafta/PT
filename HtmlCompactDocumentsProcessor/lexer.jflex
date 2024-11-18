package cup.example;
import java_cup.runtime.ComplexSymbolFactory;
import java_cup.runtime.ComplexSymbolFactory.Location;
import java_cup.runtime.Symbol;
import java.lang.*;
import java.io.InputStreamReader;

%%

%class Lexer
%implements sym
%public
%unicode
%line
%column
%cup
%char
%ignorecase
%caseless
%{
	

    public Lexer(ComplexSymbolFactory sf, java.io.InputStream is){
		this(is);
        symbolFactory = sf;
    }
	public Lexer(ComplexSymbolFactory sf, java.io.Reader reader){
		this(reader);
        symbolFactory = sf;
    }
    
    private StringBuffer sb;
    private ComplexSymbolFactory symbolFactory;
    private int csline,cscolumn;

    public Symbol symbol(String name, int code){
		return symbolFactory.newSymbol(name, code,
						new Location(yyline+1,yycolumn+1, yychar), // -yylength()
						new Location(yyline+1,yycolumn+yylength(), yychar+yylength())
				);
    }
    public Symbol symbol(String name, int code, String lexem){
	return symbolFactory.newSymbol(name, code, 
						new Location(yyline+1, yycolumn +1, yychar), 
						new Location(yyline+1,yycolumn+yylength(), yychar+yylength()), lexem);
    }
    
    protected void emit_warning(String message){
    	System.out.println("scanner warning: " + message + " at : 2 "+ 
    			(yyline+1) + " " + (yycolumn+1) + " " + yychar);
    }
    
    protected void emit_error(String message){
    	System.out.println("scanner error: " + message + " at : 2" + 
    			(yyline+1) + " " + (yycolumn+1) + " " + yychar);
    }
%}
Letters             = [a-zA-Z]
Digit               = [0-9]
LineTerminator 		= [ ,\t,\r,\n]+
End = >[, ,\t,\r,\n]+ |>
/*-----------------------ELEMENTS---------------------*/

doctype_el = <(D|d)(O|o)(C|c)(T|t)(Y|y)(P|p)(E|e) html>

a_open_el = <(A|a)
a_close_el = <\/(A|a)>

abbr_open_el = <(A|a)(B|b)(B|b)(R|r)
abbr_close_el = <\/(A|a)(B|b)(B|b)(R|r)>

acronym_open_el = <(A|a)(C|c)(R|r)(O|o)(N|n)(Y|y)(M|m)
acronym_close_el = <\/(A|a)(C|c)(R|r)(O|o)(N|n)(Y|y)(M|m)>

address_open_el = <(A|a)(D|d)(D|d)(R|r)(E|e)(S|s)(S|s)
address_close_el = <\/(A|a)(D|d)(D|d)(R|r)(E|e)(S|s)(S|s)>

applet_open_el = <(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)
applet_close_el = <\/(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)>

area_open_el = <(A|a)(R|r)(E|e)(A|a)
area_close_el = <\/(A|a)(R|r)(E|e)(A|a)>

b_open_el = <(B|b)
b_close_el = <\/(B|b)>

base_open_el = <(B|b)(A|a)(S|s)(E|e)
base_close_el = <\/(B|b)(A|a)(S|s)(E|e)>

basefont_open_el = <(B|b)(A|a)(S|s)(E|e)(F|f)(O|o)(N|n)(T|t)>
basefont_close_el = <\/(B|b)(A|a)(S|s)(E|e)(F|f)(O|o)(N|n)(T|t)>

bdo_open_el = <(B|b)(D|d)(O|o)
bdo_close_el = <\/(B|b)(D|d)(O|o)>

big_open_el = <(B|b)(I|i)(G|g)
big_close_el = <\/(B|b)(I|i)(G|g)>

blockquote_open_el = <(B|b)(L|l)(O|o)(C|c)(K|k)(Q|q)(U|u)(O|o)(T|t)(E|e)
blockquote_close_el = <\/(B|b)(L|l)(O|o)(C|c)(K|k)(Q|q)(U|u)(O|o)(T|t)(E|e)>

body_open_el = <(B|b)(O|o)(D|d)(Y|y)
body_close_el = <\/(B|b)(O|o)(D|d)(Y|y)>

br_open_el = <(B|b)(R|r)
br_close_el = <\/(B|b)(R|r)>

button_open_el = <(B|b)(U|u)(T|t)(T|t)(O|o)(N|n)
button_close_el = <\/(B|b)(U|u)(T|t)(T|t)(O|o)(N|n)>

caption_open_el = <(C|c)(A|a)(P|p)(T|t)(I|i)(O|o)(N|n)
caption_close_el = <\/(C|c)(A|a)(P|p)(T|t)(I|i)(O|o)(N|n)>

center_open_el = <(C|c)(E|e)(N|n)(T|t)(E|e)(R|r)
center_close_el = <\/(C|c)(E|e)(N|n)(T|t)(E|e)(R|r)>

cite_open_el = <(C|c)(I|i)(T|t)(E|e)
cite_close_el = <\/(C|c)(I|i)(T|t)(E|e)>

code_open_el = <(C|c)(O|o)(D|d)(E|e)
code_close_el = <\/(C|c)(O|o)(D|d)(E|e)>

col_open_el = <(C|c)(O|o)(L|l)
col_close_el = <\/(C|c)(O|o)(L|l)>

colgroup_open_el = <(C|c)(O|o)(L|l)(G|g)(R|r)(O|o)(U|u)(P|p)
colgroup_close_el = <\/(C|c)(O|o)(L|l)(G|g)(R|r)(O|o)(U|u)(P|p)>

dd_open_el = <(D|d)(D|d)
dd_close_el = <\/(D|d)(D|d)>

del_open_el = <(D|d)(E|e)(L|l)
del_close_el = <\/(D|d)(E|e)(L|l)>

dfn_open_el = <(D|d)(F|f)(N|n)
dfn_close_el = <\/(D|d)(F|f)(N|n)>

dir_open_el = <(D|d)(I|i)(R|r)
dir_close_el = <\/(D|d)(I|i)(R|r)>

div_open_el = <(D|d)(I|i)(V|v)
div_close_el = <\/(D|d)(I|i)(V|v)>

dl_open_el = <(D|d)(L|l)
dl_close_el = <\/(D|d)(L|l)>

dt_open_el = <(D|d)(T|t)
dt_close_el = <\/(D|d)(T|t)>

em_open_el = <(E|e)(M|m)
em_close_el = <\/(E|e)(M|m)>

fieldset_open_el = <(F|f)(I|i)(E|e)(L|l)(D|d)(S|s)(E|e)(T|t)
fieldset_close_el = <\/(F|f)(I|i)(E|e)(L|l)(D|d)(S|s)(E|e)(T|t)>

font_open_el = <(F|f)(O|o)(N|n)(T|t)
font_close_el = <\/(F|f)(O|o)(N|n)(T|t)>

form_open_el = <(F|f)(O|o)(R|r)(M|m)
form_close_el = <\/(F|f)(O|o)(R|r)(M|m)>

frame_open_el = <(F|f)(R|r)(A|a)(M|m)(E|e)
frame_close_el = <\/(F|f)(R|r)(A|a)(M|m)(E|e)>

frameset_open_el = <(F|f)(R|r)(A|a)(M|m)(E|e)(S|s)(E|e)(T|t)
frameset_close_el = <\/(F|f)(R|r)(A|a)(M|m)(E|e)(S|s)(E|e)(T|t)>

head_open_el = <(H|h)(E|e)(A|a)(D|d)
head_close_el = <\/(H|h)(E|e)(A|a)(D|d)>

hn_open_el = <(H|h)(N|n)
hn_close_el = <\/(H|h)(N|n)>

hr_open_el = <(H|h)(R|r)
hr_close_el = <\/(H|h)(R|r)>

html_open_el = <(H|h)(T|t)(M|m)(L|l)
html_close_el = <\/(H|h)(T|t)(M|m)(L|l)>

i_open_el = <(I|i)
i_close_el = <\/(I|i)>

iframe_open_el = <(I|i)(F|f)(R|r)(A|a)(M|m)(E|e)
iframe_close_el = <\/(I|i)(F|f)(R|r)(A|a)(M|m)(E|e)>

img_open_el = <(I|i)(M|m)(G|g)
img_close_el = <\/(I|i)(M|m)(G|g)>

input_open_el = <(I|i)(N|n)(P|p)(U|u)(T|t)
input_close_el = <\/(I|i)(N|n)(P|p)(U|u)(T|t)>

ins_open_el = <(I|i)(N|n)(S|s)
ins_close_el = <\/(I|i)(N|n)(S|s)>

isindex_open_el = <(I|i)(S|s)(I|i)(N|n)(D|d)(E|e)(X|x)
isindex_close_el = <\/(I|i)(S|s)(I|i)(N|n)(D|d)(E|e)(X|x)>

kbd_open_el = <(K|k)(B|b)(D|d)
kbd_close_el = <\/(K|k)(B|b)(D|d)>

label_open_el = <(L|l)(A|a)(B|b)(E|e)(L|l)
label_close_el = <\/(L|l)(A|a)(B|b)(E|e)(L|l)>

legend_open_el = <(L|l)(E|e)(G|g)(E|e)(N|n)(D|d)
legend_close_el = <\/(L|l)(E|e)(G|g)(E|e)(N|n)(D|d)>

li_open_el = <(L|l)(I|i)
li_close_el = <\/(L|l)(I|i)>

link_open_el = <(L|l)(I|i)(N|n)(K|k)
link_close_el = <\/(L|l)(I|i)(N|n)(K|k)>

listing_open_el = <(L|l)(I|i)(S|s)(T|T)(I|i)(N|n)(G|g)
listing_close_el = <\/(L|l)(I|i)(S|s)(T|T)(I|i)(N|n)(G|g)>

map_open_el = <(M|m)(A|a)(P|p)
map_close_el = <\/(M|m)(A|a)(P|p)>

menu_open_el = <(M|m)(E|e)(N|n)(U|u)
menu_close_el = <\/(M|m)(E|e)(N|n)(U|u)>

meta_open_el = <(M|m)(E|e)(T|t)(A|a)
meta_close_el = <\/(M|m)(E|e)(T|t)(A|a)>

nextid_open_el = <(N|n)(E|e)(X|x)(T|t)(I|i)(D|d)
nextid_close_el = <\/(N|n)(E|e)(X|x)(T|t)(I|i)(D|d)>

noframes_open_el = <(N|n)(O|o)(F|f)(R|r)(A|a)(M|e)(E|e)(S|s)
noframes_close_el = <\/(N|n)(O|o)(F|f)(R|r)(A|a)(M|e)(E|e)(S|s)>

noscript_open_el = <(N|n)(O|o)(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)
noscript_close_el = <\/(N|n)(O|o)(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)>

object_open_el = <(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)
object_close_el = <\/(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)>

ol_open_el = <(O|o)(L|l)
ol_close_el = <\/(O|o)(L|l)>

optgroup_open_el = <(O|o)(P|p)(T|t)(G|g)(R|r)(O|o)(U|u)(P|p)
optgroup_close_el = <\/(O|o)(P|p)(T|t)(G|g)(R|r)(O|o)(U|u)(P|p)>

option_open_el = <(O|o)(P|p)(T|t)(I|i)(O|o)(N|n)
option_close_el = <\/(O|o)(P|p)(T|t)(I|i)(O|o)(N|n)>

p_open_el = <(P|p)
p_close_el = <\/(P|p)>

param_open_el = <(P|p)(A|a)(R|r)(A|a)(M|m)
param_close_el = <\/(P|p)(A|a)(R|r)(A|a)(M|m)>

plaintext_open_el = <(P|p)(L|l)(A|a)(I|i)(N|n)(T|t)(E|e)(X|x)(T|t)
plaintext_close_el = <\/(P|p)(L|l)(A|a)(I|i)(N|n)(T|t)(E|e)(X|x)(T|t)>

pre_open_el = <(P|p)(R|r)(E|e)
pre_close_el = <\/(P|p)(R|r)(E|e)>

q_open_el = <(Q|q)
q_close_el = <\/(Q|q)>

s_open_el = <(S|s)
s_close_el = <\/(S|s)>

samp_open_el = <(S|s)(A|a)(M|m)(P|p)
samp_close_el = <\/(S|s)(A|a)(M|m)(P|p)>

script_open_el = <(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)
script_close_el = <\/(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)>

select_open_el = <(S|s)(E|e)(L|l)(E|e)(C|c)(T|t)
select_close_el = <\/(S|s)(E|e)(L|l)(E|e)(C|c)(T|t)>

small_open_el = <(S|s)(M|m)(A|a)(L|l)(L|l)
small_close_el = <\/(S|s)(M|m)(A|a)(L|l)(L|l)>

span_open_el = <(S|s)(P|p)(A|a)(N|n)
span_close_el = <\/(S|s)(P|p)(A|a)(N|n)>

strike_open_el = <(S|s)(T|t)(R|r)(I|i)(K|k)(E|e)
strike_close_el = <\/(S|s)(T|t)(R|r)(I|i)(K|k)(E|e)>

strong_open_el = <(S|s)(T|t)(R|r)(O|o)(N|n)(G|g)
strong_close_el = <\/(S|s)(T|t)(R|r)(O|o)(N|n)(G|g)>

style_open_el = <(S|s)(T|t)(Y|y)(L|l)(E|e)
style_close_el = <\/(S|s)(T|t)(Y|y)(L|l)(E|e)>

sub_open_el = <(S|s)(U|u)(B|b)
sub_close_el = <\/(S|s)(U|u)(B|b)>

sup_open_el = <(S|s)(U|u)(P|p)
sup_close_el = <\/(S|s)(U|u)(P|p)>

table_open_el = <(T|t)(A|a)(B|b)(L|l)(E|e)
table_close_el = <\/(T|t)(A|a)(B|b)(L|l)(E|e)>

tbody_open_el = <(T|t)(B|b)(O|o)(D|d)(Y|y)
tbody_close_el = <\/(T|t)(B|b)(O|o)(D|d)(Y|y)>

td_open_el = <(T|t)(D|d)
td_close_el = <\/(T|t)(D|d)>

textarea_open_el = <(T|t)(E|e)(X|x)(T|t)(A|a)(R|r)(E|e)(A|a)
textarea_close_el = <\/(T|t)(E|e)(X|x)(T|t)(A|a)(R|r)(E|e)(A|a)>

tfoot_open_el = <(T|t)(F|f)(O|o)(O|o)(T|t)
tfoot_close_el = <\/(T|t)(F|f)(O|o)(O|o)(T|t)>

th_open_el = <(T|t)(H|h)
th_close_el = <\/(T|t)(H|h)>

thead_open_el = <(T|t)(H|h)(E|e)(A|a)(D|d)
thead_close_el = <\/(T|t)(H|h)(E|e)(A|a)(D|d)>

title_open_el = <(T|t)(I|i)(T|t)(L|l)(E|e)
title_close_el = <\/(T|t)(I|i)(T|t)(L|l)(E|e)>

tr_open_el = <(T|t)(R|r)
tr_close_el = <\/(T|t)(R|r)>

tt_open_el = <(T|t)(T|t)
tt_close_el = <\/(T|t)(T|t)>

u_open_el = <(U|u)
u_close_el = <\/(U|u)>

ul_open_el = <(U|u)(L|l)
ul_close_el = <\/(U|u)(L|l)>

var_open_el = <(V|v)(A|a)(R|r)
var_close_el = <\/(V|v)(A|a)(R|r)>

xmp_open_el = <(X|x)(M|m)(P|p)
xmp_close_el = <\/(X|x)(M|m)(P|p)>

/*---------------------------------END OF ELEMENTS---------------------------*/


/*--------------------------------ATTRIBUTES---------------------------------*/
align_attr = align=\"[^\"]*\"
size_attr = size=\"[^\"]*\"
width_attr = width=\"[^\"]*\"
noshade_attr = noshade=\"[^\"]*\"
name_attr = name=\"[^\"]*\"
href_attr = href=\"[^\"]*\"
rel_attr = rel=\"[^\"]*\"
rev_attr = rev=\"[^\"]*\"
title_attr = title=\"[^\"]*\"
urn_attr = urn=\"[^\"]*\"
methods_attr = methods=\"[^\"]*\"
shape_attr = shape=\"[^\"]*\"
coords_attr = coords=\"[^\"]*\"
alt_attr = alt=\"[^\"]*\"
nohref_attr = nohref=\"[^\"]*\"
bgcolor_attr = bgcolor=\"[^\"]*\"
background_attr = background=\"[^\"]*\"
text_attr = text=\"[^\"]*\"
link_attr = link=\"[^\"]*\"
vlink_attr = vlink=\"[^\"]*\"
alink_attr = alink=\"[^\"]*\"
version_attr = version=\"[^\"]*\"
color_attr = color=\"[^\"]*\"
compact_attr = compact=\"[^\"]*\"
clear_attr = clear=\"[^\"]*\"
action_attr = action=\"[^\"]*\"
enctype_attr = enctype=\"[^\"]*\"
method_attr = method=\"[^\"]*\"
src_attr = src=\"[^\"]*\"
height_attr = height=\"[^\"]*\"
hspace_attr = hspace=\"[^\"]*\"
vspace_attr = vspace=\"[^\"]*\"
border_attr = border=\"[^\"]*\"
usemap_attr = usemap=\"[^\"]*\"
ismap_attr = ismap=\"[^\"]*\"
type_attr = type=\"[^\"]*\"
value_attr = value=\"[^\"]*\"
maxlength_attr = maxlength=\"[^\"]*\"
checked_attr = checked=\"[^\"]*\"
prompt_attr = prompt=\"[^\"]*\"
id_attr = id=\"[^\"]*\"
http_equiv_attr = http-equiv=\"[^\"]*\"
content_attr = content=\"[^\"]*\"
start_attr = start=\"[^\"]*\"
selected_attr = selected=\"[^\"]*\"
multiple_attr = multiple=\"[^\"]*\"
cellspacing_attr = cellspacing=\"[^\"]*\"
cellpadding_attr = cellpadding=\"[^\"]*\"
valign_attr = valign=\"[^\"]*\"
rowspan_attr = rowspan=\"[^\"]*\"
colspan_attr = colspan=\"[^\"]*\"
nowrap_attr = nowrap=\"[^\"]*\"
rows_attr = rows=\"[^\"]*\"
cols_attr = cols=\"[^\"]*\"
/*--------------------------------------------END OF ATTRIBUTES---------------------------*/

content = >[^<]* 
ATTRIBUTE_DATA = \"([^\"]*)\"
end_opened_el = >
%eofval{
    return symbolFactory.newSymbol("EOF",sym.EOF);
%eofval}
%state CODESEG
%%
    <YYINITIAL> {
    	
    	{LineTerminator} {/*Ignore*/}
    	/*{identifier} { return symbolFactory.newSymbol("Identifier", Identifier, yytext());}*/
		{a_open_el} { return symbolFactory.newSymbol("AOpen", AOpen); }
		{a_close_el} { return symbolFactory.newSymbol("AClose", AClose); }
		
		{abbr_open_el} { return symbolFactory.newSymbol("AbbrOpen", AbbrOpen); }
		{abbr_close_el} { return symbolFactory.newSymbol("AbbrClose", AbbrClose); }
		
		{acronym_open_el} { return symbolFactory.newSymbol("AcronymOpen", AcronymOpen); }
		{acronym_close_el} { return symbolFactory.newSymbol("AcronymClose", AcronymClose); }
		
		{address_open_el} { return symbolFactory.newSymbol("AddressOpen", AddressOpen); }
		{address_close_el} { return symbolFactory.newSymbol("AddressClose", AddressClose); }
		
		{applet_open_el} { return symbolFactory.newSymbol("AppletOpen", AppletOpen); }
		{applet_close_el} { return symbolFactory.newSymbol("AppletClose", AppletClose); }
		
		{area_open_el} { return symbolFactory.newSymbol("AreaOpen", AreaOpen); }
		{area_close_el} { return symbolFactory.newSymbol("AreaClose", AreaClose); }
		
		{b_open_el} { return symbolFactory.newSymbol("BOpen", BOpen); }
		{b_close_el} { return symbolFactory.newSymbol("BClose", BClose); }
		
		{base_open_el} { return symbolFactory.newSymbol("BaseOpen", BaseOpen); }
		{base_close_el} { return symbolFactory.newSymbol("BaseClose", BaseClose); }
		
		{basefont_open_el} { return symbolFactory.newSymbol("BasefontOpen", BasefontOpen); }
		{basefont_close_el} { return symbolFactory.newSymbol("BasefontClose", BasefontClose); }
		
		{bdo_open_el} { return symbolFactory.newSymbol("BdoOpen", BdoOpen); }
		{bdo_close_el} { return symbolFactory.newSymbol("BdoClose", BdoClose); }
		
		{big_open_el} { return symbolFactory.newSymbol("BigOpen", BigOpen); }
		{big_close_el} { return symbolFactory.newSymbol("BigClose", BigClose); }
		
		{blockquote_open_el} { return symbolFactory.newSymbol("BlockquoteOpen", BlockquoteOpen); }
		{blockquote_close_el} { return symbolFactory.newSymbol("BlockquoteClose", BlockquoteClose); }
		
		{body_open_el} { return symbolFactory.newSymbol("BodyOpen", BodyOpen); }
		{body_close_el} { return symbolFactory.newSymbol("BodyClose", BodyClose); }
		
		{br_open_el} { return symbolFactory.newSymbol("BrOpen", BrOpen); }
		{br_close_el} { return symbolFactory.newSymbol("BrClose", BrClose); }
		
		{button_open_el} { return symbolFactory.newSymbol("ButtonOpen", ButtonOpen); }
		{button_close_el} { return symbolFactory.newSymbol("ButtonClose", ButtonClose); }
		
		{caption_open_el} { return symbolFactory.newSymbol("CaptionOpen", CaptionOpen); }
		{caption_close_el} { return symbolFactory.newSymbol("CaptionClose", CaptionClose); }
		
		{center_open_el} { return symbolFactory.newSymbol("CenterOpen", CenterOpen); }
		{center_close_el} { return symbolFactory.newSymbol("CenterClose", CenterClose); }
		
		{cite_open_el} { return symbolFactory.newSymbol("CiteOpen", CiteOpen); }
		{cite_close_el} { return symbolFactory.newSymbol("CiteClose", CiteClose); }
		
		{code_open_el} { return symbolFactory.newSymbol("CodeOpen", CodeOpen); }
		{code_close_el} { return symbolFactory.newSymbol("CodeClose", CodeClose); }
		
		{col_open_el} { return symbolFactory.newSymbol("ColOpen", ColOpen); }
		{col_close_el} { return symbolFactory.newSymbol("ColClose", ColClose); }
		
		{colgroup_open_el} { return symbolFactory.newSymbol("ColgroupOpen", ColgroupOpen); }
		{colgroup_close_el} { return symbolFactory.newSymbol("ColgroupClose", ColgroupClose); }
		
		{dd_open_el} { return symbolFactory.newSymbol("DdOpen", DdOpen); }
		{dd_close_el} { return symbolFactory.newSymbol("DdClose", DdClose); }
		
		{del_open_el} { return symbolFactory.newSymbol("DelOpen", DelOpen); }
		{del_close_el} { return symbolFactory.newSymbol("DelClose", DelClose); }
		
		{dfn_open_el} { return symbolFactory.newSymbol("DfnOpen", DfnOpen); }
		{dfn_close_el} { return symbolFactory.newSymbol("DfnClose", DfnClose); }
		
		{dir_open_el} { return symbolFactory.newSymbol("DirOpen", DirOpen); }
		{dir_close_el} { return symbolFactory.newSymbol("DirClose", DirClose); }
		
		{div_open_el} { return symbolFactory.newSymbol("DivOpen", DivOpen); }
		{div_close_el} { return symbolFactory.newSymbol("DivClose", DivClose); }
		
		{dl_open_el} { return symbolFactory.newSymbol("DlOpen", DlOpen); }
		{dl_close_el} { return symbolFactory.newSymbol("DlClose", DlClose); }
		
		{dt_open_el} { return symbolFactory.newSymbol("DtOpen", DtOpen); }
		{dt_close_el} { return symbolFactory.newSymbol("DtClose", DtClose); }
		
		{em_open_el} { return symbolFactory.newSymbol("EmOpen", EmOpen); }
		{em_close_el} { return symbolFactory.newSymbol("EmClose", EmClose); }
		
		{fieldset_open_el} { return symbolFactory.newSymbol("FieldsetOpen", FieldsetOpen); }
		{fieldset_close_el} { return symbolFactory.newSymbol("FieldsetClose", FieldsetClose); }
		
		{font_open_el} { return symbolFactory.newSymbol("FontOpen", FontOpen); }
		{font_close_el} { return symbolFactory.newSymbol("FontClose", FontClose); }
		
		{form_open_el} { return symbolFactory.newSymbol("FormOpen", FormOpen); }
		{form_close_el} { return symbolFactory.newSymbol("FormClose", FormClose); }
		
		{frame_open_el} { return symbolFactory.newSymbol("FrameOpen", FrameOpen); }
		{frame_close_el} { return symbolFactory.newSymbol("FrameClose", FrameClose); }
		
		{frameset_open_el} { return symbolFactory.newSymbol("FramesetOpen", FramesetOpen); }
		{frameset_close_el} { return symbolFactory.newSymbol("FramesetClose", FramesetClose); }
		
		{head_open_el} { return symbolFactory.newSymbol("HeadOpen", HeadOpen); }
		{head_close_el} { return symbolFactory.newSymbol("HeadClose", HeadClose); }
		
		{hn_open_el} { return symbolFactory.newSymbol("HnOpen", HnOpen); }
		{hn_close_el} { return symbolFactory.newSymbol("HnClose", HnClose); }
		
		{hr_open_el} { return symbolFactory.newSymbol("HrOpen", HrOpen); }
		{hr_close_el} { return symbolFactory.newSymbol("HrClose", HrClose); }
		
		{html_open_el} { return symbolFactory.newSymbol("HtmlOpen", HtmlOpen); }
		{html_close_el} { return symbolFactory.newSymbol("HtmlClose", HtmlClose); }
		
		{i_open_el} { return symbolFactory.newSymbol("IOpen", IOpen); }
		{i_close_el} { return symbolFactory.newSymbol("IClose", IClose); }
		
		{iframe_open_el} { return symbolFactory.newSymbol("IframeOpen", IframeOpen); }
		{iframe_close_el} { return symbolFactory.newSymbol("IframeClose", IframeClose); }
		
		{img_open_el} { return symbolFactory.newSymbol("ImgOpen", ImgOpen); }
		{img_close_el} { return symbolFactory.newSymbol("ImgClose", ImgClose); }
		
		{input_open_el} { return symbolFactory.newSymbol("InputOpen", InputOpen); }
		{input_close_el} { return symbolFactory.newSymbol("InputClose", InputClose); }
		
		{ins_open_el} { return symbolFactory.newSymbol("InsOpen", InsOpen); }
		{ins_close_el} { return symbolFactory.newSymbol("InsClose", InsClose); }
		
		{isindex_open_el} { return symbolFactory.newSymbol("IsindexOpen", IsindexOpen); }
		{isindex_close_el} { return symbolFactory.newSymbol("IsindexClose", IsindexClose); }
		
		{kbd_open_el} { return symbolFactory.newSymbol("KbdOpen", KbdOpen); }
		{kbd_close_el} { return symbolFactory.newSymbol("KbdClose", KbdClose); }
		
		{label_open_el} { return symbolFactory.newSymbol("LabelOpen", LabelOpen); }
		{label_close_el} { return symbolFactory.newSymbol("LabelClose", LabelClose); }
		
		{legend_open_el} { return symbolFactory.newSymbol("LegendOpen", LegendOpen); }
		{legend_close_el} { return symbolFactory.newSymbol("LegendClose", LegendClose); }
		
		{li_open_el} { return symbolFactory.newSymbol("LiOpen", LiOpen); }
		{li_close_el} { return symbolFactory.newSymbol("LiClose", LiClose); }
		
		{link_open_el} { return symbolFactory.newSymbol("LinkOpen", LinkOpen); }
		{link_close_el} { return symbolFactory.newSymbol("LinkClose", LinkClose); }
		
		{listing_open_el} { return symbolFactory.newSymbol("ListingOpen", ListingOpen); }
		{listing_close_el} { return symbolFactory.newSymbol("ListingClose", ListingClose); }
		
		{map_open_el} { return symbolFactory.newSymbol("MapOpen", MapOpen); }
		{map_close_el} { return symbolFactory.newSymbol("MapClose", MapClose); }
		
		{menu_open_el} { return symbolFactory.newSymbol("MenuOpen", MenuOpen); }
		{menu_close_el} { return symbolFactory.newSymbol("MenuClose", MenuClose); }
		
		{meta_open_el} { return symbolFactory.newSymbol("MetaOpen", MetaOpen); }
		{meta_close_el} { return symbolFactory.newSymbol("MetaClose", MetaClose); }
		
		{nextid_open_el} { return symbolFactory.newSymbol("NextidOpen", NextidOpen); }
		{nextid_close_el} { return symbolFactory.newSymbol("NextidClose", NextidClose); }
		
		{noframes_open_el} { return symbolFactory.newSymbol("NoframesOpen", NoframesOpen); }
		{noframes_close_el} { return symbolFactory.newSymbol("NoframesClose", NoframesClose); }
		
		{noscript_open_el} { return symbolFactory.newSymbol("NoscriptOpen", NoscriptOpen); }
		{noscript_close_el} { return symbolFactory.newSymbol("NoscriptClose", NoscriptClose); }
		
		{object_open_el} { return symbolFactory.newSymbol("ObjectOpen", ObjectOpen); }
		{object_close_el} { return symbolFactory.newSymbol("ObjectClose", ObjectClose); }
		
		{ol_open_el} { return symbolFactory.newSymbol("OlOpen", OlOpen); }
		{ol_close_el} { return symbolFactory.newSymbol("OlClose", OlClose); }
		
		{optgroup_open_el} { return symbolFactory.newSymbol("OptgroupOpen", OptgroupOpen); }
		{optgroup_close_el} { return symbolFactory.newSymbol("OptgroupClose", OptgroupClose); }
		
		{option_open_el} { return symbolFactory.newSymbol("OptionOpen", OptionOpen); }
		{option_close_el} { return symbolFactory.newSymbol("OptionClose", OptionClose); }
		
		{p_open_el} { return symbolFactory.newSymbol("POpen", POpen); }
		{p_close_el} { return symbolFactory.newSymbol("PClose", PClose); }
		
		{param_open_el} { return symbolFactory.newSymbol("ParamOpen", ParamOpen); }
		{param_close_el} { return symbolFactory.newSymbol("ParamClose", ParamClose); }
		
		{plaintext_open_el} { return symbolFactory.newSymbol("PlaintextOpen", PlaintextOpen); }
		{plaintext_close_el} { return symbolFactory.newSymbol("PlaintextClose", PlaintextClose); }
		
		{pre_open_el} { return symbolFactory.newSymbol("PreOpen", PreOpen); }
		{pre_close_el} { return symbolFactory.newSymbol("PreClose", PreClose); }
		
		{q_open_el} { return symbolFactory.newSymbol("QOpen", QOpen); }
		{q_close_el} { return symbolFactory.newSymbol("QClose", QClose); }
		
		{s_open_el} { return symbolFactory.newSymbol("SOpen", SOpen); }
		{s_close_el} { return symbolFactory.newSymbol("SClose", SClose); }
		
		{samp_open_el} { return symbolFactory.newSymbol("SampOpen", SampOpen); }
		{samp_close_el} { return symbolFactory.newSymbol("SampClose", SampClose); }
		
		{script_open_el} { return symbolFactory.newSymbol("ScriptOpen", ScriptOpen); }
		{script_close_el} { return symbolFactory.newSymbol("ScriptClose", ScriptClose); }
		
		{select_open_el} { return symbolFactory.newSymbol("SelectOpen", SelectOpen); }
		{select_close_el} { return symbolFactory.newSymbol("SelectClose", SelectClose); }
		
		{small_open_el} { return symbolFactory.newSymbol("SmallOpen", SmallOpen); }
		{small_close_el} { return symbolFactory.newSymbol("SmallClose", SmallClose); }
		
		{span_open_el} { return symbolFactory.newSymbol("SpanOpen", SpanOpen); }
		{span_close_el} { return symbolFactory.newSymbol("SpanClose", SpanClose); }
		
		{strike_open_el} { return symbolFactory.newSymbol("StrikeOpen", StrikeOpen); }
		{strike_close_el} { return symbolFactory.newSymbol("StrikeClose", StrikeClose); }
		
		{strong_open_el} { return symbolFactory.newSymbol("StrongOpen", StrongOpen); }
		{strong_close_el} { return symbolFactory.newSymbol("StrongClose", StrongClose); }
		
		{style_open_el} { return symbolFactory.newSymbol("StyleOpen", StyleOpen); }
		{style_close_el} { return symbolFactory.newSymbol("StyleClose", StyleClose); }
		
		{sub_open_el} { return symbolFactory.newSymbol("SubOpen", SubOpen); }
		{sub_close_el} { return symbolFactory.newSymbol("SubClose", SubClose); }
		
		{sup_open_el} { return symbolFactory.newSymbol("SupOpen", SupOpen); }
		{sup_close_el} { return symbolFactory.newSymbol("SupClose", SupClose); }
		
		{table_open_el} { return symbolFactory.newSymbol("TableOpen", TableOpen); }
		{table_close_el} { return symbolFactory.newSymbol("TableClose", TableClose); }
		
		{tbody_open_el} { return symbolFactory.newSymbol("TbodyOpen", TbodyOpen); }
		{tbody_close_el} { return symbolFactory.newSymbol("TbodyClose", TbodyClose); }
		
		{td_open_el} { return symbolFactory.newSymbol("TdOpen", TdOpen); }
		{td_close_el} { return symbolFactory.newSymbol("TdClose", TdClose); }
		
		{textarea_open_el} { return symbolFactory.newSymbol("TextareaOpen", TextareaOpen); }
		{textarea_close_el} { return symbolFactory.newSymbol("TextareaClose", TextareaClose); }
		
		{tfoot_open_el} { return symbolFactory.newSymbol("TfootOpen", TfootOpen); }
		{tfoot_close_el} { return symbolFactory.newSymbol("TfootClose", TfootClose); }
		
		{th_open_el} { return symbolFactory.newSymbol("ThOpen", ThOpen); }
		{th_close_el} { return symbolFactory.newSymbol("ThClose", ThClose); }
		
		{thead_open_el} { return symbolFactory.newSymbol("TheadOpen", TheadOpen); }
		{thead_close_el} { return symbolFactory.newSymbol("TheadClose", TheadClose); }
		
		{title_open_el} { return symbolFactory.newSymbol("TitleOpen", TitleOpen); }
		{title_close_el} { return symbolFactory.newSymbol("TitleClose", TitleClose); }
		
		{tr_open_el} { return symbolFactory.newSymbol("TrOpen", TrOpen); }
		{tr_close_el} { return symbolFactory.newSymbol("TrClose", TrClose); }
		
		{tt_open_el} { return symbolFactory.newSymbol("TtOpen", TtOpen); }
		{tt_close_el} { return symbolFactory.newSymbol("TtClose", TtClose); }
		
		{u_open_el} { return symbolFactory.newSymbol("UOpen", UOpen); }
		{u_close_el} { return symbolFactory.newSymbol("UClose", UClose); }
		
		{ul_open_el} { return symbolFactory.newSymbol("UlOpen", UlOpen); }
		{ul_close_el} { return symbolFactory.newSymbol("UlClose", UlClose); }
		
		{var_open_el} { return symbolFactory.newSymbol("VarOpen", VarOpen); }
		{var_close_el} { return symbolFactory.newSymbol("VarClose", VarClose); }
		
		{xmp_open_el} { return symbolFactory.newSymbol("XmpOpen", XmpOpen); }
		{xmp_close_el} { return symbolFactory.newSymbol("XmpClose", XmpClose); }
		
		{align_attr} {return symbolFactory.newSymbol("ALIGN_ATTR", ALIGN_ATTR);}
		{size_attr} {return symbolFactory.newSymbol("SIZE_ATTR_HR", SIZE_ATTR_HR);}
		{width_attr} {return symbolFactory.newSymbol("WIDTH_ATTR_HR", WIDTH_ATTR_HR);}
		{noshade_attr} {return symbolFactory.newSymbol("NOSHADE_ATTR", NOSHADE_ATTR);}
		{name_attr} {return symbolFactory.newSymbol("NAME_ATTR", NAME_ATTR);}
		{href_attr} {return symbolFactory.newSymbol("HREF_ATTR", HREF_ATTR);}
		{rel_attr} {return symbolFactory.newSymbol("REL_ATTR", REL_ATTR);}
		{rev_attr} {return symbolFactory.newSymbol("REV_ATTR", REV_ATTR);}
		{title_attr} {return symbolFactory.newSymbol("TITLE_ATTR", TITLE_ATTR);}
		{urn_attr} {return symbolFactory.newSymbol("URN_ATTR", URN_ATTR);}
		{methods_attr} {return symbolFactory.newSymbol("METHODS_ATTR", METHODS_ATTR);}
		{shape_attr} {return symbolFactory.newSymbol("SHAPE_ATTR", SHAPE_ATTR);}
		{coords_attr} {return symbolFactory.newSymbol("COORDS_ATTR", COORDS_ATTR);}
		{alt_attr} {return symbolFactory.newSymbol("ALT_ATTR", ALT_ATTR);}
		{nohref_attr} {return symbolFactory.newSymbol("NOHREF_ATTR", NOHREF_ATTR);}
		{bgcolor_attr} {return symbolFactory.newSymbol("BGCOLOR_ATTR", BGCOLOR_ATTR);}
		{background_attr} {return symbolFactory.newSymbol("BACKGROUND_ATTR", BACKGROUND_ATTR);}
		{text_attr} {return symbolFactory.newSymbol("TEXT_ATTR", TEXT_ATTR);}
		{link_attr} {return symbolFactory.newSymbol("LINK_ATTR", LINK_ATTR);}
		{vlink_attr} {return symbolFactory.newSymbol("VLINK_ATTR", VLINK_ATTR);}
		{alink_attr} {return symbolFactory.newSymbol("ALINK_ATTR", ALINK_ATTR);}
		{version_attr} {return symbolFactory.newSymbol("VERSION_ATTR", VERSION_ATTR);}
		{color_attr} {return symbolFactory.newSymbol("COLOR_ATTR", COLOR_ATTR);}
		{compact_attr} {return symbolFactory.newSymbol("COMPACT_ATTR", COMPACT_ATTR);}
		{clear_attr} {return symbolFactory.newSymbol("CLEAR_ATTR", CLEAR_ATTR);}	
		{action_attr} {return symbolFactory.newSymbol("ACTION_ATTR", ACTION_ATTR);}
		{enctype_attr} {return symbolFactory.newSymbol("ENCTYPE_ATTR", ENCTYPE_ATTR);}
		{method_attr} {return symbolFactory.newSymbol("METHOD_ATTR", METHOD_ATTR);}		
		{src_attr} {return symbolFactory.newSymbol("SRC_ATTR", SRC_ATTR);}
		{height_attr} {return symbolFactory.newSymbol("HEIGHT_ATTR", HEIGHT_ATTR);}
		{hspace_attr} {return symbolFactory.newSymbol("HSPACE_ATTR", HSPACE_ATTR);}
		{vspace_attr} {return symbolFactory.newSymbol("VSPACE_ATTR", VSPACE_ATTR);}
		{border_attr} {return symbolFactory.newSymbol("BORDER_ATTR", BORDER_ATTR);}
		{usemap_attr} {return symbolFactory.newSymbol("USEMAP_ATTR", USEMAP_ATTR);}	
		{ismap_attr} {return symbolFactory.newSymbol("ISMAP_ATTR", ISMAP_ATTR);}	
		{type_attr} {return symbolFactory.newSymbol("TYPE_ATTR", TYPE_ATTR);}
		{value_attr} {return symbolFactory.newSymbol("VALUE_ATTR", VALUE_ATTR);}
		{maxlength_attr} {return symbolFactory.newSymbol("MAXLENGTH_ATTR", MAXLENGTH_ATTR);}
		{checked_attr} {return symbolFactory.newSymbol("CHECKED_ATTR", CHECKED_ATTR);}
		{prompt_attr} {return symbolFactory.newSymbol("PROMPT_ATTR", PROMPT_ATTR);}
		{id_attr} {return symbolFactory.newSymbol("ID_ATTR", ID_ATTR);}
		{http_equiv_attr} {return symbolFactory.newSymbol("HTTP_EQUIV_ATTR", HTTP_EQUIV_ATTR);}
		{content_attr} {return symbolFactory.newSymbol("CONTENT_ATTR", CONTENT_ATTR);}
		{start_attr} {return symbolFactory.newSymbol("START_ATTR", START_ATTR);}
		{selected_attr} {return symbolFactory.newSymbol("SELECTED_ATTR", SELECTED_ATTR);}
		{multiple_attr} {return symbolFactory.newSymbol("MULTIPLE_ATTR", MULTIPLE_ATTR);}
		{cellspacing_attr} {return symbolFactory.newSymbol("CELLSPACING_ATTR", CELLSPACING_ATTR);}
		{cellpadding_attr} {return symbolFactory.newSymbol("CELLPADDING_ATTR", CELLPADDING_ATTR);}
		{valign_attr} {return symbolFactory.newSymbol("VALIGN_ATTR", VALIGN_ATTR);}
		{rowspan_attr} {return symbolFactory.newSymbol("ROWSPAN_ATTR", ROWSPAN_ATTR);}
		{colspan_attr} {return symbolFactory.newSymbol("COLSPAN_ATTR", COLSPAN_ATTR);}
		{nowrap_attr} {return symbolFactory.newSymbol("NOWRAP_ATTR", NOWRAP_ATTR);}
		{rows_attr} {return symbolFactory.newSymbol("ROWS_ATTR", ROWS_ATTR);}
		{cols_attr} {return symbolFactory.newSymbol("COLS_ATTR", COLS_ATTR);}
		
		{ATTRIBUTE_DATA} {
								String buffer = yytext();
								buffer = buffer.replace("\"", "");
								return symbolFactory.newSymbol("AttributeData", ATTRIBUTE_DATA, buffer);
						  }
		
		{content} { 
			String buffer = yytext();
			buffer = buffer.replace(">","");
			buffer = buffer.trim();
			if(buffer.length() > 0) {
				return symbolFactory.newSymbol("CONTENT", CONTENT, buffer) ;
			}
		}
					 
    }

// error fallback
.|\n          { emit_warning("Unrecognized character '" +yytext()+"' -- ignored"); }                                                