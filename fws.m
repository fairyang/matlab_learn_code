function fws (x)
a=x ( : ) ;
a(isnan(a))= [];
ss50=prctile (x,50) ;
disp( [ '��λ��: ' , num2str(ss50) ] );
ss25=prctile (x,25);
disp ( [ '���ķ�λ��: ',num2str(ss25) ]);
ss75=prctile (x,75);
disp( ['���ķ�λ��: ',num2str(ss75) ]);
RS=ss75-ss25;
disp ( ['�ķ�λ����: ', num2str(RS) ] );
sss=0.25 * ss25+0.5 * ss50+0.25 * ss75;
disp ( ['����ֵ: ' ,num2str(sss)]);
xjie= ss25-1.5 * RS;
disp( ['�½ضϵ�: ' , num2str(xjie) ]);
sjie=ss75+1.5* RS;
disp( [ '�Ͻضϵ�: ' , num2str(sjie) ] );
