# ols_err -- Print an Olaus Shell Library Error Message

###################################################################################################
# Usage:      ols_err pgmid errnum ex_code msg
# Purpose:    Print an error message to STDERR
# Returns:    
# Parameters: None.
# Throws:     None.
# Comments:    
# See Also:   
###################################################################################################

function ols_err() {

# Synopsis: ols_err pgmid errnum ex_code msg

    if [[ -z "$1" ]]; then
        printf "%s%s%s\n" "ZZZ7001F" " " "ols_err: Argument #1 missing, pgmid"
        ols_set_excode $EX_USAGE
        ols_end
    else
        PGMID="$1"
    fi
    if [[ -z "$2" ]]; then
        printf "%s%s%s\n" "${PGMID}7001F" " " "ols_err: Augument #2 missing, errnum"
        ols_set_excode $EX_USAGE
        ols_end
    else
        local errnum=$(printf "%4u" "$2"); errnum=${errnum// /0}
    fi
    if [[ -z "$3" ]]; then
        printf "%s%s%s\n" "${PGMID}7002F" " " "ols_err: Augument #3 missing, ex_code"
        ols_set_excode $EX_USAGE
        ols_end
    else
        local ex_code="$3"
    fi

    shift 3

    if [[ ! -z "$1" ]]; then
        local msg="$@"
    else
        local msg=''
    fi

    case $ex_code in
        ( $EX_OK      ) local sev="I";;
        ( $EX_WARNING ) local sev="W";;
        ( $EX_ERROR   ) local sev="E";;
        ( $EX_SEVERE  ) local sev="S";;
        ( *           ) local sev="F";;
    esac

    printf "%s%s%s\n" ${PGMID}${errnum}${sev} ' ' "$msg" >&2

    ols_set_excode $ex_code
    if [[ $sev ==  "F" ]]; then ols_end; fi
    
    return $EX_CODE
} # end ols_err

cat >/dev/null <<'=cut'

=head1 NAME

ols_err - write an error message to STDERR, set exit code, exit if fatal.

=head1 SYNOPSIS

ols_err num ex_code msg

=head1 DESCRIPTION

=head1 ARGUMENTS

=over 4

=item I<num>

(required) Error message number.

=item I<ex_code>

(required) Exit Code and Severity of message.

=item I<msg>

(required) Error message text. 

=back

=head1 SECURITY

B<ols_err> does not require root access.

=head1 AVAILABILITY

=head1 EXAMPLES

    ols_err $OLSID 7001 $EX_SOFTWARE "${FUNCNAME}: missing argument 1, num"

=head1 NOTES

=head1 CAVEATS

=head1 DIAGNOSTICS

=head1 ENVIRONMENT

=over 4

=item EX_CODE

Current exit code.

=item PGMID

Program ID, see B<olausbegin>.

=back

=head1 FILES

=head1 STANDARDS

=head1 VERSION

=head1 AUTHOR

Mark J Jensen E<lt>mark@jensen.netE<gt>

=head1 HISTORY

Re

$Revision: 162 $

$Id: ols_err.sh 162 2007-03-13 00:19:18Z a0214394 $

2006-09-17 - Function created by nuf ver. 3.0.0

=head1 RESOURCES

=head1 BUGS

=head1 SEE ALSO

B<olausbegin>, B<setexcode>

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2013, Mark Jensen.

include(licsense.txt)

=cut

