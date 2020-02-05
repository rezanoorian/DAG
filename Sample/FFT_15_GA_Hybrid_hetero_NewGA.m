clear all;
% % This program is generally created for paper "Hybrid Task Scheduling
% Method for Cloud Computing by Genetic and PSO Algorithm
%------------------------------------------------
Num=15; % number of nodes in graph
NumProc=4; %number of processors
ComuCost=80;
CompCost=60;
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

%Omega=ones(Num,Num);
% it is assigned for FFT-problem
W=zeros(Num,Num);

W(1,2)=ComuCost;
W(1,3)=ComuCost;
W(2,4)=ComuCost;
W(2,5)=ComuCost;
W(3,6)=ComuCost;
W(3,7)=ComuCost;
W(4,8)=ComuCost;
W(4,9)=ComuCost;
W(5,8)=ComuCost;
W(5,9)=ComuCost;
W(6,10)=ComuCost;
W(6,11)=ComuCost;
W(7,10)=ComuCost;
W(7,11)=ComuCost;
W(8,12)=ComuCost;
W(8,14)=ComuCost;
W(9,13)=ComuCost;
W(9,15)=ComuCost;
W(10,12)=ComuCost;
W(10,14)=ComuCost;
W(11,13)=ComuCost;
W(11,15)=ComuCost;

% 
% W(1,2)=ComuCost;
% W(1,3)=ComuCost;
% W(1,4)=ComuCost;
% W(2,5)=ComuCost;
% W(2,7)=ComuCost;
% W(3,6)=ComuCost;
% W(3,7)=ComuCost;
% W(4,8)=ComuCost;
% W(4,9)=ComuCost;
% W(4,10)=ComuCost;
% W(4,11)=ComuCost;
% W(5,12)=ComuCost;
% W(6,12)=ComuCost;
% W(7,13)=ComuCost;
% W(7,28)=ComuCost;
% W(7,29)=ComuCost;
% W(8,14)=ComuCost;
% W(9,14)=ComuCost;
% W(10,15)=ComuCost;
% W(11,15)=ComuCost;
% W(12,16)=ComuCost;
% W(12,17)=ComuCost;
% W(12,18)=ComuCost;
% W(12,19)=ComuCost;
% W(12,20)=ComuCost;
% W(12,21)=ComuCost;
% W(13,16)=ComuCost;
% W(13,17)=ComuCost;
% W(13,18)=ComuCost;
% W(13,19)=ComuCost;
% W(13,20)=ComuCost;
% W(13,21)=ComuCost;
% W(14,21)=ComuCost;
% W(14,22)=ComuCost;
% W(15,22)=ComuCost;
% W(16,23)=ComuCost;
% W(16,24)=ComuCost;
% W(16,25)=ComuCost;
% W(17,26)=ComuCost;
% W(18,26)=ComuCost;
% W(19,26)=ComuCost;
% W(19,27)=ComuCost;
% W(20,27)=ComuCost;
% W(21,27)=ComuCost;
% W(21,34)=ComuCost;
% W(22,28)=ComuCost;
% W(22,29)=ComuCost;
% W(23,30)=ComuCost;
% W(24,30)=ComuCost;
% W(24,31)=ComuCost;
% W(25,31)=ComuCost;
% W(25,32)=ComuCost;
% W(26,33)=ComuCost;
% W(27,33)=ComuCost;
% W(28,33)=ComuCost;
% W(28,35)=ComuCost;
% W(29,34)=ComuCost;
% W(29,35)=ComuCost;
% W(30,36)=ComuCost;
% W(31,36)=ComuCost;
% W(32,37)=ComuCost;
% W(33,37)=ComuCost;
% W(34,38)=ComuCost;
% W(35,38)=ComuCost;
% W(36,39)=ComuCost;
% W(37,39)=ComuCost;
% W(37,40)=ComuCost;
% W(38,40)=ComuCost;
% W(39,41)=ComuCost;
% W(40,41)=ComuCost;

Task_on_Machine=zeros(Num,NumProc);
for i=1:Num
    for j=1:NumProc
        Task_on_Machine(i,j)=CompCost;
    end
