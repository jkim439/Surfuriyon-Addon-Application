StopTheSpam - Copyright 2006 - Tyler Riti (Malreth of Silver Hand)

Install the !StopTheSpam folder into "World Of Warcraft\Interface\AddOns"
just like you did for the hundreds of other addons that you have. If have
never installed any other addons, then I guess you really don't need this
one, mm? Make sure that the folder name retains the '!' character at the
beginning so that it loads before any of your other addons. There's
nothing to configure for this addon -- it just does its work silently
(after all, it has no choice). To disable it, go to the Character Select
screen, click on the AddOns button at the bottom, and uncheck "Stop The
Spam" in the list.

Oh, if you're an addon author and you're examining my code to get around
the filter (it really isn't hard), don't. Think of the users. If they
installed my addon, they probably installed it for a reason.

Release Notes:

1.00.10900 - Filter routine rewritten to be more flexible to allow for
	future expansion. Allow/deny rules are now supported, rules can be
	reordered, expired, invalidated, disabled, and deleted. It's so
	complicated that even I can't understand it anymore! BugSack and
	Warmup are no longer filtered. Filter code now tries to safely unhook
	itself if possible. Impact on the global namespace has been minimized
	if not eliminated. Updated interface version. Also, the marketing
	department says bigger version numbers are better. I agree.

0.05.1700  - Improved the filter routine to capture more of the spam
	without triggering false positives. Added code to block AuctionIt and
	the played time messages that get triggered by experience calculating
	addons.

0.04.1700  - Fixed a bug that blocked more than just the spam after a user
	interface reload. Added special case code to block the Ace loading
	messages.

0.03.1700  - Another rewrite because I felt like it. No more icky timer.
	Updated interface version.

0.02.1600  - Rewrite and general cleanup of code. Changed timer value to 3
	seconds to catch ShardTracker. Updated interface version.

0.01.1500  - Initial release.