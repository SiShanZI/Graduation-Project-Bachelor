function [PSM, Inter] = Sue_Dijkstra2(G, n, Sp)
%
U = ones(1, n);                                      % ʣ��ڵ㼯�ϣ���1������ڣ���0�������޳���
% ��һ���ֵ�һ��Ϊ��㵽���ڵ�����·�����ȣ��ڶ���Ϊ���·���������ڶ�����Ϊ���е����·����
PSM = {zeros(2, n), cell(1, n)}; PSM{1}(2, Sp) = 1; PSM{2}{Sp} = {[Sp]};
Bp = Sp; U(Bp) = 0;
flag = 1; while sum(U) > 0 && flag == 1; flag = 0;   % ��ʣ��ڵ�����ͨ������������ѭ������
for Np = 1:n; if G(Np, Bp) ~= 0; lsn = PSM{1}(1, Bp) + G(Np, Bp);
%
if PSM{1}(1, Np) == 0 || lsn < PSM{1}(1, Np)
PSM{1}(:, Np) = PSM{1}(:, Bp); PSM{2}{Np} = PSM{2}{Bp};
for Npi = 1:PSM{1}(2, Np); PSM{2}{Np}{Npi} = [PSM{2}{Np}{Npi}; Np]; end
PSM{1}(1, Np) = lsn;
% �ж������·����
elseif lsn == PSM{1}(1, Np)
PSM{2}{Np} = {PSM{2}{Np}{1:PSM{1}(2, Np)}, PSM{2}{Bp}{1:PSM{1}(2, Bp)}};
for Npi = (PSM{1}(2, Np) + 1) : (PSM{1}(2, Np) + PSM{1}(2, Bp)); PSM{2}{Np}{Npi} = [PSM{2}{Np}{Npi}; Np]; end
PSM{1}(2, Np) = PSM{1}(2, Np) + PSM{1}(2, Bp);
end
end; end
% ѡ���µ��м�㣬ԭ����ѡ��PSM�����е�ǰ���·����U�ľ���Ϊ��̡�
Min = inf; for Bpi = 1:n; if U(Bpi) ~= 0 && PSM{1}(1, Bpi) ~= 0 && PSM{1}(1, Bpi) <= Min
Min = PSM{1}(1, Bpi); Bp = Bpi; flag=1;
end; end
% �޳��м�㣬��Ϊ�м���޳��󷽿�ȷ��Ϊ��̡�
U(Bp)=0;
end
% ����while
PSM{1}(1, Sp) = 0; PSM{1}(2, Sp) = 1; PSM{2}{Sp} = {[Sp]};
if isempty(find(PSM{1}(2, :) == 0)); Inter = 1; else Inter = 0; end
end
%