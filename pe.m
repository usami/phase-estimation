function [ans] = pe(U00, U01, U10, U11, u0, u1, n, epsilon)
%   pe      Simulate the Quantum Phase Estimation algorithm. Return the
%           estimate of the value of phi for the given input.

U = [U00 U01; U10 U11];
u = [u0; u1];

% calculate the number of qubits for top register
t = n + ceil(log2(2 + 1/(2*epsilon)));

top_reg = zeros(2^t, 1);
top_reg(1) = 1;

H = 1 / sqrt(2) * [1 1; 1 -1];
Ht = 1;
for j = 1:t,
    Ht = kron(Ht, H);
end

% apply H^t
top_reg = Ht * top_reg;

% apply control U^(2^(k-1))
for k = 1:t,
    top_reg = ctl_u(U, u, k, t) * top_reg;
end

% apply inversed Quantum Fourier Transform
top_reg = fourier(t)' * top_reg;

% find the most likely outcome m
p = 0;
for k = 1:2^t;
    prob = top_reg(k)^2;
    if prob > p
        m = k - 1;
        p = prob;
    end
end

ans = m / 2^t;
