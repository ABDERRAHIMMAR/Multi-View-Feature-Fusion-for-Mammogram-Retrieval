    function filenames = getFilenames(rootDir, format)
        % Get filenames with specified `format` in given `foler` 
        %
        % Parameters
        % ----------
        % - rootDir: char vector
        %   Target folder
        % - format: char vector = 'mat'
        %   File foramt

        % default values
        if ~exist('format', 'var')
            format = 'dcm';
        end

        format = ['*.', format];
        filenames = dir(fullfile(rootDir, format));
        filenames = arrayfun(...
            @(x) fullfile(x.folder, x.name), ...
            filenames, ...
            'UniformOutput', false ...
        );
    end