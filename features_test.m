clear all
clc
feature=zeros(12000,88);
qq=1;
loc='G:\VISION_data_set_for SCI d';
for q=1:2
if q==1
    loc1='\I04\Training\*.jpg';
location=strcat(loc,loc1);
ds=imageDatastore(location);
end
if q==2
   loc1='\I04\Testing\*.jpg';
   location=strcat(loc,loc1);
ds=imageDatastore(location); 
end
if q==3
   loc1='\A05_Hwawie-MatePro10\Testing\*.jpg';
   location=strcat(loc,loc1);
ds=imageDatastore(location); 
end
if q==4
   loc1='\A06_Hwawei-Y5\Testing\*.jpg';
   location=strcat(loc,loc1);
ds=imageDatastore(location); 
end
if q==5
   loc1='\A07_Galaxy-S7\Testing\*.jpg';
   location=strcat(loc,loc1);
ds=imageDatastore(location); 
end



  fprintf("\ncid%d----->",q);

k=1;
while hasdata(ds)
    tic;
     ime= read(ds);
     [rows, columns, numberOfColorChannels] = size(ime);
     x_cent = rows/2;
    y_cent = columns/2;
    size_of_cropped_img = 511;
    centroide = [x_cent y_cent];
    xmin = x_cent-size_of_cropped_img/2;
    ymin = y_cent-size_of_cropped_img/2;
    ip1 = imcrop(ime,[xmin ymin size_of_cropped_img size_of_cropped_img]);
     %figure(),
     %imshow(ip1);
    %historigram equlization
    HSV = rgb2hsv(ip1);
    Heq = histeq(HSV(:,:,3));
    HSV_mod = HSV;
    HSV_mod(:,:,3) = Heq;
    ip = hsv2rgb(HSV_mod);
    
   %figure(),
   %imshow(ip);
     %ip=imresize(ime, [512 512], 'bilinear');
     %ip=double(ime);
   % R=ip(:,:,1);
    %G=ip(:,:,2);
    %=ip(:,:,3);
    
   fet_ip=divine_feature_extract(ip); % red channel feature
    %fet_G=divine_feature_extract(G); % green channel feature
    %fet_B=divine_feature_extract(B); % blue channel feature
    fet= fet_ip;
    feature(qq,:)=fet;
     fprintf("\n image_id=%d----->",k);
    toc;
     k=k+1;

    qq=qq+1;
end





end