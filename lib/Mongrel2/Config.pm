package Mongrel2::Config;
# ABSTRACT: create and interact with Mongrel2's configuration database

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2011-01-16 00:10:22
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:OdV/OrD4v1bbZeQsInbFow

use Path::Class;
use Scalar::Util qw(blessed);
use File::ShareDir qw(dist_dir);

sub i_want_to_run_my_tests_without_installing() {
    my $dist_dir = eval { dist_dir 'Mongrel2-Config' };
    return dir($dist_dir)
        || file(__FILE__)->parent->parent->parent->subdir('share')->absolute->resolve;
}

sub deploy {
    my ($self, $schema_files) = @_;
    $self->throw_exception("Can't deploy without storage") unless $self->storage;

    $schema_files = dir($schema_files) unless blessed $schema_files;
    $schema_files ||= i_want_to_run_my_tests_without_installing->subdir('sql');

    my $sql = $schema_files->file('config.sql')->slurp .
              $schema_files->file('mimetypes.sql')->slurp;

    $sql =~ s/\n/ /g;

    # i hate DBI or DBD::SQLite or both
    my @lines = split /;/, $sql;

    $self->storage->dbh_do(sub {
        my $dbh = $_[1];
        for my $line (@lines){
            next if !$line || $line =~ /^[[:space:]]+$/;
            next if $line =~ /^[[:space:]]*(begin|commit|rollback)/i;
            $dbh->do($line) or die "deploy: ". $dbh->errstr;
        }
    });
}

1;
