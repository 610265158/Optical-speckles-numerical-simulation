


%%%%%%%%%%%%%%set as your pic or just the 
g=double(imread('\path\to\example.bmp')); 

%%%%%%%%%%%%%% a simple way to produce a binary pattern from the pic
g=g(:,:,1); 

%%%%%%%%%%%%%%generate random phase from 0-2pi
RandomPhase=normrnd(0,2*pi,size(g,1),size(g,2)); 

%%%%%%%%%%%%%%combine the binary pattern with the random pahse 
IP0=g.*exp(1i*RandomPhase);

%%%%%%%%%%%%%%produce the speckles pattern through a FFT transform
speckle=abs(fftshift(fft2(IP0,500,500))).^2;

%%%%%%%%%%%%%%simple norm the data,
speckle=speckle./max(max(speckle(:,:)));
 
%%%%%%%%%%%%%%show , the speckle produced by the binary pattern,
%%%%%%%%%%%%%%and in real it means optical capture
figure
imshow(speckle)
 
 
%%%%%%%%%%%%%% one time of FFT transform to get the correlation and then
%%%%%%%%%%%%%% in this pattern you can see the shape of the original pattern

%%%%%%%%%%%%%%%%%%%%%%%%%caution！！！u should adjust the contrast in imtool to see the result
result=abs(fftshift(fft2(speckle)));%%%%%%%%%%%%%%%%%%%%%%%%%
imtool(result)
