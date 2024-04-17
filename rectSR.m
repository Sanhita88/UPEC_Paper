image(image220928new0h)

x=xnow;
y=ynow;

for i=1:4
    
    x1=x(i);
   % x2=x1+10;
    
    y1=y(i);
   % y2=y1+10;
    
    rect=[x1 y1 10 10];
    rectangle('Position',rect,'LineWidth', 0.5, 'EdgeColor', 'k')
    
end

B=imresize(z3, 10);

set(gca,'XColor', 'none','YColor','none')
set(gca, 'color', 'none');