function [PSM, Inter] = Sue_Dijkstra(G, n, Sp); if nargin < 3; Sp = 1; end
%
U = ones(1, n);                                        % ʣ��ڵ㼯�ϣ���1������ڣ���0�������޳���
PSM = zeros(2, n); PSM(2, Sp) = 1;                     % �Լ����Լ��ĳ���Ϊ0��·����Ϊ1��
Bp = Sp; U(Bp) = 0;
flag = 1; while sum(U) > 0 && flag == 1; flag = 0;     % ��ʣ��ڵ�����ͨ������������ѭ������
for Np = 1:n; if G(Np, Bp) ~= 0                        % �м��Bp��Bridge point�ŵ㣩���ڽӵ㡣
lsn = PSM(1, Bp) + G(Np, Bp);
if PSM(1, Np) == 0 || lsn < PSM(1, Np); PSM(1, Np) = lsn; PSM(2, Np) = PSM(2, Bp);
% �ж������·����
elseif lsn == PSM(1, Np); PSM(2, Np) = PSM(2, Np) + PSM(2, Bp);
end
end; end
% ѡ���µ��м�㣬ԭ����ѡ��PSM�����е�ǰ���·����U�ľ���Ϊ��̡�
Min = inf; for Bpi = 1:n; if U(Bpi) ~= 0 && PSM(1, Bpi) ~= 0 && PSM(1, Bpi) <= Min
Min = PSM(1, Bpi); Bp = Bpi; flag = 1;
end; end
% �޳��м�㣬��Ϊ�м���޳��󷽿�ȷ��Ϊ��̡�
U(Bp) = 0;
end
% ����while
PSM(1, Sp) = 0; PSM(2, Sp) = 1;
if isempty(find(PSM(2, :) == 0)); Inter = 1; else Inter = 0; end
end
%