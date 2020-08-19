function y = SLGC(u,gamma)


u=double(255*u);
u = double(u+1)/257;

ycbcr = rgb2ycbcr(u);

L=ycbcr(:,:,1);


L1 = SGLIPtimesCoreA(L,gamma);

% ycbcr(:,:,1)=L1;
% 
% z1 = ycbcr2rgb(ycbcr);
y = L1;

end


function y = SGLIPtimesCoreA(x, alpha)

    x = x - mean(x(:));

y = SGLIP(alpha.*SGLIP(x,0),1);

    m = min(y(:));
    M = max(y(:));
    y = (y-m)/(M-m);

end

function y = SGLIP(x,mode)


    %SLIP
    if mode == 0 
        y = -sign(x).*log(1-abs(x));

    else
        y = sign(x).*(1 - exp(-abs(x)));

    end
end

