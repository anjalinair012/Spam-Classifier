%extract all ham files, process them and add them to a dataset
X=ones(1,1899);
ham_files=glob('dataset\20021010_easy_ham.tar\easy_ham\*'); %please change file path
for i=1:length(ham_files),
  [dir,name,ext]=fileparts(ham_files{i});
  name=strcat(dir,'\',name,ext);
  file=readFile(name);
  word_indices=processEmail(file);
  features=emailFeatures(word_indices);
  X=[X; features];
endfor
%all ham samples will be labelled 0
y=zeros(length(ham_files));

%extract all spam files, process them and add them to a dataset
spam_files=glob('dataset\20030228_spam.tar\spam\*'); %please change file path
for i=1:length(spam_files),
  [dir,name,ext]=fileparts(spam_files{i});
  name=strcat(dir,'\',name,ext);
  file=readFile(name);
  word_indices=processEmail(file);
  features=emailFeatures(word_indices);
  X=[X; features];
endfor
%all ham samples will be labelled 0
y=[y; ones(length(spam_files))];


%extract all spam files, process them and add them to a dataset
spam_files=glob('dataset\spam_2\*'); %please change file path
for i=1:length(spam_files),
  [dir,name,ext]=fileparts(spam_files{i});
  name=strcat(dir,'\',name,ext);
  file=readFile(name);
  word_indices=processEmail(file);
  features=emailFeatures(word_indices);
  X=[X; features];
endfor
%all ham samples will be labelled 0
y=[y; ones(length(spam_files))];

%remove first line used in initialisation
X=X(2:end,:);

%save into file
save finaldata.mat X y;