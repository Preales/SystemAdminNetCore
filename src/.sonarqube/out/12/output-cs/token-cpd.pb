“]
OE:\Proyecto\C#\Prueba\SystemAdmin\SystemAdmin\Controllers\EmployeeController.cs
	namespace 	
SystemAdmin
 
. 
Controllers !
{ 
[ 
	Authorize 
] 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class 
EmployeeController #
:$ %
ControllerBase& 4
{ 
private 
readonly 
ILogger  
<  !
EmployeeController! 3
>3 4
_logger5 <
;< =
private 
readonly 
IEmployeeService )
_service* 2
;2 3
private 
readonly 
IMapper  
_mapper! (
;( )
public 
EmployeeController !
(! "
ILogger 
< 
EmployeeController &
>& '
logger( .
,. /
IEmployeeService 
service $
,$ %
IMapper 
mapper 
) 
{ 	
_logger 
= 
logger 
; 
_service   
=   
service   
;   
_mapper!! 
=!! 
mapper!! 
;!! 
}"" 	
[$$ 	
HttpGet$$	 
]$$ 
[%% 	 
ProducesResponseType%%	 
(%% 
(%% 
int%% "
)%%" #
HttpStatusCode%%# 1
.%%1 2

BadRequest%%2 <
)%%< =
]%%= >
[&& 	 
ProducesResponseType&&	 
(&& 
(&& 
int&& "
)&&" #
HttpStatusCode&&# 1
.&&1 2
OK&&2 4
,&&4 5
Type&&6 :
=&&; <
typeof&&= C
(&&C D
IEnumerable&&D O
<&&O P
Employee&&P X
>&&X Y
)&&Y Z
)&&Z [
]&&[ \
['' 	
	Authorize''	 
('' !
AuthenticationSchemes'' (
='') *
JwtBearerDefaults''+ <
.''< = 
AuthenticationScheme''= Q
)''Q R
]''R S
public(( 
async(( 
Task(( 
<(( 
IActionResult(( '
>((' (
GetAllAsync(() 4
(((4 5
)((5 6
{)) 	
_logger** 
.** 
LogInformation** "
(**" #
nameof**# )
(**) *
GetAllAsync*** 5
)**5 6
)**6 7
;**7 8
try++ 
{,, 
var-- 
result-- 
=-- 
await-- "
_service--# +
.--+ ,
GetAllAsync--, 7
(--7 8
)--8 9
;--9 :
return.. 
Ok.. 
(.. 
new.. 
ApiResponse.. )
<..) *
IEnumerable..* 5
<..5 6
Employee..6 >
>..> ?
>..? @
(..@ A
$str..A E
,..E F
$str..G I
,..I J
result..K Q
)..Q R
)..R S
;..S T
}// 
catch00 
(00 
	Exception00 
ex00 
)00  
{11 
_logger22 
.22 
LogError22  
(22  !
ex22! #
,22# $
$"22% '
{22' (
nameof22( .
(22. /
GetAllAsync22/ :
)22: ;
}22; <
 fallo general22< J
"22J K
)22K L
;22L M
return33 
Ok33 
(33 
new33 
ApiResponse33 )
<33) *
	Exception33* 3
>333 4
(334 5
$str335 <
,33< =
ex33> @
.33@ A
Message33A H
,33H I
ex33J L
)33L M
)33M N
;33N O
}44 
}55 	
[77 	
HttpGet77	 
]77 
[88 	 
ProducesResponseType88	 
(88 
(88 
int88 "
)88" #
HttpStatusCode88# 1
.881 2

BadRequest882 <
)88< =
]88= >
[99 	 
ProducesResponseType99	 
(99 
(99 
int99 "
)99" #
HttpStatusCode99# 1
.991 2
OK992 4
,994 5
Type996 :
=99; <
typeof99= C
(99C D
Employee99D L
)99L M
)99M N
]99N O
[:: 	
	Authorize::	 
(:: !
AuthenticationSchemes:: (
=::) *
JwtBearerDefaults::+ <
.::< = 
AuthenticationScheme::= Q
)::Q R
]::R S
[;; 	
Route;;	 
(;; 
$str;; 
);; 
];; 
public<< 
async<< 
Task<< 
<<< 
IActionResult<< '
><<' (
GetByIdAsync<<) 5
(<<5 6
string<<6 <
Id<<= ?
)<<? @
{== 	
_logger>> 
.>> 
LogInformation>> "
(>>" #
nameof>># )
(>>) *
GetByIdAsync>>* 6
)>>6 7
)>>7 8
;>>8 9
try?? 
{@@ 
varAA 
resultAA 
=AA 
awaitAA "
_serviceAA# +
.AA+ ,
GetByIdAsyncAA, 8
(AA8 9
GuidAA9 =
.AA= >
ParseAA> C
(AAC D
IdAAD F
)AAF G
)AAG H
;AAH I
returnBB 
OkBB 
(BB 
newBB 
ApiResponseBB )
<BB) *
EmployeeBB* 2
>BB2 3
(BB3 4
$strBB4 8
,BB8 9
$strBB: <
,BB< =
resultBB> D
)BBD E
)BBE F
;BBF G
}CC 
catchDD 
(DD 
	ExceptionDD 
exDD 
)DD  
{EE 
_loggerFF 
.FF 
LogErrorFF  
(FF  !
exFF! #
,FF# $
$"FF% '
{FF' (
nameofFF( .
(FF. /
GetByIdAsyncFF/ ;
)FF; <
}FF< =
 fallo generalFF= K
"FFK L
)FFL M
;FFM N
returnGG 
OkGG 
(GG 
newGG 
ApiResponseGG )
<GG) *
	ExceptionGG* 3
>GG3 4
(GG4 5
$strGG5 <
,GG< =
exGG> @
.GG@ A
MessageGGA H
,GGH I
exGGJ L
)GGL M
)GGM N
;GGN O
}HH 
}II 	
[KK 	
HttpPostKK	 
]KK 
[LL 	 
ProducesResponseTypeLL	 
(LL 
(LL 
intLL "
)LL" #
HttpStatusCodeLL# 1
.LL1 2

BadRequestLL2 <
)LL< =
]LL= >
[MM 	 
ProducesResponseTypeMM	 
(MM 
(MM 
intMM "
)MM" #
HttpStatusCodeMM# 1
.MM1 2
OKMM2 4
,MM4 5
TypeMM6 :
=MM; <
typeofMM= C
(MMC D
EmployeeDtoMMD O
)MMO P
)MMP Q
]MMQ R
[NN 	
	AuthorizeNN	 
(NN !
AuthenticationSchemesNN (
=NN) *
JwtBearerDefaultsNN+ <
.NN< = 
AuthenticationSchemeNN= Q
)NNQ R
]NNR S
publicOO 
asyncOO 
TaskOO 
<OO 
IActionResultOO '
>OO' (
	PostAsyncOO) 2
(OO2 3
EmployeeDtoOO3 >
dataOO? C
)OOC D
{PP 	
_loggerQQ 
.QQ 
LogInformationQQ "
(QQ" #
nameofQQ# )
(QQ) *
	PostAsyncQQ* 3
)QQ3 4
)QQ4 5
;QQ5 6
tryRR 
{SS 
dataTT 
.TT 
IdTT 
=TT 
GuidTT 
.TT 
NewGuidTT &
(TT& '
)TT' (
.TT( )
ToStringTT) 1
(TT1 2
)TT2 3
;TT3 4
varUU 
entityUU 
=UU 
_mapperUU $
.UU$ %
MapUU% (
<UU( )
EmployeeUU) 1
>UU1 2
(UU2 3
dataUU3 7
)UU7 8
;UU8 9
awaitVV 
_serviceVV 
.VV 
AddAsyncVV '
(VV' (
entityVV( .
)VV. /
;VV/ 0
returnWW 
OkWW 
(WW 
newWW 
ApiResponseWW )
<WW) *
EmployeeWW* 2
>WW2 3
(WW3 4
$strWW4 8
,WW8 9
$strWW: <
,WW< =
entityWW= C
)WWC D
)WWD E
;WWE F
}XX 
catchYY 
(YY 
	ExceptionYY 
exYY 
)YY  
{ZZ 
_logger[[ 
.[[ 
LogError[[  
([[  !
ex[[! #
,[[# $
$"[[% '
{[[' (
nameof[[( .
([[. /
	PostAsync[[/ 8
)[[8 9
}[[9 :
 fallo general[[: H
"[[H I
)[[I J
;[[J K
return\\ 
Ok\\ 
(\\ 
new\\ 
ApiResponse\\ )
<\\) *
	Exception\\* 3
>\\3 4
(\\4 5
$str\\5 <
,\\< =
ex\\> @
.\\@ A
Message\\A H
,\\H I
ex\\J L
)\\L M
)\\M N
;\\N O
}]] 
}^^ 	
[`` 	
HttpPut``	 
]`` 
[aa 	 
ProducesResponseTypeaa	 
(aa 
(aa 
intaa "
)aa" #
HttpStatusCodeaa# 1
.aa1 2

BadRequestaa2 <
)aa< =
]aa= >
[bb 	 
ProducesResponseTypebb	 
(bb 
(bb 
intbb "
)bb" #
HttpStatusCodebb# 1
.bb1 2
OKbb2 4
,bb4 5
Typebb6 :
=bb; <
typeofbb= C
(bbC D
EmployeebbD L
)bbL M
)bbM N
]bbN O
[cc 	
	Authorizecc	 
(cc !
AuthenticationSchemescc (
=cc) *
JwtBearerDefaultscc+ <
.cc< = 
AuthenticationSchemecc= Q
)ccQ R
]ccR S
publicdd 
asyncdd 
Taskdd 
<dd 
IActionResultdd '
>dd' (
PutAsyncdd) 1
(dd1 2
Employeedd2 :
entitydd; A
)ddA B
{ee 	
_loggerff 
.ff 
LogInformationff "
(ff" #
nameofff# )
(ff) *
PutAsyncff* 2
)ff2 3
)ff3 4
;ff4 5
trygg 
{hh 
awaitii 
_serviceii 
.ii 
UpdateAsyncii *
(ii* +
entityii+ 1
)ii1 2
;ii2 3
returnjj 
Okjj 
(jj 
newjj 
ApiResponsejj )
<jj) *
Employeejj* 2
>jj2 3
(jj3 4
$strjj4 8
,jj8 9
$strjj: <
,jj< =
entityjj> D
)jjD E
)jjE F
;jjF G
}kk 
catchll 
(ll 
	Exceptionll 
exll 
)ll  
{mm 
_loggernn 
.nn 
LogErrornn  
(nn  !
exnn! #
,nn# $
$"nn% '
{nn' (
nameofnn( .
(nn. /
PutAsyncnn/ 7
)nn7 8
}nn8 9
 fallo generalnn9 G
"nnG H
)nnH I
;nnI J
returnoo 
Okoo 
(oo 
newoo 
ApiResponseoo )
<oo) *
	Exceptionoo* 3
>oo3 4
(oo4 5
$stroo5 <
,oo< =
exoo> @
.oo@ A
MessageooA H
,ooH I
exooJ L
)ooL M
)ooM N
;ooN O
}pp 
}qq 	
}rr 
}ss ™K
KE:\Proyecto\C#\Prueba\SystemAdmin\SystemAdmin\Controllers\UserController.cs
	namespace 	
SystemAdmin
 
. 
Controllers !
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class 
UserController 
:  !
ControllerBase" 0
{ 
private 
readonly 
ILogger  
<  !
UserController! /
>/ 0
_logger1 8
;8 9
private 
readonly 
UserManager $
<$ %
User% )
>) *
_userManager+ 7
;7 8
private 
readonly 
SignInManager &
<& '
User' +
>+ ,
_signInManager- ;
;; <
private 
readonly 

JwtSetting #
_settingsJwt$ 0
;0 1
public 
UserController 
( 
ILogger 
< 
UserController "
>" #
logger$ *
,* +
UserManager 
< 
User 
> 
userManager )
,) *
SignInManager 
< 
User 
> 
signInManager  -
,- .
IOptionsMonitor 
< 

JwtSetting &
>& '

jwtSetting( 2
)2 3
{   	
_logger!! 
=!! 
logger!! 
;!! 
_userManager"" 
="" 
userManager"" &
;""& '
_signInManager## 
=## 
signInManager## *
;##* +
_settingsJwt$$ 
=$$ 

jwtSetting$$ %
.$$% &
CurrentValue$$& 2
;$$2 3
}%% 	
[(( 	
HttpPost((	 
](( 
[)) 	 
ProducesResponseType))	 
()) 
()) 
int)) "
)))" #
HttpStatusCode))# 1
.))1 2

BadRequest))2 <
)))< =
]))= >
[** 	 
ProducesResponseType**	 
(** 
(** 
int** "
)**" #
HttpStatusCode**# 1
.**1 2
OK**2 4
,**4 5
Type**6 :
=**; <
typeof**= C
(**C D
Object**D J
)**J K
)**K L
]**L M
[++ 	
Route++	 
(++ 
$str++ 
)++ 
]++ 
public,, 
async,, 
Task,, 
<,, 
Object,,  
>,,  !
PostUser,," *
(,,* +
	UserModel,,+ 4
model,,5 :
),,: ;
{-- 	
_logger.. 
... 
LogInformation.. "
(.." #
nameof..# )
(..) *
PostUser..* 2
)..2 3
)..3 4
;..4 5
try// 
{00 
var11 
user11 
=11 
new11 
User11 #
(11# $
)11$ %
{22 
UserName33 
=33 
model33 $
.33$ %
UserName33% -
,33- .
Email44 
=44 
model44 !
.44! "
Email44" '
,44' (
FullName55 
=55 
model55 $
.55$ %
FullName55% -
}66 
;66 
var88 
result88 
=88 
await88 "
_userManager88# /
.88/ 0
CreateAsync880 ;
(88; <
user88< @
,88@ A
model88B G
.88G H
Password88H P
)88P Q
;88Q R
return99 
Ok99 
(99 
result99  
)99  !
;99! "
}:: 
catch;; 
(;; 
	Exception;; 
ex;; 
);;  
{<< 
_logger== 
.== 
LogError==  
(==  !
ex==! #
,==# $
$"==$ &
{==& '
nameof==' -
(==- .
PostUser==. 6
)==6 7
}==7 8
 fallo general==8 F
"==F G
)==G H
;==H I
throw>> 
;>> 
}?? 
}@@ 	
[BB 	
HttpPostBB	 
]BB 
[CC 	 
ProducesResponseTypeCC	 
(CC 
(CC 
intCC "
)CC" #
HttpStatusCodeCC# 1
.CC1 2

BadRequestCC2 <
)CC< =
]CC= >
[DD 	 
ProducesResponseTypeDD	 
(DD 
(DD 
intDD "
)DD" #
HttpStatusCodeDD# 1
.DD1 2
OKDD2 4
,DD4 5
TypeDD6 :
=DD; <
typeofDD= C
(DDC D
IActionResultDDD Q
)DDQ R
)DDR S
]DDS T
[EE 	
RouteEE	 
(EE 
$strEE 
)EE 
]EE 
publicFF 
asyncFF 
TaskFF 
<FF 
IActionResultFF '
>FF' (
LoginFF) .
(FF. /
	UserModelFF/ 8
modelFF9 >
)FF> ?
{GG 	
_loggerHH 
.HH 
LogInformationHH "
(HH" #
nameofHH# )
(HH) *
LoginHH* /
)HH/ 0
)HH0 1
;HH1 2
tryII 
{JJ 
varKK 
userKK 
=KK 
awaitKK  
_userManagerKK! -
.KK- .
FindByNameAsyncKK. =
(KK= >
modelKK> C
.KKC D
UserNameKKD L
)KKL M
;KKM N
ifLL 
(LL 
userLL 
!=LL 
nullLL  
&&LL! #
awaitLL$ )
_userManagerLL* 6
.LL6 7
CheckPasswordAsyncLL7 I
(LLI J
userLLJ N
,LLN O
modelLLP U
.LLU V
PasswordLLV ^
)LL^ _
)LL_ `
{MM 
varNN 
keyNN 
=NN 
newNN ! 
SymmetricSecurityKeyNN" 6
(NN6 7
EncodingNN7 ?
.NN? @
UTF8NN@ D
.NND E
GetBytesNNE M
(NNM N
_settingsJwtNNN Z
.NNZ [
	SecretKeyNN[ d
)NNd e
)NNe f
;NNf g
varaa 

credentialaa "
=aa# $
newaa% (
SigningCredentialsaa) ;
(aa; <
keyaa< ?
,aa? @
SecurityAlgorithmsaaA S
.aaS T

HmacSha256aaT ^
)aa^ _
;aa_ `
varbb 
headerbb 
=bb  
newbb! $
	JwtHeaderbb% .
(bb. /

credentialbb/ 9
)bb9 :
;bb: ;
varee 
claimsee 
=ee  
newee! $
[ee$ %
]ee% &
{ff 
newgg 
Claimgg !
(gg! "

ClaimTypesgg" ,
.gg, -
Namegg- 1
,gg1 2
usergg3 7
.gg7 8
UserNamegg8 @
)gg@ A
,ggA B
newhh 
Claimhh !
(hh! "

ClaimTypeshh" ,
.hh, -
Emailhh- 2
,hh2 3
userhh4 8
.hh8 9
Emailhh9 >
)hh> ?
,hh? @
newii 
Claimii !
(ii! "
$strii" *
,ii* +
userii, 0
.ii0 1
Idii1 3
.ii3 4
ToStringii4 <
(ii< =
)ii= >
)ii> ?
,ii? @
newjj 
Claimjj !
(jj! "
$strjj" ,
,jj, -
userjj. 2
.jj2 3
FullNamejj3 ;
)jj; <
,jj< =
}kk 
;kk 
varnn 
payloadnn 
=nn  !
newnn" %

JwtPayloadnn& 0
(nn0 1
_settingsJwtoo (
.oo( )
Issueroo) /
,oo/ 0
_settingsJwtpp (
.pp( )
Audiencepp) 1
,pp1 2
claimsqq "
,qq" #
DateTimerr $
.rr$ %
Nowrr% (
,rr( )
DateTimess $
.ss$ %
UtcNowss% +
.ss+ ,
AddHoursss, 4
(ss4 5
$numss5 6
)ss6 7
)tt 
;tt 
varvv 
tokenSecurityvv %
=vv& '
newvv( +
JwtSecurityTokenvv, <
(vv< =
headervv= C
,vvC D
payloadvvE L
)vvL M
;vvM N
varww 
tokenww 
=ww 
newww  ##
JwtSecurityTokenHandlerww$ ;
(ww; <
)ww< =
.ww= >

WriteTokenww> H
(wwH I
tokenSecuritywwI V
)wwV W
;wwW X
returnxx 
Okxx 
(xx 
newxx !
{xx" #
tokenxx$ )
}xx* +
)xx+ ,
;xx, -
}yy 
elsezz 
return{{ 

BadRequest{{ %
({{% &
new{{& )
{{{* +
message{{, 3
={{4 5
$str{{6 V
}{{W X
){{X Y
;{{Y Z
}|| 
catch}} 
(}} 
	Exception}} 
ex}} 
)}}  
{~~ 
_logger 
. 
LogError  
(  !
ex! #
,# $
$"% '
{' (
nameof( .
(. /
Login/ 4
)4 5
}5 6
 fallo general6 D
"D E
)E F
;F G
throw
ÄÄ 
;
ÄÄ 
}
ÅÅ 
}
ÉÉ 	
}
ÖÖ 
}ÜÜ ˘
VE:\Proyecto\C#\Prueba\SystemAdmin\SystemAdmin\Controllers\WeatherForecastController.cs
	namespace

 	
SystemAdmin


 
.

 
Controllers

 !
{ 
[ 
	Authorize 
] 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class %
WeatherForecastController *
:+ ,
ControllerBase- ;
{ 
private 
static 
readonly 
string  &
[& '
]' (
	Summaries) 2
=3 4
new5 8
[8 9
]9 :
{ 	
$str 
, 
$str !
,! "
$str# +
,+ ,
$str- 3
,3 4
$str5 ;
,; <
$str= C
,C D
$strE L
,L M
$strN S
,S T
$strU a
,a b
$strc n
} 	
;	 

private 
readonly 
ILogger  
<  !%
WeatherForecastController! :
>: ;
_logger< C
;C D
public %
WeatherForecastController (
(( )
ILogger) 0
<0 1%
WeatherForecastController1 J
>J K
loggerL R
)R S
{ 	
_logger 
= 
logger 
; 
} 	
[ 	
HttpGet	 
] 
[ 	 
ProducesResponseType	 
( 
( 
int "
)" #
HttpStatusCode# 1
.1 2

BadRequest2 <
)< =
]= >
[ 	
	Authorize	 
( !
AuthenticationSchemes (
=) *
JwtBearerDefaults+ <
.< = 
AuthenticationScheme= Q
)Q R
]R S
public   
IEnumerable   
<   
WeatherForecast   *
>  * +
Get  , /
(  / 0
)  0 1
{!! 	
_logger"" 
."" 
LogInformation"" "
(""" #
nameof""# )
("") *
Get""* -
)""- .
)"". /
;""/ 0
var## 
rng## 
=## 
new## 
Random##  
(##  !
)##! "
;##" #
return$$ 

Enumerable$$ 
.$$ 
Range$$ #
($$# $
$num$$$ %
,$$% &
$num$$' (
)$$( )
.$$) *
Select$$* 0
($$0 1
index$$1 6
=>$$7 9
new$$: =
WeatherForecast$$> M
{%% 
Date&& 
=&& 
DateTime&& 
.&&  
Now&&  #
.&&# $
AddDays&&$ +
(&&+ ,
index&&, 1
)&&1 2
,&&2 3
TemperatureC'' 
='' 
rng'' "
.''" #
Next''# '
(''' (
-''( )
$num'') +
,''+ ,
$num''- /
)''/ 0
,''0 1
Summary(( 
=(( 
	Summaries(( #
[((# $
rng(($ '
.((' (
Next((( ,
(((, -
	Summaries((- 6
.((6 7
Length((7 =
)((= >
]((> ?
})) 
))) 
.** 
ToArray** 
(** 
)** 
;** 
}++ 	
},, 
}-- π
DE:\Proyecto\C#\Prueba\SystemAdmin\SystemAdmin\Helpers\AutoMapping.cs
	namespace 	
SystemAdmin
 
. 
Helpers 
{ 
public 

class 
AutoMapping 
: 
Profile &
{		 
public

 
AutoMapping

 
(

 
)

 
{ 	
	CreateMap 
< 
Employee 
, 
EmployeeDto  +
>+ ,
(, -
)- .
. 
	ForMember 
( 
dest 
=>  "
dest# '
.' (
Id( *
,* +
orig, 0
=>1 3
orig4 8
.8 9
MapFrom9 @
(@ A
srcA D
=>E G
srcH K
.K L
IdL N
)N O
)O P
;P Q
	CreateMap 
< 
EmployeeDto !
,! "
Employee# +
>+ ,
(, -
)- .
. 
	ForMember 
( 
dest 
=>  "
dest# '
.' (
Id( *
,* +
orig, 0
=>1 3
orig4 8
.8 9
MapFrom9 @
<@ A
GuidA E
>E F
(F G
srcG J
=>K M
GuidN R
.R S
ParseS X
(X Y
srcY \
.\ ]
Id] _
)_ `
)` a
)a b
;b c
} 	
} 
} ˙
UE:\Proyecto\C#\Prueba\SystemAdmin\SystemAdmin\HostedServices\MigratorHostedService.cs
	namespace 	
SystemAdmin
 
. 
HostedServices $
{ 
public 

class !
MigratorHostedService &
:' (
IHostedService) 7
,7 8
IDisposable9 D
{ 
private 
readonly 
IServiceProvider )
_serviceProvider* :
;: ;
public !
MigratorHostedService $
($ %
IServiceProvider 
serviceProvider ,
), -
{ 	
_serviceProvider 
= 
serviceProvider .
;. /
} 	
public 
async 
Task 

StartAsync $
($ %
CancellationToken% 6
cancellationToken7 H
)H I
{ 	
using 
var 
scope 
= 
_serviceProvider .
.. /
CreateScope/ :
(: ;
); <
;< =
using 
( 
var 
_context 
=  !
scope" '
.' (
ServiceProvider( 7
.7 8

GetService8 B
<B C
ContextC J
>J K
(K L
)L M
)M N
{ 
var 
userManager 
=  !
(" #
UserManager# .
<. /
User/ 3
>3 4
)4 5
scope5 :
.: ;
ServiceProvider; J
.J K

GetServiceK U
(U V
typeofV \
(\ ]
UserManager] h
<h i
Useri m
>m n
)n o
)o p
;p q
await 
_context 
. 
Database '
.' (
MigrateAsync( 4
(4 5
CancellationToken5 F
.F G
NoneG K
)K L
;L M
var 
seedDb 
= 
new  
SeedDb! '
(' (
_context( 0
,0 1
userManager2 =
)= >
;> ?
await   
seedDb   
.   
SeedDbAsync   (
(  ( )
)  ) *
;  * +
}!! 
}## 	
public$$ 
Task$$ 
	StopAsync$$ 
($$ 
CancellationToken$$ /
cancellationToken$$0 A
)$$A B
=>%% 
Task%% 
.%% 
CompletedTask%% %
;%%% &
private(( 
bool(( 
disposedValue(( "
=((# $
false((% *
;((* +
	protected)) 
virtual)) 
void)) 
Dispose)) &
())& '
bool))' +
	disposing)), 5
)))5 6
{** 	
disposedValue++ 
=++ 
true++  
;++  !
},, 	
public.. 
void.. 
Dispose.. 
(.. 
).. 
{// 	
Dispose00 
(00 
true00 
)00 
;00 
GC11 
.11 
SuppressFinalize11 
(11  
this11  $
)11$ %
;11% &
}22 	
~44 	!
MigratorHostedService44	 
(44 
)44  
=>44! #
Dispose44$ +
(44+ ,
false44, 1
)441 2
;442 3
}77 
}88 ˜
AE:\Proyecto\C#\Prueba\SystemAdmin\SystemAdmin\Models\UserModel.cs
	namespace 	
SystemAdmin
 
. 
Models 
{ 
public 

class 
	UserModel 
{ 
public 
string 
UserName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
FullName 
{  
get! $
;$ %
set& )
;) *
}+ ,
}		 
}

 î

8E:\Proyecto\C#\Prueba\SystemAdmin\SystemAdmin\Program.cs
	namespace 	
SystemAdmin
 
{ 
public 

class 
Program 
{ 
	protected 
static 
void 
Main "
(" #
string# )
[) *
]* +
args, 0
)0 1
{		 	
CreateHostBuilder

 
(

 
args

 "
)

" #
.

# $
Build

$ )
(

) *
)

* +
.

+ ,
Run

, /
(

/ 0
)

0 1
;

1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
} 
} ÒV
8E:\Proyecto\C#\Prueba\SystemAdmin\SystemAdmin\Startup.cs
	namespace 	
SystemAdmin
 
{ 
public 

class 
Startup 
{ 

JwtSetting 
_jwtSetting 
; 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public"" 
void"" 
ConfigureServices"" %
(""% &
IServiceCollection""& 8
services""9 A
)""A B
{## 	
services$$ 
.$$ 
AddAutoMapper$$ "
($$" #
typeof$$# )
($$) *
Startup$$* 1
)$$1 2
.$$2 3
Assembly$$3 ;
)$$; <
;$$< =
services%% 
.%% 
AddDbContextPool%% %
<%%% &
Context%%& -
>%%- .
(%%. /
options%%/ 6
=>%%7 9
{&& 
options'' 
.'' 
UseSqlServer'' $
(''$ %
Configuration''% 2
.''2 3
GetConnectionString''3 F
(''F G
$str''G [
)''[ \
,''\ ]
optsql''^ d
=>''e g
optsql''h n
.''n o
CommandTimeout''o }
(''} ~
(''~ 
int	'' Ç
)
''Ç É
TimeSpan
''É ã
.
''ã å
FromMinutes
''å ó
(
''ó ò
$num
''ò ô
)
''ô ö
.
''ö õ
TotalSeconds
''õ ß
)
''ß ®
)
''® ©
;
''© ™
}(( 
)(( 
;(( 
services** 
.** 
AddDefaultIdentity** '
<**' (
User**( ,
>**, -
(**- .
)**. /
.++ $
AddEntityFrameworkStores++ )
<++) *
Context++* 1
>++1 2
(++2 3
)++3 4
;++4 5
services-- 
.-- 
	Configure-- 
<-- 
IdentityOptions-- .
>--. /
(--/ 0
options--0 7
=>--8 :
{.. 
options// 
.// 
Password//  
.//  !
RequireDigit//! -
=//. /
false//0 5
;//5 6
options00 
.00 
Password00  
.00  !"
RequireNonAlphanumeric00! 7
=008 9
false00: ?
;00? @
options11 
.11 
Password11  
.11  !
RequireLowercase11! 1
=112 3
false114 9
;119 :
options22 
.22 
Password22  
.22  !
RequireUppercase22! 1
=222 3
false224 9
;229 :
options33 
.33 
Password33  
.33  !
RequiredLength33! /
=330 1
$num332 3
;333 4
}55 
)55 
;55 
services77 
.77 
AddCors77 
(77 
c77 
=>77 !
{88 
c99 
.99 
	AddPolicy99 
(99 
$str99 )
,99) *
options99+ 2
=>993 5
options996 =
.99= >
AllowAnyOrigin99> L
(99L M
)99M N
.99N O
AllowAnyMethod99O ]
(99] ^
)99^ _
.99_ `
AllowAnyHeader99` n
(99n o
)99o p
)99p q
;99q r
}:: 
):: 
;:: 
services;; 
.;; 
AddControllers;; #
(;;# $
);;$ %
;;;% &
_jwtSetting== 
=== 
new== 

JwtSetting== (
(==( )
)==) *
;==* +
Configuration>> 
.>> 

GetSection>> $
(>>$ %
$str>>% 1
)>>1 2
.>>2 3
Bind>>3 7
(>>7 8
_jwtSetting>>8 C
)>>C D
;>>D E
services?? 
.?? 
	Configure?? 
<?? 

JwtSetting?? )
>??) *
(??* +
Configuration??+ 8
.??8 9

GetSection??9 C
(??C D
$str??D P
)??P Q
)??Q R
;??R S
servicesAA 
.AA 
	AddScopedAA 
(AA 
typeofAA %
(AA% &
IGenericRepositoryAA& 8
<AA8 9
>AA9 :
)AA: ;
,AA; <
typeofAA< B
(AAB C
GenericRepositoryAAC T
<AAT U
>AAU V
)AAV W
)AAW X
;AAX Y
servicesBB 
.BB 
AddTransientBB !
<BB! "
IUnitOfWorkBB" -
,BB- .

UnitOfWorkBB/ 9
>BB9 :
(BB: ;
)BB; <
;BB< =
servicesCC 
.CC 
AddTransientCC !
<CC! "
IEmployeeServiceCC" 2
,CC2 3
EmployeeServiceCC4 C
>CCC D
(CCD E
)CCE F
;CCF G
servicesEE 
.EE 
AddSwaggerGenEE "
(EE" #
cEE# $
=>EE% '
{FF 
cGG 
.GG 

SwaggerDocGG 
(GG 
$strGG !
,GG! "
newGG# &
OpenApiInfoGG' 2
{GG3 4
TitleGG5 :
=GG; <
$strGG= J
,GGJ K
VersionGGL S
=GGT U
$strGGV Z
}GG[ \
)GG\ ]
;GG] ^
cHH 
.HH !
AddSecurityDefinitionHH '
(HH' (
$strHH( 0
,HH0 1
newHH2 5!
OpenApiSecuritySchemeHH6 K
{II 
NameJJ 
=JJ 
$strJJ *
,JJ* +
TypeKK 
=KK 
SecuritySchemeTypeKK -
.KK- .
ApiKeyKK. 4
,KK4 5
SchemeLL 
=LL 
$strLL %
,LL% &
BearerFormatMM  
=MM! "
$strMM# (
,MM( )
InNN 
=NN 
ParameterLocationNN *
.NN* +
HeaderNN+ 1
,NN1 2
DescriptionOO 
=OO  !
$strOO" V
+OOW X
$strPP$ r
+PPs t
$strQQ$ M
,QQM N
}RR 
)RR 
;RR 
cSS 
.SS "
AddSecurityRequirementSS (
(SS( )
newSS) ,&
OpenApiSecurityRequirementSS- G
{TT 
{UU 
newVV !
OpenApiSecuritySchemeVV 3
{WW 
	ReferenceXX  )
=XX* +
newXX, /
OpenApiReferenceXX0 @
{YY  !
TypeZZ$ (
=ZZ) *
ReferenceTypeZZ+ 8
.ZZ8 9
SecuritySchemeZZ9 G
,ZZG H
Id[[$ &
=[[' (
$str[[) 1
}\\  !
}]] 
,]] 
Array^^ !
.^^! "
Empty^^" '
<^^' (
string^^( .
>^^. /
(^^/ 0
)^^0 1
}__ 
}`` 
)`` 
;`` 
}aa 
)aa 
;aa 
servicescc 
.cc 
AddAuthenticationcc &
(cc& '
optionscc' .
=>cc/ 1
{dd 
optionsee 
.ee %
DefaultAuthenticateSchemeee 1
=ee2 3
JwtBearerDefaultsee4 E
.eeE F 
AuthenticationSchemeeeF Z
;eeZ [
optionsff 
.ff "
DefaultChallengeSchemeff .
=ff/ 0
JwtBearerDefaultsff1 B
.ffB C 
AuthenticationSchemeffC W
;ffW X
}gg 
)gg 
.gg 
AddJwtBearergg 
(gg 
optionsgg $
=>gg% '
{hh 
optionsii 
.ii %
TokenValidationParametersii 1
=ii2 3
newii4 7%
TokenValidationParametersii8 Q
{jj 
ValidateIssuerkk "
=kk# $
truekk% )
,kk) *
ValidateAudiencell $
=ll% &
truell' +
,ll+ ,
ValidateLifetimemm $
=mm% &
truemm' +
,mm+ ,$
ValidateIssuerSigningKeynn ,
=nn- .
truenn/ 3
,nn3 4
ValidIssueroo 
=oo  !
_jwtSettingoo# .
.oo. /
Issueroo/ 5
,oo5 6
ValidAudiencepp !
=pp" #
_jwtSettingpp% 0
.pp0 1
Audiencepp1 9
,pp9 :
IssuerSigningKeyqq $
=qq% &
newqq( + 
SymmetricSecurityKeyqq, @
(qq@ A
EncodingqqA I
.qqI J
UTF8qqJ N
.qqN O
GetBytesqqO W
(qqW X
_jwtSettingqqX c
.qqc d
	SecretKeyqqd m
)qqm n
)qqn o
}rr 
;rr 
}ss 
)ss 
;ss 
servicestt 
.tt 
AddHostedServicett %
<tt% &!
MigratorHostedServicett& ;
>tt; <
(tt< =
)tt= >
;tt> ?
}uu 	
publicxx 
voidxx 
	Configurexx 
(xx 
IApplicationBuilderxx 1
appxx2 5
,xx5 6
IWebHostEnvironmentxx7 J
envxxK N
)xxN O
{yy 	
appzz 
.zz 
UseCorszz 
(zz 
optionszz 
=>zz  "
optionszz# *
.zz* +
AllowAnyOriginzz+ 9
(zz9 :
)zz: ;
.zz; <
AllowAnyMethodzz< J
(zzJ K
)zzK L
.zzL M
AllowAnyHeaderzzM [
(zz[ \
)zz\ ]
)zz] ^
;zz^ _
if{{ 
({{ 
env{{ 
.{{ 
IsDevelopment{{ !
({{! "
){{" #
){{# $
{|| 
app}} 
.}} %
UseDeveloperExceptionPage}} -
(}}- .
)}}. /
;}}/ 0
app~~ 
.~~ 

UseSwagger~~ 
(~~ 
)~~  
;~~  !
app 
. 
UseSwaggerUI  
(  !
c! "
=># %
c& '
.' (
SwaggerEndpoint( 7
(7 8
$str8 R
,R S
$strT d
)d e
)e f
;f g
}
ÄÄ 
app
ÇÇ 
.
ÇÇ 

UseRouting
ÇÇ 
(
ÇÇ 
)
ÇÇ 
;
ÇÇ 
app
ÑÑ 
.
ÑÑ 
UseAuthentication
ÑÑ !
(
ÑÑ! "
)
ÑÑ" #
;
ÑÑ# $
app
ÖÖ 
.
ÖÖ 
UseAuthorization
ÖÖ  
(
ÖÖ  !
)
ÖÖ! "
;
ÖÖ" #
app
áá 
.
áá 
UseEndpoints
áá 
(
áá 
	endpoints
áá &
=>
áá' )
{
àà 
	endpoints
ââ 
.
ââ 
MapControllers
ââ (
(
ââ( )
)
ââ) *
;
ââ* +
}
ää 
)
ää 
;
ää 
}
ãã 	
}
åå 
}çç ≈
@E:\Proyecto\C#\Prueba\SystemAdmin\SystemAdmin\WeatherForecast.cs
	namespace 	
SystemAdmin
 
{ 
public 

class 
WeatherForecast  
{ 
public 
DateTime 
Date 
{ 
get "
;" #
set$ '
;' (
}) *
public		 
int		 
TemperatureC		 
{		  !
get		" %
;		% &
set		' *
;		* +
}		, -
public 
int 
TemperatureF 
=>  "
$num# %
+& '
(( )
int) ,
), -
(- .
TemperatureC. :
/; <
$num= C
)C D
;D E
public 
string 
Summary 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} 