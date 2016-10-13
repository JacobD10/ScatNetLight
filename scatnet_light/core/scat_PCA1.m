
function S = scat_PCA1(x, filters, PCA_filters, J)

U_tilde = cell(1,J);
    for j = 1 : J
        fprintf ('scat pca1 compute scale %d\n', j)
        U_j = compute_J_scale(x, filters, j);
        fprintf ('scat pca1 project pca %d\n', j)
        U_tilde{j} = project_PCA(U_j, PCA_filters{j});
        U_tilde{j}=abs(U_tilde{j});
        %s=wavelet_2d(U_tilde{j},filters);
        fprintf ('scat pca1 reshape %d\n', j)
        s2=size(U_tilde{j},ndims(U_tilde{j}));
        s1=numel(U_tilde{j})/s2;
        U_tilde{j} = reshape(U_tilde{j},[s1,s2])';
    end
    
    S = cell2mat(U_tilde)';
end
