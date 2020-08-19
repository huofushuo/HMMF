function dehazed = Dehaze(I_hazy)

%veil remove
 I_hazy=veil_removal(I_hazy);

I_hazy_ycbcr=rgb2ycbcr(I_hazy);

I_hazy_ycbcr_cb=I_hazy_ycbcr(:,:,2);
I_hazy_ycbcr_cr=I_hazy_ycbcr(:,:,3);

II = zeros(size(I_hazy,1),size(I_hazy,2),size(I_hazy,3),2);




for i=2:3

    gamma = i;

    for c=1:3

        II(:,:,c,i) = I_hazy(:,:,c).^gamma;

    end

end



%  II(:,:,:,1) = SLGC(I_hazy,2);
% III(:,:,:,3) = SLGC(I_hazy,2);

%rgb2ycbcr
III(:,:,1,:) = 0.257*II(:,:,1,:) + 0.564*II(:,:,2,:) + 0.0988*II(:,:,3,:)+(16/255);
%III(:,:,2,:) = -0.148*II(:,:,1,:) - 0.291*II(:,:,2,:) + 0.439*II(:,:,3,:)+(128/255);
%III(:,:,3,:) = 0.439*II(:,:,1,:) - 0.368*II(:,:,2,:) - 0.071*II(:,:,3,:)+(128/255);
III(:,:,:,3) = SLGC(I_hazy,2);

R=MSF(III(:,:,1,:));

dehazed(:,:,1)= R(:,:,1);  
dehazed(:,:,2)= I_hazy_ycbcr_cb;   
dehazed(:,:,3)= I_hazy_ycbcr_cr;

dehazed=ycbcr2rgb(dehazed);



end
