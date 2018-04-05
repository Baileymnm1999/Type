function varargout = spencerTest(varargin)
% SPENCERTEST MATLAB code for spencerTest.fig
%      SPENCERTEST, by itself, creates a new SPENCERTEST or raises the existing
%      singleton*.
%
%      H = SPENCERTEST returns the handle to a new SPENCERTEST or the handle to
%      the existing singleton*.
%
%      SPENCERTEST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SPENCERTEST.M with the given input arguments.
%
%      SPENCERTEST('Property','Value',...) creates a new SPENCERTEST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before spencerTest_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to spencerTest_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help spencerTest

% Last Modified by GUIDE v2.5 05-Apr-2018 12:25:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @spencerTest_OpeningFcn, ...
                   'gui_OutputFcn',  @spencerTest_OutputFcn, ...
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


% --- Executes just before spencerTest is made visible.
function spencerTest_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to spencerTest (see VARARGIN)

% Choose default command line output for spencerTest
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes spencerTest wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = spencerTest_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;