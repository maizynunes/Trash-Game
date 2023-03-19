classdef app1copy < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure    matlab.ui.Figure
        redcupT     matlab.ui.control.Button
        utensilsT   matlab.ui.control.Button
        hotdogC     matlab.ui.control.Button
        flowersC    matlab.ui.control.Button
        teabagC     matlab.ui.control.Button
        metalcanR   matlab.ui.control.Button
        cardboardR  matlab.ui.control.Button
        chipsT      matlab.ui.control.Button
        background  matlab.ui.control.Image
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Key press function: UIFigure
        function UIFigureKeyPress(app, event)
          key = event.Key;
                if strcmp(key,'leftarrow')
                    app.utensilsT.Position(1) = app.utensilsT.Position(1) -10
                end
                if strcmp(key,'rightarrow')
                    app.utensilsT.Position(1) = app.utensilsT.Position(1) +10
                end
                if strcmp(key,'uparrow')
                    app.utensilsT.Position(2) = app.utensilsT.Position(2) +10
                end
                if strcmp(key,'downarrow')
                    app.utensilsT.Position(2) = app.utensilsT.Position(2) -10
                end
            end
    end
        % Button pushed function: utensilsT

    function utensilsTButtonPushed(app, event)
            key = event.Key;
            last_button = 0;
            if  app.redcupT.Value == 1;
                last_button = app.redcupT;
            end
            if  app.utensilsT.Value == 1;
                last_button = app.utensilsT;
            end
            if  app.hotdogC.Value == 1;
                last_button = app.hotdogC;
            end
            if  app.flowersC.Value == 1;
                last_button = app.flowersC;
            end
            if  app.teabagC.Value == 1;
                last_button = app.teabagC;
            end
            if  app.metalcanR.Value == 1;
                last_button = app.metalcanR;
            end
            if  app.cardboardR.Value == 1;
                last_button = app.cardboardR;
            end
            if  app.chipsT.Value == 1;
                last_button = app.chipsT;
            end
                if strcmp(key,'leftarrow')
                    app.last_button.Position(1) = app.last_button.Position(1) -10
                end
                if strcmp(key,'rightarrow')
                    app.last_button.Position(1) = app.last_button.Position(1) +10
                end
                if strcmp(key,'uparrow')
                    app.last_button.Position(2) = app.last_button.Position(2) +10
                end
                if strcmp(key,'downarrow')
                    app.last_button.Position(2) = app.last_button.Position(2) -10
                end
end


    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Get the file path for locating images
            pathToMLAPP = fileparts(mfilename('fullpath'));

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';
            app.UIFigure.KeyPressFcn = createCallbackFcn(app, @UIFigureKeyPress, true);

            % Create background
            app.background = uiimage(app.UIFigure);
            app.background.Position = [15 6 612 470];
            app.background.ImageSource = fullfile(pathToMLAPP, 'LabelledTrashcan.png');

            % Create chipsT
            app.chipsT = uibutton(app.UIFigure, 'push');
            app.chipsT.Icon = fullfile(pathToMLAPP, 'lays chips.png');
            app.chipsT.Position = [355 308 58 69];
            app.chipsT.Text = '';

            % Create cardboardR
            app.cardboardR = uibutton(app.UIFigure, 'push');
            app.cardboardR.Icon = fullfile(pathToMLAPP, 'cardboard.png');
            app.cardboardR.Position = [351 395 68 68];
            app.cardboardR.Text = '';

            % Create metalcanR
            app.metalcanR = uibutton(app.UIFigure, 'push');
            app.metalcanR.Icon = fullfile(pathToMLAPP, 'metal can.png');
            app.metalcanR.Position = [297 269 50 63];
            app.metalcanR.Text = '';

            % Create teabagC
            app.teabagC = uibutton(app.UIFigure, 'push');
            app.teabagC.Icon = fullfile(pathToMLAPP, 'tea bag.png');
            app.teabagC.Position = [218 323 63 54];
            app.teabagC.Text = '';

            % Create flowersC
            app.flowersC = uibutton(app.UIFigure, 'push');
            app.flowersC.Icon = fullfile(pathToMLAPP, 'dead flowers.png');
            app.flowersC.Position = [257 388 51 76];
            app.flowersC.Text = '';

            % Create hotdogC
            app.hotdogC = uibutton(app.UIFigure, 'push');
            app.hotdogC.Icon = fullfile(pathToMLAPP, 'hotdog.png');
            app.hotdogC.Position = [157 285 52 56];
            app.hotdogC.Text = '';

            % Create utensilsT
            app.utensilsT = uibutton(app.UIFigure, 'push');
            app.utensilsT.ButtonPushedFcn = createCallbackFcn(app, @utensilsTButtonPushed, true);
            app.utensilsT.Icon = fullfile(pathToMLAPP, 'Utensils.png');
            app.utensilsT.Position = [166 401 52 62];
            app.utensilsT.Text = '';

            % Create redcupT
            app.redcupT = uibutton(app.UIFigure, 'push');
            app.redcupT.Icon = fullfile(pathToMLAPP, 'plastic_cup.png');
            app.redcupT.Position = [429 331 59 76];
            app.redcupT.Text = '';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = app1

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end