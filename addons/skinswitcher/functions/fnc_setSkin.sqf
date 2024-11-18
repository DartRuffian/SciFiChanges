#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Sets a skin onto a vehicle.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: TextureSource <STRING>
 *    - Class name defined in vehicle's TextureSources class
 *
 * Return Value:
 * None
 *
 * Example:
 * [_vehicle, "TextureSourceName"] call gau_skinswitcher_fnc_setSkin;
 *
 * Public: Yes
 */

params [
    ["_vehicle", objNull, [objNull]],
    ["_textureSource", "", [""]]
];
TRACE_2("fnc_setSkin",_vehicle,_textureSource);

if (isNull _vehicle or _textureSource isEqualTo "") exitWith {};

private _textures = getArray (configOf _vehicle >> "TextureSources" >> _textureSource >> "textures");

{
    _vehicle setObjectTextureGlobal [_forEachIndex, _x];
} forEach _textures;

private _oldSkin = _vehicle getVariable [QGVAR(skin), ""];
_vehicle setVariable [QGVAR(skin), _textureSource, true];

// Create event with static JIP id
[QGVAR(skinChanged), [_vehicle, _textureSource, _oldSkin], CREATE_EVENT_ID(_vehicle)] call CBA_fnc_globalEventJIP;
CREATE_EVENT_ID(_vehicle) call CBA_fnc_removeGlobalEventJIP; // Delete from JIP queue if vehicle is deleted

nil;