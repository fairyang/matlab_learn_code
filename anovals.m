function table=anovals(A)
alpha1=0.05;alpha2=0.01;
[pval,table]=anova1(A,[],'off');
table(1,1:7)=cell(1,7);
table(1,:)={'������Դ','ƫ��ƽ����','���ɶ�','����','Fֵ','Fa','������'};
table(2:4,1)={'����A';'���e';'�ܺ�'};
table{2,6}=finv(1-alpha1,table{2,3},table{3,3});
table{3,6}=finv(1-alpha2,table{2,3},table{3,3});
mrk={'������','����','�߶�����'};
tst=1+(pval<0.05)+(pval<0.01);
table{2,7}=mrk{tst};
