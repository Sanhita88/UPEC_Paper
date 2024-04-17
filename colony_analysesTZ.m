function [ourseries,x,y] = colony_analysesTZ(NN) %nn=no. of points
[redfiles,pathred]=uigetfile('*.png','multiselect','on');
[greenfiles,pathgreen]=uigetfile('*.png','multiselect','on');
[p,q]=size(redfiles);


reddata={};
greendata={};

for i=1:q
[reddata{i},redrow{i}]=imread(fullfile(pathred,redfiles{i})); 
[greendata{i},greenrow{i}]=imread(fullfile(pathgreen,greenfiles{i})); 
%row{1} %check to make sure everything is ok
%pause
end


%data72red=reddata{q};
%redimage72=data72red(:,:,1);
data72green=greendata{q};
greenimage72=data72green(:,:,2);

%imshow(redimage72)
imshow(greenimage72)
[x,y] = ginput(NN);

regionout1={}; 
regionint1={};
regioncentint1={};
regioncent1={};

regionout2={}; 
regionint2={};
regioncentint2={};
regioncent2={};

for j=1:q
[centreg1,centint1,intermed1,outerreg1]=lionreader(reddata{j}, x, y, NN, 1);
[centreg2,centint2,intermed2,outerreg2]=lionreader(greendata{j}, x, y, NN, 2);

regionout1{j}=outerreg1; 
regionint1{j}=intermed1;
regioncentint1{j}=centint1;
regioncent1{j}=centreg1;

regionout2{j}=outerreg2; 
regionint2{j}=intermed2;
regioncentint2{j}=centint2;
regioncent2{j}=centreg2;

end

outer1=cell2mat(regionout1.');
intermediate1=cell2mat(regionint1.');
centintzone1=cell2mat(regioncentint1.');
centerzone1=cell2mat(regioncent1.');

outer2=cell2mat(regionout2.');
intermediate2=cell2mat(regionint2.');
centintzone2=cell2mat(regioncentint2.');
centerzone2=cell2mat(regioncent2.');

filename = 'kineticsred20220917.xlsx';
writematrix(centerzone1,filename,'Sheet','centerzone_red','Range','D1')
writematrix(centintzone1,filename,'Sheet','centintzone_red','Range','D1')
writematrix(intermediate1,filename,'Sheet','intermediate_red','Range','D1')
writematrix(outer1,filename,'Sheet','outer_red','Range','D1')

filename = 'kineticsgreen20220917.xlsx';
writematrix(centerzone2,filename,'Sheet','centerzone_green','Range','D1')
writematrix(centintzone2,filename,'Sheet','centintzone_green','Range','D1')
writematrix(intermediate2,filename,'Sheet','intermediate_green','Range','D1')
writematrix(outer2,filename,'Sheet','outer_green','Range','D1')

ourseries=[outer1
intermediate1
centintzone1
centerzone1

outer2
intermediate2
centintzone2
centerzone2];

% imshow(data72)
% position = [x(1) y(1) 10 10; x(2) y(2) 10 10; x(3) y(3) 10 10; x(4) y(4) 10 10];
% label=['center' 'centerint' 'intermediate' 'outer'];
% RGB = insertObjectAnnotation(data72,"rectangle",position,label);
% imshow(RGB)