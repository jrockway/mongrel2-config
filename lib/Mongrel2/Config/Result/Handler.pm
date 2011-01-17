package Mongrel2::Config::Result::Handler;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Mongrel2::Config::Result::Handler

=cut

__PACKAGE__->table("handler");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 send_spec

  data_type: 'text'
  is_nullable: 1

=head2 send_ident

  data_type: 'text'
  is_nullable: 1

=head2 recv_spec

  data_type: 'text'
  is_nullable: 1

=head2 recv_ident

  data_type: 'text'
  is_nullable: 1

=head2 raw_payload

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "send_spec",
  { data_type => "text", is_nullable => 1 },
  "send_ident",
  { data_type => "text", is_nullable => 1 },
  "recv_spec",
  { data_type => "text", is_nullable => 1 },
  "recv_ident",
  { data_type => "text", is_nullable => 1 },
  "raw_payload",
  { data_type => "integer", default_value => 0, is_nullable => 1 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2011-01-16 00:10:22
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:lByBiIE7piZdHLqXzrcA2Q

=head1 RELATIONSHIPS

=head2 has_many routes

The routes that point to this handler.

=cut

__PACKAGE__->has_many(
    routes => 'Mongrel2::Config::Result::Route', 'target_id',
    { where => { 'target_type' => 'handler' } },
);

1;
