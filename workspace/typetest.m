

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

% Last Modified by GUIDE v2.5 10-Apr-2018 12:27:48

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
wpmHS_Callback(handles.wpmHS, eventdata, handles)


    


% TODO: READ FILE AND SET wpmHigh AND accHigh TO TOP SCORES
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
global testRestart;
% hObject    handle to interaction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of interaction as text
%        str2double(get(hObject,'String')) returns contents of interaction as a double
inputText = get(handles.interaction, 'string');
if inputText == "(Press [ENTER] to start)"
    set(handles.interaction, 'string', "")
    tic;
    testRestart = 0;
else
    testRestart = testRestart + 1;
    if testRestart == 1
        minutesElapsed = toc / 60;
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
        WPM = string(round(numCorrect / minutesElapsed, 2));
        set(handles.results, 'string', "Accuracy = " + string(round(100 * numCorrect/max(size(loadText)), 2)) + "%" + newline + "WPM = " + WPM)
        if round(100 * numCorrect/max(size(loadText)), 2) > 30 % Only writes to files if accuracy is greater than 30%
            WPMFile = fopen('WPM.txt','a');
            fprintf(WPMFile, '%0.2f\n', WPM);
            fclose(WPMFile);
            AccFile = fopen('Accuracy.txt', 'a');
            fprintf(AccFile, '%0.2f\n', 100 * numCorrect/max(size(loadText)));
            fclose(AccFile);
            wpmHS_Callback(handles.wpmHS, eventdata, handles)
        end
    end
end


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


% --- Executes on button press in shuffle.
function shuffle_Callback(hObject, eventdata, handles)
global loadText;
% hObject    handle to shuffle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
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
set(handles.interaction, 'string', '(Press [ENTER] to start)');
set(handles.results, 'string', '');
loadText = string(loadText).split(' ');


% --- Executes on button press in wpmHS.
function wpmHS_Callback(hObject, eventdata, handles)
% hObject    handle to wpmHS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
acc = dlmread('Accuracy.txt', '\n');
wpm = dlmread('WPM.txt', '\n');
wpmSorted = flip(sort(wpm));
[~,wpmInd] = ismember(wpmSorted, wpm);
wpmAcc = [];
for i=1:5
    wpmAcc = [wpmAcc, acc(wpmInd(i))];
end
set(handles.wpmWpm, 'string', "WPM" + newline + wpmSorted(1) + newline + wpmSorted(2) + newline + wpmSorted(3) + newline + wpmSorted(4) + newline + wpmSorted(5)) 
set(handles.wpmAcc, 'string', "Acc" + newline + wpmAcc(1) + "%" + newline + wpmAcc(2) + "%" + newline + wpmAcc(3) + "%" + newline + wpmAcc(4) + "%" + newline + wpmAcc(5) + "%")

