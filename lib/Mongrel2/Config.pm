package Mongrel2::Config;
# ABSTRACT: interact with Mongrel2's configuration database
use strict;
use warnings;
use true;
use namespace::autoclean;

use Path::Class;
use Scalar::Util qw(blessed);
use File::ShareDir qw(dist_dir);

use parent 'DBIx::Class::Schema';

sub deploy {
    my ($self, $schema_files) = @_;

    # to deploy, we use the pristine SQL files as shipped with
    # mongrel2.  this way, you'll get weird errors from your perl
    # script instead of weird errors from your production web server
    # when the schema changes.

    $schema_files ||= dist_dir 'Mongrel2-Config';
    $schema_files = dir($schema_files) unless blessed $schema_files;

    my $sql = $schema_files->file('config.sql')->slurp .
              $schema_files->file('mimetypes.sql')->slurp;

    $self->dbh_do(sub {
        my $dbh = shift;
        $dbh->do($sql) or die "deploy: ". $dbh->errstr;
    });
}

__PACKAGE__->load_namespaces;
