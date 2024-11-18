#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Creates child actions for available skins.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * Array of ACE Actions <ARRAY>
 *
 * Example:
 * [_vehicle, player] call gau_skinswitcher_fnc_canSwitch;
 *
 * Public: No
 */

params ["_vehicle", "_player"];
TRACE_2("fnc_insertChildren",_vehicle,_player);

private _actions = [];
private _textureSources = configProperties [configOf _vehicle >> "TextureSources"];

{
    private _displayName = getText (_x >> "displayName");
    private _textureSource = configName _x;

    private _action = [
        format [QGVAR(switchSkin_%1), _textureSource],
        _displayName, "", {
            params ["_target", "", "_textureSource"];
            [_target, _textureSource] call FUNC(setSkin);
        }, {true}, {}, _textureSource
    ] call ace_interact_menu_fnc_createAction;

    _actions pushBack [_action, [], _target]
} forEach _textureSources;

_actions;