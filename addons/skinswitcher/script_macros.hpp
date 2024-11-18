#define CREATE_EVENT_ID(var1) (format [QGVAR(switchSkin_%1), hashValue var1])

#define SKIN_SWITCHER \
    class GVAR(switchSkin) { \
        displayName = CSTRING(switchSkin); \
        condition = QUOTE(call FUNC(canSwitch)); \
        insertChildren = QUOTE(call FUNC(insertChildren)); \
    }
