package Mongrel2::Config::Result::Server;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Mongrel2::Config::Result::Server

=cut

__PACKAGE__->table("server");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 uuid

  data_type: 'text'
  is_nullable: 1

=head2 access_log

  data_type: 'text'
  is_nullable: 1

=head2 error_log

  data_type: 'text'
  is_nullable: 1

=head2 chroot

  data_type: 'text'
  default_value: '/var/www'
  is_nullable: 1

=head2 pid_file

  data_type: 'text'
  is_nullable: 1

=head2 default_host

  data_type: 'integer'
  is_nullable: 1

=head2 name

  data_type: 'text'
  default_value: (empty string)
  is_nullable: 1

=head2 bind_addr

  data_type: 'text'
  default_value: '0.0.0.0'
  is_nullable: 1

=head2 port

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "uuid",
  { data_type => "text", is_nullable => 1 },
  "access_log",
  { data_type => "text", is_nullable => 1 },
  "error_log",
  { data_type => "text", is_nullable => 1 },
  "chroot",
  { data_type => "text", default_value => "/var/www", is_nullable => 1 },
  "pid_file",
  { data_type => "text", is_nullable => 1 },
  "default_host",
  { data_type => "integer", is_nullable => 1 },
  "name",
  { data_type => "text", default_value => "", is_nullable => 1 },
  "bind_addr",
  { data_type => "text", default_value => "0.0.0.0", is_nullable => 1 },
  "port",
  { data_type => "integer", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2011-01-16 00:10:22
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:wYSz35oOu2m9aaJjD3h7iQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
