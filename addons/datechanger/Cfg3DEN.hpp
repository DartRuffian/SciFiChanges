class ctrlCombo;
class Cfg3DEN {
    class Attributes {
        class Default;
        class Title: Default {
            class Controls;
        };
        class Date: Title {
            class Controls: Controls {
                class ValueYear: ctrlCombo {
                    onLoad = QUOTE(call FUNC(yearOnLoad));
                };
            };
        };
    };
};