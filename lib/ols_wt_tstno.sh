# ols_wt_tstno - Write Olaus Test Number to temporary file.

cat >/dev/null <<'/*'

=head1 NAME

B<ols_wt_tstno> - Write Olaus Test No. to temporary file.

=head1 SYNOPSIS

B<ols_wt_tstno> I<NUM>

=head1 DESCRIPTION

B<ols_wt_tstno> writes the Olaus Test No., I<NUM> to a temporary files.

=head1 EXAMPLE

    ols_wt_tstno $OLSTSTNO

=head1 DIAGNOSTICS

OLS7001F ols_wt_tstno: missing argument 1, num 


=head1 ENVIRONMENT

=over 4

=item OLSMKT

A temporary file to remember temporary file names.

=back

=head1 FILES

OLKMKT

clsfile removes temporary files.

=head1 VERSION

Version V00.00.00

=head1 BUGS

=head1 SEE ALSO

mktemp, mktfile

=head1 AUTHOR

Mark J Jensen E<lt>mark@jensen.netE<gt>

=head1 HISTORY

   Date      Version   Description
2025-03-08  V00.00.00  Function created by Mark

=cut

/*

function ols_wt_tstno() {

    if [[ -z "$1" ]]
    then
        ols_err $OLSID 7001 $EX_USAGE "ols_wt_tstno: Missing Argument #1, num"
    else
        local num=$(printf "%u" "$1"); num=${num// /0}  # Convert leading blanks to leading zeros.
    fi
    
    printf "%u\n" $num >$OLS_TSTFILE

} # end ols_wt_tstno
