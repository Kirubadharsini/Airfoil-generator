clear all
close all
clc

% This program generates the NACA 
% 4-Digit series airfoils

naca = input('Enter the NACA 4-Digit No.: ','s');
M = str2double(naca(1)); % first digit
P = str2double(naca(2)); % second digit
T = str2double(naca(3:4)); % last two digits
% M = str2num(naca(1))
n = input('Enter the No. of points: ');
% M = 0; % first digit
% P = 0; % second digit
% T = 12; % last two digit

c = 1; % chord length

m = M*c/100; % maximum camber
p = P*c/10; % Location of maximum camber
t = T*c/100; % maximum thickness

for i = 1:n
    theta = (i-1)*2*pi/n;
    % Eq. A
    x = 0.5*c*(1+cos(theta));
    if (x<p)
        %Eq. 1
        yc(i) = (m/p^2)*(2*p*x-x^2);
        hold on
    else 
        yc(i) = (m/(1-p)^2)*((1-2*p)+2*p*x-x^2);
    end
    %Eq. 3
    yt = 5*t*(0.2969*sqrt(x) ...
         -0.1260*x ...
         -0.3516*x^2 ...
         +0.2843*x^3 ...
         -0.1015*x^4);
    if i<(n/2+1)
        % upper surface (Eq.4 and 5)
        xa(i) = x;
        ya(i) = yc(i)+yt;
    else 
         xa(i) = x;
         ya(i) = yc(i)-yt;
    end
    %Trailing edge
    xa(n+1) = c;
    ya(n+1) = 0;
    yc(n+1) = 0;
    
end
figure(1)
% fill(xa,ya,'y')
fill(xa,ya,[0.9290 0.6940 0.1250])
hold on
% plot(xa,ya,'-ok','LineWidth',2)
plot(xa,ya,'-k','LineWidth',2)
plot(xa,yc,'-.r','LineWidth',1)
plot(xa,ya*0,'-b','LineWidth',1)

axis([-0.1 1.1 -0.5 0.6])
title('Shape of the NACA 4-Digit Airfoil')
hold off
grid on

% figure(2)
% fill(xa,ya,[0.9290 0.6940 0.1250])
% hold on
% plot(xa,ya,'-k','LineWidth',2)
% axis([-0.1 1.1 -0.5 0.6])
% axis off
% hold off



    

