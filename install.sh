apt-get install -y lame eject id3 id3v2 eyed3 normalize-audio vorbisgain mkcue mp3gain libdata-dump-perl flac pmount glyrc abcde
cp 99-cd-audio-processing.rules /etc/udev/rules.d/.
cp ripit.sh /usr/local/bin/.
cp ripit.service /etc/systemd/system/.
wget https://abcde.einval.com/download/abcde-2.8.1.tar.gzabcde-2.8.1.tar.gz
tar xvzf abcde-2.8.1.tar.gz
cp abcde-2.8.1/abcde /usr/bin/.
cp abcde-2.8.1/cddb-tool /usr/bin/.
cp abcde-2.8.1/abcde-musicbrainz-tool /usr/bin/.
cp abcde.conf /etc/abcde.conf
udevadm control --reload
