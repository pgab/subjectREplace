subjectREplace
==============

Replaces annoying AW:, WG:, SV: and so on coming from Microsoft Outlook in Apple Mail


Install
-------
	- Type in terminal:

defaults write com.apple.mail EnableBundles 1
defaults write com.apple.mail BundleCompatibilityVersion 4

	- copy subjectREplace.mailbundle to ~/Library/Mail/Bundles

	- Restart Mail

Add more abbreviations to be replaced
-------------------------------------

Open ~/Library/Mail/Bundles/subjectREplace.mailbundle/Contents/Info.plist with the Property List Editor and add childs to StringsToREplace or StringsToReplaceFWD like AW:, SV:, WG: (note the : ) respectively.

Issue Tracker
-------------

https://github.com/pgab/subjectREplace/issues