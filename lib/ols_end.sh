# olsend - Olaus BASH Shell Housekeeping Function at End of Script

cat >/dev/null <<'=cut'

=head1 NAME

ols_end - Olaus BASH Shell Housekeeping Function at End of Script

=head1 SYNOPSIS

ols_end

=head1 DESCRIPTION

B<ols_end> removes temporary files created by mktfile.

=head1 EXAMPLE

    TMPDIR=.
    mktfile
    mktfile
    mktfile
    mktfile
    mktfile
    clsfile

results in

    ./tmp.oLQAKu3856
    ./tmp.YYPgYWa576
    ./tmp.bleTsL1664
    ./tmp.cQPswSq872
    ./tmp.JVydYl5792
    ./tmp.IinrNW1440
    /tmp/OLSMKT.SDwX6040

temporary files being removed.

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

$Revision$

$Id: clsfile.sh 87 2006-09-13 17:06:10Z a0214394 $

$URL: file:///cygdrive/c/svn/olaus/trnk/src/bash/clsfile/clsfile.sh $

=head1 BUGS

=head1 SEE ALSO

mktemp, mktfile

=head1 AUTHOR

Mark J Jensen E<lt>mark@jensen.netE<gt>

=head1 HISTORY

2006-09-12 - Function created by nuf ver. 3.0.0

=cut

function ols_end() {

    trap '' EXIT                       # No need to trap exit here

    [[ $OLS_VERBOSE -ne $PASS ]] && ols_err $PGMID 0000 $EX_OK "END   $(date +'%H:%M:%S')"

    if [[ ! "$OLS_TMP_DIR" || ! -d "$OLS_TMP_DIR" ]]; then
        # Don't try to delete the non existant temporary directory.
        exit $EX_TEMPFAIL
    else
        EX_CODE=$(ols_rd_excode)
        rm -fr "$OLS_TMP_DIR"           # TODO: Delete temporary directory after making
                                        # the command safe from missing OLS_TMP_DIR.
        exit $EX_CODE                   # exit with exit code we have been tracking
    fi

} # end ols_end
