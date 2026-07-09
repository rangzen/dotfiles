hs.hotkey.bind({}, 105, function()
	local file = os.getenv("HOME") .. "/Pictures/Screenshot-" .. os.date("%Y%m%d-%H%M%S") .. ".png"
	hs.execute("/usr/sbin/screencapture -i " .. file)

	local exists = hs.fs.attributes(file)
	if exists then
		hs.execute(
			string.format("osascript -e 'set the clipboard to (read (POSIX file \"%s\") as «class PNGf»)'", file)
		)
		hs.alert.show("Capture sauvée + copiée")
	else
		hs.alert.show("Échec : fichier non créé (annulé ou permission manquante)")
	end
end)
