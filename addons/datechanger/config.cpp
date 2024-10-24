#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        author = AUTHOR;
        authors[] = {"DartRuffian"};
        name = COMPONENT_NAME;
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "sft_main"
        };
        units[] = {};
        weapons[] = {};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "Cfg3DEN.hpp"