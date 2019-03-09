# homeassitant-fibaro-event
Example of how a scene activation in Fibaro HC2 can fire an event in Homeassistant

1. Create LUA scene in Fibaro HC2 using the template ha_scene_activation.lua
2. Enter your own values for ha_ip, ha_port and ha_token
3. Enter the deviceID for each device in HC2 you want to act on
4. Create an automation in Homeassitant to trigger on custom event
5. Reload automations or restart Homeassistant
6. Done
