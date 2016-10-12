% SCAT Compute the scattering transform
%
% Usage
%    [S, S_tilde, U] = SCAT(x, Wop, PCA_filters, J) 
%
% Input
%    x (numeric): The input signal.
%    Wop (cell of function handles): Linear operators used to generate a new 
%       layer from the previous one.
%    PCA filters(cell with the filters learned up to the scale J)
%    J (single): the maximum scale used
%
% Output
%    S (numeric): The scattering PCA representation up to scale J
%    S_tilde (cell, optionnal): The scattering PCA representation up to the scale J+1
%    down sampled, ie S_\tilde_{j+1}
%    U (cell, optionnal): The U_{J+1} as written by Stéphane 
%
% Description
%    This function simply computes tilde_S, and if the two outputs are set
%    up, it computes S_tilde and U at the next scale!!!
%
% See also 
%   WAVELET_FACTORY_1D, WAVELET_FACTORY_2D, WAVELET_FACTORY_2D_PYRAMID

function [S, U_tilde] = scat_PCA2(x, Wop,PCA_filters, J, S_J_prev)
    if nargin == 5
        % version with previous J given
        [S, U_tilde] = scat_PCA_previous(x, Wop, PCA_filters, J, S_J_prev);
    else
        % loop on Js
        S = {};
        S{1} = x;
        S_J_prev = S{1};
        U_tilde = {};
        for j = 2 : J
            [S{j}, U_tilde{j}] = scat_PCA_previous (x, Wop, PCA_filters, j, S_J_prev);
            S_J_prev = S{j};
        end
    
    end

end