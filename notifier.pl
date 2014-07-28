use LWP::UserAgent;

$extension_mode = $EM_SCRIPT_OFF;

$handle = sub {
    my $ref = shift;

    #Load the file for each tweet (this allows you to add to the list without needing to reload the app)
    #If your tweet count is excessive consider adding a guard around this
    #Make sure to create this file
    open my $watchhandle, '<', "$ENV{'HOME'}/twt.watchlist";
    chomp(my @lines = <$watchhandle>);
    my %userLookup = map { $_ =>  1} @lines;
    close $watchhandle;

    #Build up the message to store , this is the formatting taken direct from the docs
    my $sn = &descape($ref->{'user'}->{'screen_name'});
    my $string = &descape($ref->{'created_at'}) .
    " \@$sn " .
    &descape($ref->{'user'}->{'name'}) .
    " says: " .
    &descape($ref->{'text'}) . "\n";

    #If the user is in our watchlist then send us a notifcation 
    #Always let the default handle take over so that the message is printer to the cli
    if($userLookup{$sn}){
        $sn =~ s#/#-#g;
        LWP::UserAgent->new()->post(
            "https://api.pushover.net/1/messages.json", [
                "token" => "",                              #Add your app token here
                "user" => "",                               #Add your user token here or look it up if you are sending to other users
                "message" => $string,
            ]);
    }
    &defaulthandle($ref);
    return 1;
};

$conclude = sub {
    &defaultconclude;
};
