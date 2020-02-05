clear all;
Num=36; % number of nodes in graph
NumProc=4; %number of processors
ComuCost=100;
CompCost=40;
%W=csvread('adjacency.csv');
%Task_on_Machine=csvread('Task_on_Machine.csv');
W=zeros(Num,Num);

w1=0.25;
w2=0.5;
w3=0.75;
w4=1.0;
Omega=[w1 w2 w3 w4];

Le=7;
Lee=8;
Row=1;
Col=Lee+Row; 
for i=1:Le
    Col=Lee+Row;
    for j=1:Le+1-i   
        W(Row,Col)=ComuCost;
        Col=Col+1;
    end
    Row=Row+Lee;
    Lee=Lee-1;
end

Le=7;
Lee=8;
Row=1;
Col=Lee+Row;
for i=1:Le
    Col=Lee+Row;
    for j=1:Le+1-i   
      W(Row+j,Col)=ComuCost;
      Col=Col+1;
    end
    Row=Row+Lee;
    Lee=Lee-1;
end

% W(1,2)=ComuCost;
% W(1,3)=ComuCost;
% W(1,4)=ComuCost;
% W(1,5)=ComuCost;

% W(1,8)=ComuCost;
% W(1,9)=ComuCost;
% W(1,10)=ComuCost;
% W(1,11)=ComuCost;
% W(1,12)=ComuCost;
% W(1,13)=ComuCost;
% W(2,8)=ComuCost;
% W(3,9)=ComuCost;
% W(4,10)=ComuCost;
% W(5,11)=ComuCost;
% W(6,12)=ComuCost;
% W(7,13)=ComuCost;
% W(8,14)=ComuCost;
% W(8,15)=ComuCost;
% W(8,16)=ComuCost;
% W(8,17)=ComuCost;
% W(8,18)=ComuCost;
% W(9,14)=ComuCost;
% W(10,15)=ComuCost;
% W(11,16)=ComuCost;
% W(12,17)=ComuCost;
% W(13,18)=ComuCost;
% W(14,19)=ComuCost;
% W(14,20)=ComuCost;
% W(14,21)=ComuCost;
% W(14,22)=ComuCost;
% W(15,19)=ComuCost;
% W(16,20)=ComuCost;
% W(17,21)=ComuCost;
% W(18,22)=ComuCost;
% W(19,23)=ComuCost;
% W(19,24)=ComuCost;
% W(19,25)=ComuCost;
% W(20,23)=ComuCost;
% W(21,24)=ComuCost;
% W(22,25)=ComuCost;
% W(23,26)=ComuCost;
% W(23,27)=ComuCost;
% W(24,26)=ComuCost;
% W(25,27)=ComuCost;
% W(26,28)=ComuCost;
% W(27,28)=ComuCost;
% W(1,7)=ComuCost;
% W(1,8)=ComuCost;
% W(1,9)=ComuCost;
% W(1,10)=ComuCost;
% W(1,11)=ComuCost;
% W(2,7)=ComuCost;
% W(3,8)=ComuCost;
% W(4,9)=ComuCost;
% W(5,10)=ComuCost;
% W(6,11)=ComuCost;
% W(7,12)=ComuCost;
% W(7,13)=ComuCost;
% W(7,14)=ComuCost;
% W(7,15)=ComuCost;
% W(8,12)=ComuCost;
% W(9,13)=ComuCost;
% W(10,14)=ComuCost;
% W(11,15)=ComuCost;
% W(12,16)=ComuCost;
% W(12,17)=ComuCost;
% W(12,18)=ComuCost;
% W(13,16)=ComuCost;
% W(14,17)=ComuCost;
% W(15,18)=ComuCost;
% W(16,19)=ComuCost;
% W(16,20)=ComuCost;
% W(17,19)=ComuCost;
% W(18,20)=ComuCost;
% W(19,21)=ComuCost;
% W(20,21)=ComuCost;
% 
% W(1,6)=ComuCost;
% W(1,7)=ComuCost;
% W(1,8)=ComuCost;
% W(1,9)=ComuCost;
% W(2,6)=ComuCost;
% W(3,7)=ComuCost;
% W(4,8)=ComuCost;
% W(5,9)=ComuCost;
% W(6,10)=ComuCost;
% W(6,11)=ComuCost;
% W(6,12)=ComuCost;
% W(7,10)=ComuCost;
% W(8,11)=ComuCost;
% W(9,12)=ComuCost;
% W(10,13)=ComuCost;
% W(10,14)=ComuCost;
% W(11,13)=ComuCost;
% W(12,14)=ComuCost;
% W(13,15)=ComuCost;
% W(14,15)=ComuCost;
% W(1,2)=ComuCost;
% W(1,3)=ComuCost;
% W(1,4)=ComuCost;
% W(1,5)=ComuCost;
% W(2,6)=ComuCost;
% W(3,7)=ComuCost;
% W(4,8)=ComuCost;
% W(5,9)=ComuCost;
% W(6,7)=ComuCost;
% W(6,8)=ComuCost;
% W(6,9)=ComuCost;
% W(7,10)=ComuCost;
% W(8,11)=ComuCost;
% W(9,12)=ComuCost;
% W(10,11)=ComuCost;
% W(10,12)=ComuCost;
% W(11,13)=ComuCost;
% W(12,14)=ComuCost;
% W(13,14)=ComuCost;

