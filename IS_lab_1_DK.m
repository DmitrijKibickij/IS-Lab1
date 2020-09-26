%Classification using perceptron

%SELECT 5-7 IMAGES OF PEARS AND APPLES!!!!!
% T: use T=1 pears and T=-1 for apples!!!!

%Reading apple images
A1=imread('apple_04.jpg');
A2=imread('apple_05.jpg');
A3=imread('apple_06.jpg');
A4=imread('apple_07.jpg');
A5=imread('apple_11.jpg');
A6=imread('apple_12.jpg');
A7=imread('apple_13.jpg');
A8=imread('apple_17.jpg');
A9=imread('apple_19.jpg');

%Reading pears images
P1=imread('pear_01.jpg');
P2=imread('pear_02.jpg');
P3=imread('pear_03.jpg');
P4=imread('pear_09.jpg');

%Calculate for each image, colour and roundness
%For Apples
%1st apple image(A1)
hsv_value_A1=spalva_color(A1); %color
metric_A1=apvalumas_roundness(A1); %roundness
%2nd apple image(A2)
hsv_value_A2=spalva_color(A2); %color
metric_A2=apvalumas_roundness(A2); %roundness
%3rd apple image(A3)
hsv_value_A3=spalva_color(A3); %color
metric_A3=apvalumas_roundness(A3); %roundness
%4th apple image(A4)
hsv_value_A4=spalva_color(A4); %color
metric_A4=apvalumas_roundness(A4); %roundness
%5th apple image(A5)
hsv_value_A5=spalva_color(A5); %color
metric_A5=apvalumas_roundness(A5); %roundness
%6th apple image(A6)
hsv_value_A6=spalva_color(A6); %color
metric_A6=apvalumas_roundness(A6); %roundness
%7th apple image(A7)
hsv_value_A7=spalva_color(A7); %color
metric_A7=apvalumas_roundness(A7); %roundness
%8th apple image(A8)
hsv_value_A8=spalva_color(A8); %color
metric_A8=apvalumas_roundness(A8); %roundness
%9th apple image(A9)
hsv_value_A9=spalva_color(A9); %color
metric_A9=apvalumas_roundness(A9); %roundness

%For Pears
%1st pear image(P1)
hsv_value_P1=spalva_color(P1); %color
metric_P1=apvalumas_roundness(P1); %roundness
%2nd pear image(P2)
hsv_value_P2=spalva_color(P2); %color
metric_P2=apvalumas_roundness(P2); %roundness
%3rd pear image(P3)
hsv_value_P3=spalva_color(P3); %color
metric_P3=apvalumas_roundness(P3); %roundness
%4th pear image(P4)
hsv_value_P4=spalva_color(P4); %color
metric_P4=apvalumas_roundness(P4); %roundness

%1
%selecting features(color, roundness, 3 apples and 2 pears)
%A1,A2,A3,P1,P2
%building matrix 2x5
x1=[hsv_value_A1 hsv_value_A2 hsv_value_A3 hsv_value_P1 hsv_value_P2];
x2=[metric_A1 metric_A2 metric_A3 metric_P1 metric_P2];
% estimated features are stored in matrix P:
P=[x1;x2];

%2
z1=[hsv_value_A4 hsv_value_A5 hsv_value_A6 hsv_value_P3 hsv_value_P4];
z2=[metric_A4 metric_A5 metric_A6 metric_P3 metric_P4];
P2=[z1;z2];

%Desired output vector
T=[1;1;1;-1;-1];

%Learning rate(initial)
eta=0.2; 

%% train single perceptron with two inputs and one output

% generate random initial values of w1, w2 and b
w1 = randn(1);
w2 = randn(1);
b = randn(1);
% calculate weighted sum with randomly generated parameters
v1 = x1(1,1)*w1+x2(1,1)*w2+b; % write your code here
disp(v1);
% calculate current output of the perceptron 
if v1 > 0
	y = 1;
else
	y = -1;
end
% calculate the error
e1 = T(1) - y;
disp(e1);
% repeat the same for the rest 4 inputs x1 and x2
% calculate weighted sum with randomly generated parameters
v2 = x1(1,2)*w1+x2(1,2)*w2+b; % write your code here
disp(v2);
% calculate current output of the perceptron 
if v2 > 0
	y = 1;
else
	y = -1;
end
% calculate the error
e2 = T(2) - y;
disp(e2);
% <...> write the code for another 3 inputs
v3=x1(1,3)*w1+x2(1,3)*w2+b;
disp(v3);
if v3 > 0
    y = 1;
else
    y = -1;
end
e3=T(3)-y;
disp(e3);

v4=x1(1,4)*w1+x2(1,4)*w2+b;
disp(v4);
if v4 > 0
    y = 1;
else
    y = -1;
end
e4=T(4)-y;
disp(e4);

v5=x1(1,5)*w1+x2(1,5)*w2+b;
disp(v5);
if v5 > 0
    y = 1;
else
    y = -1;
end
e5=T(5)-y;
disp(e5);
% calculate the total error for these 5 inputs 
e = abs(e1) + abs(e2) + abs(e3) + abs(e4) + abs(e5);
disp(e);

% write training algorithm(no random selection inside loop)
while e ~= 0 % executes while the total error is not 0
	% here should be your code of parameter update
    for m=1:5 % 1 to 5 matrix for x1/x2
        
    %new inputs
    %w1(n+1)=w1(n)+eta*e(n)*x1(m);
    %w2(n+1)=w2(n)+eta*e(n)*x2(m);
    %b(n+1)=b(n)+eta*e(n);
    
%   calculate output for current example
    v=x1(m)*w1+x2(m)*w2+b;
    disp(v);
   
%   calculate error for current example

    if v > 0
        y = 1;
    else
        y = -1;
    end
    e=T(m)-y;
    disp(e);

%   update parameters using current inputs and current error
    w1 = w1+eta*e*x1(m);
    %!w1(n+1)=w1(n)+eta*e(n)*x1(n);
    disp(w1);
    
    w2 = w2+eta*e*x2(m);
    %!w2(n+1)=w2(n)+eta*e(n)*x2(n);
    disp(w2);
    
    b = b+eta*e*1;
    %!b(n+1)=b(n)+eta*e(n)*1;
    disp(b);

    end
    %Out of loop test
    %1
    for m=1:5
    v=x1(m)*w1+x2(m)*w2+b;
    if v>0
        y=1;
    else
        y=-1;
    end
    E(m)=T(m)-y;
    e = e+abs(E(m));
    disp("error1");
    disp(e);
    end
end

 for j=1:5
    v=z1(j)*w1+z2(j)*w2+b;
    if v>0
        y=1;
    else
        y=-1;
    end
    G(j)=T(j)-y;
    e = e+abs(G(j));
    disp("error2");
    disp(e);
end