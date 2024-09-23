% Linear Discrete Time System
% Sample Quiz 3 - Question 1

% Step A) Please derive the state-space representation of the system in matrix form.

% State-space matrices
A = [0.7 1.2 -0.4; 0.1 0.9 0.2; -0.7 1 1];
B = [1; 1; 1];
C = [1 0 0; 0 2 0; 1 1 1];
D = 0; % No direct term

% Display the state-space representation
disp('State-space representation:');
disp('A = '), disp(A);
disp('B = '), disp(B);
disp('C = '), disp(C);
disp('D = '), disp(D);

% Step B) Write the generic solution of the system. If the initial state is 𝑥(0) = [1, −1, 1]𝑇 , 
%         and the input is zero vector, calculate 𝑥(1) and 𝑥(2)

% Initial conditions
x0 = [1; -1; 1];

% Zero input
u = 0; 

% Simulate the system at k = 1 and k = 2
x1 = A * x0 + B * u;
x2 = A * x1 + B * u;

disp('x(1) = '), disp(x1);
disp('x(2) = '), disp(x2);

% Step C) Analyse the stability of the system by finding the eigenvalues of the state matrix.

% Eigenvalue analysis for stability
eigenvalues_A = eig(A);
disp('Eigenvalues of A:');
disp(eigenvalues_A);

% Stability check: if all abs(eigenvalues) < 1, system is stable
if all(abs(eigenvalues_A) < 1)
    disp('The system is stable.');
else
    disp('The system is unstable.');
end

% Step D) Find the controllability matrix and determine if the system is controllable.

% Controllability matrix
Co = ctrb(A, B);
rank_Co = rank(Co);

disp('Controllability matrix:');
disp(Co);
disp(['Rank of Controllability matrix: ', num2str(rank_Co)]);

if rank_Co == size(A, 1)
    disp('The system is controllable.');
else
    disp('The system is not controllable.');
end

% Step E) Given poles 𝑝 = [0.3, 0.4, 0.5]𝑇 , design the state feedback controller such that 
%         the closed loop system has given poles.

% Desired closed-loop poles
p = [0.3 0.4 0.5];

% Compute state feedback gains using pole placement
K = place(A, B, p);

disp('State feedback gain matrix K:');
disp(K);

% Step F) Briefly describe how to design the optimal state feedback control by using Linear 
%         Quadratic Regulator (LQR). Given Q is 3x3 identical matrix and R is scalar 1, 
%         calculate the optimal feedback K using MATLAB.

% LQR design parameters
Q = eye(3); % Identity matrix of size 3x3
R = 1; % Scalar

% Compute optimal state feedback gain using LQR
[K_lqr, S, e] = lqr(A, B, Q, R);

disp('Optimal state feedback gain matrix using LQR:');
disp(K_lqr);
