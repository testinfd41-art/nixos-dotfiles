//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/ 
        {"",       "audio",                       1,                       10},
        {"󰃠",      "brightness",                 1,                      0},
        {"",       "internet",                   5,                       4},
        {"",       "battery",                       1,                  0},
        {"󰃰 ", "TZ=Asia/Kolkata date '+%b %d - %I:%M%p'",      60,      1},
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
