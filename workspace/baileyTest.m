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

% Last Modified by GUIDE v2.5 05-Apr-2018 12:24:39

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
