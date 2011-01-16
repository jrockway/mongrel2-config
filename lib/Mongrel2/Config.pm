package Mongrel2::Config;

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

sub deploy {
    my ($self, $schema_files) = @_;

    $schema_files ||= dist_dir 'Mongrel2-Config';
    $schema_files = dir($schema_files) unless blessed $schema_files;

    my $sql = $schema_files->file('config.sql')->slurp .
              $schema_files->file('mimetypes.sql')->slurp;

    $self->dbh_do(sub {
        my $dbh = shift;
        $dbh->do($sql) or die "deploy: ". $dbh->errstr;
    });
}

1;
