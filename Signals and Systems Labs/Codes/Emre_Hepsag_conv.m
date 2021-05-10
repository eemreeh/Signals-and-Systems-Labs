
function [cnv] = Emre_Hepsag_conv(sig1,sig2)
    
    sig2 = flip(sig2);
    b1 = length(sig1);
    b2 = length(sig2);
    a = b1 + b2 -1;
    output = zeros(1,a);
    
    
    for i = 1:a
        if i<=b2
            for j = 1:i
                output(i) = output(i) + sig1(j)*sig2(b2-i+j);
            end
        else
            for j = 1:(b1+b2-i)
                output(i) = output(i)+sig1(j+i-b2)*sig2(j);
            end
    end
    
    cnv = output;
end