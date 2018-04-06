

function varargout = typetest(varargin)
% TYPETEST MATLAB code for typetest.fig
%      TYPETEST, by itself, creates a new TYPETEST or raises the existing
%      singleton*.
%
%      H = TYPETEST returns the handle to a new TYPETEST or the handle to
%      the existing singleton*.
%
%      TYPETEST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TYPETEST.M with the given input arguments.
%
%      TYPETEST('Property','Value',...) creates a new TYPETEST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before typetest_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to typetest_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help typetest

% Last Modified by GUIDE v2.5 06-Apr-2018 13:22:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @typetest_OpeningFcn, ...
                   'gui_OutputFcn',  @typetest_OutputFcn, ...
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


% --- Executes just before typetest is made visible.
function typetest_OpeningFcn(hObject, eventdata, handles, varargin)
global loadText;
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to typetest (see VARARGIN)

% Choose default command line output for typetest
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

rng shuffle;
i = randi(5);
switch i
    case 1 
        loadText = fileread('../res/copyPastas/apache.txt');
    case 2
        loadText = fileread('../res/copyPastas/beeMovie.txt');
    case 3
        loadText = fileread('../res/copyPastas/navySeal.txt');
    case 4
        loadText = fileread('../res/copyPastas/safetyDance.txt');
    case 5
        loadText = fileread('../res/copyPastas/tragedy.txt');
end
set(handles.story, 'string', loadText);
loadText = string(loadText).split(' ');

% UIWAIT makes typetest wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = typetest_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function interaction_Callback(hObject, eventdata, handles)
global loadText;
% hObject    handle to interaction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of interaction as text
%        str2double(get(hObject,'String')) returns contents of interaction as a double

inputText = get(handles.interaction, 'string');
inputText = string(inputText).split(' ');
numCorrect = 0;
while max(size(inputText)) > max(size(loadText))
    inputText(max(size(loadText)) + 1) = [];
end


for i=1:size(inputText)
    if inputText(i) == loadText(i)
        numCorrect = numCorrect + 1;
    end
end

set(handles.interaction, 'string', "Accuracy = " + string(round(100 * numCorrect/max(size(loadText)), 2)) + "%")
   


% --- Executes during object creation, after setting all properties.
function interaction_CreateFcn(hObject, eventdata, handles)
% hObject    handle to interaction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over interaction.
function interaction_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to interaction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
