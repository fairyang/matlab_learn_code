function y=cmps(A)
alpha=[0.01,0.05];
[m,s]=size(A);
y=cell(s+1,s+2);
B=zeros(2,s);
done=1;
for k=1:s
    tmp=A(:,k);
    nans=isnan(tmp);
    ind=find(nans);
    if length(ind)>0
        done=0;
        tmp(ind)= [];
    end
    B(1,k)=mean(tmp);
    B(2,k)=length(tmp);
end
[tm1,tm2]=sort(B(1,:));
M=fliplr(tm1);
ind=fliplr(tm2);
[p,table]=anova1(A,[],'off');
MSE=table{3,4};
y{1,1}='ˮƽ';
y{1,2}='ƽ����';
for k=1:s
    y{1,k+2}= ['A',int2str(tm2(k))];
end
for k=1:s
    y{k+ 1,1}= ['A',int2str(ind(k))];
    y{k+1,2}=num2str(M (k));
end
if done
    LJ1=tinv(1-alpha,table{3,3});
else
    LJ1=sqrt(table{2,3}*finv(1-alpha,table{2,3},table{3,3}));
end
for k=1:(s-1)
    for kr=1:(s-k)
        xij=M(kr)-tm1(k);
        LJ2=sqrt(MSE* (1/B(2,ind(kr))+1/B(2,tm2(k))));
        LJ=LJ1*LJ2;
        if xij>=LJ(1)
            mrk='* *';
        elseif (xij<LJ(1))&(xij>=LJ(2))
            mrk='*';
        else
            mrk=[];
        end
        y{kr+1,k+2}=[num2str(xij),mrk];
    end
end
