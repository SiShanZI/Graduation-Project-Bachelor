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

% Last Modified by GUIDE v2.5 17-May-2015 13:48:38

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
global BGM;
global BGMflag1;
global BGMflag2;
BGMflag1=1;
BGMflag2=1;
HH=axes('units','normalized','position',[0 0 1 1]);     %����Ӧ����������������
uistack(HH,'up');
image(imread('����.jpg'));
colormap gray;
set(HH,'handlevisibility','off','visible','off');       %�ؼ�����
set(handles.pushbutton1,'cdata',imread('����.jpg'));
set(handles.pushbutton2,'cdata',imread('����.jpg'));
set(handles.pushbutton3,'cdata',imread('����.jpg'));
set(handles.pushbutton4,'cdata',imread('����.jpg'));


% --- Outputs from this function are returned to the command line.
function varargout = App_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%���ж�����ж�ָ��ڡ�Property Inspector�������ã�
global BGM;
global BGMflag1;
global BGMflag2;
load handel;        %����ǰ�棬����û���������ǣ�
clc;
if(BGMflag1==1)
    BGMflag1=0;
    while(~BGMflag1)%���ֱ�Ǹ���ţ�
        switch BGMflag2
            case 01
                BGMflag2=2;         %�ټ�һ������������eval()���������ʵ��ѡ����Ҫ�Ĳ���ģʽ�ˣ�eval()��һ���ǳ�����ĺ�����
                [Bgm,Fs]=wavread('һ�����-��ʱ����.wav');
                BGM=audioplayer(Bgm,Fs);
                play(BGM);
                pause(130);
            case 02
                BGMflag2=3;
                [Bgm,Fs]=wavread('��ѩ��-��ʱ����.wav');
                BGM=audioplayer(Bgm,Fs);
                play(BGM);
                pause(188);
            case 03
                BGMflag2=4;
                [Bgm,Fs]=wavread('��ˮ����-��ʱ����.wav');
                BGM=audioplayer(Bgm,Fs);
                play(BGM);
                pause(75);
            otherwise
                BGMflag2=1;
                [Bgm,Fs]=wavread('��������-��ʱ����.wav');
                BGM=audioplayer(Bgm,Fs);
                play(BGM);
                pause(87);
        end
    end
else
    BGMflag1=1;
    stop(BGM);
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global BGM;
clc;
close(App);
stop(BGM);                              



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;Np=42;
[Sel,Oo]=listdlg('liststring',{'1.Optimal','2.Original'},'listsize',[180 80],'OkString','Yes','CancelString','Cancel','promptstring','Scheme','name','����ѡ��','selectionmode','single');
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
            ing=pwd;                                  %���浱ǰ·����������󻻻�
            cd(PathName);                             %����ǰ·���޸�Ϊ�洢·��
            imwrite(Disp,FileName);
            cd(ing);
        end
    end
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;Np=42;
[Sel,Oo]=listdlg('liststring',{'1.Optimal','2.Original'},'listsize',[180 80],'OkString','Yes','CancelString','Cancel','promptstring','Scheme','name','����ѡ��','selectionmode','single');
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
%������Ϣʱ��Ҫ��ȡ����
%�����������㹻�죬��ô�������־�û��ʲô�����ˣ�

