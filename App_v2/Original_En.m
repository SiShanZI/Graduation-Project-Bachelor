%��һ�ֲ��ԣ������ɴＫ��
function [Disp,Loss]=Original_En(image,Np,Sel)
[Refer,Lim,Lc,Lr,Block]=Version_Pick_En(image);     %ѡ��ͬ�汾         
[EnSeq,KEY]=Z_Str_Agree(Lim,Sel);
rand('state',KEY);MR=randperm(Lc);
MR=MR(1:Lr);MRM=[];                                 
for i=1:Block                                       %����������Ҫ
    MRM=[MRM;MR];
end
SMf=0;
[DecEn,BinEn]=Sue_ArithEnco(EnSeq,Np);
Rep=[];Fill=[0 1 0 0 1 0 1 1];                      %���                               
for i=1:numel(MRM)                      
    Rep=[Rep,Fill];
end
Rep(1:length(BinEn))=BinEn;         
Rep=reshape(Rep,8,numel(Rep)/8);                    %����������Ҫ
eval(Refer);Disp;                                         
Diff=bitxor(image,Disp);
Loss=length(find(Diff==1))/numel(image);            %ʧ���ʼ���
