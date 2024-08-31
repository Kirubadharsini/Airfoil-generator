function varargout = Airfoil_gen_GUI(varargin)
% AIRFOIL_GEN_GUI MATLAB code for Airfoil_gen_GUI.fig
%      AIRFOIL_GEN_GUI, by itself, creates a new AIRFOIL_GEN_GUI or raises the existing
%      singleton*.
%
%      H = AIRFOIL_GEN_GUI returns the handle to a new AIRFOIL_GEN_GUI or the handle to
%      the existing singleton*.
%
%      AIRFOIL_GEN_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AIRFOIL_GEN_GUI.M with the given input arguments.
%
%      AIRFOIL_GEN_GUI('Property','Value',...) creates a new AIRFOIL_GEN_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Airfoil_gen_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Airfoil_gen_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Airfoil_gen_GUI

% Last Modified by GUIDE v2.5 12-Mar-2023 11:49:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Airfoil_gen_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Airfoil_gen_GUI_OutputFcn, ...
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


% --- Executes just before Airfoil_gen_GUI is made visible.
function Airfoil_gen_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Airfoil_gen_GUI (see VARARGIN)

% Choose default command line output for Airfoil_gen_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Airfoil_gen_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Airfoil_gen_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function naca_box_Callback(hObject, eventdata, handles)
% hObject    handle to naca_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of naca_box as text
%        str2double(get(hObject,'String')) returns contents of naca_box as a double


% --- Executes during object creation, after setting all properties.
function naca_box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to naca_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function n_box_Callback(hObject, eventdata, handles)
% hObject    handle to n_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n_box as text
%        str2double(get(hObject,'String')) returns contents of n_box as a double


% --- Executes during object creation, after setting all properties.
function n_box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in color_box.
function color_box_Callback(hObject, eventdata, handles)
% hObject    handle to color_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns color_box contents as cell array
%        contents{get(hObject,'Value')} returns selected item from color_box


% --- Executes during object creation, after setting all properties.
function color_box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to color_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in generate_box.
function generate_box_Callback(hObject, eventdata, handles)
% hObject    handle to generate_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% This program generates the NACA 
% 4-Digit series airfoils

naca = get(handles.naca_box,'String');
M = str2double(naca(1)); % first digit
P = str2double(naca(2)); % second digit
T = str2double(naca(3:4)); % last two digits
n = str2num(get(handles.n_box,'String'));

% M = 0; % first digit
% P = 0; % second digit
% T = 12; % last two digit

c = 1; % chord length

m = M*c/100; % maximum camber
p = P*c/10; % Location of maximum camber
t = T*c/100; % maximum thickness

for i = 1:n
    theta = (i-1)*2*pi/n;
    % Eq. A
    x = 0.5*c*(1+cos(theta));
    if (x<p)
        %Eq. 1
        yc(i) = (m/p^2)*(2*p*x-x^2);
    else 
        yc(i) = (m/(1-p)^2)*((1-2*p)+2*p*x-x^2);
    end
    %Eq. 3
    yt = 5*t*(0.2969*sqrt(x) ...
         -0.1260*x ...
         -0.3516*x^2 ...
         +0.2843*x^3 ...
         -0.1015*x^4);
    if i<(n/2+1)
        % upper surface (Eq.4 and 5)
        xa(i) = x;
        ya(i) = yc(i)+yt;
    else 
         xa(i) = x;
         ya(i) = yc(i)-yt;
    end
    %Trailing edge
    xa(n+1) = c;
    ya(n+1) = 0;
    yc(n+1) = 0;
    
end

str = get(handles.color_box,'String');
val = get(handles.color_box,'Value');
axes(handles.axes_box)
plot(xa,ya,'-k','LineWidth',2)
axis([-0.1 1.1 -0.5 0.6])
grid on

switch str{val};
    case 'red'
        fill(xa,ya,'r')
        axis([-0.1 1.1 -0.5 0.6])
        grid on
        hold on
        plot(xa,ya,'-k','LineWidth',2)
        plot(xa,yc,'-.y','LineWidth',1)
        plot(xa,ya*0,'-w','LineWidth',1)
        hold off 
    case 'green'
        fill(xa,ya,'g')
        axis([-0.1 1.1 -0.5 0.6])
        grid on
        hold on
        plot(xa,ya,'-k','LineWidth',2)
        plot(xa,yc,'-.r','LineWidth',1)
        plot(xa,ya*0,'-b','LineWidth',1)
        hold off
    case 'blue'
        fill(xa,ya,'b')
        axis([-0.1 1.1 -0.5 0.6])
        grid on
        hold on
        plot(xa,ya,'-k','LineWidth',2)
        plot(xa,yc,'-.r','LineWidth',1)
        plot(xa,ya*0,'-w','LineWidth',1)
        hold off
    case 'black'
        fill(xa,ya,'k')
        axis([-0.1 1.1 -0.5 0.6])
        grid on
        hold on
        plot(xa,ya,'-g','LineWidth',2)
        plot(xa,yc,'-.y','LineWidth',1)
        plot(xa,ya*0,'-w','LineWidth',1)
        hold off
    case 'yellow'
        fill(xa,ya,'y')
        axis([-0.1 1.1 -0.5 0.6])
        grid on
        hold on
        plot(xa,ya,'-k','LineWidth',2)
        plot(xa,yc,'-.r','LineWidth',1)
        plot(xa,ya*0,'-b','LineWidth',1)
        hold off
    case 'cyan'
        fill(xa,ya,'c')
        axis([-0.1 1.1 -0.5 0.6])
        grid on
        hold on
        plot(xa,ya,'-k','LineWidth',2)
        plot(xa,yc,'-.r','LineWidth',1)
        plot(xa,ya*0,'-b','LineWidth',1)
        hold off
    case 'meganta'
        fill(xa,ya,'m')
        axis([-0.1 1.1 -0.5 0.6])
        grid on
        hold on
        plot(xa,ya,'-k','LineWidth',2)
        plot(xa,yc,'-.b','LineWidth',1)
        plot(xa,ya*0,'-w','LineWidth',1)
        hold off
end


% fill(x,ya,[0.9290 0.6940 0.1250])