--[[
%% properties
291 sceneActivation
165 sceneActivation
%% events
%% globals
--]]

-- Send sceneActivation to Homeassistant Event
-- By astrandb, 2019

local ha_host='192.168.0.18';
local ha_port='8123';
local ha_token='** Get a longlife token from homeassistant and place it here';

local http = net.HTTPClient();
local requestHeaders = {
        ["Content-Type"] = "application/json",
        ["Authorization"] = "Bearer " .. ha_token
      };

local trigger = fibaro:getSourceTrigger();
local deviceID = 0;
local globalName = '';
local sceneActivation = 0;

if (trigger['type'] == 'property') then
  deviceID = trigger['deviceID'];
  sceneActivation = tonumber(fibaro:getValue(deviceID, "sceneActivation"));
  fibaro:debug('Source device = ' .. deviceID .. '/ sceneActivation = ' .. sceneActivation);
elseif (trigger['type'] == 'global') then
  globalName = trigger['name'];
  fibaro:debug('Source global variable = ' .. globalName);
elseif (trigger['type'] == 'other') then
  fibaro:debug('Other source');
end

requestData = {scene_activation = sceneActivation, device_id = deviceID};
local requestBody = json.encode(requestData);
local url = 'http:' .. ha_host .. ':' .. ha_port .. '/api/events/fibaro_sceneactivation';
http:request(url,
               { options= {headers = requestHeaders,
                           data = requestBody,
                           method = 'POST',
                           timeout = 5000
                          },
                 success = function(resp)
                             if resp.status == 200 then
                               fibaro:debug(resp.status)
                             else
                               fibaro:debug(resp.status)
                             end
                           end
              })