Task_on_Machine=zeros(Num,NumProc);
for i=1:Num
    for j=1:NumProc
        Task_on_Machine(i,j)=CompCost;
    end
end

for i=1:Num
    for j=1:NumProc
      Task_on_Machine(i,j)=Task_on_Machine(i,j)/Omega(j);
    end
end

for i=1:Num
    W(i,i)=sum(Task_on_Machine(i,:))/NumProc;
end

BG=biograph(W);
view(BG);

% 
% % LU based on springer paper; entitle "A performance study of
% % multiprocessor task scheduling algorithms"
% % for j=1:NumProc
% %  Task_on_Machine(Num,j)=CompCost;
% % end
% %Task_on_Machine
% %halt
% %------How to calculate W(i,i) bar-----
% % for i=1:Num
% %     W(i,i)=sum(Task_on_Machine(i,:))/NumProc;
% % end
% %--------------------------------------
% % L=[]; isempty(L) returns 1
% %S=SUCC(6,Num,W)
% %S=PRED(9,Num,W)
% %W(7,2)=90;
% %LEVEL(11,Num,W)
% % for k=1:Num
% % UpwardRank(k,Num,W,Task_on_Machine,NumProc)
% % end
% % for i=1:Num
% %     for j=1:NumProc
% %       Task_on_Machine(i,j)=sum(Task_on_Machine(i,:))/NumProc;
% %     end
% % end
% %Task_on_Machine
% %halt
% PRED(6,Num,W)
% List=zeros(1,Num);
% for k=1:Num
%   List(k)=DownwardRank(k,Num,W,Task_on_Machine,NumProc);
%   
% end
% % List of processor Availability
% % All processors are available at t=0;
% for i=1:NumProc
%     Avail(i)=0;
% end
% 
% % ni=2;
% % pj=1;
% % [a,b]=AFT(ni,W,Avail,Task_on_Machine,NumProc)
% % EST(ni,pj,Num,W,Task_on_Machine,Avail,NumProc)
% %Avail(b)=a;
% %EST(ni,pj,W,Task_on_Machine,Avail,NumProc)
% TaskList=zeros(1,Num);
% 
% for i=1:Num
%  Min1=inf;
%  idx=-1;
%  for j=1:Num
%     if List(j)<Min1
%         Min1=List(j);
%         idx=j;
%     end
%  end
%  TaskList(i)=idx;
%  List(idx)=inf;
% end
% 
% 
% % for i=1:Num
% %  Max1=-inf;
% %  idx=-1;
% %  for j=1:Num
% %     if List(j)>Max1
% %         Max1=List(j);
% %         idx=j;
% %     end
% %  end
% %  TaskList(i)=idx;
% %  List(idx)=-inf;
% % end
% TaskList
% Valid(TaskList,W,Num)
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
