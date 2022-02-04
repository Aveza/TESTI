%Initial values
dt = 20;
T = 100;
U_0 = 100;
k = 0; 

f = @(u,t) 0.1*(1-u/500)*u;
[u, t] = ode_FE(f, U_0, dt, T); %initial ode that is called

answer = 'Y';
while answer == 'Y';
    dt_k = 2^(-k)*dt; %time step
    [u_new, t_new] = ode_FE(f, U_0, dt_k, T); %new ode
    plot(t, u, 'b-', t_new, u_new, 'r--') %red = new plot
    xlabel('t'); ylabel('N(t)'); 
    fprintf('Time step: %g\n', dt_k);
    answer = input('Continue with halved time step? (Y/N): ', 's')
    if answer == 'Y' 
        u = u_new; %replaces previous u and t
        t = t_new;
    else
        break %termination if answer is not Y
    end
    k = k + 1;
end