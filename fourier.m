function [F] = fourier(t)
%   fourier     Returns the matrix representation of the Quantum Fourier
%               Transform for t qubits.

N = 2^t;
F = zeros(N, N);
for j = 1:N,
    for k = 1:N,
        F(j, k) = exp(2 * pi * i * (j-1) * (k-1) / N);
    end
end

F = 1 / sqrt(N) * F;
