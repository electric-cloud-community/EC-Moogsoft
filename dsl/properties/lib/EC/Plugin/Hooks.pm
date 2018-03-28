package EC::Plugin::Hooks;

use strict;
use warnings;
use MIME::Base64 qw(encode_base64);

use base qw(EC::Plugin::HooksCore);


=head1 SYNOPSYS

User-defined hooks

Available hooks types:

    before
    parameters
    request
    response
    parsed
    after

    ua - will be called when User Agent is created

    Accepts step name, hook name, hook code, options

    sub define_hooks {
        my ($self) = @_;

        $self->define_hook('my step', 'before', sub { ( my ($self) = @_; print "I'm before step my step" }, {run_before_shared => 1});
    }


    step name - the name of the step. If value "*" is specified, the hook will be "shared" - it will be executed for every step
    hook name - the name of the hook, see Available hook types
    hook code - CODEREF with the hook code
    options - hook options
        run_before_shared - this hook ("own" step hook) will be executed before shared hook (the one marked with "*")




=head1 SAMPLE


    sub define_hooks {
        my ($self) = @_;

        # step name is 'deploy artifact'
        # hook name is 'request'
        # This hook accepts HTTP::Request object
        $self->define_hook('deploy artifact', 'request', \&deploy_artifact);
    }

    sub deploy_artifact {
        my ($self, $request) = @_;

        # $self is a EC::Plugin::Hooks object. It has method ->plugin, which returns the EC::RESTPlugin object
        my $artifact_path = $self->plugin->parameters($self->plugin->current_step_name)->{filesystemArtifact};

        open my $fh, $artifact_path or die $!;
        binmode $fh;
        my $buffer;
        $self->plugin->logger->info("Writing artifact $artifact_path to the server");

        $request->content(sub {
            my $bytes_read = read($fh, $buffer, 1024);
            if ($bytes_read) {
                return $buffer;
            }
            else {
                return undef;
            }
        });
    }


=cut

# autogen end

use LWP::UserAgent;
use JSON qw(decode_json);

sub define_hooks {
    my ($self) = @_;

    $self->define_hook('Get System Status', 'request', \&get_system_status)
}


sub get_system_status {
    my ($self, $request) = @_;

    use Data::Dumper;
    print Dumper ($request);

    my $config = $self->plugin->get_config_values($self->plugin->parameters->{config});
    print Dumper $config;

# https://habitualbag.moogsoft.io/graze/v1/authenticate?username=graze&password=graze
    my $url = $config->{endpoint} . '/' . $config->{userName} . "/v1/authenticate?username=$config->{userName}&password=$config->{password}";
    my $ua = LWP::UserAgent->new;
    my $response = $ua->get($url);
    print Dumper $response;
    if ($response->is_success) {
        my $data = decode_json($response->content);
        my $token = $data->{auth_token};
        # TODO

        my $url = URI->new($request->uri);
        $url->query_form($url->query_form, auth_token => $token);

        print Dumper $url;
        $request->uri($url);
    }
}

1;
