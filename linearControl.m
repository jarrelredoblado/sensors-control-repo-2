% Linear Continous System 
% Quiz 2 - Question 3 

% Define state-space matrices
A = [1/4, 3/4; 1/4, -1/2];
B = [0; 1];
C = eye(2);
D = [0; 0];

% State  - Matlab function to turn the matrices into state equation
sys_open = ss(A, B, C, D);

% Plot the "natural" system state
figure;
step(sys_open);
title('Step Response of Open-Loop System');
xlabel('Time (s)');
ylabel('Amplitude');

% Part b) Eigenvalues for stability analysis
eigenvalues = eig(A);

% Part c) Controllability matrix
C = ctrb(A, B);
rank_C = rank(C);

% Part d) Pole placement
desired_poles = [-0.5, -0.75];
K = place(A, B, desired_poles);

% Display
disp('Eigenvalues of A:');
disp(eigenvalues);
disp('Rank of Controllability Matrix:');
disp(rank_C);
disp('Gain Matrix K for Pole Placement:');
disp(K);