end
% LU based on springer paper; entitle "A performance study of
% multiprocessor task scheduling algorithms"
% for j=1:NumProc
%  Task_on_Machine(Num,j)=CompCost;
% end


for i=1:Num
    for j=1:NumProc
      Task_on_Machine(i,j)=Task_on_Machine(i,j)/Omega(j);
    end
end

BG=biograph(W);
view(BG);
%
% % 
% % for i=1:Num
% %     for j=1:NumProc
% %       Task_on_Machine(i,j)=sum(Task_on_Machine(i,:))/NumProc;
% %     end
% % end
% % 
% %  Task_on_Machine
% %  halt
% 
% 
% 
% List=zeros(1,Num);
% for k=1:Num
%   List(k)=DownwardRank(k,Num,W,Task_on_Machine,NumProc);
% end
% % List of processor Availability
% % All processors are available at t=0;
% %List
% %halt
% % ni=2;
% % pj=1;
% % [a,b]=AFT(ni,W,Avail,Task_on_Machine,NumProc)
% % EST(ni,pj,Num,W,Task_on_Machine,Avail,NumProc)
% %Avail(b)=a;
% %EST(ni,pj,W,Task_on_Machine,Avail,NumProc)
% TaskList1=zeros(1,Num);
% TaskList2=zeros(1,Num);
% TaskList3=zeros(1,Num);
% for i=1:Num
%  Min1=inf;
%  idx=-1;
%  for j=1:Num
%     if List(j)<Min1
%         Min1=List(j);
%         idx=j;
%     end
%  end
%  TaskList1(i)=idx;
%  List(idx)=inf;
% end
% 
% 
% List=zeros(1,Num);
% for k=Num:-1:1
%     %k
%     %List(k)
%   List(k)=UpwardRank(k,Num,W,Task_on_Machine,NumProc);
% end
% % List of processor Availability
% % All processors are available at t=0;
% 
% %List
% %halt
% % ni=2;
% % pj=1;
% % [a,b]=AFT(ni,W,Avail,Task_on_Machine,NumProc)
% % EST(ni,pj,Num,W,Task_on_Machine,Avail,NumProc)
% %Avail(b)=a;
% %EST(ni,pj,W,Task_on_Machine,Avail,NumProc)
% TaskList2=zeros(1,Num);
% for i=1:Num
%  Max1=-inf;
%  idx=-1;
%  for j=1:Num
%     if List(j)>Max1
%         Max1=List(j);
%         idx=j;
%     end
%  end
%  TaskList2(i)=idx;
%  List(idx)=-inf;
% end
% 
% 
% 
% Lev=zeros(1,Num);
% List1=zeros(1,Num);
% List2=zeros(1,Num);
% CP=zeros(1,Num); % it is used for critical path
% for k=Num:-1:1
%    
%     List1(k)=UpwardRank(k,Num,W,Task_on_Machine,NumProc);
% end
% for k=1:Num
%   Lev(k)=LEVEL(k,Num,W)  
%   List2(k)=DownwardRank(k,Num,W,Task_on_Machine,NumProc);
%   CP(k)=List1(k)+List2(k);
% end
% 
% TaskList3=zeros(1,Num);
% 
% 
% %CP
% LevelNum=0; % it goes levels step by 1
% i=1; % it is used to fulfill the TaskList
% Idx=1;
% while i<=Num
%     Traverse=[]; % list of tasks with level=i
%     j=1;
%     Max1=-inf;
%     Idx1=1;
%     PPP=0; %it indicates there still exist a member with level=LevelNum
%     while j<=Num %it finds all nodes with level=LevelNum and CP=Max
%         if (Lev(j)==LevelNum)&&(CP(j)>Max1)
%             Max1=CP(j);
%             Idx1=j;
%             PPP=1;
%         end
%         j=j+1;
%     end
%     if PPP~=0
%       TaskList3(i)=Idx1;
%       CP(Idx1)=-inf;
%       Lev(Idx1)=-1;
%       i=i+1;
%     else
%         LevelNum=LevelNum+1;
%     end
%     
%     
% end
% 
% TaskList1
% TaskList2
% TaskList3
% % X1=0;
% % Y1=0;
% % X2=100;
% % Y2=10;
% % DrawScheduling(TaskList1,Num,W,NumProc,Task_on_Machine,X1,Y1,X2,Y2);
% % CCR(W,Num,Task_on_Machine,NumProc)
% % halt
%  Population(1,:)=TaskList1;
%  Population(2,:)=TaskList2;
%  Population(3,:)=TaskList3;
% Counter=3; %number of chromosome
% for k=1:Num
%   Lev(k)=LEVEL(k,Num,W) ;
% end
% Max_Lev=max(Lev);
% %Cluster=zeros(Max_Lev,Num);
% % Population(1,:)=TaskList1;
% % Population(2,:)=TaskList2;
% % Population(3,:)=TaskList3;
% TT=3;
% while TT<PopSize
% NewList=[];
% Indv=[];
% %X1=perms([2]);
% %length(X1)
% j=1;
% %Lev
% %ha
% for i=0:Max_Lev
%     %j=1;
%     NewList=[];
%     while Lev(j)==i
%        NewList=[NewList,j];
%        j=j+1;
%        if j>Num 
%            break;
%        end
%     end
%     
%     
%     X1=perms(NewList);
% %     Lev
% %     NewList
% %     Max_Lev
% %     i
% %     X1
%     len1=randi([1,length(X1)]);
%     Indv=[Indv,X1(len1,:)];
% end
% %Indv
% 
% %Max_Lev
% if (Valid(Indv,W,Num)==1)&&(Repeated(Population,TT,Indv)==0)
%     TT=TT+1;
%     Population(TT,:)=Indv;
% end
% end
% %TT
% % %hal
% %Population
% 
% %Indv
% %Valid(Indv,W,Num)
% 
% 
% %halt
% 
% % X1=0;
% % Y1=0;
% % X2=100;
% % Y2=10;
% %DrawScheduling(Population(1,:),Num,W,NumProc,Task_on_Machine,X1,Y1,X2,Y2)
% Fitness=zeros(1,TT);
% for i=1:TT
%     Fitness(i)=MakespanScheduling(Population(i,:),Num,W,NumProc,Task_on_Machine);%,X1,Y1,X2,Y2)
% end
% %-------------------
% % The intial Population was made
% %-------------------
% 
% % Fitness
%  %Population
%  %halt
%   [c,d]=min(Fitness(1:PopSize))
%   [c,d]=max(Fitness(1:PopSize))
% % i=RouleeteWheel4(Fitness,TT)
% % Fitness(i)
% %min(AA)
% Iter=0;
% Iteration=20;
% Ch1=zeros(1,Num);
% Ch2=zeros(1,Num);
% while Iter < Iteration
%     
%     %Temp=zeros(PopSize*Crate,Num);
%     NEW_POP=zeros(PopSize+PopSize*Crate+PopSize*Mrate,Num);
%     for LEN=1:PopSize
%         NEW_POP(LEN,1:Num)=Population(LEN,1:Num);
%     end
%     LEN=LEN-1;
%     %Temp_Id=0;
%     %-------------------Start of Crossover-----------------------
%     i=1;
%     while i<=PopSize*Crate
%         P1=-1;
%         P2=-1;
%         while P1==P2
%          P1=RouleeteWheel4(Fitness,PopSize);
%          P2=RouleeteWheel4(Fitness,PopSize);
%         end
%         Cpoint=randi([3,Num-2],1,1);
%         % first child
%         Ch1(1:Cpoint)=Population(P1,1:Cpoint);
%         k=Cpoint;
%         for j=1:Num
%             idx=ismember(Population(P2,j),Ch1(1:Cpoint));
%             if idx==0
%                 k=k+1;
%                 Ch1(k)=Population(P2,j);
%             end
%         end
%         %second child
%         Ch2(1:Cpoint)=Population(P2,1:Cpoint);
%         k=Cpoint;
%         for j=1:Num
%             idx=ismember(Population(P1,j),Ch2(1:Cpoint));
%             if idx==0
%                 k=k+1;
%                 Ch2(k)=Population(P1,j);
%             end
%         end
% %         P1
% %         P2
% %         Cpoint
% %         Population(P1,:)
% %         Population(P2,:)
% %         Ch1
% %         Ch2
% %        ha
%         Temp(i,1:Num)=Ch1(1:Num);
%         Temp(i+1,1:Num)=Ch2(1:Num);
%         LEN=LEN+1;
%         NEW_POP(LEN,1:Num)=Ch1(1:Num);
%         LEN=LEN+1;
%         NEW_POP(LEN,1:Num)=Ch2(1:Num);
%         i=i+2;
%     end
%     %----------------end of crossover--------------------
%     %
%     %--------Start of Mutation------------
%     i=1;
%     while i<=PopSize*Mrate
%         Mut=RouleeteWheel4(Fitness,PopSize);
%         % Population(Mut) is a selected Chrom
%         Ri=randi([2,Num-2]);
%         S_L=SUCC(Population(Mut,Ri),Num,W);
%         %Sig=randi([0,1]);
%         for M=Ri+1:Num
%             if ismember(Population(Mut,M),S_L)
%                 Rj=M;
%                 break;
%             end
%         end
%         %Mut
%         %Population(Mut,1:Num)
%         %Ri
%         %S_L
%       %  if Sig==0
%            IDX=0;
%            for K=Ri+1:Rj-1
%                P_K=PRED(K,Num,W);
%                IDX=0;
%                for J=1:length(P_K)
%                    if ismember(P_K(J),Population(Mut,1:Ri-1))==0
%                        IDX=1;
%                    end
%                end
%                if IDX==0
%                    POS=K;
%                    INDV1=Population(Mut,1:Num);
%                    INDV1(Ri)=INDV1(Ri)+INDV1(POS);
%                    INDV1(POS)=INDV1(Ri)-INDV1(POS);
%                    INDV1(Ri)=INDV1(Ri)-INDV1(POS);
%                    LEN=LEN+1;
%                    NEW_POP(LEN,1:Num)=INDV1(1:Num);
% 
%                    %Valid(INDV1,W,Num)
%                    i=i+1;
%                    break;
%                end
%            end
%            %K
%            %POS
%            
% %            if IDX==1
% %                disply('no');
% %                exit;
% %            end
% %        % else
%        % end
%         %i=i+1;
%     end
%     %i
%     %halt
%     
%     %--------end of Mutation
%     Fit=zeros(PopSize+PopSize*Crate+PopSize*Mrate);
%     Fit1=zeros(PopSize+PopSize*Crate+PopSize*Mrate);
%     Index=zeros(PopSize+PopSize*Crate+PopSize*Mrate);
%     for M=1:PopSize+PopSize*Crate+PopSize*Mrate-1
%         
%         Fit(M)=MakespanScheduling(NEW_POP(M,1:Num),Num,W,NumProc,Task_on_Machine);
%         Fit1(M)=Fit(M);
%     end
%     M=1;
%     while M< PopSize/3
%         [h,R]=min(Fit1(1:PopSize+PopSize*Crate+PopSize*Mrate-1));
%         if Index(R)==0            
%             Population(M,1:Num)=NEW_POP(R,1:Num);
%             Fitness(M)=Fit1(R);
%             Fit1(R)=inf;
%             Index(R)=1;
%             M=M+1;
%             %Index(d)=0;
%         end
%     end
%     while M<PopSize
%         R=RouleeteWheel4(Fit,PopSize+PopSize*Crate-1);  
%         if Index(R)==0
%             Population(M,1:Num)=NEW_POP(R,1:Num);
%             Fitness(M)=Fit(R);
%             Index(R)=1;
%             M=M+1;
%         end
%     end
%   
%     Iter=Iter+1;
%     
% end
% % [e,f]=min(Fitness(1:PopSize))
% % [e,f]=max(Fitness(1:PopSize))
%     [a,b]=min(Fit(1:PopSize))
%     [e,f]=max(Fit(1:PopSize))
%     X1=0;
%     Y1=0;
%     X2=100;
%     Y2=10;
%     DrawScheduling(Population(b,1:Num),Num,W,NumProc,Task_on_Machine,X1,Y1,X2,Y2);
%     CCR(W,Num,Task_on_Machine,NumProc)
% %Fitness(35:40)
% %Fit(35:40)
% 
% %Fit(31)
% %Fitness(31)