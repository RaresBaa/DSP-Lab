function [y,n]=impuls(li,ls,k);
%IMPULS – the unit (Dirac) impulse in discrete time,
%defined on a finite temporal support
%-syntax:
%y=impuls(li,ls,k)
%[y,n]=impuls(li,ls,k)
%-output parameters:
%y=line vector which represents delta(n-k) on the support
%[li;ls]
%n=line vector which represents the support [li;ls]
%- input parameters:
%li=the inferior limit of the temporal support;
%ls= the superior limit of the temporal support;
%k=the index from delta(n-k)
%-for display: stem(n,y)
if nargin<3
error('Too few input arguments')
elseif nargin>3
error('Too many input arguments')
end
if nargout>2
error('Too many output arguments')
end
if li>=ls
error('The temporal support is not valid')
end
if (k<li)|(k>ls)
error('The temporal support is not valid')
end
L=ls-li+1;
y=zeros(1,L);
y(k-li+1)=1;
n=li:ls;