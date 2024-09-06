% code based of https://arxiv.org/abs/1708.06595
%   1.take an arbitrary antisymmetric state ρA; 
%   2. compute pPPT(ρA) via the SDP (10);
%   3. if pPPT(ρA) < 1/2, then the optimal PPT state σ∗ that is such that PAσ∗PA = pPPT(ρA)ρA is a PPT entangled state.

function [pPPT,state,realig] = SDP_PPT(dim)
Pa = AntisymmetricProjection(dim,2);
Ps = SymmetricProjection(dim,2);
RHO = RandomDensityMatrix(dim*dim);
rhoA = Pa*RHO*Pa/trace(Pa*RHO);
%rhoA = Pa/trace(Pa);

cvx_begin sdp quiet
    variable siq(dim*dim,dim*dim) hermitian
    maximize( trace(Pa*siq) )
    subject to
        Pa*siq*Pa == trace(Pa*siq)*rhoA;
        siq >= 0;
        trace(siq) == 1;
        PartialTranspose(siq,2,dim) >= 0;
cvx_end
pPPT = trace(Pa*siq);
state = siq;
realig = sum(svd(Realignment(state)));
end