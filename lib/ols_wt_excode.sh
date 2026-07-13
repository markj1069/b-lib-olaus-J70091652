# ols_wt_tstno - Write Olaus Test Number to temporary file.

cat >/dev/null <<'/*'

=head1 NAME

B<ols_wt_excode> - Write Olaus Exit Code to temporary file.

=head1 SYNOPSIS

B<ols_wt_excode> I<EX_CODE>

=head1 DESCRIPTION

B<ols_wt_excode> writes the Olaus Exit Code, I<EX_CODE> to a temporary file with the name $OLS_EX_FILE.

The Olaus Bash Library uses temporary files to simulate global variables.

=head1 EXAMPLE

    ols_wt_excode $OLS_EXCODE

=head1 NOTES & CAVEATS

B<Note:> Due to the behavior of the C<printf> command,
EX_CODE should not have a leading zero.
If it does,
the value will be converted to octal, I<e.g.>,
'064' will be converted to ' 52'.

=head1 DIAGNOSTICS

=head2 OLS7001F

ols_wt_excode: Missing Argument #1, num

=head3 Severity: Fatal Error, EX_CODE=16

=head3 Explanation:

B<ols_wt_excode> was called without an exit code.

=head3 Programmer Response:

Isolate call to B<ols_wt_excode> and supply the intended exit code.

=head2 OLS7002F

B<ols_wt_excode:> Exit Code must be between 0 and 255.

=head3 Severity: Fatal Error, EX_CODE=16

=head3 Explanation:

B<ols_wt_excode> was called with an exit code, num, outside the permissibable range, 0 E<le> num E<le> 255.

=head3 Programmer Response:

Isolate call to B<ols_wt_excode> and supply the proper exit code.

=head1 ENVIRONMENT

=over 4

=item OLS_LIB

B<ols_wt_excode> uses OLS_LIB to know where the Olaus Bash Library is located.

=item OLS_EX_FILE

B<ols_wt_excode> uses OLS_EX_FILE to know where to write the exit code.

=item EX_SOFTWARE

B<ols_wt_excode> uses EX_SOFTWARE to signal a fatal error if required.

=back

=head1 FILES

B<ols_wt_excode> writes the exit code to the temporary file stored in OLS_EX_FILE.

=head1 VERSION

Version V00.00.01

=head1 BUGS

=head1 SEE ALSO

B<ols_rd_excode>, B<ols_set_excode>

=head1 AUTHOR

Mark J Jensen E<lt>mark@jensen.netE<gt>

=head1 HISTORY

   Date      Version   Description
2025-03-10  V00.00.00  Function created by Mark
2025-03-10  V00.00.01  Initial Release by Mark

=cut

/*

function ols_wt_excode() {

    local num

    if [[ -z "$1" ]]
    then
        ols_err "$OLSID" 7001 $EX_USAGE "ols_wt_excode: Missing argument #1, num"
    else
        num=$(printf "%3u" "$1");     # Convert num into a 3 digit string.
    fi

    if (( $num < 0 || 255 < $num )); then
        ols_err "$OLSID" 7002 $EX_SOFTWARE "ols_wt_excode: Exit Code must be between 0 and 255."
    fi

    printf "%3d\n" $num >$OLS_EX_FILE

} # end ols_wt_tstno
