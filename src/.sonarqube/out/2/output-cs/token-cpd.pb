€
JE:\Proyecto\C#\Prueba\SystemAdmin\SystemAdmin.Services\Base\BaseSerivce.cs
	namespace 	
SystemAdmin
 
. 
Services 
. 
Base #
{ 
public 

abstract 
class 
BaseService %
{ 
	protected 
Context 
	_contexto #
;# $
	protected		 
BaseService		 
(		 
Context		 %
context		& -
)		- .
{

 	
	_contexto 
= 
context 
;  
} 	
} 
} ö	
UE:\Proyecto\C#\Prueba\SystemAdmin\SystemAdmin.Services\Interfaces\IEmployeeService.cs
	namespace 	
SystemAdmin
 
. 
Services 
. 

Interfaces )
{ 
public 

	interface 
IEmployeeService %
{		 
Task

 
<

 
IEnumerable

 
<

 
Employee

 !
>

! "
>

" #
GetAllAsync

$ /
(

/ 0
)

0 1
;

1 2
Task 
< 
Employee 
> 
GetByIdAsync #
(# $
Guid$ (
Id) +
)+ ,
;, -
Task 
< 
Employee 
> $
GetByIdentificationAsync /
(/ 0
string0 6
Identification7 E
)E F
;F G
Task 
< 
Employee 
> 
AddAsync 
(  
Employee  (
entity) /
)/ 0
;0 1
Task 
< 
Employee 
> 
UpdateAsync "
(" #
Employee# +
entity, 2
)2 3
;3 4
} 
} ¢
RE:\Proyecto\C#\Prueba\SystemAdmin\SystemAdmin.Services\Services\EmployeeService.cs
	namespace		 	
SystemAdmin		
 
.		 
Services		 
.		 
Services		 '
{

 
public 

class 
EmployeeService  
:! "
IEmployeeService# 3
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public 
EmployeeService 
( 
IUnitOfWork *

unitOfWork+ 5
)5 6
{ 	
_unitOfWork 
= 

unitOfWork $
;$ %
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
Employee& .
>. /
>/ 0
GetAllAsync1 <
(< =
)= >
=> 
await 
_unitOfWork  
.  !
EmployeeRepository! 3
.3 4
GetAllAsync4 ?
(? @
)@ A
;A B
public 
async 
Task 
< 
Employee "
>" #
GetByIdAsync$ 0
(0 1
Guid1 5
Id6 8
)8 9
=> 
await 
_unitOfWork  
.  !
EmployeeRepository! 3
.3 4
GetByIdAsync4 @
(@ A
IdA C
)C D
;D E
public 
async 
Task 
< 
Employee "
>" #$
GetByIdentificationAsync$ <
(< =
string= C
IdentificationD R
)R S
{ 	
var 
result 
= 
await 
_unitOfWork *
.* +
EmployeeRepository+ =
.= >
GetAsync> F
(F G
wG H
=>I K
wL M
.M N
IdentificationN \
==] _
Identification` n
)n o
;o p
return 
result 
. 
FirstOrDefault (
(( )
)) *
;* +
}   	
public"" 
async"" 
Task"" 
<"" 
Employee"" "
>""" #
AddAsync""$ ,
("", -
Employee""- 5
entity""6 <
)""< =
{## 	
await$$ 
_unitOfWork$$ 
.$$ 
EmployeeRepository$$ 0
.$$0 1
AddAsync$$1 9
($$9 :
entity$$: @
)$$@ A
;$$A B
await%% 
_unitOfWork%% 
.%% 
SaveChangesAsync%% .
(%%. /
)%%/ 0
;%%0 1
return&& 
entity&& 
;&& 
}'' 	
public)) 
async)) 
Task)) 
<)) 
Employee)) "
>))" #
UpdateAsync))$ /
())/ 0
Employee))0 8
entity))9 ?
)))? @
{** 	
_unitOfWork++ 
.++ 
EmployeeRepository++ *
.++* +
Update+++ 1
(++1 2
entity++2 8
)++8 9
;++9 :
await,, 
_unitOfWork,, 
.,, 
SaveChangesAsync,, .
(,,. /
),,/ 0
;,,0 1
return-- 
entity-- 
;-- 
}.. 	
}// 
}00 