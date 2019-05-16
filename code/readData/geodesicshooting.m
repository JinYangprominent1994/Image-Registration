t = 1;
stepsize = 0.01;

v_initial = loadMETA('./v0Spatial.mhd');
source = loadMETA('./source.mhd');

v_update = v_initial;

transform_x = repmat([1:100],100,1);
transform_y = transform_x.';
transform_tx = transform_x;
transform_ty = transform_y;

transform = transform_x;

for i = 1: 100

Ix = reshape(v_update(1,:,:),[],100);
Iy = reshape(v_update(2,:,:),[],100);

Ixx = Ix.*Ix;
Ixy = Ix.*Iy;
Iyx = Iy.*Ix;
Iyy = Iy.*Iy;

divx = Dx(Ixx) + Dx(Ixy);
divy = Dx(Iyx) + Dx(Iyy);

D1 = Dx(Ix);
D2 = Dx(Ix);
D3 = Dx(Iy);
D4 = Dx(Iy);

Jax = D1 * Ix + D3 * Iy;
Jay = D2 * Ix + D4 * Iy;

x = Jax + divx;

y = Jay + divy;

% use fft2 function to compute fourier transform
FX = fft2(x);
% use fftshift to center the low frequency
FSX = fftshift(FX);
% use ifftshift function to relocate the center of image
FSFX = ifftshift(FSX);
% use ifft2 function to reconstruct the original image
x = ifft2(FSFX);

% use fft2 function to compute fourier transform
FY = fft2(y);
% use fftshift to center the low frequency
FSY = fftshift(FY);
% use ifftshift function to relocate the center of image
FSFY = ifftshift(FSY);
% use ifft2 function to reconstruct the original image
y = ifft2(FSFY);

Ix = Ix + stepsize * x;
Iy = Iy + stepsize * y;

transform_tx_dif = interp2(transform_x,transform_y,Ix,transform_tx,transform_ty);
transform_ty_dif = interp2(transform_x,transform_y,Iy,transform_tx,transform_ty);

transform_tx = transform_tx + stepsize * transform_tx_dif;
transform_ty = transform_ty + stepsize * transform_ty_dif;

end

image = interp2(source,transform_tx,transform_ty);

figure(1);imshow(image);
figure(2);imshow(source);