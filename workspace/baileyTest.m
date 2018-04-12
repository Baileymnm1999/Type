function varargout = baileyTest(varargin)
% BAILEYTEST MATLAB code for baileyTest.fig
%      BAILEYTEST, by itself, creates a new BAILEYTEST or raises the existing
%      singleton*.
%
%      H = BAILEYTEST returns the handle to a new BAILEYTEST or the handle to
%      the existing singleton*.
%
%      BAILEYTEST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BAILEYTEST.M with the given input arguments.
%
%      BAILEYTEST('Property','Value',...) creates a new BAILEYTEST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before baileyTest_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to baileyTest_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help baileyTest

% Last Modified by GUIDE v2.5 05-Apr-2018 14:24:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @baileyTest_OpeningFcn, ...
                   'gui_OutputFcn',  @baileyTest_OutputFcn, ...
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


% --- Executes just before baileyTest is made visible.
function baileyTest_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to baileyTest (see VARARGIN)

% Choose default command line output for baileyTest
handles.output = hObject;
handles.slideCount = 1;
axis(handles.slide);
imshow('../res/img/1.jpg');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes baileyTest wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = baileyTest_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in nextSlideButt.
function nextSlideButt_Callback(hObject, eventdata, handles)
% hObject    handle to nextSlideButt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    axis(handles.slide);
    switch(handles.slideCount)
        case 1
            cla
            imshow('../res/img/2.png')
            handles.slideCount = 2;
        case 2
            cla
            imshow('../res/img/3.png')
            handles.slideCount = 3;
        case 3
            cla
            imshow('../res/img/4.jpg');
            handles.slideCount = 4;
        case 4
            cla
            imshow('../res/img/5.jpg');
            handles.slideCount = 5;
        case 5
            imshow('../res/img/6.jpg');
            handles.slideCount = 6;
        case 6
            imshow('../res/img/7.jpg');
            handles.slideCount = 7;
        case 7
            imshow('../res/img/8.jpg');
            handles.slideCount = 8;
        case 8
            imshow('../res/img/9.jpg');
            handles.slideCount = 9;
        case 9
            imshow('../res/img/10.jpg');
            handles.slideCount = 10;
        case 10
            imshow('../res/img/11.jpg');
            handles.slideCount = 11;
        case 11
            imshow('../res/img/11.jpg');
            handles.slideCount = 11;
    
    end
    guidata(hObject, handles);


% --- Executes on button press in previousSlideButt.
function previousSlideButt_Callback(hObject, eventdata, handles)
% hObject    handle to previousSlideButt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    axis(handles.slide);
    switch(handles.slideCount)
        case 1
            imshow('../res/img/1.jpg');
            handles.slideCount = 1;
        case 2
            imshow('../res/img/1.jpg');
            handles.slideCount = 1;
        case 3
            imshow('../res/img/2.png');
            handles.slideCount = 1;
        case 4
            imshow('../res/img/3.png');
            handles.slideCount = 2;
        case 5
            imshow('../res/img/4.jpg');
            handles.slideCount = 3;
        case 6
            imshow('../res/img/5.jpg');
            handles.slideCount = 4;
        case 7
            imshow('../res/img/6.jpg');
            handles.slideCount = 5;
        case 8
            imshow('../res/img/7.jpg');
            handles.slideCount = 7;
        case 9
            imshow('../res/img/8.jpg');
            handles.slideCount = 8;
        case 10
            imshow('../res/img/9.jpg');
            handles.slideCount = 9;
        case 11
            imshow('../res/img/10.jpg');
            handles.slideCount = 10;
    end
    guidata(hObject, handles);
