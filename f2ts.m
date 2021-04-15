function yout=f2ts(x,y,varargin)
tail=0;alpha=0.05; yout = 0;
if nargin<2
    error('至少应有两组输入参数')
end
if nargin>2
    tmp=varargin(1);
    if isnumeric(tmp)&&(tmp>0)&&(tmp<1)
         alpha=tmp;
    end
end
if nargin>3
    tmp=varargin(2);
    if isnumeric(tmp)
        tail=tmp;
    end
end
x=x(:);y=y(:);
n1=length(x);n2=length(y);
TT=var(x)/var(y);
switch tail
    case -1
        sui= finv(alpha,n1-1,n2-1) ;
        yout= (TT>=1)||(TT<=sui) ;
    case 1
        sui=finv(1-alpha,n1-l,n2- 1);
        yout= (TT<=1)||(TT>=sui) ;
    otherwise
        si= finv (alpha/2,n1-1,n2-1);
        lian= finv (1-alpha/2,n1- 1,n2-1) ;
        yout= (TT<=si)||(TT>=lian) ;
end
