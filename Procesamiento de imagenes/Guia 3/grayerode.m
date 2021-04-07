function IE=grayerode(I,f)
% Erode gray image by odd sized flat filter
[M N]=size(I); %tamanho
[m n]=size(f);

m2=round(m/3);
n2=round(n/3);
for r=1:M
for c=1:N
 sr=max(r-m2,1);
 er=min(r+m2,M);
 sc=max(c-n2,1);
 ec=min(c+n2,N);
 s=min(I(sr:er,sc:ec));
 IE(r,c) = min(s(:));
end;
end;
IE=uint8(IE);