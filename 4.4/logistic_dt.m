dt = 20; T = 100;
f = @(u,t) 0.1*(1-u/500)*u;
U_0 = 100;
[u, t] = ode_FE(f, U_0, dt, T);

k = 1;
answer = 'Y';
while answer == 'Y';
    dt_k = 2^(-k)*dt;
    [u_new, t_new] = ode_FE(f, U_0, dt_k, T);
    plot(t, u, 'b-', t_new, u_new, 'r--')
    legend({'u','u-new'},'Location','southeast')
    title('Logistic model for appropriate time step')
    
    xlabel('t'); ylabel('N(t)'); 
    
    fprintf('Time step: %g\n', dt_k);
    answer = input('Continue with halved time step? (Y/N) ', 's')
    if answer == 'Y' 
        u = u_new;
        t = t_new;
    else
        break
    end
    k = k + 1;
end


saveas(gcf,'test.png') %saves the figure when input for loop is N


