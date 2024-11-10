clear all
clc
%%
FeatureNum = 8;
DPNum = 1;
Features = zeros(FeatureNum,DPNum);
Target = zeros(FeatureNum,1);
%%
cvx_begin
    variable w(1) % define w is a 4 dimension vector (DP2-5)
    minimize ( norm(Target - Features*w,2) ) % Target is (mix-wine) %Features*w is the data you get, so you want the norm of difference is minimize
    subject to %add constraint
        %ones(1,DPNum) * w == 2 %add up of w = 1
        w >= 0 % w more than or equal to 0
cvx_end

w % print out w

%% save different features and target
save('Target1.mat','Target');
save('FeaturesDP4.mat','Features')