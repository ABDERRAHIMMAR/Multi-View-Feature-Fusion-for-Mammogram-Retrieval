function [f]= foury(im)
  % input: image in binary form, from which the Fourier Descriptors are     calculated
  % output: Fourier Descriptor ,which describes the shape of the image by calculating Fourier Transform of its  Boundary  
    im = im2bw(im);
    b = bwboundaries(im);
    [max_size, max_index] = max(cellfun('size', b, 1));
    if size(b,1)==0
        c=zeros(10,2);
    else
    c = b{max_index};
    end
    % calculating Fourier Transform of image boundaries
    s = c(:, 1) + 1i*c(:, 2);
    descriptors = fft(s,512);
    descriptors=descriptors';
    D=abs(descriptors(1));
    descriptor=zeros(511,1);
    for i=1:511
      descriptor(i)=abs(descriptors(i+1))/D;
    end
    f = descriptor;
    f = transpose(f);