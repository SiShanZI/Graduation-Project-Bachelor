function [Warn,KEY]=Z_Str_Agree(Lim,Sel)  
flag=1;
while(flag)                            
    string=sprintf('Message:(%d���ַ�֮�ڣ�)',Lim);
    switch Sel
        case 01
            Answ=inputdlg({string},'Message Hiding!',[5 50]);
            KEY=0;
        otherwise
            Answ=inputdlg({string,'KEY:'},'Message Hiding!',[5 50]);
            KEY=str2num(char(Answ(2)));
    end
    Warn=abs(char(Answ(1)));            %���ַ���ת��ΪASCII������
    Warn=[Warn,33];                     %�����ֹ��
    for i=1:length(Warn)                %�ݶ��ַ���{@ A~Z . / 0~9 : �ո� !}��42������!��Ϊ��ֹ������������
        if(Warn(i)>=64&Warn(i)<=90)     %Լ����ӳ���ϵ
            Warn(i)=Warn(i)-63;
            flag=0;
        elseif(Warn(i)>=46&Warn(i)<=58) 
            Warn(i)=Warn(i)-18;
            flag=0;
        elseif(Warn(i)==32)
            Warn(i)=41;
            flag=0;
        elseif(Warn(i)==33)             %��ֹ��
            Warn(i)=42;
            flag=0;
        else
            clc;clear all;
            flag=1;
            OK=errordlg('Illegal Word��','Error!','on');
            waitfor(OK);                %����
            break
        end
    end
end
                
