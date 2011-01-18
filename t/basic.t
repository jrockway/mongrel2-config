use strict;
use warnings;
use Test::More;

use Mongrel2::Config;

my $schema = Mongrel2::Config->connect('DBI:SQLite::memory:');
$schema->deploy;

my $server = $schema->resultset('Server')->create({
    uuid         => '2676edd5-7493-4dc6-a85c-e09e9f445076',
    default_host => 'localhost',
});

my $host = $server->create_related( hosts => {
    name     => 'localhost',
    matching => 'localhost',
});

my $dir = $schema->resultset('Directory')->create({
    id         => 1,
    base       => '/var/www/',
    index_file => 'index.html',
});

my $handler = $schema->resultset('Handler')->create({
    id        => 1,
    send_spec => 'tcp://lo:1234',
    recv_spec => 'tcp://lo:1235',
    send_ident => 'db0ae21c-1881-420e-91ce-0515c3e3e0b4',
    recv_ident => '2ef5a99e-f981-444e-99aa-60b9de328527',
});

my $proxy = $schema->resultset('Proxy')->create({
    id   => 1,
    addr => 'http://www.google.com/',
    port => 80,
});

my $root = $host->create_related('routes' => {
    path        => '/',
    target_id   => $dir->id,
    target_type => 'dir',
});

my $foo = $host->create_related('routes' => {
    path        => '/foo',
    target_id   => $handler->id,
    target_type => 'handler',
});

my $bar = $host->create_related('routes' => {
    path        => '/bar',
    target_id   => $proxy->id,
    target_type => 'proxy',
});

my $routes = $schema->resultset('Route');

is $server->hosts->count, 1, 'one host';
is $server->default_host->name, 'localhost', 'got default host ok';
is $server->hosts->related_resultset('routes')->count, 3, '3 routes for this server';
is $routes->count, 3, '3 routes total';

is $dir->routes->count, 1, 'only one route that references the dir';
is $handler->routes->count, 1, 'only one route that references the handler';
is $proxy->routes->count, 1, 'only one route that references the proxy';

done_testing;
