
g=double(imread('C:\Users\lz\Desktop\example.bmp')); %%%%%%%%%%%%%%%%%%%%%%%set as your pic path
g=g(:,:,1);
%%%%%%%%%%%%%从0-2pi生成随机相位矩阵%%%%%%%%%%%%%%%
TarImg=normrnd(0,2*pi,size(g,1),size(g,2)); 

%%%%%%%%%%%%%将随机相位矩阵与目标物体结合%%%%%%%%%%%
 IP0=g.*exp(1i*TarImg);

%%%%%%%%%%%%%通过傅里叶变换生成散斑图%%%%%%%%%%%
 speckle=abs(fftshift(fft2(IP0,500,500))).^2;

 %%%%%%%%%%%%%%%归一化%%%%%%%%%%%%%%%
 speckle=speckle./max(max(speckle(:,:)));
 figure
 imshow(speckle)
 
 
 result=abs(fftshift(fft2(speckle)));%%%%%%%%%%%%%%%%%%%%%%%%%调整对比度

 
 imtool(result)
