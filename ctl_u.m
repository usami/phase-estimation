function [matrix] = ctl_u(U, u, k, t)
%   ctl_u   Return the matrix representation of the Clt-U^(2^(k-1)) gate.

psi = U^(2^(k-1)) * u;

for j = 1:size(u, 1),
    if u(j) ~= 0
        phase = psi(j) / u(j);
    end
end

matrix = 1;
for j = t:-1:1,
    if j == k
        matrix = kron(matrix, [1 0; 0 phase]);
    else
        matrix = kron(matrix, eye(2));
    end
end
