%�ڶ��ֲ��ԣ��������������Ի�ȡ��С��ʧ��
function [Message]=Optimize_De(image,Np)
msgbox('�԰����꣡','AH����','on'); 
[Refer,Lc,Lr,Block,KEY]=Version_Pick_OpDe(image); 
MRM=[];
for i=1:Block
    rand('state',KEY(i));MR=randperm(Lc);
    MR=MR(1:Lr);MRM=[MRM;MR];
end
eval(Refer);
Original=Sue_ArithDeco(BinEx,Np);
Message=Z_Agree_Str(Original);
