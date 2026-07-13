#====================== Olaus General Symbol Definitions =======================

if [[ -z "$OLS_DEF" ]]; then

    declare    -r -x TRUE=1
    declare    -r -x FALSE=0
    declare    -r -x SUCCESS=0
    declare    -r -x FAIL=1
    declare    -r -x PASS=0
    declare    -r -x OLSID="OLS"        # Olaus ID

  # Exit code definitions:
    declare -i -r -x EX_OK=0            # Successful termination
    declare -i -r -x EX_INFO            # Informational message
    declare -i -r -x EX_PASS=1          # Informational message
    declare -i -r -x EX_WARNING=4       # Warning
    declare -i -r -x EX_ERROR=8         # Error
    declare -i -r -x EX_SEVERE=12       # Severe error
    declare -i -r -x EX_FATAL=16        # Fatal error
    declare -i -r -x EX_BASE=64         # Base value for error messages
    declare -i -r -x EX_USAGE=64        # Command line usage error
    declare -i -r -x EX_DATAERR=65      # Data format error
    declare -i -r -x EX_NOINPUT=66      # Cannot open input
    declare -i -r -x EX_NOUSER=67       # Addressee unknown
    declare -i -r -x EX_NOHOST=68       # Host name unknown 
    declare -i -r -x EX_UNAVAILABLE=69  # Service unavailable
    declare -i -r -x EX_SOFTWARE=70     # Internal software error
    declare -i -r -x EX_OSERR=71        # System error (e.g., can't fork)
    declare -i -r -x EX_OSFILE=72       # Critical OS file missing
    declare -i -r -x EX_CANTCREAT=73    # Can't create (user) output file
    declare -i -r -x EX_IOERR=74        # Input/output error
    declare -i -r -x EX_TEMPFAIL=75     # Temp failure; user is invited to retry
    declare -i -r -x EX_PROTOCOL=76     # Remote error in protocol
    declare -i -r -x EX_NOPERM=77       # Permission denied
    declare -i -r -x EX_CONFIG=78       # Configuration error
    declare -i -r -x EX_MISSINGFILE=79  # A file is missing
    declare -i -r -x EX_CANTC8TEMP=80   # Can't create temporary file
    declare -i -r -x EX_ASSERTFAIL=81   # Assertion failed
    declare -i -r -x EX_CANTC8LOCK=82   # Can't create lock file.
    declare -i -r -x EX_USERABORT=83    # Aborted by user
    declare -i -r -x EX_TERMINATION=84  # Trapped termination interrupt
    declare -i -r -x EX_TRAPINT=85      # Trapped interrupt
    declare -i -r -x EX_TESTMAXERR=254  # Maximum error count for Olaus Test
    declare -i -r -x EX_TESTBAIL=255    # BAIL_OUT function terminated script
    declare -i    -x EX_CODE=$EX_OK     # Initialize Exit Code to OK

  # ASCII Special Characters:
    declare    -r -x OLS_NUL="\x00"     # Null Character
    declare    -r -x OLS_SOH="\x01"     # Start of Heading
    declare    -r -x OLS_STX="\x02"     # Start of Text
    declare    -r -x OLS_ETX="\x03"     # End of Text
    declare    -r -x OLS_EOT="\x04"     # End of Transmission
    declare    -r -x OLS_ENQ="\x05"     # Enquire
    declare    -r -x OLS_ACK="\x06"     # Acknowledge
    declare    -r -x OLS_BEL="\x07"     # Bell, Alert
    declare    -r -x OLS_BS="\x08"      # Backspace
    declare    -r -x OLS_HT="\x09"      # Horizontal Tab
    declare    -r -x OLS_LF="\x0a"      # Line Feed
    declare    -r -x OLS_VT="\x0b"      # Vertical Tab
    declare    -r -x OLS_FF="\x0c"      # Form Feed
    declare    -r -x OLS_CR="\x0d"      # Carriage Return
    declare    -r -x OLS_SO="\x0e"      # Shift Out
    declare    -r -x OLS_SI="\x0f"      # Shift In
    declare    -r -x OLS_DLE="\x10"     # Data Link Excape
    declare    -r -x OLS_DC1="\x11"     # Device Control One (XON)
    declare    -r -x OLS_DC2="\x12"     # Divice Control Two
    declare    -r -x OLS_DC3="\x13"     # Device Control There (XOFF)
    declare    -r -x OLS_DC4="\x14"     # Device Control Four
    declare    -r -x OLS_NAK="\x15"     # Negative Acknowledge
    declare    -r -x OLS_SYN="\x16"     # Synchronousw Idle
    declare    -r -x OLS_ETB="\x17"     # End of Transmission Block
    declare    -r -x OLS_CAN="\x18"     # Cancel
    declare    -r -x OLS_EM="\x19"      # End of Medium
    declare    -r -x OLS_SUB="\x1a"     # Substitute
    declare    -r -x OLS_ESC="\x1b"     # Escape
    declare    -r -x OLS_FS="\x1c"      # File Separator
    declare    -r -x OLS_GS="\x1d"      # Group Separator
    declare    -r -x OLS_RS="\x1e"      # Record Separator
    declare    -r -x OLS_US="\x1f"      # Unit Separator
    declare    -r -x OLS_SP=" "         # Blank
    declare    -r -x OLS_DEL="\x7F"     # Delete


  # Test harness definitions:
    declare -i -r -x OLS_TST_INIT=0     # Start with test number zero.
    declare    -r -x OLS_TAP_VERSION="TAP version 14"

  # Olaus argument and option processing variables
    declare       -x OLS_BASH_SOURCE="${BASH_SOURCE[0]}"
    declare -i    -x OLS_VERBOSE=0      # Initialize to normal output.
    declare -i    -x OLS_DEBUG=$FAIL    # Initialize to no debugging output.
    declare -i    -x OLS_LOG=$FAIL      # Initialize to no log output.
    declare       -x OLS_LOG_FILE="$OLS_BASH_SOURCE.log"  # Initialize OLS_LOG_FILE for debugging.
    
  # Switch to load definitions one time.
    declare -i -r -x OLS_DEF=$TRUE      # OLSDEF=T ==> ols_def has been loaded.

fi # if [[ -z "$OLS_DEF" ]]
