function sfpin(y)
%直方图程序代码
y=y(:);
N=length(y);
L=floor(1.87*(N-1)^0.4);
[Y,X]=hist(y,L);
X=X(:)';
Y=Y(:)';
ind=find(Y==0);
X(ind)=[];
Y(ind)=[];
xt1=1.5*X(1)-X(2)*0.5;
xtt=X(1:end-1)*0.5+X(2:end)*0.5;
xt2=1.5*X(end)-X(end-1)*0.5;
X=[xt1,xtt,xt2];
n=sum(Y);
Y=Y/n;
xx=[X;X];yy=[Y;Y];
Xt=xx(:);Yt=[0;yy(:);0];
fill(Xt,Yt,'c')
hold on 
x1=(X(2:end)+X(1:end-1))/2;
XX=[Xt';Xt'];
YY=[Yt';zeros(1,length(Yt))];
plot(x1,Y,'-k',Xt,Yt,'-k',XX,YY,'-k')
hold off
title('频率直方图')