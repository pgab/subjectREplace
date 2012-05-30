subjectREplace
==============

Replaces annoying AW:, WG:, SV: and so on coming from Microsoft Outlook in Apple Mail


In order to install:
	- Type in terminal:

defaults write com.apple.mail EnableBundles 1
defaults write com.apple.mail BundleCompatibilityVersion 4

	- copy subjectREplace.mailbundle to ~/Library/Mail/Bundles

	- Restart Mail

In order to add more abbreviations to be replaced:
	- open ~/Library/Mail/Bundles/subjectREplace.mailbundle/Contents/Info.plist with the Property List Editor and add childs to StringsToREplace or StringsToReplaceFWD like AW:, SV:, WG: (note the : ) respectively
