create tenant "dndsmnds" partition 1 node nd;

create tenant "dndsmds";


alter tenant "dndsmnds" set partition 3; 
alter tenant "dndsmnds" set node nd;

drop tenant dsndsmnds; 

set   tenant dndsmnds; 
reset tenant; 


