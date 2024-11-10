clear all
clc
%%
FeatureNum =8;
DPNum = 5;
Features = zeros(FeatureNum,DPNum);
Target = zeros(FeatureNum,1);
%%
lambda = (6e-7)*max(Target); % lambda is the regulizer
cvx_begin
    variable w(DPNum) % define w is a 4 dimension vector (DP2-5)
    minimize ( norm((Target - Features*w),2) - lambda*sum(log(w)) ) % Target is the true value,  %Features*w is the data you get, so you want the norm of difference is minimize
    subject to %add constraint
        ones(1,DPNum) * w == 1 %add up of w = 1
        w >= 0 % w more than or equal to 0
cvx_end

w % print out w

%% save different features and target
save('Target1.mat','Target');
save('Features1.mat','Features')
