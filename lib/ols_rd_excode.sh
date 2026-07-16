# ols_rd_excode - Read Olaus Exit Code to temporary file.

cat >/dev/null <<'/*'

=head1 NAME

B<ols_rd_excode> - Write Olaus Exit Code to temporary file.

=head1 SYNOPSIS

B<ols_rd_excode> I<EX_CODE>

=head1 DESCRIPTION

B<ols_rd_excode> writes the Olaus Exit Code, I<EX_CODE> to a temporary file with the name $OLS_EX_FILE.

The Olaus Bash Library uses temporary files to simulate global variables.

=head1 EXAMPLE

    EX_CODE=$(ols_rd_excode)

=head1 NOTES & CAVEATS

=head1 DIAGNOSTICS

=head2 OLS7001F

ols_rd_excode: Missing Argument #1, num

=head3 Severity: Fatal Error, EX_CODE=16

=head3 Explanation:

B<ols_rd_excode> was called without an exit code.

=head3 Programmer Response:

Isolate call to B<ols_rd_excode> and supply the intended exit code.

=head2 OLS7002F

B<ols_rd_excode:> Exit Code must be between 0 and 255.

=head3 Severity: Fatal Error, EX_CODE=16

=head3 Explanation:

B<ols_rd_excode> was called with an exit code, num, outside the permissibable range, 0 E<le> num E<le> 255.

=head3 Programmer Response:

Isolate call to B<ols_rd_excode> and supply the proper exit code.

=head1 ENVIRONMENT

=over 4

=item OLS_LIB

B<ols_rd_excode> uses OLS_LIB to know where the Olaus Bash Library is located.

=item OLS_EX_FILE

B<ols_rd_excode> uses OLS_EX_FILE to know where to write the exit code.

=item EX_SOFTWARE

B<ols_rd_excode> uses EX_SOFTWARE to signal a fatal error if required.

=back

=head1 FILES

B<ols_rd_excode> writes the exit code to the temporary file stored in OLS_EX_FILE.

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

=head1 SOURCE

=cut

/*

function ols_rd_excode() {

    # Synopsis: N=$(ols_rd_excode)
    read -r EX_CODE <"$OLS_EX_FILE"   # EX_CODE as a trailing NEWLINE
    EX_CODE="${EX_CODE%$'\n'}"        # Strip the NEWLINE # Issue #21
    echo $EX_CODE                     # Return EX_CODE

} # end ols_rd_tstno
