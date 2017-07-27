function XL = Plot_GM_FU5(X,k,~,M,V)
[~,d] = size(X);
S = zeros(d,k);
R1 = zeros(d,k);
R2 = zeros(d,k);

for i=1:k,  % Determine plot range as 4 x standard deviations
    S(:,i) = sqrt(diag(V(:,:,i)));
    R1(:,i) = M(:,i)-4*S(:,i);
    R2(:,i) = M(:,i)+4*S(:,i);
end
Rmin = min(min(R1));
Rmax = max(max(R2));
clf, hold on
if d==2
    plot(X(:,1),X(:,2),'r.');
    XL = zeros(1,max(size(X)));
    for i=1:k,
        XL = XL + Plot_Std_Ellipse_FU6(M(:,i),V(:,:,i),X,XL);
    end
    xlabel('Energy');
    ylabel('Contrast');
    axis([Rmin Rmax Rmin Rmax])
end
XL= transpose(XL);
    dx = 0.005; dy = 0.005; % displacement so the text does not overlay the data points
text((X(:,1))+dx, (X(:,2))+dy,num2str(XL));
%saveas(gcf,'Barchart','jpg')
%title('');
end
