function [centreg,centint,intermed,outerreg]=lionreader(ourdata, x, y, NN, plane)


imageplane=ourdata(:,:,plane);

datacrops={};


for k=1:NN
    x1=x(k);
    x2=x1+10;
    
    y1=y(k);
    y2=y1+10;
    
    rect=[x1 y1 x2 y2];
    
    
    Icropped=imcrop(imageplane, rect);
    avgpxl=mean(mean(Icropped));
    pxlstd=std(mean(Icropped));
    
    datacrops{k}= [avgpxl pxlstd];
    %datacrops{k}= avgpxl;
    
end

centreg=datacrops{1};
centint=datacrops{2};
intermed=datacrops{3};
outerreg=datacrops{4};




