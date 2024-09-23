% Linear Discrete Time System for Bank Accounts
% Sample Quiz 3 - Question 2

% Given initial conditions
x0 = [28000; 10500; 16500]; % Initial balances for the three accounts

% Step A) Model the system as a linear discrete-time system.
% State-space matrices
A = [0.2 0 0; 0.4 0.5 0; 0.5 0.5 1]; % Transition matrix
B = [0 0; 1 0; 0 -1]; % Input matrix (salary and mortgage)
C = eye(3); % Output matrix (observing all states directly)
D = zeros(3, 2); % No direct term

% Display the state-space representation
disp('State-space representation:');
disp('A = '), disp(A);
disp('B = '), disp(B);
disp('C = '), disp(C);
disp('D = '), disp(D);

% Step B) What is the generic solution of the state x(k)?
% The generic solution is x(k+1) = A*x(k) + B*u(k)

% Initial conditions
u = [3000; 1500]; % Salary u1 = 3000, Mortgage u2 = 1500

% Simulate the system for two steps (k = 1 and k = 2)
x1 = A * x0 + B * u;
x2 = A * x1 + B * u;

disp('x(1) = '), disp(x1);
disp('x(2) = '), disp(x2);

% Step C) Analyse the stability of the system when control inputs are zero.

% Set the inputs to zero (no salary, no mortgage payments)
u_zero = [0; 0]; 

% Simulate the system for stability check (control inputs = zero)
x1_zero = A * x0 + B * u_zero;
x2_zero = A * x1_zero + B * u_zero;

disp('x(1) with zero inputs = '), disp(x1_zero);
disp('x(2) with zero inputs = '), disp(x2_zero);

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

% Step D) Analyse the controllability of the system.

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

% Step E) Design the optimal state feedback control using Linear Quadratic Regulator (LQR).

% Define Q and R for the LQR design
Q = eye(3); % Identity matrix for penalizing all states equally
R = eye(2); % Identity matrix for penalizing both inputs equally

% Compute optimal state feedback gain using LQR
[K_lqr, S, e] = lqr(A, B, Q, R);

disp('Optimal state feedback gain matrix using LQR:');
disp(K_lqr);