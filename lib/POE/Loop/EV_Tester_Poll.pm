=for poe_tests
BEGIN { $ENV{LIBEV_FLAGS} = 2; }
sub skip_tests {
    return "Author and automated testing only"
        unless $ENV{AUTHOR_TESTING} or $ENV{AUTOMATED_TESTING};
    return "EV module with poll backend could not be loaded" if (
        do { eval "use EV"; $@ }
    );
    return "EV was not built with a poll backend"
        if EV::backend() != EV::BACKEND_POLL();
    diag("Using EV with poll backend") if shift eq '00_info';
}
