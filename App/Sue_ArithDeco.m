function [Original]=Sue_ArithDeco(Stream,Np)
Stream=reshape(Stream,4,numel(Stream)/4);     
Original=[];DeSeq=[];
for i=1:numel(Stream)/4                 %��������ת��Ϊʮ�����ַ���
    Mid=0;
    for j=1:4
        Mid=Mid+Stream(j,i)*2^(4-j);
    end
    DeSeq=[DeSeq,Mid];
end
DeSeq=sym(DeSeq);
DeSeqL=length(DeSeq);
Nn=Np;i=1;Q=10;
Cal=ones(1,Np);
Sides=sym([0:1/Np:1]);                  %�������㱣֤����
A=DeSeq(i)/Q;
B=A+1/Q;
while(1)
    j=1;                                %ȷ�������Ի��һλ�������
    while(j<=Np&(~(double(Sides(j))<=double(A)&double(B)<=double(Sides(j+1)))))
        j=j+1;
    end
    if(j>Np)                            %���Ȳ��㣬����С��λ
        i=i+1;
        if(i<=DeSeqL)
            Q=Q*10;
            A=A+DeSeq(i)/Q;
            B=A+1/Q;
        else
            break
        end
    else                                %��ǰ���ȿ���ȷ��ĳһ���䣨һλ�������Ȼ�����·ֲ���������                         
        if(j==Np)                       %������ֹ����ֹͣ���루ϵͳ��Ҫ��
            break
        end
        Original=[Original,j];          %����ֹ�������һλ����,�������ԣ���disp(j)����
        Nn=Nn+1;                        %���·ֲ��������䣬ͬ����
        Cal(j)=Cal(j)+1;
        Sides(1)=Sides(j);
        Sides(Np+1)=Sides(j+1);
        Stepv=(Sides(Np+1)-Sides(1))/Nn;
        while(1)                        %��ȡ����С��λ������С��λ����ͬ����
            Pa=floor(Sides(1)*10);      
            Pb=floor(Sides(Np+1)*10);
            if(Pa==Pb)
                Stepv=Stepv*10;
                Sides(1)=Sides(1)*10-Pa;
                Sides(Np+1)=Sides(Np+1)*10-Pa;
                Q=Q/10;                 %ͬʱ��ȡ����С��λ
                A=A*10-floor(A*10);
                B=B*10-floor(B*10);
            else
                break
            end
        end
        for k=2:Np
            Sides(k)=Sides(k-1)+Stepv*Cal(k-1);
        end        
    end
end
A;                                      %ʣ�����λ
SiL=double((Sides(1)));                 %��������
SiR=double((Sides(Np+1)));
Original;
