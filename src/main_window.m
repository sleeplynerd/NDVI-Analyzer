function varargout = main_window(varargin)
%MAIN_WINDOW M-file for main_window.fig
%      MAIN_WINDOW, by itself, creates a new MAIN_WINDOW or raises the existing
%      singleton*.
%
%      H = MAIN_WINDOW returns the handle to a new MAIN_WINDOW or the handle to
%      the existing singleton*.
%
%      MAIN_WINDOW('Property','Value',...) creates a new MAIN_WINDOW using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to main_window_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      MAIN_WINDOW('CALLBACK') and MAIN_WINDOW('CALLBACK',hObject,...) call the
%      local function named CALLBACK in MAIN_WINDOW.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main_window

% Last Modified by GUIDE v2.5 16-Oct-2018 14:41:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_window_OpeningFcn, ...
                   'gui_OutputFcn',  @main_window_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before main_window is made visible.
function main_window_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for main_window
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main_window wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_window_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function window_CreateFcn(hObject, eventdata, handles)
% hObject    handle to window (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on selection change in list_images.
function list_images_Callback(hObject, eventdata, handles)
% hObject    handle to list_images (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns list_images contents as cell array
%        contents{get(hObject,'Value')} returns selected item from list_images


% --- Executes during object creation, after setting all properties.
function list_images_CreateFcn(hObject, eventdata, handles)
% hObject    handle to list_images (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in button_images_plus.
function button_images_plus_Callback(hObject, eventdata, handles)
% hObject    handle to button_images_plus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in button_images_minus.
function button_images_minus_Callback(hObject, eventdata, handles)
% hObject    handle to button_images_minus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in button_images_up.
function button_images_up_Callback(hObject, eventdata, handles)
% hObject    handle to button_images_up (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in button_images_down.
function button_images_down_Callback(hObject, eventdata, handles)
% hObject    handle to button_images_down (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in list_ignored_areas.
function list_ignored_areas_Callback(hObject, eventdata, handles)
% hObject    handle to list_ignored_areas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns list_ignored_areas contents as cell array
%        contents{get(hObject,'Value')} returns selected item from list_ignored_areas


% --- Executes during object creation, after setting all properties.
function list_ignored_areas_CreateFcn(hObject, eventdata, handles)
% hObject    handle to list_ignored_areas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in button_ignored_areas_plus.
function button_ignored_areas_plus_Callback(hObject, eventdata, handles)
% hObject    handle to button_ignored_areas_plus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in button_ignored_areas_minus.
function button_ignored_areas_minus_Callback(hObject, eventdata, handles)
% hObject    handle to button_ignored_areas_minus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in list_analyzed_areas.
function list_analyzed_areas_Callback(hObject, eventdata, handles)
% hObject    handle to list_analyzed_areas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns list_analyzed_areas contents as cell array
%        contents{get(hObject,'Value')} returns selected item from list_analyzed_areas


% --- Executes during object creation, after setting all properties.
function list_analyzed_areas_CreateFcn(hObject, eventdata, handles)
% hObject    handle to list_analyzed_areas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in button_analyzed_areas_plus.
function button_analyzed_areas_plus_Callback(hObject, eventdata, handles)
% hObject    handle to button_analyzed_areas_plus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in button_analyzed_areas_minus.
function button_analyzed_areas_minus_Callback(hObject, eventdata, handles)
% hObject    handle to button_analyzed_areas_minus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menu_file_Callback(hObject, eventdata, handles)
% hObject    handle to menu_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menu_Analyze_Callback(hObject, eventdata, handles)
% hObject    handle to menu_Analyze (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menu_analyze_graph_Callback(hObject, eventdata, handles)
% hObject    handle to menu_analyze_graph (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menu_analyze_ndvi_vizualization_Callback(hObject, eventdata, handles)
% hObject    handle to menu_analyze_ndvi_vizualization (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
visualization_parameters();


% --------------------------------------------------------------------
function menu_file_quit_Callback(hObject, eventdata, handles)
% hObject    handle to menu_file_quit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(handles.window);
