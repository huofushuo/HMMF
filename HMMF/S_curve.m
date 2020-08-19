function S_corrected = S_curve( im )

[m,n]=size(im);
im=double(im)*255;
T=ones(m,n)*252.503;
S=ones(m,n)+exp(-(im-(ones(m,n))*127.092)./(ones(m,n)*6.879));
A=-ones(m,n)*5;
S_corrected=T./S+A;

S_corrected=double(S_corrected)/255;
%S_corrected=double((ones(m,n))*253./(ones(m,n)+exp(-(im-ones(m,n))*124./ones(m,n)))*31-ones(m,n)*5)/255;
end