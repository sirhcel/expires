REDMINE FOO
-----------

Test of a Redmine plugin for expiring user accounts. It adds an expiring date
to user accounts and prevents expired accounts from logging in.


Implementation Overview
-----------------------

This plugin provides a date field at the user edit tab where an expiring date
could be set. If set, this field is checked at the time of login and expired
accounts are indicated as inactive.

No further chrome is provided for keeping a low profile. Redmine seems to
determine the accounts status in different ways: the AccountController refers
to the User's active? method while the user list seems to use the Principal's
status directly. This leads to an inconsistent presentation. For example,
expired accounts are not shown as inactive at the list of users.
