close all; clear; clc;
load 0.3979MainReRun.mat;
const.TanParam.DimGiven = 2;
const.TanParam.NCoordDim = 1;
const.TanParam.EValueTolerance = 1;
%%
[adj, ~] = FindAdj(nodes, const.RANGE);
knn = min(sum(adj~=0, 2));
ILabels.LFlag = zeros(const.N, 1);
ILabels.LFlag(1:const.AN) = 1;
ILabels.y = noisy_nodes;
%%
NNIdx = zeros(const.N, knn);
for i = 1:const.N
    NNIdx(i, :) = find(adj(i, :), knn);
end;
% [B, BS] = ConstructHessian(noisy_nodes, NNIdx, const.TanParam);