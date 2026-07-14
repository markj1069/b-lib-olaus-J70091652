#! /usr/bin/env bash

# Synopsis: is_csv csv_file_name

function is_csv() {

    local csv_file_name="$1"

    # Does the csv_file_name have a value?
    if [[ -z "$csv_file_name" ]]; then
        ols_err $OLSID 7001 "$EX_USAGE" "is_csv: Argument #1 missing, csv_file_name"
        ols_set_excode $EX_USAGE
        ols_end
    fi

    # Does this file exist?
    if [[ ! -f "$csv_file_name" ]]; then
        ols_err $OLSID 7070 $EX_NOINPUT "is_csv: $csv_file_name does not exist or is not a normal file"
        ols_set_excode $EX_NOINPUT
        ols_end
    fi

    # Does this file have a CSV extention?
    if [[ ! "${csv_file_name##*.,,}" == "csv" ]]; then
        ols_err $OLSID 7071 $EX_INFO "is_csv: $csv_file_name does not have a 'csv' extention."
        ols_set_excode $EX_INFO
        ols_end
    fi

    ols_set_excode $EX_OK
    return $EX_OK

} # is_csv

cat <<=cut >/dev/null
=head1 Name

B<is_csv> - Checks to see if a file is a csv

=head1 Synopsis

B<is_csv> F<csv_file_name>

=head1 Description

B<is_csv> makes an attempt to check that F<csv_file_name>
is a CSV file by checking its existance and a CSV extention.
Recognize that this is not the Unix way but I<c'est la vie>.


=head1 Arguments

=over 4

=item I<csv_file_name>

(required) The name of the file to be check as a CSV.

=back

=head1 Security

Superuser athority is not reuired to run this function.
This function contains no security information.

=head1 Examples

=head2 Passing CSV

    source $OLSLIB

    csv_file_name="tmp.csv"           # csv_file_name is a CSV, is_csv returns
    is_csv "$csv_file_name"           # with a SUCCESS exit code.

=head2 Failing CSV

    source $OLSLIB

    csv_file_name="tmp.txt"           # csv_file_name is not a CSV, is_csv issues
    is_csv "$test"                    # an error message and exits
                                      # with an exit code of 64.

=head1 Notes & Caveats

A regular text file looks with a .csv extention looks like a CSV
with a single column.

=head1 Diagnostics

A list of every error and warning message that the module can generate
(even the ones that will "never happen"), with a full explanation
of each problem, one or more likely causes, and any suggested remedies.

=head2 Exit Status

The following exit codes are possible:

 | Exit Code      | Exit Value | Description              |
 |----------------|------------|--------------------------|
 | EX_OK          |      0     | Successful termination   |
 | EX_USAGE       |     64     | Command line usage error |
 | EX_MISSINGFILE |     79     | A file is missing        |


=head1 Configuration & Environment

=over 4

=item OLS_EX_FILE

File containing the current Olaus Exit Code.

=item OLSLIB

B<is_csv> is brough into the program by sourcing $OSLLIB.

=back

=head1 Dependencies

B<is_csv> is part of the Olaus Bash Shell Library and uses:

=over 4

=item * ols_end

=item * ols_err

=item * ols_set_excode

=back

=head1 Files

=over 4

=item OLSLIB

OLSLIB is sourced in scripts using B<is_csv>.

=item OLS_EX_FILE

OLS_EX_FILE store the Olaus Exit Code.

=item STDOUT

ols_err prints to STDOUT.

=back

=head1 Version

Version 0.0.1

=head1 History

 Version  | Author         | Description     | Date       |
 0.0.1    | Mark J. Jensen | Initial Release | 2025-99-99 |

=head1 Bugs & Limitations

A regular text file will be recognized as a CSV with a single column.

Please report problems to <Maintainer name(s)> (<contact address>)

Patches are welcome.

=head1 See Also

B<ols_end>, B<ols_err>. B<ols_set_excode>

=head1 Author

Mark J Jensen E<lt>mark@jensen.netE<gt>

=head1 Copyright & License

B<is_csv> is licensed under
L<CC BY 4.0|https://creativecommons.org/licenses/by/4.0/?ref=chooser-v1>
by L<Mark J. Jensen|https://www.linkedin.com/in/jensenmark/>.

=head1 Source

B<is_csv> may be found at [xxx](yyy).

=cut

