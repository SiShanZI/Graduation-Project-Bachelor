function varargout = App(varargin)
% APP MATLAB code for App.fig
%      APP, by itself, creates a new APP or raises the existing
%      singleton*.
%
%      H = APP returns the handle to a new APP or the handle to
%      the existing singleton*.
%
%      APP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APP.M with the given input arguments.
%
%      APP('Property','Value',...) creates a new APP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before App_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to App_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help App

% Last Modified by GUIDE v2.5 24-Oct-2015 16:13:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @App_OpeningFcn, ...
                   'gui_OutputFcn',  @App_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before App is made visible.
function App_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to App (see VARARGIN)

% Choose default command line output for App
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes App wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global Np;
global BGM;
global BGMflag1;
global BGMflag2;
Np=42;
BGM=[];
BGMflag1=1;
BGMflag2=1;
Background=axes('units','normalized','position',[0 0 1 1]);
uistack(Background,'up');
image(imread('����.jpg'));
colormap gray;
set(Background,'handlevisibility','off','visible','off');
%����Ӧ����������������


% --- Outputs from this function are returned to the command line.
function varargout = App_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);
global BGM;
global BGMflag1;
if(BGMflag1==0)
BGMflag1=1;
stop(BGM);
end


% --------------------------------------------------------------------
function Menu_1_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global BGM;
global BGMflag1;
global BGMflag2;
load handel;        %����ǰ�棬����û���������ǣ�
clc;
if(BGMflag1==1)
BGMflag1=0;
while(~BGMflag1)    %���ֱ�Ǹ���ţ�
switch BGMflag2
case 01
BGMflag2=2;         %�ټ�һ������������eval()���������ʵ��ѡ����Ҫ�Ĳ���ģʽ�ˣ�eval()��һ���ǳ�����ĺ�����
[Bgm,Fs]=audioread('һ�����-��ʱ����.wav');
case 02
BGMflag2=3;
[Bgm,Fs]=audioread('��ѩ��-��ʱ����.wav');
case 03
BGMflag2=4;
[Bgm,Fs]=audioread('��ˮ����-��ʱ����.wav');
otherwise
BGMflag2=1;
[Bgm,Fs]=audioread('��������-��ʱ����.wav');
end
BGM=audioplayer(Bgm,Fs);
playblocking(BGM);
end
else
BGMflag1=1;
stop(BGM);
end


% --------------------------------------------------------------------
function Menu_2_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Menu_2_1_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_2_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Np;
clc;
[Sel,Oo]=listdlg('liststring',{'1.����Կ����','2.����Կ����'},'listsize',[150 150],'OkString','Yes','CancelString','Cc','promptstring','Scheme','name','����ѡ��','selectionmode','single');
if(Oo==1)
[FileName,PathName,FileIndex]=uigetfile({'*.bmp';'*.png';'*.gif'},'���Cover?','*.png');
if(FileIndex~=0)
FileAddress=strcat(PathName,FileName);        
image=im2bw(rgb2gray(imread(FileAddress)));   %�Ӷ�ά������õ���QR��ͼ��һ����rgbͼ��
switch Sel
case 01
[Disp,Loss]=Optimize_En(image,Np,Sel);
otherwise
[Disp,Loss]=Original_En(image,Np,Sel);
end
Msg=sprintf('ʧ���ʣ�%.2f',Loss*100);
Msg=strcat(Msg,'%');
Oo=msgbox(Msg,'���!','on');      
waitfor(Oo);
Disp=Disp.*255;                               %��ֵת�Ҷ�
Disp=Gr_rgb(Disp);                            %�Ҷ�ת��RGB��
[FileName,PathName,FileIndex]=uiputfile({'*.bmp';'*.png';'*.gif'},'Save as','*.png');
if(FileIndex~=0)
ing=pwd;                                      %���浱ǰ·����������󻻻�
cd(PathName);                                 %����ǰ·���޸�Ϊ�洢·��
imwrite(Disp,FileName);
cd(ing);
end
end
end
clc;


% --------------------------------------------------------------------
function Menu_2_2_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_2_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Np;
clc;
[Sel,Oo]=listdlg('liststring',{'1.����Կ����','2.����Կ����'},'listsize',[150 150],'OkString','Yes','CancelString','Cc','promptstring','Scheme','name','����ѡ��','selectionmode','single');
if(Oo==1)
[FileName,PathName,FileIndex]=uigetfile({'*.bmp';'*.png';'*.gif'},'������Ҫ��˭?','*.png');
if(FileIndex~=0)
FileAddress=strcat(PathName,FileName);
image=im2bw(rgb2gray(imread(FileAddress)));
switch Sel
case 01
Message=Optimize_De(image,Np);
otherwise
Message=Original_De(image,Np);
end
Oo=msgbox(Message,'������','on');
waitfor(Oo);
end
end
clc;
%������Ϣʱ��Ҫ��ȡ����
%�����������㹻�죬��ô�������־�û��ʲô�����ˣ�
