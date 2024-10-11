[
    QGVAR(yearMin), "EDITBOX",
    ["Minimum Year", "Minimum year to show in the date picker. See Attributes > Environment (Ctrl+I) in the Eden Editor."],
    _category, VANILLA_MIN_YEAR, true
] call CBA_fnc_addSetting;

[
    QGVAR(yearMax), "EDITBOX",
    ["Maximum Year", "Maximum year to show in the date picker. See Attributes > Environment (Ctrl+I) in the Eden Editor."],
    _category, VANILLA_MAX_YEAR, true
] call CBA_fnc_addSetting;