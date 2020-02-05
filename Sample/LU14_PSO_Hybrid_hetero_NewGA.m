clear all;
% % This program is generally created for paper "Hybrid Task Scheduling
% Method for Cloud Computing by Genetic and PSO Algorithm
%------------------------------------------------
Num=14; % number of nodes in graph
NumProc=4; %number of processors
ComuCost=8;
CompCost=10;
%---GA Spacification----
PopSize=30;
Mrate=0.2;
Crate=0.7;
Iteration=60;
%------------------------
Tentry=1;
Texit=Num;
Population=zeros(PopSize,Num);

% X=perms([2 4 6]);
% X(1,:)
% X(2,:)
% hal

w1=0.25;
w2=0.5;
w3=0.75;
w4=1.0;
Omega=[w1 w2 w3 w4];

W=zeros(Num,Num);

W(1,2)=ComuCost;
W(1,3)=ComuCost;
W(1,4)=ComuCost;
W(1,5)=ComuCost;
W(2,6)=ComuCost;
W(3,7)=ComuCost;
W(4,8)=ComuCost;
W(5,9)=ComuCost;
W(6,7)=ComuCost;
W(6,8)=ComuCost;
W(6,9)=ComuCost;
W(7,10)=ComuCost;
W(8,11)=ComuCost;
W(9,12)=ComuCost;
W(10,11)=ComuCost;
W(10,12)=ComuCost;
W(11,13)=ComuCost;
W(12,14)=ComuCost;
W(13,14)=ComuCost;

Task_on_Machine=zeros(Num,NumProc);
for i=1:Num-1
    for j=1:NumProc
        Task_on_Machine(i,j)=CompCost+10;
    end
end
% LU based on springer paper; entitle "A performance study of
% multiprocessor task scheduling algorithms"
for j=1:NumProc
 Task_on_Machine(Num,j)=CompCost;
end


for i=1:Num
    for j=1:NumProc
      Task_on_Machine(i,j)=Task_on_Machine(i,j)/Omega(j);
    end
end

W;
Task_on_Machine;
% BG=biograph(W);
% view(BG);
