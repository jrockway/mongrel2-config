package Mongrel2::Config::Result::Directory;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Mongrel2::Config::Result::Directory

=cut

__PACKAGE__->table("directory");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 base

  data_type: 'text'
  is_nullable: 1

=head2 index_file

  data_type: 'text'
  is_nullable: 1

=head2 default_ctype

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "base",
  { data_type => "text", is_nullable => 1 },
  "index_file",
  { data_type => "text", is_nullable => 1 },
  "default_ctype",
  { data_type => "text", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2011-01-16 00:10:22
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:XyEwqlt/hs1iEbUgb0r4Ng


# You can replace this text with custom content, and it will be preserved on regeneration
1;
