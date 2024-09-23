% Nonlinear Discrete Time System
% Sample Quiz 3 - Question 3

% Step A) Approximate the equilibrium points when u1(k) = 1.5, u2(k) = 1.

% We will use approximate values for the equilibrium points based on manual calculations.
% From inspection or approximation, let's assume:
x1_eq = 1.25; % Approximated value of x1 at equilibrium
x2_eq = 2.0;  % Approximated value of x2 at equilibrium

disp('Approximate equilibrium points:');
disp(['x1_eq = ', num2str(x1_eq)]);
disp(['x2_eq = ', num2str(x2_eq)]);

% Step B) Linearize the system around the equilibrium points.

% Define numerical Jacobians using finite differences
epsilon = 1e-5;

% Partial derivatives of f1 (x1_next) with respect to x1 and x2
df1_dx1 = (2*(x1_eq + epsilon)^2 - 2.5*(x1_eq + epsilon) + 1.5 - (2*x1_eq^2 - 2.5*x1_eq + 1.5)) / epsilon;
df1_dx2 = 0; % f1 does not depend on x2

% Partial derivatives of f2 (x2_next) with respect to x1 and x2
df2_dx1 = (0.2*(x1_eq + epsilon)*x2_eq + 1 - x2_eq - (0.2*x1_eq*x2_eq + 1 - x2_eq)) / epsilon;
df2_dx2 = (0.2*x1_eq*(x2_eq + epsilon) + 1 - (0.2*x1_eq*x2_eq + 1)) / epsilon;

% Construct the linearized system matrix A
A_eq = [df1_dx1, df1_dx2;
        df2_dx1, df2_dx2];

disp('Linearized system matrix A at equilibrium points:');
disp(A_eq);

% Step C) Analyse the stability of the linearized system by finding the eigenvalues of the state matrix.

% Eigenvalue analysis for stability
eigenvalues_A_eq = eig(A_eq);
disp('Eigenvalues of A (linearized system):');
disp(eigenvalues_A_eq);

% Stability check: if all abs(eigenvalues) < 1, system is stable
if all(abs(eigenvalues_A_eq) < 1)
    disp('The system is stable at the equilibrium point.');
else
    disp('The system is unstable at the equilibrium point.');
end
