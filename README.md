ttytter-pushover
================

A pushover notifier for ttytter (because some people are more important than others)

Ever want to get notified if specific people you follow on twitter post a tweet.
Well now you can , setup ttytter-pushover and you can get notifications sent to you
when the people you really care about tweet :P 

Setup 
=====

- Install the two libraries in the requirements.sh file.
- Create a twt.watchlist in your homefolder
- Add users to the file that you want to watch (One user per line)
- Start ttytter with the command ttytter -exts=notifier.pl -daemon

Thats all there is to it , the script will now run as a daemon watching out for all
those people you care about.

PS : If you dont want to set this up yourself message me your pushoverkey and I can setup a bot for you.
