contents = dir('*.jpg') ;% or whatever the filename extension is
for i = 1:numel(contents)
  filename = contents(i).name;
  % Open the file specified in filename, do your processing...
  [path ,file] = fileparts(filename);
  file = strcat(file,'.jpg');
  [img,rotate] = FU1(file);
%FU2
[ca] = FU2(img);

%FU3
[X] = FU3(ca);
X(isnan(X)) = 0 ;

%FU4
[W,M,V,L] = EM_GM_FU4(X,2,[],10,1,[]);

%FU5
XLabels = Plot_GM_FU5(X,2,W,M,V);
file = strcat('em_',file);
saveas(gcf,file)
end