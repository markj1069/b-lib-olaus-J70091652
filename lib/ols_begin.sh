# ols_begin - Olaus BASH Shell Housekeeping Function at Beginning of Script

cat >/dev/null <<'=cut'

=head1 NAME

B<ols_begin> - Olaus BASH Shell Housekeeping Function at Beginning of Script

=head1 SYNOPSIS

source $OLSLIB

=head1 DESCRIPTION

=head1 SUBROUTINES/FUNCTIONS/METHODS

=head1 SECURITY

B<ols_begin> does not need to run as root.

=head1 AVAILABILITY

=head1 EXAMPLES

=head1 NOTES

=head1 CAVEATS

=head1 DIAGNOSTICS

=head1 RETURN STATUS

=over 4

=item EX_OK

=back

=head1 DEPENDENCIES

=head1 INCOMPATABILITIES

=head1 CONFIGURATION AND ENVIRONMENT

=over 4

=item DATE

=item EX_OK

B<errmsg>, 

=item PGMDATE

=item PGMREL

=item YEAR

=back

=head1 FILES

=head1 STANDARDS

=head1 VERSION

=head1 AUTHOR

Mark J Jensen E<lt>mark@jensen.netE<gt>

=head1 HISTORY

   Date      Version   Description
2006-09-22  V00.00.00  Function created by nuf ver. 3.0.0
2025-03-10  V00.00.01  Initial Release by Mark

=head1 RESOURCES

=head1 BUGS AND LIMITATIONS

=head1 SEE ALSO

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2006 Mark Jensen. All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

=over 4

=item 1.

Redistributions of source code must retain the above copyright
notice, this list of conditions and the following disclaimer.

=item 2.

Redistributions in binary form must reproduce the above copyright
notice, this list of conditions and the following disclaimer in the
documentation and/or other materials provided with the distribution.

=back

THIS SOFTWARE IS PROVIDED BY MARK JENSEN ``AS IS'' AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL TEXAS INSTRUMENTS OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
SUCH DAMAGE.

=cut

# Make some pretty date strings.
declare    -r -x OLS_DATE=$(date +'%Y-%m-%d') # Grab today's date
declare    -r -x OLS_YEAR=$(date +'%Y')       # We want the year also.
declare    -r -x OLS_TIME=$(date +'%H:%M:%S') # Grab the start time.

declare    -r -x OLS_TMP_DIR=$(mktemp -d) # Make a directory for temporary files.
# check if tmp dir was created
if [[ ! "$OLS_TMP_DIR" || ! -d "$OLS_TMP_DIR" ]]; then
  printf "OLS1000F Could not create OLS_TMP_DIR temporary directory\n"
  exit $EX_TEMPFAIL
fi

declare    -r -x OLS_TSTFILE="$OLS_TMP_DIR/TAP.txt"      # Hold the current TAP test number.
declare    -r -x OLS_EX_FILE="$OLS_TMP_DIR/EX_CODE.txt"  # Hold the current Exit Code.

trap "Exit 1"                HUP INT PIPE QUIT TERM 
trap 'ols_end' EXIT

ols_wt_excode $EX_OK                  # Assume this script will be successful.
ols_wt_tstno  $OLS_TST_INIT           # Initialize OLS_TMP_DIR/TAP.txt

declare -a    -x OLS_SYSIN            # Store the input  files in the OLS_SYSIN array.
declare       -x OLS_SYSOUT           # Store the Output file  in OLS_SYSOUT.

declare -a    -x OLS_EXTRA_OPT        # Store the unexpected options. 

# end ols_begin
