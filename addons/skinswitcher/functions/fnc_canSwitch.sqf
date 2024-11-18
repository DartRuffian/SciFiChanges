#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Determines whether a player can switch their vehicle's skin.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * True if player can switch vehicle's skin, otherwise false <BOOL>
 *
 * Example:
 * [_vehicle, player] call gau_skinswitcher_fnc_canSwitch;
 *
 * Public: No
 */

params ["_vehicle", "_player"];
TRACE_2("fnc_canSwitch",_vehicle,_player);

if (!GVAR(enabled)) exitWith { false };

// currentPilot on statics returns objNull
private _isPilot = _player isEqualTo currentPilot _vehicle or {_vehicle isKindOf "StaticWeapon"};

_isPilot and {alive _vehicle} and
{_vehicle getVariable [QGVAR(canSwitchSkin), true]} and
{_player getVariable [QGVAR(canSwitchSkin), true]} and {IS_STOPPED(_vehicle)} and {
    private _textureSources = getArray (configOf _vehicle >> "textureList");
    count _textureSources > 1
};