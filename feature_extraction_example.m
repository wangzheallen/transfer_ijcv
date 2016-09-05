
path_val = '/PATH/TO/YOUR/PICTURE/';
path_caffe = '/PATH/TO/YOUR/CAFFE/DIRECTORY';
addpath(path_caffe);
folderlist = dir(path_val);
if exist('../+caffe', 'dir')
  addpath('..');
else
  error('Please run this demo from caffe/matlab/demo');
end
data = importdata('/WIDER_v0.1/test.lst');

gpu_id = 0;
model_file = '/PATH/TO/MODEL/WEIGHT';
model_def_file = '/PATH/TO/MODEL/PROTOTXT';
phase = 'test';
caffe.reset_all();
caffe.set_mode_gpu();
caffe.set_device(gpu_id);
net = caffe.Net(model_def_file, model_file, phase);
path_target = '/PATH/TO/SAVE/YOUR/SCORE';
for scale = 1:0.5:2
    for j=3:length(folderlist)
    if ~exist([path_target,folderlist(j).name],'dir')
        mkdir([path_target,folderlist(j).name]);
    end    
    end
    
    filelist = data.textdata;
    test_fc = zeros(length(filelist), 61, 18);
    for i = 1:length(filelist)
        im = imread([path_val,filelist{i}(19:end)]);
        if size(im,3) == 1
            im = cat(3, im, im, im);
        end
        input_data = prepare_image(im, scale);
        net.blobs('data').set_data(input_data);
        net.forward_prefilled();
        feature_fc = squeeze(net.blobs('fc_event').get_data());
        test_fc(i,:,:) = feature_fc;
        i
    end
    
    save(['/SAVE/YOUR/SCORE'], 'test_fc', '-v7.3');
end
caffe.reset_all();







