function[dec,P,Q] = sdp_decomp(choi_matrix,m,n,r)
%r = 0 n x m choi matrix, r = 1 reducted choi matrix
cvx_begin sdp quiet
variable Qtt(n*(m-r),n*(m-r)) semidefinite
variable Ptt(n*(m-r),n*(m-r)) semidefinite
variable P(n*(m-r),n*(m-r)) semidefinite
variable Q(n*(m-r),n*(m-r)) semidefinite
minimize( trace(Ptt+Qtt));
subject to
choi_matrix-P-PartialTranspose(Q,1,[(m-r),n])==Ptt-Qtt;
cvx_end 
dec=trace(Ptt+Qtt);
end