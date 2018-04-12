

function varargout = interact(varargin)
% INTERACT MATLAB code for interact.fig
%      INTERACT, by itself, creates a new INTERACT or raises the existing
%      singleton*.
%
%      H = INTERACT returns the handle to a new INTERACT or the handle to
%      the existing singleton*.
%
%      INTERACT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERACT.M with the given input arguments.
%
%      INTERACT('Property','Value',...) creates a new INTERACT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interact_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interact_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interact

% Last Modified by GUIDE v2.5 12-Apr-2018 13:22:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interact_OpeningFcn, ...
                   'gui_OutputFcn',  @interact_OutputFcn, ...
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


% --- Executes just before interact is made visible.
function interact_OpeningFcn(hObject, eventdata, handles, varargin)
global loadText;
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interact (see VARARGIN)

% Choose default command line output for interact
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

axes(handles.handsimg);
imshow('../res/img/hands.png');



loadText = fileread('../res/copyPastas/guide.txt');

set(handles.story, 'string', loadText);
%loadText = string(loadText).split(' ');
% Below is to display the top five WPM and Acc
accuracy = fileread('Accuracy.txt');
wpm = fileread('WPM.txt');
% TODO: READ FILE AND SET wpmHigh AND accHigh TO TOP SCORES
% UIWAIT makes interact wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interact_OutputFcn(hObject, eventdata, handles) 
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
elseif length(get(handles.interaction, 'string')) == length(convertStringsToChars(loadText))
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
        end
    end
else
    newText = get(handles.interaction, 'string');
    for i = 1:length(newText)
        if newText(i) ~= loadText(i) && i > 1
            set(handles.interaction, 'string', newText(1:i-1));
            uicontrol(handles.handsimg);
            break;
        elseif newText(i) ~= loadText(i) && ~(i > 1)
            set(handles.interaction, 'string', '');
        end
    end
    if length(newText) < length(loadText)
        lowerText = lower(loadText);
        myChar = lowerText(length(newText)+1);
        x = randi(5)-1;
        switch x
            case 0
                file = '../res/img/sad_troll.png';
            case 1
                file = '../res/img/alone.png';
            case 2
                file = '../res/img/no.png';
            case 3
                file = '../res/img/me_gusta.png';
            case 4
                file = '../res/img/Troll_face.png';
        end
        if myChar == 'q' || myChar == 'a' || myChar == 'z' || myChar == '1' || myChar == '!'
            axes(handles.axes2);
            imshow(file);
            pause(1);
            cla(handles.axes2);
        elseif myChar == 'w' || myChar == 's' || myChar == 'x' || myChar == '2' || myChar == '@'
            axes(handles.axes3);
            imshow(file);
            pause(1);
            cla(handles.axes3);
        elseif myChar == 'e' || myChar == 'd' || myChar == 'c' || myChar == '3' || myChar == '#'
            axes(handles.axes4);
            imshow(file);
            pause(1);
            cla(handles.axes4);
        elseif myChar == 'r' || myChar == 'f' || myChar == 'v' || myChar == '4' || myChar == '$' || myChar == 't' || myChar == 'g' || myChar == 'b' || myChar == '5' || myChar == '%'
            axes(handles.axes5);
            imshow(file);
            pause(1);
            cla(handles.axes5);
        elseif myChar == 'y' || myChar == 'h' || myChar == 'n' || myChar == '6' || myChar == '^' || myChar == 'u' || myChar == 'j' || myChar == 'm' || myChar == '7' || myChar == '&'
            axes(handles.axes8);
            imshow(file);
            pause(1);
            cla(handles.axes8);
        elseif myChar == ' '
            axes(handles.axes7);
            imshow(file);
            axes(handles.axes6);
            imshow(file);
            pause(1);
            cla(handles.axes7);
            cla(handles.axes6);
        elseif myChar == 'i' || myChar == 'k' || myChar == ',' || myChar == '8' || myChar == '*'
            axes(handles.axes9);
            imshow(file);
            pause(1);
            cla(handles.axes9);
        elseif myChar == 'o' || myChar == 'l' || myChar == '.' || myChar == '9' || myChar == '('
            axes(handles.axes10);
            imshow(file);
            pause(1);
            cla(handles.axes10);
        elseif myChar == 'p' || myChar == ';' || myChar == '?' || myChar == '0' || myChar == ')'
            axes(handles.axes11);
            imshow(file);
            pause(1);
            cla(handles.axes11);
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


% --- Executes on button press in accHS.
function accHS_Callback(hObject, eventdata, handles)
% hObject    handle to accHS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
