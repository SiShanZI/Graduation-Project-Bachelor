function [Refer,Lim,Lc,Lr,Block]=Version_Pick_OpEn(image)  
switch sqrt(numel(image))                               %�д�����
    case 21
        Refer='Disp=Version_01_En(DispOp,Rep,MRM,SMf);';
        Lim=07;Lc=25;Lr=07;Block=1;                     %�д�����
    case 25
        Refer='Disp=Version_02_En(DispOp,Rep,MRM,SMf);';
        Lim=13;Lc=43;Lr=13;Block=1;                     %�д�����
    case 29
        Refer='Disp=Version_03_En(DispOp,Rep,MRM,SMf);';
        Lim=20;Lc=34;Lr=10;Block=2;                     %�д�����
    case 33
        Refer='Disp=Version_04_En(DispOp,Rep,MRM,SMf);';
        Lim=28;Lc=24;Lr=07;Block=4;                     %�д�����
    otherwise
        Refer='Disp=Version_05_En(DispOp,Rep,MRM,SMf);';
        Lim=40;Lc=32;Lr=10;Block=4;                     %�д�����
end
