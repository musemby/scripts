## Quirks/Gotchas

### What's this?

A documentation of frequent or rare peculiar situations I come across in my day to day coding. These are not necessarily difficult concepts but rather things that have caught me off guard severally. Thus it serves as a reminder for the next time I might come across them and how to resolve them. Sure I could just do a google search and get the solution very quickly but having them nicely packed in one place with the necessary explanation is nicer.

#### 1. psql: FATAL:  Ident authentication failed for user "postgres"

This will catch you on a fresh installation of postgres when you try to run `psql -U postgres`

Solution: Open `/etc/postgresql/9.5/main/pg_hb.conf` with sudo access i.e `sudo nano /etc/postgresql/9.5/main/pg_hb.conf`
 Gotcha: If you open the file normally (no sudo) it will be empty and you will be wondering what's going on.
 
 Initially you have this in the file:
 
 ![Initial state of conf file](/home/musembi/Pictures/peer-fin.png  "Initial state of pg_hba.conf file")
 
Change `peer` to `trust`, that is:

![Final state of conf file](/home/musembi/Pictures/pg_hba-trust.png  "Final state of pg_hba.conf file")

Finally reload server configuration changes by typing: `sudo /etc/init.d/postgresql reload`

Now running `psql -U postgres` does not throw an error but launches the psql shell.