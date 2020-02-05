clear all;
Num=35; % number of nodes in graph
NumProc=4; %number of processors
ComuCost=80;
CompCost=10;
%W=csvread('adjacency.csv');
%Task_on_Machine=csvread('Task_on_Machine.csv');
W=zeros(Num,Num);
W(1,2)=ComuCost;
W(1,3)=ComuCost;
W(1,4)=ComuCost;
W(1,5)=ComuCost;
W(1,6)=ComuCost;
W(1,7)=ComuCost;
W(1,8)=ComuCost;
W(2,9)=ComuCost;
W(3,10)=ComuCost;
W(4,11)=ComuCost;
W(5,12)=ComuCost;
W(6,13)=ComuCost;
W(7,14)=ComuCost;
W(8,15)=ComuCost;
W(9,10)=ComuCost;
W(9,11)=ComuCost;
W(9,12)=ComuCost;
W(9,13)=ComuCost;
W(9,14)=ComuCost;
W(9,15)=ComuCost;
W(10,16)=ComuCost;
W(11,17)=ComuCost;
W(12,18)=ComuCost;
W(13,19)=ComuCost;
W(14,20)=ComuCost;
W(15,21)=ComuCost;
W(16,17)=ComuCost;
W(16,18)=ComuCost;
W(16,19)=ComuCost;
W(16,20)=ComuCost;
W(16,21)=ComuCost;
W(17,22)=ComuCost;
W(18,23)=ComuCost;
W(19,24)=ComuCost;
W(20,25)=ComuCost;
W(21,26)=ComuCost;
W(22,23)=ComuCost;
W(22,24)=ComuCost;
W(22,25)=ComuCost;
W(22,26)=ComuCost;
W(23,27)=ComuCost;
W(24,28)=ComuCost;
W(25,29)=ComuCost;
W(26,30)=ComuCost;
W(27,28)=ComuCost;
W(27,29)=ComuCost;
W(27,30)=ComuCost;
W(28,31)=ComuCost;
W(29,32)=ComuCost;
W(30,33)=ComuCost;
W(31,32)=ComuCost;
W(31,33)=ComuCost;
W(32,34)=ComuCost;
W(33,35)=ComuCost;
W(34,35)=ComuCost;

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
%Task_on_Machine
%halt
%------How to calculate W(i,i) bar-----
% for i=1:Num
%     W(i,i)=sum(Task_on_Machine(i,:))/NumProc;
% end
%--------------------------------------
% L=[]; isempty(L) returns 1
%S=SUCC(6,Num,W)
%S=PRED(9,Num,W)
%W(7,2)=90;
%LEVEL(11,Num,W)
% for k=1:Num
% UpwardRank(k,Num,W,Task_on_Machine,NumProc)
% end
for i=1:Num
    for j=1:NumProc
      Task_on_Machine(i,j)=sum(Task_on_Machine(i,:))/NumProc;
    end
end

BG=biograph(W);
view(BG);

% 
% %Task_on_Machine
% %halt
% List=zeros(1,Num);
% for k=Num:-1:1
%   List(k)=UpwardRank(k,Num,W,Task_on_Machine,NumProc)
% end
% 
% % CCR(W,Num,Task_on_Machine,NumProc)
% % halt
% 
% 
% % List of processor Availability
% % All processors are available at t=0;
% for i=1:NumProc
%     Avail(i)=0;
% end
% %List
% %halt
% % ni=2;
% % pj=1;
% % [a,b]=AFT(ni,W,Avail,Task_on_Machine,NumProc)
% % EST(ni,pj,Num,W,Task_on_Machine,Avail,NumProc)
% %Avail(b)=a;
% %EST(ni,pj,W,Task_on_Machine,Avail,NumProc)
% TaskList=zeros(1,Num);
% for i=1:Num
%  Max1=-inf;
%  idx=-1;
%  for j=1:Num
%     if List(j)>Max1
%         Max1=List(j);
%         idx=j;
%     end
%  end
%  TaskList(i)=idx;
%  List(idx)=-inf;
% end
% TaskList
% CCR(W,Num,Task_on_Machine,NumProc)
% X1=0;
% Y1=0;
% X2=100;
% Y2=10;
% DrawScheduling(TaskList,Num,W,NumProc,Task_on_Machine,X1,Y1,X2,Y2);
% % 
% % %halt
% % %Draw(TaskList,Num,W,NumProc,Task_on_Machine);
% % 
% % % This does not work
% % 
% % for i=1:NumProc
% %     Avail(i)=0;
% % end
% % 
% % LastTask=zeros(1,NumProc);
% % ActualFT=zeros(1,Num);
% % ActualST=zeros(1,Num);
% % TaskMap=zeros(1,Num);
% % for i=1:Num
% %   Node=TaskList(i)
% %   [a,b]=AFT(Node,Num,W,Task_on_Machine,Avail,NumProc,ActualFT,TaskMap)
% %   Avail(b)=a;
% %   LastTask(b)=Node;
% %   TaskMap(Node)=b;
% %   ActualFT(Node)=a;
% %   ActualST(Node)=ActualFT(Node)-Task_on_Machine(Node,TaskMap(Node));
% % end
% % a
% % b
% % 
% % rectangle('Position',[0 0 100 10]);
% % grid on;
% % hold on;
% % X=0;
% % Y=0;
% % text(-10,0.5,'P0');
% % text(-10,1.5,'P1');
% % text(-10,2.5,'P2');
% % for i=1:Num
% %     Len=ActualFT(i)-ActualST(i);
% %     TM=TaskMap(i);
% %     rectangle('Position', [X+ActualST(i) Y+TM-1 Len 1] );
% %     T=['T'];
% %     T=[T,num2str(i-1)];
% %     text(X+ActualST(i)+1,Y+TM-1+0.5,T);
% %     hold on;
% % end
% % text(ActualFT(Num)-2,-.30,num2str(ActualFT(Num)));
% % for i=1:Num
% %     
% %     Len=ActualFT(i)-ActualST(i);
% %     TM=TaskMap(i);
% %     %PP=SUCC(W,n,i);
% %     PP=SUCC(i,Num,W);
% %     %l=1;
% %     for l=1:length(PP)
% %         if TaskMap(i)~=TaskMap(PP(l))
% %            A=[X+ActualST(i)+Len  X+ActualST(PP(l))];
% %            B=[Y+TM Y+TaskMap(PP(l))];
% %            %A=[10 20]
% %            %B=[20 1]
% %            plot(A,B);
% %         %line(   
% %         end
% %      %   l=l+1;
% %     end
% %     
% % end
% % 
