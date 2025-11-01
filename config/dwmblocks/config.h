#ifndef CONFIG_H
#define CONFIG_H

// String used to delimit block outputs in the status.
#define DELIMITER "  "

// Maximum number of Unicode characters that a block can output.
#define MAX_BLOCK_OUTPUT_LENGTH 45

// Control whether blocks are clickable.
#define CLICKABLE_BLOCKS 1

// Control whether a leading delimiter should be prepended to the status.
#define LEADING_DELIMITER 0

// Control whether a trailing delimiter should be appended to the status.
#define TRAILING_DELIMITER 0

// Define blocks for the status feed as X(icon, cmd, interval, signal).
#define BLOCKS(X)             \
    X("", "nix-updates", 600, 1)  \
    X("", "bt", 1, 2)  \
    X("", "audio", 1, 3)   \
    X("󰃠", "brightness", 1, 4) \
    X("", "internet", 5, 5) \
    X("", "battery", 1, 6) \
    X("󰃰 ", "TZ=Asia/Kolkata date '+%b %d - %I:%M%p'",      60,      7) \
    X("", "sb-volume", 0, 8)  \
    X("", "sb-battery", 5, 9) \
    X("", "sb-date", 1, 10)

#endif  // CONFIG_H
