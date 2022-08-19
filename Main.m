% We need to first set up X, the Matrix of graph signals 
%  then we need to initialize V_{G} to a random orthogonal matrix 
% and start the alternating coordinate descent 
N = 20;
M = 300;
k = 4;
thresh = 0.0001;


% The ground truth graph 
F = gsp_random_regular(N,2);
ActA = full(F.W);
[Q,E] = eig(ActA);
K= [];

for i = 1:M
    temp1 = randi([0,5],1,1);
    K = [K,full(sparse(randi([1,20],temp1,1),i*ones(temp1,1),cos(pi*rand(temp1,1)).*(1 + rand(temp1,1)),20,1))];
end

X = Q*K  + 0.1*randn(N,M);

Start = randn(N,N);
[V,~] = qr(Start);


objrn = frob_norm(X- V*Y);
objbef = -1000;


while abs(objbef - objrn) > thresh
    Y = V'*X;
    Y = sparser(Y,k);
    [U,S,W]= svd(X*Y'); 
    V = U*W;
    objbef = objrn;
    objrn = frob_norm(X-V*Y);
end 

%  now we have optimal Y, V
% Learning the adjacency from V????

cvx_begin 
 variables A(N,N) Z(N,N);
 minimize(norm(A,1));
 subject to 
    A = V*Z*V';
    A*ones(N,1) >= ones(N,1);
    A >= zeros(N,N);
cvx_end

print(frob_norm(ActA-A));

