package Mongrel2::Config::Result::Statistic;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Mongrel2::Config::Result::Statistic

=cut

__PACKAGE__->table("statistic");

=head1 ACCESSORS

=head2 id

  data_type: 'serial'
  is_nullable: 1

=head2 other_type

  data_type: 'text'
  is_nullable: 0

=head2 other_id

  data_type: 'integer'
  is_nullable: 0

=head2 name

  data_type: 'text'
  is_nullable: 0

=head2 sum

  data_type: 'real'
  is_nullable: 1

=head2 sumsq

  data_type: 'real'
  is_nullable: 1

=head2 n

  data_type: 'integer'
  is_nullable: 1

=head2 min

  data_type: 'real'
  is_nullable: 1

=head2 max

  data_type: 'real'
  is_nullable: 1

=head2 mean

  data_type: 'real'
  is_nullable: 1

=head2 sd

  data_type: 'real'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "serial", is_nullable => 1 },
  "other_type",
  { data_type => "text", is_nullable => 0 },
  "other_id",
  { data_type => "integer", is_nullable => 0 },
  "name",
  { data_type => "text", is_nullable => 0 },
  "sum",
  { data_type => "real", is_nullable => 1 },
  "sumsq",
  { data_type => "real", is_nullable => 1 },
  "n",
  { data_type => "integer", is_nullable => 1 },
  "min",
  { data_type => "real", is_nullable => 1 },
  "max",
  { data_type => "real", is_nullable => 1 },
  "mean",
  { data_type => "real", is_nullable => 1 },
  "sd",
  { data_type => "real", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("other_type", "other_id", "name");


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2011-01-16 00:10:22
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ZblWS/lh/rU+Ki8TbZ4NEQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
