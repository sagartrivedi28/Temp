function ILT_EPEStat(Target, Markup, STarget, Wafer, DistT,DistST)

Tedge = double(xor(Target>0,imerode(Target>0,strel('square',3)))).*Target;

STedge = double(xor(STarget>0,imerode(STarget>0,strel('square',3)))).*STarget;

Wedge = double(xor(Wafer>0,imerode(Wafer>0,strel('square',3)))).*Wafer;


[Tdx,Tdy]  = gradient(Target>0);
[STdx,STdy]  = gradient(STarget>0);


temp = Markup.*(Tedge~=0);

[WEx,WEy] = find(Wedge~=0);

% Smooth Region EPE

[SLx, SLy ]= find(temp==5);

for i = 1:length(STx)
    xi=SLx(i); yi = SLy(i);
    if Tdx(xi,yi) > Tdy(xi,yi)
        
        
    else
        
    end;
end;














Diff = DistW-DistT;

Tle = (temp==2).*Diff;
Tjs = (temp==3).*Diff;
Tcn = (temp==4).*Diff;
Tsl = (temp==5).*Diff;

figure(1); contour(DistW,[0 0],'r'); hold on; contour(Tedge,[1 1],'b'); 

figure(2); T = bplot(Tle(find(temp==2)),2,'points'); hold on; 
% bplot(Tjs(find(temp==3)),3,'points');
% bplot(Tcn(find(temp==4)),4,'points');
bplot(Tsl(find(temp==5)),4,'points'); hold off;
legend(T);

end
