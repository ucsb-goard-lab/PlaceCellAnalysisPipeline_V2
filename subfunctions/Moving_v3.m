function [ data, floating] = Moving_v3(move_flag,data,floating)
%-------------------------------------------------------------------------%
%MOVING_V3 Removes times where the mouse is not moving from the data.
%
%   [data, floating] = MOVING_V3(move_flag, data, floating) removes
%   times where the mouse is not moving from both the behavior data and
%   the suite2p activity data. This function works with both the newer
%   and older versions of the Neurotar software.
%
%   INPUT
%   'move_flag' is a boolean flag indicating whether to remove times
%   where the mouse is not moving. If 'move_flag' is not provided or
%   empty, it defaults to 1 (true).
%   'data' is a structure containing the suite2p activity data, with
%   fields 'DFF', 'DFF_raw', 'raw_F', and 'neuropil_F'.
%   'floating' is a structure containing the behavior data, with a field
%   'moving_times' that is a logical vector indicating the times when
%   the mouse is moving.
%
%   OUTPUT
%   The function returns 'data' and 'floating' with the times where the
%   mouse is not moving removed.
%
%   Written by NSW 11/16/2022 // Based on code from WTR Sept. 2020
%-------------------------------------------------------------------------%
if nargin < 1 || isempty(move_flag)
    move_flag = 1;
end
%
% if length(data.DFF) > frames % if the data is longer than the neurotar recording
%     data.DFF = data.DFF(:,1:frames); % chop off end after neurotar was turned off
%     data.DFF_raw = data.DFF_raw(:,1:frames);
%     data.raw_F = data.raw_F(:,1:frames);
%     data.neuropil_F = data.neuropil_F(:,1:frames);
% end

if move_flag
    not_moving_time = ~floating.moving_times;

    % remove not moving time from activity data
    data.DFF(:, not_moving_time) = [];
    data.DFF_raw(:, not_moving_time) = [];
    data.spikes(:, not_moving_time) = [];
    data.raw_F(:, not_moving_time) = [];
    data.neuropil_F(:, not_moving_time) = [];
end