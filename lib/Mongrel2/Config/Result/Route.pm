package Mongrel2::Config::Result::Route;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Mongrel2::Config::Result::Route

=cut

__PACKAGE__->table("route");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 path

  data_type: 'text'
  is_nullable: 1

=head2 reversed

  data_type: 'boolean'
  default_value: 0
  is_nullable: 1

=head2 host_id

  data_type: 'integer'
  is_nullable: 1

=head2 target_id

  data_type: 'integer'
  is_nullable: 1

=head2 target_type

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "path",
  { data_type => "text", is_nullable => 1 },
  "reversed",
  { data_type => "boolean", default_value => 0, is_nullable => 1 },
  "host_id",
  { data_type => "integer", is_nullable => 1 },
  "target_id",
  { data_type => "integer", is_nullable => 1 },
  "target_type",
  { data_type => "text", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2011-01-16 00:10:22
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:grBPAAa5l4s7hnrWxb8Hgw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
