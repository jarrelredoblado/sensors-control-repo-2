% Linear Continuous System
% Quiz 2 - Question 3 

% Define state-space matrices
A = [1/4, 3/4; 1/4, -1/2];
B = [0; 1];
C = eye(2);  % Output matrix (Identity matrix)
D = [0; 0];  % Direct transmission matrix

% Initial condition
x0 = [1; 0];  % Initial state

% Define the input u(t)
u = @(t) 1; 

% Part a) Solution of x(t)
% Define the system of differential equations
odefun = @(t, x) A * x + B * u(t);  % dx/dt = A*x + B*u(t)

% Time span for the solution
tspan = [0 10];  % Solve from t = 0 to t = 10 seconds

% Solve the system using ode45
[t, x] = ode45(odefun, tspan, x0);

% Output the solution of x(t)
disp('Time values (t):');
disp(t);

disp('Solution for state variables x(t):');
disp(x);

% Plot the state variables over time
figure;
plot(t, x(:,1), 'r', 'DisplayName', 'x1(t)'); % Plot x1(t)
hold on;
plot(t, x(:,2), 'b', 'DisplayName', 'x2(t)'); % Plot x2(t)
xlabel('Time (t)');
ylabel('State Variables');
title('Solution of the Continuous-Time Linear System');
legend;
grid on;

% Create state-space model
sys_open = ss(A, B, C, D);

% Step response of the system
figure;
step(sys_open);
title('Step Response of Open-Loop System');
xlabel('Time (s)');
ylabel('Amplitude');

% Part b) Eigenvalues for stability analysis
eigenvalues = eig(A);

% Part c) Controllability matrix
control_matrix = ctrb(A, B);
rank_C = rank(control_matrix);

% Part d) Pole placement for state feedback control
desired_poles = [-0.5, -0.75];  % Desired pole locations
K = place(A, B, desired_poles);  % Calculate feedback gain matrix

% Display results
disp('Eigenvalues of A:');
disp(eigenvalues);

disp('Rank of Controllability Matrix:');
disp(rank_C);

disp('Gain Matrix K for Pole Placement:');
disp(K);