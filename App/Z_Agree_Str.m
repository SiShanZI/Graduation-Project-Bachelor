function [Deliver]=Z_Agree_Str(Original)
for i=1:length(Original)                %�ݶ��ַ���{@ A~Z . / 0~9 : �ո� !}��41����������Ϊ��ֹ������������
    if(Original(i)>=1&Original(i)<=27)  %Լ����ӳ���ϵ
        Original(i)=Original(i)+63;
    elseif(Original(i)>=28&Original(i)<=40)
        Original(i)=Original(i)+18;
    else                                %���������ֹ������ǰ��ģ�鱣֤��
        Original(i)=32;
    end
end
Deliver=setstr(Original);               %ASCII��ת��Ϊ�ַ���