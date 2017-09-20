function [DecEn,BinEn]=Sue_ArithEnco(EnSeq,Np)
DecEn=[];BinEn=[];
EnSeqL=length(EnSeq);
Nn=Np;
Cal=ones(1,Np);
Sides=sym([0:1/Np:1]);                  %�������㱣֤����
for i=1:EnSeqL                        
    Nn=Nn+1;
    Cal(EnSeq(i))=Cal(EnSeq(i))+1;      %�ۼ�ÿ���ַ����ֵ�Ƶ��
    Sides(1)=Sides(EnSeq(i));           %���·ֲ���������
    Sides(Np+1)=Sides(EnSeq(i)+1);      
    Stepv=(Sides(Np+1)-Sides(1))/Nn;
    while(1)                            %��ȡС��λ������С��λ��
        Pa=floor(Sides(1)*10);          
        Pb=floor(Sides(Np+1)*10);
        if(Pa==Pb)
            DecEn=[DecEn,Pa];           %���С��λ����,�������ԣ���disp(Pa)����
            BinEn=[BinEn,dec2bin(double(Pa),4)];
            Stepv=Stepv*10;
            Sides(1)=Sides(1)*10-Pa;
            Sides(Np+1)=Sides(Np+1)*10-Pa;
        else
            break
        end
    end
    for j=2:Np
        Sides(j)=Sides(j-1)+Stepv*Cal(j-1);
    end
end
SiL=double(Sides(1));                   %�������䣬˫����ֱ�ۣ���ȡ����һ������ɱ���
SiR=double(Sides(Np+1));
P=1;                                    %���벻Ψһ����ͨ������Ĺ���ɱ�֤����Ψһ
while(1)                                %�ض϶˵�С��ֵ����˵��λ���Ҷ˵���λ��
    Dec=floor(SiR*(10^P))-ceil(SiL*(10^P));
    if(Dec>1)                           %�������֮�����һ����λ������ȡ����֮���һ��������
        Reb=(ceil(SiL*(10^P))+floor(Dec/2))/(10^P);
        break                           %������ȡ�е�
    else
        P=P+1;
    end
end
while(P>0)                              %���ʣ��С��λ���룬�������ԣ���disp(floor(Reb*10))����
    DecEn=[DecEn,floor(Reb*10)];
    BinEn=[BinEn,dec2bin(floor(Reb*10),4)];
    Reb=Reb*10-floor(Reb*10);
    P=P-1;
end
DecEn;
BinEn=BinEn-48;

