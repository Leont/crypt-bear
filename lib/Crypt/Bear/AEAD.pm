package Crypt::Bear::AEAD;

use Crypt::Bear;

1;

# ABSTRACT: AEAD encoder baseclass BearSSL

=method reset($iv)

=method aad_inject($data)

=method flip()

=method run($data, $encrypt)

=method get_tag()

=method check_tag($tag)
