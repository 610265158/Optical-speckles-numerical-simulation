
g=double(imread('C:\Users\lz\Desktop\example.bmp')); %%%%%%%%%%%%%%%%%%%%%%%set as your pic path
g=g(:,:,1);
%%%%%%%%%%%%%��0-2pi���������λ����%%%%%%%%%%%%%%%
TarImg=normrnd(0,2*pi,size(g,1),size(g,2)); 

%%%%%%%%%%%%%�������λ������Ŀ��������%%%%%%%%%%%
 IP0=g.*exp(1i*TarImg);

%%%%%%%%%%%%%ͨ������Ҷ�任����ɢ��ͼ%%%%%%%%%%%
 speckle=abs(fftshift(fft2(IP0,500,500))).^2;

 %%%%%%%%%%%%%%%��һ��%%%%%%%%%%%%%%%
 speckle=speckle./max(max(speckle(:,:)));
 figure
 imshow(speckle)
 
 
 result=abs(fftshift(fft2(speckle)));%%%%%%%%%%%%%%%%%%%%%%%%%�����Աȶ�

 
 imtool(result)
