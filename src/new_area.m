function varargout = new_area(varargin)
% NEW_AREA MATLAB code for new_area.fig
%      NEW_AREA, by itself, creates a new NEW_AREA or raises the existing
%      singleton*.
%
%      new_area(image_id)
%
%
%      H = NEW_AREA returns the handle to a new NEW_AREA or the handle to
%      the existing singleton*.
%
%      NEW_AREA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEW_AREA.M with the given input arguments.
%
%      NEW_AREA('Property','Value',...) creates a new NEW_AREA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before new_area_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to new_area_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help new_area

% Last Modified by GUIDE v2.5 18-Oct-2018 19:38:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @new_area_OpeningFcn, ...
                   'gui_OutputFcn',  @new_area_OutputFcn, ...
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


% --- Executes just before new_area is made visible.
function new_area_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to new_area (see VARARGIN)

% Choose default command line output for new_area
% handles.output = hObject;
global is_valid;
global image_resolution;
global plot_handler;
global polygon;
global image_struct;

image_resolution = [0, 0];
image_struct = 0;
polygon = {};
plot_handler = -1;
handles.output = {};

if nargin>=4 && isnumeric(varargin{1})
	image_struct = get_image(int64(varargin{1}));
	img_matrix = imread(image_struct.red);
	img_matrix = flipud(img_matrix);
	[h, w, d] = size(img_matrix);
	
	image_resolution = [w,h];
	is_valid = true;
	image(img_matrix, 'buttonDownFcn', @new_point, ...
		'parent', handles.axes_preview);
	axis image;
	axis off;
	set(handles.axes_preview, 'ydir', 'normal');
	hold on;
else
	is_valid = false;
end



% Update handles structure
guidata(hObject, handles);

if is_valid
	uiwait(handles.window);
end


% --- Outputs from this function are returned to the command line.
function varargout = new_area_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
global is_valid
varargout{1} = handles.output;

if ~is_valid
	msgbox('No image has been passed', 'Error', 'error');
	close(hObject);
	return;
end
delete(handles.window);



% --- Executes on button press in button_ok.
function button_ok_Callback(hObject, eventdata, handles)
% hObject    handle to button_ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global polygon
global image_resolution
global image_struct
if length(polygon) < 3
	ans_continue = 'Back to window';
	ans_cancel = 'Cancel area selection';
	answer = questdlg('Selected area must consist of 3 or more vertices',...
		'Wrong input',...
		ans_continue, ans_cancel, ans_continue);
	switch answer
		case ans_continue
			return;
		case ans_cancel
			button_cancel_Callback(hObject, eventdata, handles);
			return;
		case ''
			return;
	end
end
handles.output = polyxy2lonlat(polygon, image_resolution, image_struct.bound);
guidata(hObject, handles);
clear image_resolution plot_handler polygon image_struct
close(handles.window);


% --- Executes on button press in button_cancel.
function button_cancel_Callback(hObject, eventdata, handles)
% hObject    handle to button_cancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(handles.window);
guidata(hObject,handles);
clear image_resolution plot_handler polygon image_struct


% --- Executes on button press in button_reset.
function button_reset_Callback(hObject, eventdata, handles)
% hObject    handle to button_reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global polygon;
polygon = {};
update_list(hObject, eventdata);
update_plot(hObject, eventdata);


% --- Executes on selection change in list_area.
function list_area_Callback(hObject, eventdata, handles)
% hObject    handle to list_area (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns list_area contents as cell array
%        contents{get(hObject,'Value')} returns selected item from list_area


% --- Executes during object creation, after setting all properties.
function list_area_CreateFcn(hObject, eventdata, handles)
% hObject    handle to list_area (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function window_CreateFcn(hObject, eventdata, handles)
set(handles, 'userdata', {'sdf' 'fds' 'fds'});
% hObject    handle to window (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object deletion, before destroying properties.
function window_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to window (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when user attempts to close window.
function window_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to window (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
if isequal(get(hObject, 'waitstatus'), 'waiting')
	uiresume(hObject);
else
	delete(hObject);
end

% --- Callback on image click ---
function new_point(h,e)
global polygon
handles = guidata(h);
point = get(handles.axes_preview,'currentPoint');
point = point(1,1:2);
polygon = [polygon, {point}];
update_list(h,e);
update_plot(h,e);

% --- Update list ---
function update_list(h,e)
global polygon
global image_resolution
global image_struct
handles = guidata(h);
if isempty(polygon)
	set(handles.list_area, 'string', '');
	return;
end
string = polygon2str(polyxy2lonlat(polygon, ...
	image_resolution, ...
	image_struct.bound));
set(handles.list_area, 'string', string);
guidata(h, handles);


% --- Update plot --- 
function update_plot(h,e)
global polygon
global plot_handler
handles = guidata(h);
if plot_handler ~= -1
	delete(plot_handler);
	plot_handler = -1;
end
if isempty(polygon)
	return;
end
if length(polygon) > 2
	plotpoly = [polygon, polygon(1)];
else
	plotpoly = polygon;
end
[xvec, yvec] = polygon2vectors(plotpoly);
plot_handler = plot(xvec, yvec, ...
	'parent', handles.axes_preview, ...
	'linewidth', 3, ...
	'color', [0 .6 1]);
guidata(h,handles);
