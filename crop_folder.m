clc
clear all

x_cent = 2080;
    y_cent = 1560;
    size_of_cropped_img = 511;

    centroide = [x_cent y_cent];
    myFolder =  'G:\VISION_data_set_for SCI d\A02_Huawei-P8\Testing';
if ~isdir(myFolder)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', myFolder);
  uiwait(warndlg(errorMessage));
  return;
end
filePattern = fullfile(myFolder, '*.jpg');
jpegFiles = dir(filePattern);
for k = 1:length(jpegFiles)
  baseFileName = jpegFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  fprintf(1, 'Now reading %s\n', fullFileName);
  I = imread(fullFileName);
 % imshow(I);
   % imshow(I);
    %I2 = imcrop(I,rect) crops the image I. rect is a four-element position vector of the
    %form [xmin ymin width height] that specifies the size and position of the crop rectangle. 
    %imcrop returns the cropped image, I2.
    xmin = x_cent-size_of_cropped_img/2;
    ymin = y_cent-size_of_cropped_img/2;
    I2 = imcrop(I,[xmin ymin size_of_cropped_img size_of_cropped_img]);
   % figure();
  %  imshow(I2)
    fullFileName2=fullfile('G:\data_crop\Testing', baseFileName);
        imwrite(I2,fullFileName2);
end