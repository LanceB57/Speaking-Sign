classdef app1 < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UI = uifigure;
        UIAxes = uiaxes;
    end
    
    properties (Access = private)
        imageObject;
        webcamObject;
        tStart;
    end
    methods (Access = private)
        
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = app1

            % Create UIFigure and components
            % createComponents(app)

            % Pass over control to main
            main(app);

            if nargout == 0
                close all;
                delete(app);
            end
        end
        
        function updateImage(app)
            app.imageObject = flip(snapshot(app.webcamObject), 1);
            imshow(app.imageObject, 'parent', app.UIAxes);
        end
        
        function main(app)
            app.webcamObject = webcam('EOS Webcam Utility');
            last = get(gcf, 'CurrentKey');
            lbl = uilabel(app.UI);
            lbl.Text = "Hello";
            app.tStart = tic;
            while last ~= 'e'
                %if toc(app.tStart) > 0.03
                    updateImage(app);
                    app.tStart = tic;
                %end
                last = get(gcf, 'CurrentKey');
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UI)
        end
    end
end