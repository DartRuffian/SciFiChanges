[
    QGVAR(yearMin), "EDITBOX",
    [LSTRING(yearMin_name), LSTRING(yearMin_tooltip)],
    _category, VANILLA_MIN_YEAR, true
] call CBA_fnc_addSetting;

[
    QGVAR(yearMax), "EDITBOX",
    [LSTRING(yearMax_name), LSTRING(yearMax_tooltip)],
    _category, VANILLA_MAX_YEAR, true
] call CBA_fnc_addSetting;