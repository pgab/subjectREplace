subjectREplace
==============

subjecREplace is a plug in for Apple Mail.app. It replaces annoying AW:, WG:, SV: and so on coming from Microsoft Outlook in Apple Mail. Thus long chains of Re: AW: Re: AW: can be avoided. Of course can u do it manually, but why?


Install
-------

*Type in terminal:

	defaults write com.apple.mail EnableBundles 1
	defaults write com.apple.mail BundleCompatibilityVersion 4

*Download subjectREplace.mailbundle

*Copy subjectREplace.mailbundle to ~/Library/Mail/Bundles

*Restart Mail.app

Add more abbreviations to be replaced
-------------------------------------

Open ~/Library/Mail/Bundles/subjectREplace.mailbundle/Contents/Info.plist with the Property List Editor and add childs to StringsToREplace or StringsToReplaceFWD like AW:, SV:, WG: (note the : ) respectively.

Issue Tracker
-------------

https://github.com/pgab/subjectREplace/issues

Acknowledgement
---------------

Thanks to https://github.com/stl/MailBundle-Template for making it easy to start with plug ins for Mail.app