#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * onLoad function for the modified year list box.
 *
 * Arguments:
 * 0: Year listbox control
 *
 * Return Value:
 * None
 *
 * Example:
 * _ctrlYear call gau_datechanger_fnc_yearOnLoad;
 *
 * Public: No
 */

params ["_ctrlYear"];
TRACE_1("fnc_yearOnLoad",_ctrlYear);

private _yearMin = parseNumber (missionNamespace getVariable [QGVAR(yearMin), VANILLA_MIN_YEAR]);
private _yearMax = parseNumber (missionNamespace getVariable [QGVAR(yearMax), VANILLA_MAX_YEAR]);

TRACE_2("Loaded year picker",_yearMin,_yearMax);

// Ensure ranges are valid
if (_yearMin > _yearMax) then {
    WARNING_2("Minimum year (%1) is greater than maximum year (%2), resetting min year to default.",_yearMin,_yearMax);
    _yearMin = parseNumber VANILLA_MIN_YEAR;
};
if (_yearMax < _yearMin) then {
    WARNING_2("Maximum year (%1) is less than minimum year (%2), resetting max year to default.",_yearMax,_yearMin);
    _yearMax = parseNumber VANILLA_MAX_YEAR;
};

for "_i" from _yearMin to _yearMax do {
    _ctrlYear lbSetValue [_ctrlYear lbAdd str _i, _i];
};

// Default to the middle of the range
private _yearMid = floor ((_yearMax - _yearMin) / 2);
_ctrlYear lbSetCurSel _yearMid;
nil;