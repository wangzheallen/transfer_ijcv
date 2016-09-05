% ------------------------------------------------------------------------
function crops_data = prepare_image(im, scale)

CROPPED_DIM = 224;

im = imresize(im, scale);
im_data = im(:, :, [3, 2, 1]);  % permute channels from RGB to BGR
im_data = permute(im_data, [2, 1, 3]);  % flip width and height
im_data = single(im_data);  % convert from uint8 to single
im_data = bsxfun(@minus, im_data, reshape([104,117,123],[1,1,3]));

im1 = im_data(1:CROPPED_DIM,1:CROPPED_DIM,:);
im8 = im_data(1:CROPPED_DIM, round((size(im_data,2)-CROPPED_DIM)/2)+1:round((size(im_data,2)-CROPPED_DIM)/2)+CROPPED_DIM,:);
im2 = im_data(1:CROPPED_DIM,end-CROPPED_DIM+1:end,:);

im3 = im_data(end-CROPPED_DIM+1:end,1:CROPPED_DIM,:);
im9 = im_data(end-CROPPED_DIM+1:end, round((size(im_data,2)-CROPPED_DIM)/2)+1:round((size(im_data,2)-CROPPED_DIM)/2)+CROPPED_DIM,:);
im4 = im_data(end-CROPPED_DIM+1:end,end-CROPPED_DIM+1:end,:);

im6 = im_data(round((size(im_data,1)-CROPPED_DIM)/2)+1:round((size(im_data,1)-CROPPED_DIM)/2)+CROPPED_DIM,...
    1:CROPPED_DIM,:);
im5 = im_data(round((size(im_data,1)-CROPPED_DIM)/2)+1:round((size(im_data,1)-CROPPED_DIM)/2)+CROPPED_DIM,...
    round((size(im_data,2)-CROPPED_DIM)/2)+1:round((size(im_data,2)-CROPPED_DIM)/2)+CROPPED_DIM,:);
im7 = im_data(round((size(im_data,1)-CROPPED_DIM)/2)+1:round((size(im_data,1)-CROPPED_DIM)/2)+CROPPED_DIM,...
    end-CROPPED_DIM+1:end,:);



crops_data = cat(4,im1,im2,im3,im4,im5,im6,im7,im8,im9);
crops_data = cat(4, crops_data, crops_data(end:-1:1,:,:,:));

end
