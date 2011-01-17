package Mongrel2::Config::Result::Host;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Mongrel2::Config::Result::Host

=cut

__PACKAGE__->table("host");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 server_id

  data_type: 'integer'
  is_nullable: 1

=head2 maintenance

  data_type: 'boolean'
  default_value: 0
  is_nullable: 1

=head2 name

  data_type: 'text'
  is_nullable: 1

=head2 matching

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "server_id",
  { data_type => "integer", is_nullable => 1 },
  "maintenance",
  { data_type => "boolean", default_value => 0, is_nullable => 1 },
  "name",
  { data_type => "text", is_nullable => 1 },
  "matching",
  { data_type => "text", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2011-01-16 00:10:22
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:cy7AFBsXXiFHdtjYUjel1w

=head1 RELATIONSHIPS

=head2 belongs_to server

The server that this host belongs to.

=head2 has_many routes

The routs that this server handles.

=cut

__PACKAGE__->belongs_to( server => 'Mongrel2::Config::Result::Server', 'server_id' );

__PACKAGE__->has_many( routes => 'Mongrel2::Config::Result::Route', 'host_id' );

1;
