Codes to [MATLAB](https://matlab.mathworks.com) using [CVX package](https://cvxr.com) (semidefinite programming) to tests the decomposability of the Choi matrices associated with positive maps. 

1. SDP_PPT.m: checks if the Choi matrix of the map is an entanglement witness (EW) to a PPT entangled state. If a value is negative then a map is indecomposable, otherwise, a map is decomposable.
2. sdp_decomp.m: checks the decomposition of the Choi matrix if it is a sum of positive semidefinite and co-positive semidefinite matrices. If the value is near zero then such decomposition exists and the map is decomposable.

License
---
This code is under the MIT license.
[MIT License](https://opensource.org/license/MIT)
