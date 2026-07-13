# ols_set_excode - Read Olaus Test Number from temporary file.

cat >/dev/null <<'=cut'

=head1 NAME

B<ols_set_excode> - Read Olaus Test No. from a temporary file.

=head1 SYNOPSIS

NUM=$(B<ols_set_excode>)

=head1 DESCRIPTION

B<ols_set_excode> reads the Olaus Test No., I<NUM> from a temporary files and writes it to standard out.

=head1 EXAMPLE

    NUM=NUM=$(B<ols_set_excode>)

=head1 DIAGNOSTICS

ols_clean: cannot remove $file

=head1 ENVIRONMENT

=over 4

=item OLSMKT

A temporary file to remember temporary file names.

=back

=head1 FILES

OLKMKT

clsfile removes temporary files.

=head1 VERSION

Version V00.00.01

=head1 BUGS

=head1 SEE ALSO

mktemp, mktfile

=head1 AUTHOR

Mark J Jensen E<lt>mark@jensen.netE<gt>

=head1 HISTORY

   Date      Version   Description
2025-03-08  V00.00.00  Function created by Mark
2025-03-10  V00.00.01  Replace dummy code

=cut

function ols_set_excode()
{
    if [[ -z "$1" ]]; then
        ols_err $OLSID 7001 $EX_USAGE "ols_set_excode: Missing Argument #1, ex_code"
    else
        local -i ex_code=$1
    fi

    EX_CODE=$(ols_rd_excode)

    if (( EX_CODE < ex_code )); then
        ols_wt_excode $ex_code
    fi
    
    return $EX_OK

} # end ols_set_excode
