clear
%initializing
db = 2;
samp=1000;
err_all=zeros(8,8);
i=1;
signif = 0.05;

%%
for db = 3:10

error=zeros(8,1);
for alp=0.01:0.01:signif
% alp=signif; 
    for j=1:100
        err = randn(samp,1)*10^(-db/10);
        X = rand(samp,1)+err;
        [H,t] = norm_test_time(X, alp);
        for count = 1:8
            if H(count)==0
                error(count)=error(count)+1;
            end;
        end;
        hy(j,:)=H; %assigning all the hypothesis results into a vector
        ti(j,:)=t; %assigning times from each calculation of different tests into a vector
   end;
    err_all(i,:)=error/1000;
    i=i+1;
end;
     hy_ave(i,:) = mean(hy); %average hypothesis results from 100 runs of the norm test
     ti_ave(i,:) = mean(ti); %average time from 100 runs of norm test

end;
 alp=0.01:0.01:signif;
 figure(1);plot(alp, ti_ave);
 figure(2);plot(alp, hy_ave);
 figure(3);plot(ti_ave(20));
 figure(4);plot(hy_ave(1));
 figure(5);plot(hy_ave(10));
 figure(6);plot(hy_ave(20));