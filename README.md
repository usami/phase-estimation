# Quantum Phase Estimation Algorithm
pe is a Matlab function which simulates the Quantum Phase Estimation algorithm.
It calculates and returns the estimate of the value of phi.

## Usage
pe function have the following sintax:

    pe(U00, U01, U10, U11, u0, u1, n, epsilon)

It estimates the value of phi for U|u> = e^(2\*pi\*i\*phi)|u> where U = [U00,
U01; U10, U11], |u> = [u0; u1].
> **NOTE**
> The function pe is restricted to simulate the case that U is a 2 by 2 matrix and
> |u> is a 2 coordinates vector.
This function also takes n and epsilon as inputs. It returns phi so that the
difference from the true value of phi and the estimate of phi is less than
2^(-n).
Epsilon is the probability of failure of this algorithm.

    >> pe(1, 0, 0, -1, 0, 1, 2, 0.25)

    ans =

        0.5000

In this example, the function returns the estimate of the value of phi where
e^(2\*pi\*i\*phi) = -1.
The value 0.5000 is a good estimation.

    >> pe(1, 0, 0, i, 0, 1, 2, 0.25)

    ans =

        0.2500

Another example for U = [1 0; 0 i]. Here we have e^(2\*pi\*i\*phi) = i, therefore
phi = 0.2500 is a good estimation.
