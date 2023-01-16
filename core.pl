# core.pl v1.03 2022/06/01

##################################
# ���e�t�H�[��
##################################

sub form {

	local($name, $email, $value, $subject, $hpage, $button, ,$thread, $flag) = @_;
	local $reset = " <small><a href='$scriptrel' title='���e�Җ����̑��S�\\���ݒ�̃��Z�b�g'>*Reset</a></small>" if ($flag ne 'search1');
	print <<"EOF";
<form class="main" method="POST" enctype="multipart/form-data" action="$scriptrel">
<input type="hidden" name="action" value="$action">
���e�� <input type="text" name="name" size="20" maxlength="40" value="$name">$reset<br>
���[�� <input type="text" name="email" size="30" value="$email"><br>
�薼�@ <input type="text" name="subject" size="30" value="$subject"> 
<input type="submit" value="$button"><input type="reset" value="����"><br>
�摜 <small>(GIF JPG PNG  ��${l_width}x${l_height}px �T�C�Y${l_all_kb}KB�܂�)</small><br>
<input type=file size="30" name="filedata" accept=".gif,.jpeg,.jpg,.png"><br>
���e <small>�K���ɉ��s�����Ă��������B�摜�Ɠ��e�������Ƃ�������Ԃœ��e�{�^���������ƃ����[�h�ɂȂ�܂��B</small><br>
<textarea name="value" rows="5" cols="70" wrap="off">$value</textarea>
<input type="hidden" name="hpage" value="$hpage"><br>
EOF
	if ($codemode) {
		&aacode($code);
	}
	else {
		print "<input type='hidden' name='code' value='$code'>\n";
	}

	if ($flag eq 'search1') {
		print <<"EOF";

URL����Link<input type="checkbox" name="autolink" value="1"$chklink>
<input type="hidden" name="num" value="$num">
<input type="hidden" name="bgcolor" value="$bgc">
<input type="hidden" name="imgview" value="$imgview">
<input type="hidden" name="video" value="$video">
<input type="hidden" name="thread" value="$thread">
&nbsp;
<input type="submit" value="$button"><input type="reset" value="����">
EOF
	}
	else {
	print <<"EOF";
<font size="-1">URL����Link<input type="checkbox" name="autolink" value="1"$chklink>(���e���ɓK�p)&nbsp;
�\\������<input type="text" name="num" size="2" value="$num">&nbsp;
�w�i�F<input type="text" name="bgcolor" size="4" value="$bgc">&nbsp;
�摜�\\��<input type="checkbox" name="imgview" value="1"$chkimg>&nbsp;
YouTube����<input type="checkbox" name="video" value="1"$chkvideo>
</font>
EOF
	}

}# form end (form�^�O�͌Ăяo�����ŕ�����d�l�ł�)

sub mbform {
	local($name, $email, $value, $subject, $hpage, $button, ,$thread, $flag) = @_;
	local $reset = " <a href='$scriptrel'>*Reset</a>" if($flag ne 'search1');
	local $pclink = "��$counter &nbsp;<a href='./$scriptname'>PC</a>" if($flag ne 'search1');
	print <<"EOF";
<form class="main" method="POST" enctype="multipart/form-data" action="$scriptrel">
<input type="hidden" name="action" value="$action">
���O <input type="text" name="name" size="14" value="$name">
$pclink<br>
<input type="hidden" name="email" size="12" value="$email">
�薼 <input type="text" name="subject" size="14" value="$subject">
$reset<br>
<input type=file size="12" name="filedata" accept=".gif,.jpeg,.jpg,.png"><br>
<textarea name="value" rows="5" cols="37">$value</textarea>
<input type="hidden" name="hpage" value="$hpage"><br>
EOF
	if ($flag eq 'search1') { print "<input type='hidden' name='thread' value='$thread'>"; }
	if ($codemode == 2) {
		&aacode($code);
	}
	else {
		print "<input type='hidden' name='code' value='$code'>\n";
	}
	print <<"EOF";
<input type="submit" class="main" value="$button">
<input type="reset" value="��">
Lin<input type="checkbox" name="autolink" value="1"$chklink>
<input type="text" name="num" class="num" value="$num">
EOF

} # mbform end

sub aacode {

	local $code = shift;
	local($l1, $l2, $l3, $l4, $l5, $msg);
	local $codeA = substr($code, 0, -4);
	local $codeB = substr($code, -4, 4);
	local @lines = split(//, $codeB);
	foreach (@lines) {
if ($_ ==1 ) {
$l1 .= '�@�@���@';
$l2 .= '�@�@���@';
$l3 .= '�@�@���@';
$l4 .= '�@�@���@';
$l5 .= '�@�@���@';
}
elsif ($_== 2) {
$l1 .= '�������@';
$l2 .= '�@�@���@';
$l3 .= '�������@';
$l4 .= '���@�@�@';
$l5 .= '�������@';
}
elsif ($_ == 3) {
$l1 .= '�������@';
$l2 .= '�@�@���@';
$l3 .= '�������@';
$l4 .= '�@�@���@';
$l5 .= '�������@';
}
elsif ($_ == 4){
$l1 .= '���@���@';
$l2 .= '���@���@';
$l3 .= '�������@';
$l4 .= '�@�@���@';
$l5 .= '�@�@���@';
}
elsif ($_ == 5){
$l1 .= '�������@';
$l2 .= '���@�@�@';
$l3 .= '�������@';
$l4 .= '�@�@���@';
$l5 .= '�������@';
}
elsif ($_ == 6){
$l1 .= '�������@';
$l2 .= '���@�@�@';
$l3 .= '�������@';
$l4 .= '���@���@';
$l5 .= '�������@';
}
elsif ($_ == 7){
$l1 .= '�������@';
$l2 .= '�@�@���@';
$l3 .= '�@���@�@';
$l4 .= '���@�@�@';
$l5 .= '���@�@�@';
}
elsif ($_ == 8){
$l1 .= '�������@';
$l2 .= '���@���@';
$l3 .= '�������@';
$l4 .= '���@���@';
$l5 .= '�������@';
}
elsif ($_ == 9){
$l1 .= '�������@';
$l2 .= '���@���@';
$l3 .= '�������@';
$l4 .= '�@�@���@';
$l5 .= '�������@';
}
elsif ($_ == 0){
$l1 .= '�������@';
$l2 .= '���@���@';
$l3 .= '���@���@';
$l4 .= '���@���@';
$l5 .= '�������@';
}
	}
if (! $FORM{'mobile'}) { $msg = '����4���̐������L�����Ă�������';}
else { $msg = '���̐������L��' }
		print <<"EOF";
<input type="hidden" name="codeA" value="$codeA">
���e�R�[�h <input type="text" class="code" name="codeB" size="4"><small> ($msg)</small>
<pre class="code">$l1
$l2
$l3
$l4
$l5</pre>
EOF

} # aacode end

##################################
# �L���̏o��
##################################

sub disp {

	# �k���R�[�h�ɕϊ��L�^�������p�J���}�𕜌�
	foreach (@_) { $_ =~ s/\x00/,/g; } 
	local($date, $name, $email, $value, $subject, $hpage, $img, $w, $h, $search, $code, $thread, $flag) = @_;
	local $datenum = &digit($date);
	local( $mark, $thbutton, $size, $tagfront, $tagrear, $vflag, @vlines, $refdate, $refdatenum);
	# ���o�[�W�����f�[�^���ݎ��p�̈��S���u
	chomp($thread); 

	print "<hr><font size='+1' color='#$subjc'><b>$subject</b></font>";

	if ($email) { print "�@���e�ҁF<b><a href='mailto:$email'>$name</a></b>\n"; }
	else { print "�@���e�ҁF<font color='#$subjc'><b>$name</b></font>\n"; }

	print <<"EOF";
<font size="-1">�@���e���F$date</font> &nbsp;
<input class="search" type="submit" name="$datenum" value="��">&nbsp;
<input class="search" type="submit" name="$search" value="��">&nbsp;
EOF

	if (&digit($date) == $thread) { print "<input class='search' type='submit' name='$thread' value='��'>"; }
	elsif ($thread) { print "<input class='search' type='submit' name='$thread' value='��'>"; }

	print '<p><blockquote><pre>';

	# ���o�[�W������WEB�摜�C���^�O���c���Ă����烊���N�ɕϊ�����
	$value =~ s!<img src="([^"]+)">!<a href="$1" target="_blank" rel="noopener noreferrer">$1</a>!gi; 

	if ($w && $h) { $size = " width='$w' height='$h'"; }
	else { $size = ' width="640" height="480"'; } # ���S���u

	if (($imgview == 0 || $flag eq 'search2' || $flag eq 'thread' || ! (-e "$imgdir/$img")) && $img) { 
		if (-e "$imgdir/$img") {
			print "<font color='#ff69b4'>�A�b�v���[�h�摜�F</font><a href='$imgdir/$img' target='_blank' rel='noopener noreferrer'>$img</a>\n";
		}
		else {
			print "<font color='#ff69b4'>�A�b�v���[�h�摜�F</font><font color='#$resc'>$img (�폜�ς�)</font>\n";
		}
	}
	elsif ($img) {
		print "<img src='$imgdir/$img'$size>\n";
	}

	print "\n" if ($value && $img);

	if ($value) {
		$tagfront = "<iframe src='https://www.youtube.com/embed/";
		$tagrear = "' width='$videowidth' height='$videoheight' frameborder='0' rel='0' allowfullscreen></iframe>";
		@vlines = split(/\r/, $value);
		$vflag = 0;
		foreach (@vlines) {
			if (/^(&gt;|��)/) {
				$_ = "<font color='#$resc'>$_</font>";
			}
			elsif ($video == 1 && ! $vflag && $flag ne 'search2' && $flag ne 'thread') {
				if (m!^[^<]*?<a href="https\://youtu\.be/! && ! $vflag) {
					$_ =~ s!^([^<]*?)<a href="https\://youtu\.be/([\w\-]+)[^"]*"[^>]*>[^<]*</a>(.*)$!$1$tagfront$2$tagrear$3!;
					$vflag++;
				}
				elsif (m!^[^<]*?<a href="https\://www\.youtube\.com/! && ! $vflag && $flag ne 'search2') {
					$_ =~ s!^([^<]*?)<a href="https\://www\.youtube\.com/(embed/|v/|watch\?v=)([\w\-]+)[^"]*"[^>]*>[^<]+</a>(.*)$!$1$tagfront$3$tagrear$4!;
					$vflag++;
				}
				elsif (m!^[^<]*?<a href="https\://www\.youtube\-nocookie\.com/! && ! $vflag && $flag ne 'search2') {
					$_ =~ s!^([^<]*?)<a href="https\://www\.youtube\-nocookie\.com/embed/([\w\-]+)[^"]*"[^>]*>[^<]+</a>(.*)$!$1$tagfront$2$tagrear$3!;
					$vflag++;
				}
			}
		}
		$value = join("\n", @vlines);
		$value =~ s!<a href="(https?://[^"]+)">[^<]+</a>!<a href="$redirect?$1" target="_blank" rel="noopener noreferrer">$1</a>!g if ($redirect);
		print "$value";
	}

	print "</pre><p>\n";

	# hpage�֘A��URL�ɂ�./$scriptname���g�p
	if ($hpage =~ m!^\./$scriptname\?action=search1&search=(.*)$! && ! $FORM{'mobile'}) {
		$refdate = $1;
		$refdatenum = &digit($refdate);
		$hpage = "./$scriptname?action=search1&search=$refdatenum";
		print "<label><input class='rel' type='submit' name='$refdatenum' value='�Q�l�F'>";
		print "$refdate</label>\n";
	}

	print "</blockquote>\n";

} # disp end

sub mbdisp {

	foreach (@_) { $_ =~ s/\x00/,/g; } 
	local($date, $name, $email, $value, $subject, $hpage, $img, $w, $h, $search, $code, $thread, $flag) = @_;
	local $datenum = &digit($date);
	local( $mark, $thbutton, $size, $tagfront, $tagrear, $vflag, @vlines, $refdate, $refdatenum);
	chomp($thread); # ���o�[�W�����f�[�^���ݎ��p
	(local $prtdate = $date) =~ s!.{6}(\d\d)..(\d\d)..(.{4})(\d\d)..(\d\d).*$!$1/$2$3$4:$5!;

	print "<hr>$subject ";
	print "�F$prtdate &nbsp;<input class='search' type='submit' name='$datenum' value='��'>&nbsp;\n";
	if ($datenum == $thread) { print "<input class='search' type='submit' name='$thread' value='��'>"; }
	elsif ($thread) { print "<input class='search' type='submit' name='$thread' value='��'>"; }
	print "<br>\n";
	if ($email) { print "���O�F<a href='mailto:$email'>$name</a>&nbsp;\n"; }
	else { print "���O�F$name&nbsp;\n"; }
	# ���o�[�W������WEB�摜�������N�ɕϊ�
	$value =~ s!<img src="([^"]+)">!<a href="$1" target="_blank" rel="noopener noreferrer">$1</a>!gi; 
	local @vlines = split(/\r/, $value);
	foreach (@vlines) {
		$_ = "<span class='c2'>$_</span>" if (/^(&gt;|��)/);
	}
	$value = join("\n", @vlines);
	$value =~ s!<a href="(https?://[^"]+)">[^<]+</a>!<a href="$redirect?$1" target="_blank" rel="noopener noreferrer">$1</a>!g if ($redirect);
	if ($img) { 
		if(-e "$imgdir/$img"){
			print "<span class='c3'>�摜�F</span><a href='$imgdir/$img' target='_blank' rel='noopener noreferrer'>$img</a>\n";
		}
		else{
			print "<span class='c2'>�摜�F$img (�폜�ς�)</span>\n";
		}
	}
	print "<br>\n";
	print "<span class='article'>$value</span>\n";

} # mbdisp end

##################################
# �f�R�[�h�ƃA�b�v���[�h�摜�̋L�^
##################################

sub decode {

	if ($l_all < $ENV{'CONTENT_LENGTH'}) { &error("���e���e���傫�����܂��B�A�b�v���[�h�͉摜���܂߂čő�${l_all_kb}KB�܂łł��B", __LINE__); }
	local($name, $value);
	require $jcpl;
	binmode(STDIN);

	if ($ENV{'CONTENT_TYPE'} =~ m!multipart/form-data; boundary=(.*)!){
		local $bound = $1;
		$bound =~ s/^"(.*)"$/$1/;
		while (1) {
			while (<STDIN>) {
				last if ($_ =~ /$bound/);
				if ($_ =~ /^Content-Disposition: form-data; name="([^\"]*)"/){
					$name = $1;
					if ($name eq 'filedata') {
						&binary($_, $bound);
						$name = '';
						$value = '';
					}
					next;
				}
				$value .= $_;
			}
			$value =~ s/^\r\n//;
			$value =~ s/\r\n$//;

			&jcode'convert(*value,'sjis');
			$value = &sanitaize($value, $name);

			$FORM{$name} = $value;

			$name = '';
			$value = '';
			last if eof(STDIN);
		}
	}
	else {
		if ($ENV{'REQUEST_METHOD'} eq 'POST') { read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'}); }
		else { $buffer = $ENV{'QUERY_STRING'}; }
		foreach (split (/&/, $buffer)) {
			($name, $value) = split(/=/,$_);
			$value =~ tr/+/ /;
			$value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("H2", $1)/eg;
			&jcode'convert(*value, 'sjis');
			$value = &sanitaize($value, $name);
			if ($name eq 'data') {
				push(@{$GLOB{'logs'}}, $value);
			}
			elsif ($name eq 'delnum') {
				push(@{$GLOB{'delmsg'}}, $value);
			}
			else {
				$FORM{$name} = $value;
			}
		}
	}

	# ���e���e�����s/�󔒂݂̂̓��e�͑���~�X�Ɣ��f���ē��e���e������
	if ($FORM{'value'} =~ /^\s+$/) { $FORM{'value'} = ''; }

} # decode end

sub binary {

	if($_[0] !~ /^Content-Disposition: form-data; name="filedata"; filename="(.+)"/) { return; }
	local $bound = $_[1];
	local($type, $data, $range, $pos, @data);

	while (<STDIN>) { last if ($_ =~ /^\r\n/); } # �󔒍s���X�L�b�v

	open(DB, $imglog) || &error(1, __LINE__);
	eval 'flock (DB, 2);';
	seek(DB, 0, 0);
	$GLOB{'id'} = <DB>;
	eval 'flock (DB, 8);';
	close(DB);
	$GLOB{'id'} = sprintf ("%03d", ++$GLOB{'id'});
	open(DB, ">$imglog") || &error(1,__LINE__);
	eval 'flock(DB, 2);';
	seek(DB, 0, 0);
	print DB $GLOB{'id'};
	eval 'flock (DB, 8);';
	close(DB);

	open(TMP, ">$tmpdir/$GLOB{'id'}.tmp") || &error(1, __LINE__);
	binmode(TMP);

	read(STDIN, $_, 10);
	if (/^GIF8[7,9]a/) {
		print TMP $_;
		$type = 'gif';
		$range = 10;
	}
	elsif (/^\xFF\xD8/) {
		print TMP $_;
		$type = 'jpg';
		$range = 256*1024;
	}
	elsif (/^\x89PNG\x0d\x0a\x1a\x0a/) {
		print TMP $_;
		$type = 'png';
		$range = 24;
	}
	else{ &error('GIF JPG PNG�摜�ȊO�̓A�b�v���[�h�ł��܂���B', __LINE__); }

	local $crlf = '';
	while (<STDIN>) {
		if ($_ =~ /$bound/) { last; }
		elsif ($crlf && $_ =~ /^(.*)\r\n/) { print TMP $crlf, $1; }
		elsif( $crlf && $_ =~ /[^\r]*\n/) {
			print TMP "$crlf$_";
			$crlf = '';
		}
		elsif (! $crlf && $_ =~ /^(.*)\r\n/) {
			$crlf = "\r\n";
			print TMP $1;
		}
		else{ print TMP $_; }
	}

	close(TMP);

	open(DATA, "$tmpdir/$GLOB{'id'}.tmp"); 
	binmode (DATA);
	read(DATA, $data, $range);
	close(DATA);

	if ($type eq 'jpg') {
		if ($data =~ /ImplantArchive/) { $pos = index($data, "\xff\xc0"); }
		elsif ($data =~ /\xff\xc2/) { $pos = rindex($data, "\xff\xc2"); }
		else{ $pos = rindex($data, "\xff\xc0"); }
		if ($pos == -1) { &error('�摜�T�C�Y(width/height)�̎擾�Ɏ��s���܂����B', __LINE__); }
		@data = split(//, substr($data, $pos + 5, 4));
		foreach (@data) { $_ = ord; };
		$GLOB{'imgw'} = 256 * $data[2] + $data[3];
		$GLOB{'imgh'} = 256 * $data[0]+ $data[1];
	}
	elsif ($type eq 'gif') {
		@data = split (//, substr($data, 6, 4));
		foreach (@data) { $_ = ord; }
		$GLOB{'imgw'} = 256 * $data[1] + $data[0];
		$GLOB{'imgh'} = 256 * $data[3] + $data[2];
	}
	elsif ($type eq 'png'){
		@data = split(//, substr($data, 16, 8));
		foreach (@data) { $_ = ord; }
		$GLOB{'imgw'} = 65536 * $data[0] + 4096 * $data[1] + 256 * $data[2] + $data[3];
		$GLOB{'imgh'} = 65536 * $data[4] + 4096 * $data[5] + 256 * $data[6] + $data[7];
	}

	if ($l_width < $GLOB{'imgw'} || $l_height < $GLOB{'imgh'}) { &error("�A�b�v���[�h�ł���摜�͒���${l_width}px�܂łł��B", __LINE__); }

	$GLOB{'img'} = "$GLOB{'id'}.$type";
	if (-e "$imgdir/$GLOB{'img'}") {
		unlink("$tmpdir/$GLOB{'id'}.tmp");
		&error(3, __LINE__);
	}
	rename("$tmpdir/$GLOB{'id'}.tmp", "$imgdir/$GLOB{'img'}");

	$GLOB{'imgsize'} = -s "$imgdir/$GLOB{'img'}";

} # binary end

sub sanitaize {

	local($value, $name) = @_;
	$value =~ s/\r\n/\r/g;
	$value =~ s/\n/\r/g;
	if ($name eq 'hpage'){
		$value =~ s/[<>"'\s]//g;
	}
	else{
		$value =~ s/&/&amp\;/g;
		$value =~ s/</&lt\;/g;
		$value =~ s/>/&gt\;/g;
		$value =~ s/"/&quot;/g;
		$value =~ s/'/&#39;/g;
	}
	return $value;

} # sanitaize end

##################################
# ���e�L�^����
##################################

sub register {

	local $name = $FORM{'name'};
	local $subject = $FORM{'subject'};
	$name = ' ' if ($name eq ''); 
	$subject = ' ' if ($subject eq '');
	$FORM{'thread'} = &digit($datenow) if (! $FORM{'thread'});

	# $FORM{'hpage'}(�����X�Q�ƌ������Nor��ʃ����N�A���s�̓��X�Q�ƌ������N��p)�̏���#(hpage�֘A��URL�ɂ�./$scriptname���g�p)
	if ($FORM{'hpage'} !~ m!^\./$scriptname\?action=search1&search=\d{4}�N\d{2}��\d{2}��\(..\)\d{2}��\d{2}��\d{2}�b$!) { $FORM{'hpage'} = ''; }

	if ($l_name < length $FORM{'name'})       { &error("���O���������܂��B�ő�$l_name byte�܂łł��B", __LINE__); }
	if ($l_email < length $FORM{'email'})     { &error("���[���A�h���X���������܂��B�ő�$l_email byte�܂łł��B", __LINE__); }
	if ($l_subject < length $FORM{'subject'}) { &error("�薼���������܂��B�ő�$l_subject byte�܂łł��B", __LINE__); }
	if ($l_value < length $FORM{'value'})     { &error("���e���������܂��B�ő�$l_value byte�܂łł��B", __LINE__); }
	if ($l_line < ($FORM{'value'} =~ tr/\r/\r/) + 1) { &error("���e�̍s�����������܂��B�ő�$l_line �s�܂łł��B", __LINE__); }

	# �X�p���΍�
	if ($spammode == 2 || ($spammode == 1 && ! $GLOB{'img'})) {
		local $urlcount = 0;
		local $value = $FORM{'value'};
		local $valuecode = &jcode'getcode(*value);
		while ($value =~ m!https?://!gi) {
			$urlcount++;
			if (2 < $urlcount && $ENV{'HTTP_ACCEPT_LANGUAGE'} !~ /^ja/) {
				&error('���{���Ή��̃u���E�U�����e���e��URL��3�ȏ゠�邽�߃X�p���Ƃ݂Ȃ���܂����B', __LINE__);
			}
			elsif (2 < $urlcount && $valuecode !~ /sjis|jis|euc|utf8/) {
				&error('���e���e��URL��3�ȏ゠��A���{����܂܂�Ă��Ȃ����߃X�p���Ƃ݂Ȃ���܂����B', __LINE__);
			}
			elsif (5 <$urlcount) {
				&error('���e���e��URL���������邽�߃X�p���Ƃ݂Ȃ���܂����B��x�ɏ������߂�URL��5�܂łł��B', __LINE__);
			}
		}
	}

	local $adminpass;
	open(PAS, $passfile) || &error(1, __LINE__);
	chomp($adminpass = <PAS>);
	close(PAS);

	local $formname = $name;
	local($formnameord, $namezord);

	if ($formname eq $nameng) { &error('xx', __LINE__); }

	if (crypt($formname, $adminpass) eq $adminpass) {
		if ($FORM{'value'} eq $adminkey) {
			if ($GLOB{'img'}) {
				&del_currentimg;
				&reset_currentid;
				&cleanup_tmpdir;
			}
			&admintop($formname);
		}
		else {
			$formname = $namez;
			$FORM{'email'} = $mailz;
		}
	}
	else {
		foreach (split(//, $formname)) {
			$formnameord .= ord($_);
		}
		foreach (split(//, $namez)) {
			$namezord .= ord($_);
		}
		if ($formnameord =~ /$namezord/) {
			$formname = "<small>$formname</small>";
		}
		$formname =~ s/����/���́K/g;
	}

	local $search = &encode($formname);

	$FORM{'value'} =~ s!(https?://)!\x00$1!g if ($FORM{'autolink'}); # URL���ꎞ�I�ɕ���

	local @lines = split(/\r/, $FORM{'value'});
	local $i = 0;
	foreach (@lines) {
		next if (/^&gt;|��/ || /^\s$/);
		$i++;
		last;
	}
	if (! $i && $FORM{'hpage'} && ! $GLOB{'img'}) { &error('�t�H���[���e�ň��p�s(+���s/��)�݂̂̓��e�͂ł��܂���B�����R�����g���������摜��I�����Ă��������B', __LINE__); }

	if ($FORM{'autolink'}) {
		foreach (@lines) {
			next if (/^&gt;|��/);
			$_ =~ s!(https?://)([\w/=~@#%&';:,\.\-\+\?\(\)\[\]\{\}\^\|\*\$\!\\]+)!<a href="$1$2" target="_blank" rel="noopener noreferrer">$1$2</a>!g;
		}
		$FORM{'value'} = join("\r", @lines);
		$FORM{'value'} =~ s/\x00//g; # URL�����Ɏg�p�����Z�p���[�^������
	}

	@lines = ();
	open(DB, $bbsfile) || &error(1, __LINE__);
	binmode(DB);
	eval 'flock (DB, 2);';
	@lines = <DB>;
	eval 'flock (DB, 8);';
	close(DB);

	if (($codemode == 1 && ! $FORM{'mobile'}) || $codemode == 2) {
		$FORM{'code'} = $FORM{'codeA'} . $FORM{'codeB'};
		if ($FORM{'codeB'} !~ /^\d{4}$/) { &error('���e�R�[�h�������͂����p�����ȊO�̂��̂ɂȂ��Ă��܂��B', __LINE__); }
	}

	foreach (@lines) {
		local $code0 = (split(/\,/, $_))[10];
		chomp $code0;
		if ($code0 == $FORM{'code'}) { &error('���e�R�[�h���g�p�ς݂ł��B�f���������[�h���ĉ������B', __LINE__); }
	}

	&chkcode($FORM{'code'});

	$i = 0;
	local(@new);
	foreach (@lines) {
		$i++;
		last if ($i == $l_record);
		push (@new, $_);
	}

	foreach (@lines[0..($check - 1)]) {
		local($d, $d, $d, $value, $d, $d, $img) = split(/,/, $_);
		if ($GLOB{'img'} && $img && (-s "$imgdir/$img") == (-s "$imgdir/$GLOB{'img'}") && $FORM{'value'} eq $value) {
			&error('���e���e���d�����Ă��܂��B�摜�������͓��e(�R�����g)��ύX���Ă��������B', __LINE__);
		}
		elsif (! $GLOB{'img'} && ! $img && $FORM{'value'} eq $value) {
			&error('���e���e(�R�����g)���d�����Ă��܂��B', __LINE__);
		}
	}

	local @values = ($datenow, $formname, $FORM{'email'}, $FORM{'value'}, $subject, $FORM{'hpage'}, $GLOB{'img'}, $GLOB{'imgw'}, $GLOB{'imgh'}, $search, $FORM{'code'}, $FORM{'thread'},'');
	foreach (@values) { $_ =~ s/,/\x00/g; } # �f�[�^���̑S�Ă� , ��\x00�ɕϊ�
	local $newmsg = join(',', @values) . "\n";
	unshift(@new, $newmsg);

	open(DB, ">$bbsfile") || &error(1, __LINE__);
	binmode(DB);
	eval 'flock (DB, 2);';
	print DB @new;
	eval 'flock (DB, 8);';
	close(DB);

	# �摜�e��/�t�@�C�����Ǘ�
	if ($GLOB{'img'} && $imgctrl eq 'size') {
		local @tmp = &dirinfo($imgdir);
		local $sum = shift(@tmp);
		local $delsum = 0;
		local $usage = sprintf('%.1f', $sum / 1024 /1024);
		if ($l_imgdir < $sum + $l_all) {
			foreach (@tmp){
				last if ($sum - $delsum < $l_imgdir - $l_all);
				$delsum += $$_[1];
				unlink("$imgdir/$$_[0]");
			}
			$usage = sprintf('%.1f', ($sum - $delsum) / 1024 /1024);
		}
		open(DB, ">$dirinfofile");
		print DB $usage;
		close(DB);
		&cleanup_tmpdir;
	}
	elsif ($GLOB{'img'} && $imgctrl eq 'num') {
		&del_oldimg;
		&cleanup_tmpdir;
	}

	&pushlog(@values);
	&add($formname) if ($rankkey);

	&html;

} # register end

sub pushlog {

	# �ϊ��������p�J���}�𕜌�
	foreach (@_) { $_ =~ s/\x00/,/g; }

	local($date, $name, $email, $value, $subject, $hpage, $img) = @_;

	# �ϊ����ꂽ���s�L���𓝈�
	$value =~ s/\r\n|\r/\n/g if ($value);

	if (!(-s $logfiledate)) {
		open(LOG,">$logfiledate") || &error(2, __LINE__);
		print LOG "<html><head><title>$title</title></head>\n";
		print LOG qq!<body bgcolor="#$bgcdef" text="#$textc" link="#$linkc" vlink="#$vlinkc" alink="#$alinkc">\n!;
		print LOG "<big><b>$title $year�N$mon���ߋ����O</b></big>\n";
		close (LOG);
	}

	open (LOG, ">>$logfiledate") || &error(2, __LINE__);
	print LOG qq!<hr><font size="+1" color="#$subjc"><b>$subject</b></font>!;
	
	if ($email) { print LOG qq!�@���e�ҁF<b><a href="mailto:$email">$name</a></b>\n!; }
	else { print LOG qq!�@���e�ҁF<font color="#$subjc"><b>$name</b></font>\n!; }

	print LOG qq!<font size="-1">�@���e���F$datenow</font><p>\n<blockquote><pre>\n!;

	# log�f�B���N�g������̑��Ύw��ŃA�b�v���[�h�摜��../$imgdir/$img

	print LOG qq!<font color="#ff69b4">�A�b�v���[�h�摜�F</font><a href="../$imgdir/$img" target="img">$img</a>\n! if ($img);

	print LOG "\n" if($value && $img);

	print LOG "$value" if($value);

	print LOG "</pre><p>\n";
	# hpage�֘A��URL�ɂ�./$scriptname���g�p
	if ($hpage =~ m!^\./$scriptname\?action=search1\&search=(.*)$!) {
		print LOG "<u>�Q�l�F$1</u><p>\n";
	}

	print LOG "</blockquote>\n";

	close(LOG);

} # pushlog end

##################################
# �t�H���[���e�T�[�`
##################################

sub search1 {

	&header;
	print <<"EOF";
<title>$title</title>
$css
</head>
$body
<form class="article" method="POST" action="$scriptrel">
$baseinput
<font size=+1><b>�t�H���[�L�����e</b></font> &nbsp;
<input type="submit" value="�߂�">

EOF

	local($found, $value, @lines, @data, @vlines);

	open(DB, $bbsfile) || &error(2, __LINE__);
	@lines = <DB>;
	close(DB);

	foreach (@lines) {
		@data = split(/,/, $_);
		chomp($data[11]); # ���f�[�^���ݎ��p�ɂ�����chomp
		local $date = &digit($data[0]);
		if ($date eq $FORM{'search'}) { 
			push(@data, 'search1'); # &disp�ɓn���t���O�ǉ�
			$found++; 
			last; 
		}
	}

	if ($found) {
		if (! $FORM{'mobile'}) { &disp(@data); }
		else{ &mbdisp(@data); }
		print "</form><hr>\n";
		$value = $data[3];
		if ($value) {
			$value =~ s/<img src="(.*?)">/$1/g;
			$value =~ s/<a href=[^>]+>([^<]+)<\/a>/$1/g;
			@vlines = split(/\r/,$value); # ���X���e�Ɉ��p����t����i���p�͍ő�3�i�܂Łj
			$value = '';
			foreach (@vlines) {
				if ($_ !~ /^&gt; &gt; &gt; .*/) { $value .= "&gt; $_\n"; }
			}
			$value .= "\n";
		}
		# hpage�֘A��URL�ɂ�./$scriptname���g�p
		print "<font color='#ff69b4'></font>�����p������URL��checkbox�̏�Ԃ��킸�����N�Ɏ����ϊ�����܂���B�A�b�v���[�h�摜�͈��p����܂���B<br><br>\n\n";
		local @parm = ($FORM{'name'}, $FORM{'email'}, $value, "��$data[1]", "./$scriptname?action=search1&search=$data[0]", '      ���e      ', $data[11], 'search1');
		if (! $FORM{'mobile'}) { &form(@parm); }
		else{ &mbform(@parm); }
		print "</form><p>\n";
	}
	else {
		print "�@�݂���܂���B���L�����폜���ꂽ�\\��������܂��B<br>";
	}

	&footer;

} # search1 end


##################################
# ���e�Җ��T�[�`
##################################

sub search2 {

	local($name, $found, @lines, @data);
	local $searchname = $FORM{'searchname'};
	$searchname =~ s/%25/%/g;
	$searchname =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("H2", $1)/eg;
	local $name = $searchname;
	$searchname =~ s/,/\x00/g; # �L�^�t�@�C���f�[�^�ƃt�H�[�}�b�g�����킹��

	&header;
	print <<"EOF";
<title>$title</title>
$css
</head>
$body
<form class="article" method="POST" action="$scriptrel">
$baseinput
<font size="+1"><b>���e�Җ��T�[�`�u$name�v</b></font><small>(�ő�$l_search2���\\��)</small> &nbsp;
<input type="submit" value="�߂�">
EOF

	open(DB, $bbsfile) || &error(2, __LINE__);
	chomp(@lines = <DB>);
	close(DB);
	
	if( $ngsearch == 1 && ( $name eq ' ' || $name eq '�@' ) ) { 
		print "<br><br>�G���[ : ���por�S�p�X�y�[�X1�̓��e�Җ����T�[�`���邱�Ƃ͂ł��܂���B\n";
		&footer;
	}
	elsif ($ngsearch == 2 && length ( $name ) == 1) {
		print "<br><br>�G���[ : ���p1����(1byte)�̓��e�Җ����T�[�`���邱�Ƃ͂ł��܂���B\n";
		&footer;
	}

	$found = 0;
	foreach (@lines) {
		@data = split(/,/, $_);
		chomp($data[11]); # ���f�[�^���ݎ��p
		if ($data[1] eq $searchname) {
			$found++;
			push(@data, 'search2'); # &disp�ɓn���t���O�ǉ�
			&disp(@data);
		
		}
		if ( $l_search2 <= $found ) {
			print "<hr>�L����$l_search2���𒴂��܂����B����ȍ~�̋L���͏ȗ�����Ă��܂��B\n"; 
			last;
		}
	}
	print "</form>\n";
	
	if ($rankkey) {
		print "<hr>�����̓��e���F";
		print &how_much($searchname);
	}
	print "�݂���܂���<br>" if ($found == 0);

	print "<br><a href='$scriptrel#top'>��TOP</a>\n";

	&footer;

} # search2 end

##################################
# �X���b�h�\��
##################################

sub thread {

	local($found, @lines, @data);
	local $threadname = substr($FORM{'thread'}, 4, 4);
	&header;
	print <<"EOF";
<title>$title</title>
$css
</head>
$body
<form class="article" method="POST" action="$scriptrel">
$baseinput
<font size="+1"><b>�X���b�h $threadname*</b></font> &nbsp;
<input type="submit" value="�߂�">
EOF

	open(DB, $bbsfile) || &error(2, __LINE__);
	$found = 0;
	while (<DB>) {
		chomp $_;
		@data = split(/,/, $_);
		if ($data[11] eq $FORM{'thread'}) {
			$found++;
			push(@data, 'thread'); # &disp�ɓn���t���O�ǉ�
			if (! $FORM{'mobile'}) { &disp(@data); }
			else{ &mbdisp(@data); }
			last if (&digit($data[0]) eq $FORM{'thread'});
		
		}
		if ( $l_thread <= $found ) {
			print "<hr>�L����$l_thread���𒴂��܂����B����ȍ~�̋L���͏ȗ�����Ă��܂��B\n"; 
			last;
		}
	}
	close(DB);

	print "</form>\n";
	print "�݂���܂���<br>" if ($found == 0);
	print "<br><a href='$scriptrel#top'>��TOP</a>\n";
	
	&footer;

} # thread end

##################################
# ���e�����L���O(by ����׎�)
##################################

sub viewrank {

	&header;
	print <<"EOF";
<title>$title</title>
</head>
$body
<center>
<table width=80% border=0><tr><td align="center">
	<font size=+1><b>$title ���e�����L���OTOP10</b></font>
</tr></td></table>
<p>
EOF
	opendir(DIR, $rankdir) || &error(2, __LINE__);

	foreach(grep(/^\d+/,readdir(DIR))){ # DB�t�@�C����(�g���q���������擪����)�擾
		$_ =~ s/\D//g;
		push(@rankfiles, $_);
	}

	%count=();
	@rankfiles = reverse sort grep(! $count{$_}++, @rankfiles); # �d���r��

	$page = ($FORM{'rankpage'} || 0);
	(($pageend = $page+$rankdef-1) > $#rankfiles) && ($pageend = $#rankfiles);

	foreach $rankfile (@rankfiles[$page..$pageend]){
		$rankyear = substr($rankfile,0,4);
		$rankmon = substr($rankfile,4,2);
		dbmopen(%DB,"$rankdir/$rankfile",0666);
		$total=0;
		foreach(values(%DB)){ $total += $_; }
		print <<"EOF";
<table width=80% border=0><tr><td align="left">
<font size=+1>$rankyear�N$rankmon��</font>�@���e���F$total
</td></tr></table>
<table width=80% border=1>
<tr><th>����</th><th>���O</th><th>��</th><th>����</th></tr>
EOF
		$kazu = $i = 1;
		foreach(sort {$DB{$b} <=> $DB{$a}} keys(%DB)){
			if ($kazu != $DB{$_}){ last if ($i>10); $rank="$i��";}
			else { $rank="�@"; }
			$kazu = $DB{$_};
			$percent = sprintf("%4.1f",($DB{$_} / $total*100));
			print <<"EOF";
<tr>
<th align="center">$rank</th>
<td><b>$_</b></td>
<td align="right"><b>$DB{$_}</b></td>
<td align="right"><b>$percent</b>%</td>
</tr>
EOF
			$i++;
		}
		dbmclose(%DB);
		print "</table>\n<p>\n";
	}

	(($rankfront = $page-$rankdef) < 0) && ($rankfront = 0);
	(($ranknext = $page+$rankdef) > ($rankend = $#rankfiles-$rankdef+1)) && ($ranknext = $rankend);
	if ($pageend < $#rankfiles){
		print "<a href=\"$scriptrel?bgcolor=$bgc&action=ranking&rankpage=$rankend\">����</a>\n";
		print "<a href=\"$scriptrel?bgcolor=$bgc&action=ranking&rankpage=$ranknext\">���Â��ق���</a>\n";
	}
	if ($page > 0){
		print "<a href=\"$scriptrel?bgcolor=$bgc&action=ranking&rankpage=$rankfront\">�V�����ق��ց�</a>\n";
		print "<a href=\"$scriptrel?bgcolor=$bgc&action=ranking&rankpage=0\">����</a>\n";
	}
	print <<"EOF";
</center>
</body></html>
EOF

	exit;

} # viewrank end

sub add {

	$name = $_[0];
	dbmopen(%DB,$rankfile,0666);
	$DB{$name}++;
	dbmclose(%DB);

} # add end

sub how_much {

	$name = $_[0];
	dbmopen(%DB,$rankfile,0666);
	$kazu = $DB{$name};
	dbmclose(%DB);
	$kazu = 0 if ($kazu eq '');
	return($kazu);

} # how_much end


##################################
# �ߋ����O�I���y�[�W
##################################

sub selectlog {

	local(@logs, $i, $chk, $count, $log, $size, $logyear, $logmon, $logname, $sel);

	opendir(LOG, $logdir) || &error(2, __LINE__);
	@logs = sort { $a <=> $b } grep(/\.html$/, readdir(LOG));
	close (LOG);

	&header;
	print <<"EOF";
<title>$title�ߋ����O</title>
</head>
$body
<p>
<font size=4><b>$title�ߋ����O</b></font>
<form method="POST" action="$scriptrel">
<input type="hidden" name="action" value="getlog">
<hr><pre>
EOF

	foreach $log (@logs) {
		$chk = '';
		$count = 0;
		open(IN, "$logdir/$log");
		while (<IN>) { $count++ if (/<blockquote>/); }
		close (IN);
		$size = (stat("$logdir/$log"))[7];
		$logyear = substr($log, 0, 4);
		$logmon = substr($log, 4, 2);
		$logname = "$logyear�N$logmon��";
		if ($i == $#logs) { $chk = ' checked'; }
		printf("<input type='checkbox' name='data' value='$log'$chk> <a href='$logdir/$log'>$logname</a>    %6s byte   $count��\n", $size);
		$i++;
	}

	print "</pre>���t�F<select name='start'>\n";
	for ($i = 1; $i <= 31; $i++) {
		$sel = ' selected' if ($i == 1);
		print "<option value='$i'$sel>";
		printf("%02d\n", $i);
		$sel = '';
	}
	print "</select>������\n";
	print "<select name='end'>\n";
	for ($i = 1; $i <= 31; $i++){
		$sel = ' selected' if ($i == 31);
		print "<option value='$i'$sel>";
		printf("%02d\n", $i);
	}

	print <<"_HTML_";
</select>���܂�
<p>
<select name="search">
<option value="all" selected>�S��
<option value="name">���e��
<option value="subject">�薼
</select>
<select name="command">
<option value="NORMAL" selected>�ʏ팟��
<option value="AND">AND����
<option value="OR">OR����
</select>
<input type="text" name="keyword" size="30" maxlength="$l_keyword"><p>
<input type="submit" value="�ǂݍ���/����">�@
<input type="checkbox" name="opt_i" value="1" checked>�啶������������ʂ��Ȃ�<p>
�����������񖳂��� [�ǂݍ���/����] �{�^���������ƑI���������O�����ׂĕ\\�����܂�(�ő�$l_logsearch��)
</form>
_HTML_

	&footer;

} # selectlog end


##################################
# �ߋ����O�\��
##################################

sub getlog {

	local(@logs, $warn, $search, $command, $keyword, @keyword, $line, $hitlimit, $printed, @re, $hit, $hitall);

	@logs = sort { $a <=> $b } grep (/^\d{6}\.html$/, @{$GLOB{'logs'}});

	&header;
	print <<"EOF";
<title>$title�ߋ����O</title>
$css
</head>
$body
<p><font size="+1"><b>
EOF

	foreach (@logs) { print "$_ "; }

	print "</b></font> (�ő�$l_logsearch��) &nbsp; <a href='$scriptrel?action=selectlog'>���O�I����ʂɖ߂�</a><hr>\n";

	$warn = '';

	if ($l_keyword < length$FORM{'keyword'}) { 
		$warn .= "<br><br>�����L�[���[�h�͔��p$l_keyword�����ȓ��ɂ��Ă��������B\n";
	}

	if($ngsearch == 1 && ($FORM{'keyword'} eq ' ' || $FORM{'keyword'} eq '�@')) { 
		$warn .= "<br><br>�G���[ : �L�[���[�h\"���por�S�p�X�y�[�X1��\"�ŉߋ����O�T�[�`���邱�Ƃ͂ł��܂���B\n";
	}
	elsif($ngsearch == 2 && length( $FORM{'keyword'} ) == 1) {
		$warn .=  "<br><br>�G���[ : �L�[���[�h\"���p1����(1byte)\"�ŉߋ����O�T�[�`���邱�Ƃ͂ł��܂���B2�����ȏ�̃L�[���[�h���w�肵�Ă��������B\n";
	}

	if ($warn) {
		print $warn;
		&footer;
	}

	if ($FORM{'keyword'}) {
		if ($FORM{'search'} eq 'all') { $search = "�S�� $FORM{'command'}����"; }
		elsif ($FORM{'search'} eq 'name') { $search = "���e�� $FORM{'command'}����"; }
		elsif ($FORM{'search'} eq 'subject') { $search = "�薼 $FORM{'command'}����"; }

		$command = $FORM{'command'};
		if ($command eq 'NORMAL') {
			$keyword = quotemeta($FORM{'keyword'});
			$keyword = qr/$keyword/i if ($FORM{'opt_i'});
		}
		else {
			$FORM{'keyword'} =~ tr/ / /s;
			$FORM{'keyword'} =~ s/^ | $//g;
			@keyword = split (/ /, $FORM{'keyword'});
			foreach (@keyword) {
				$_ = quotemeta($_);
				$_ = qr/$_/i if($FORM{'opt_i'});
			}
			$keyword = join("|", @keyword) if ($command eq 'OR');
		}
	}

	$/ = '<hr>'; #���̓��R�[�h�Z�p���[�^��\n����<hr>�ɕύX

	$hitlimit = 0;
	$printed = 0;
	foreach $logdata (@logs){ # �ߋ����O�o��

		open(LOG,"$logdir/$logdata") || print '�����̉ߋ����O�͂܂��쐬����Ă��܂���B<br><br>';

		LOOP: while ($line = <LOG>) {
			chomp $line;
			$line =~ />�@���e���F[^<]*(\d{2}).?.?\(..\)/;
			next if ($1 < $FORM{'start'} || $FORM{'end'} < $1);

			if ($FORM {'keyword'}) {
				if ($FORM{'search'} eq 'all') {
					if ($command eq 'AND') {
						foreach $keyword (@keyword) { next LOOP if ($line !~ /$keyword/); }
					}
					else { next LOOP if($line !~ /$keyword/); }
				}
				elsif ($FORM{'search'} eq 'name') {
					if ($command eq 'AND') {
						foreach $keyword (@keyword) { next LOOP if ($line !~ /���e�ҁF<[^>]+><b>[^<]*$keyword[^<]*</); }
					}
					else { next LOOP if($line !~ /���e�ҁF<[^>]+><b>[^<]*$keyword[^<]*</); }
				}
				elsif ($FORM{'search'} eq 'subject') {
					if ($command eq 'AND') {
						foreach $keyword (@keyword) { next LOOP if ($line !~ /<font size=[^>]+><b>[^<]*$keyword[^<]*</); }
					}
					else { next LOOP if ($line !~ /<font size=[^>]+><b>[^<]*$keyword[^<]*</); }
				}
			}

			# �A�b�v���[�h�摜�̏����i���債���ȌŗL�j
			$line =~ s!<a href="\.\./([^"]*?\.(jpg|gif|png))"!<a href="$1"!g;
			# ���p����
			@re = split(/\r\n|\r|\n/, $line);

			foreach (@re) {
				if (/^(��|&gt;)/) { $_ = "<font color='#$resc'>$_</font>"; }
				elsif(/^<blockquote><pre>((��|&gt;).*)/){ # ver3.01�ȍ~�̉ߋ����O�ł͂��̕����͕s�v
					$_ = "<blockquote><pre><font color=\"#$resc\">$1</font>";
				}
			}

			$line =join("\n", @re);
			$line =~ s/<a href="(https?:\/\/[^"]+)">[^<]+<\/a>/<a href="$redirect?$1">$1<\/a>/g if ($redirect);
			print "$line<hr>";
			$hit++;
			$printed++;

			if( $l_logsearch <= $printed ) {
				$hitlimit = 1;
				last;
			}
		}

		close(LOG);

		if ($FORM{'keyword'} && $hit) {
			print "<font size='+1' color='#ff69b4'><b>$logdata $search�F$FORM{'keyword'} ��$hit���݂���܂����B</b></font><hr>\n";
			$hitall += $hit;
		}
		elsif ($FORM{'keyword'}) {
			print "<font size='+1' color='#ff69b4'><b>$logdata $search�F$FORM{'keyword'} �݂͂���܂���ł����B</b></font><hr>\n";
		}

		$hit = '';
		last if ($hitlimit);

	} # �ߋ����O�o�͏I��

	$/ = "\n"; # �Z�p���[�^�����ɖ߂�

	if ($hitlimit) {
		print "<font size='+1' color='#ff69b4'><b>Hit����$l_logsearch���𒴂������ߏo�͂����f����܂����B�������[�h�܂��͑I�����O�����������Ă��������B</b></font><hr>\n";
	}

	if ($FORM{'keyword'} && $hitall) {
		print "<font size='+1'><b>";
		print "$search�F$FORM{'keyword'} �͍��v$hitall���݂���܂����B</b></font>�@ \n";
	}

	print "<a href='$scriptrel?action=selectlog'>���O�I����ʂɖ߂�</a>\n";

	&footer;

} # getlog end


##################################
# �Ǘ����[�h
##################################

#------------------�p�X���[�h�F��

sub chkpass {

	local $pass = $FORM{'pass'};
	local $adminpass;
	open(PAS, $passfile) || &error(2, __LINE__);;
	chomp($adminpass = <PAS>);
	close(PAS);
	if (crypt ($pass, $adminpass) ne $adminpass) { &error('�p�X���[�h���s���ł��B�ē��͂��ĉ������B', __LINE__); }

} # chkpassword end

#------------------���O�C�����

sub admintop {

	$FORM{'pass'} = $_[0] if ($_[0]);

	&header;
	print <<"EOF";
<title>$title�Ǘ����[�h</title>
$css
</head>
$body
<form class="back" method="POST" action="$scriptrel">
$baseinput
<p><font size=+1><b>$title�Ǘ����[�h</b></font> &nbsp;
<input type="submit" value="�f���ɖ߂�">
</form>
<hr>
<form class="admin" method="POST" action="$scriptrel">
$baseinput
<input type="hidden" name="pass" value="$FORM{'pass'}">
�L���폜 <input type="radio" name="action" value="delform" checked> &nbsp;
�p�X���[�h�ύX <input type="radio" name="action" value="passform"><p>
<input type="submit" value="    ����    ">
</form>
EOF

	&footer;

} # admintop end

#------------------�p�X���[�h�쐬�t�H�[��

sub passform {

	local $warn = $_[0];
	local $info;
	if( $warn) { $info = "<p><font color='red'>$warn</font><br>"; }
	if ($FORM{'pass'}) { $info .= "<p>���݂̃p�X���[�h�F$FORM{'pass'}"; }

	&header;
	print <<"EOF";
<title>$title�Ǘ����[�h</title>
$css
</head>
$body
<form class="admin" method="POST" action="$scriptrel">
<input type="hidden" name="action" value="admintop">
$baseinput
<input type="hidden" name="pass" value="$FORM{'pass'}">
<input type="submit" value="�Ǘ����[�hTOP">
</form> &nbsp;

<form class="back" method="POST" action="$scriptrel">
$baseinput
<input type="submit" value="�f���ɖ߂�">
</form><br><br>

<font size="+1"><b>�p�X���[�h�ݒ�/�ύX</b></font><hr>
<p>$info
<form method="POST" action="$scriptrel">
<input type="hidden" name="action" value="registerpass">
$baseinput
<input type="hidden" name="pass" value="$FORM{'pass'}">
�V�����p�X���[�h�F<input type="text" name="newpass" size="12" maxlength="12">
�i���p�p��4�`12�����œ��́j<p>
<input type=submit value="�p�X���[�h�ݒ�"></form>
EOF
	&footer;

} # passform end

#------------------�폜�t�H�[��

sub delform {

	open(IN, $bbsfile) || &error(2, __LINE__);
	local @lines = <IN>;
	close(IN);

	&header;
	print <<"EOF";
<title>$title�Ǘ����[�h</title>
$css
</head>
$body
<form class="admin" method="POST" action="$scriptrel">
$baseinput
<input type="hidden" name="action" value="admintop">
<input type="hidden" name="pass" value="$FORM{'pass'}">
<input type="submit" value="�Ǘ����[�hTOP">
</form> &nbsp;

<form class="back" method="POST" action="$scriptrel">
$baseinput
<input type="submit" value="�f���ɖ߂�">
</form><br><br>

<font size="4"><b>�폜���[�h</b></font>
<p>���e���� : ���O : �薼 : ���e
<hr><form method="POST" action="$scriptrel">
$baseinput
<input type="hidden" name="action" value="delmsg">
<input type="hidden" name="pass" value="$FORM{'pass'}">
<input type="submit" value="�@�@�폜�@�@"><p>
<pre>
EOF

	foreach (@lines) {
		local ($date, $name, $email, $value, $subject) =  split(/,/ ,$_);
		foreach ($name, $subject, $value) { $_ =~ s/\x00/,/g; }
		local $datenum = &digit($date);
		$name = substr($name, 0, 20);
		$subject = substr($subject, 0, 20);
		$value = substr($value, 0, 30);
		foreach ($name, $subject, $value) {
			$_ =~ s/</&lt;/g;
			$_ =~ s/>/&gt;/g;
			$_ =~ s/\s/ /g;
		}
		local $out = sprintf("$date : %-20s : %-20s : %-30s ", $name, $subject, $value);
		print "<input type='checkbox' name='delnum' value='$datenum'>$out\n";
	}

	print <<"EOF";
</pre>
<p><input type="submit" value="    �폜    "></form><hr>
<form class="admin" method="POST" action="$scriptrel">
$baseinput
<input type="hidden" name="action" value="admintop">
<input type="hidden" name="pass" value="$FORM{'pass'}">
<input type="submit" value="�Ǘ����[�hTOP">
</form> &nbsp;

<form class="back" method="POST" action="$scriptrel">
$baseinput
<input type="submit" value="�f���ɖ߂�">
</form><br>
EOF
	&footer;

} # delform end

#------------------�Í����p�X���[�h�o��

sub registerpass {

	local $warn = '';
	if (length $FORM{'newpass'} < 4)     { $warn = '�p�X���[�h��4�����ȏ�̔��p�p���������g�p���ĉ������B'; }
	elsif (12 < length $FORM{'newpass'}) { $warn = '�p�X���[�h��12�����ȓ��̔��p�p���������g�p���ĉ������B'; }
	elsif ($FORM{'newpass'} =~ /\W/)     { $warn = '�p�X���[�h�͔��p�p���������g�p���ĉ������B'; }

	if ($warn) {
		&passform($warn);
		exit; # ���S���u
	}

	local $crpass = crypt($FORM{'newpass'}, em);

	open(PAS, ">$passfile") || &error(2, __LINE__);
	print PAS $crpass;
	close(PAS);

	&header;
	print <<"EOF";
<title>$title�Ǘ����[�h</title>
$css
</head>
$body
<form class="admin" method="POST" action="$scriptrel">
$baseinput
<input type="hidden" name="action" value="admintop">
<input type="hidden" name="pass" value="$FORM{'newpass'}">
<input type="submit" value="�Ǘ����[�hTOP">
</form> &nbsp;

<form class="back" method="POST" action="$scriptrel">
$baseinput
<input type="submit" value="�f���ɖ߂�">
</form><br><br>
<hr>
<font size=4><b>�Ǘ��҃p�X���[�h�o�^����</b></font><br><br>
�V�����Ǘ��҃p�X���[�h�́u<font color="#cc0000">$FORM{'newpass'}</font>�v�ł��B
<br><br>
EOF
	&footer;

} # registerpass end

#------------------�폜����

sub delmsg {

	open(IN, $bbsfile) || &error(2, __LINE__);
	binmode(IN);
	local @lines = <IN>;
	close(IN);

	local @new;
	foreach (@lines) {
		local $i = '';
		local @data = split(/\,/, $_);
		$target = &digit($data[0]);
		foreach (@{$GLOB{'delmsg'}}) {
			if ($_ eq $target) { 
				unlink("$imgdir/$data[6]");
				$i = 1;
				last;
			}
		}
		push(@new, $_) if (! $i);
	}

	open(OUT, ">$bbsfile") || &error(2, __LINE__);
	binmode(OUT);
	print OUT @new;
	close(OUT);

} # delmsg end

##################################
# ���ʃT�u���[�`��
##################################

sub chkcode {

	local $code = shift;
	local $de_code = ($code / $codesalt) - $codekey;
	if ($code % $codesalt) {&error('���e�R�[�h�����Ă��܂��B�f���������[�h���ĉ������B', __LINE__);}
	if ($time < $de_code) { &error('���e�R�[�h�����Ă��܂��B�f���������[�h���ĉ������B', __LINE__); }
	elsif ($l_time < $time - $de_code) { &error("���e�R�[�h�̗L�������i$l_time�b�j���߂��Ă��܂��B�f\���������[�h���ĉ������B", __LINE__);}
	elsif ($time - $de_code < $s_time) { &error("���e�Ԋu���Z�������܂��B$s_time�b�ȏ�o�߂��Ă��瓊�e���ĉ������B", __LINE__);}

}

sub encode {

	local $str = shift;
	local(@array) = unpack('C*',$str);
	foreach (@array) {
		$_ = '%' . sprintf('%2.2x' ,$_);
	}
	return (join('', @array));

}

sub set_parmdef {

	$num = $numdef;
	$bgc = $bgcdef;
	$autolink = $autolinkdef;
	$imgview = $imgviewdef;
	$video = $videodef;
	if( $autolink == 1){ $chklink = ' checked'; }
	if( $imgview == 1){ $chkimg = ' checked'; }
	if( $video == 1){ $chkvideo = ' checked'; }

}

sub del_currentimg {

	unlink("$imgdir/$GLOB{'img'}");
	$GLOB{'img'} = '';

}

sub reset_currentid {

	$GLOB{'id'} = sprintf ("%03d", --$GLOB{'id'});
	open(DB, ">$imglog") || &error(2, __LINE__);
	eval 'flock (DB, 2);';
	seek(DB,0,0);
	print DB $GLOB{'id'};
	eval 'flock (DB, 8);';
	close(DB);

}

sub del_oldimg {

	opendir(DIR, $imgdir) || &error(2, __LINE__);
	local(@list) = grep(! /^\.{1,2}/, readdir(DIR));
	closedir(DIR);
	@list = sort { $a <=> $b } @list;
	local $i = @list;
	foreach (@list) {
		last if ($i <= $l_imgnum);
		unlink("$imgdir/$_");
		$i--;
	}

}

sub cleanup_tmpdir {

	opendir(DIR, $tmpdir) || &error(2, __LINE__);
	local(@list) = grep(! /^\.{1,2}/, readdir( DIR ));
	closedir(DIR);
	return if (! @list);
	foreach (@list) {
		unlink("$tmpdir/$_");
	}

}

sub digit {

	local $str = shift;
	$str =~ s/\D//g;
	return $str;

}

sub dirinfo {

	local $dir = shift;
	local($i, $sum, $size, $time, @list);
	opendir(DIR, $dir);
	$i = 0;
	$sum = 0;
	foreach (sort { $a <=> $b } readdir(DIR)) {
		next if ($_ =~ /^\./);
		($size, $time) = (stat("$dir/$_"))[7,9];
		 @{$list[$i]} = ($_, $size, $time);
		$sum += $size;
		$i++;
	}
	closedir(DIR);
	unshift(@list, $sum);
	return @list;

}

sub pagination {

	local($num, $page, $page_all) = @_;
	print <<"EOF";
<form class="page" method="POST" action="$scriptrel">
$baseinput
<input type="hidden" name="page" value="$page">
EOF

	if ($page == 1 && $page_all != 1) {
		$prev = "<input type='button' class='prev' value='�J�n�y�[�W'>\n";
		$next = "<input type='submit' class='next' name='next' value='���̃y�[�W &gt;'>\n";
	}
	elsif ($page == 1 && $page_all == 1) {
		$prev = "<input type='button' class='prev' value='   (((*'-')'>\n";
		$next = "<input type='button' class='next' value='���� ���ڰ�'>\n";
	}
	elsif ($page != $page_all) {
		$prev = "<input type='submit' class='prev' name='prev' value='&lt; �O�̃y�[�W'>\n";
		$next = "<input type='submit' class='next' name='next' value='���̃y�[�W &gt;'>\n";
	}
	else {
		$prev = "<input type='submit' class='prev' name='prev' value='&lt; �O�̃y�[�W'>\n";
		$next = "<input type='button' class='next' value='�ŏI�y�[�W'>\n";
	}

	print $prev;
	print $next;
	print "<input type='submit' class='reload' name='start' value='Reload' title='�J�n�y�[�W/�����[�h'>";
	if (! $FORM{'mobile'}) {
		print "<input type='submit' class='jump' value='P' title='�w��y�[�W�ɃW�����v'>";
		print "<input type='text' class='page' name='page' value='$page' size='1'>";
		if ($page ne $page_all) {
			print "<input type='submit' class='end' name='end' value='End.$page_all' title='�ŏI�y�[�W'>\n";
		}
		else {
			print "<input type='button' class='end' name='end' value='End.$page_all' title='�ŏI�y�[�W'>\n";
		}
	}

	print "</form>\n";

} # pagination end

sub max {
	return (sort { $b <=> $a } @_)[0];
}

sub min {
	return (sort { $a <=> $b } @_)[0];
}

sub counter {

	local($i, $maxcount, $mincount, @count, @filenumber, @sortedcount);
	for( $i=0 ; $i < $countlevel ; $i++){
		open(IN,"$countdir/count$i.txt");
		$count[$i] = <IN>;
		$bbsfilenumber[$count[$i]] = $i;
		close(IN);
	}
	@sortedcount = sort { $a <=> $b } @count;
	$maxcount = $sortedcount[$countlevel-1];
	$mincount = $sortedcount[0];
	$maxcount++;
	open(OUT,">$countdir/count$bbsfilenumber[$mincount].txt");
	print OUT $maxcount;
	close(OUT);
	return $maxcount;

}

##################################
# �G���[����
##################################

sub error {

	local($error, $line) = @_;
	local $msg;

	if (($GLOB{'img'} || $GLOB{'id'}) && $error != 2 && $error != 3) { 
		&del_currentimg if ($GLOB{'img'});
		&reset_currentid if ($GLOB{'id'});
		&cleanup_tmpdir;
	}

	if    ($error == 1) { $msg = '�t�@�C��/�f�B���N�g�����J���܂���ł����B(1)'; }
	elsif ($error == 2) { $msg = '�t�@�C��/�f�B���N�g�����J���܂���ł����B(2)'; } # UP�摜�폜�Ȃ�
	elsif ($error == 3) { $msg = '�摜�t�@�C�������d�����Ă��܂��Bimg.dat�̐��l�ƃA�b�v���[�h�摜�ԍ��̍ő�l����v�����Ă��������B'; } # UP�摜�폜�Ȃ�
	elsif ($error eq 'x')  { $msg = '�ȉ��̏�񂪋L�^����܂����B����'; }
	elsif ($error eq 'xx') { $msg = '���킢����'; }
	else  { $msg =  $error; }
	
	if (! $baseinput) {
		 &set_parmdef;
	}

	&header;
	print <<"EOF";
<title>$title</title>
$css
</head>
<body bgcolor="#$bgc" text="#$textc" link="#$linkc" vlink="#$vlinkc" alink="#$alinkc">
<h3>Line:$line $msg</h3>
<form class="back" method="POST" action="$scriptrel">
<input type="hidden" name="name" value="$FORM{'name'}">
<input type="hidden" name="email" value="$FORM{'email'}">
<input type="hidden" name="num" value="$num">
<input type="hidden" name="bgcolor" value="$bgc">
<input type="hidden" name="autolink" value="$autolink">
<input type="hidden" name="imgview" value="$imgview">
<input type="hidden" name="video" value="$video">
<input type="submit" value="�f���ɖ߂�">
</form><br><br>
EOF

	if($FORM{value}){
		$FORM{value} =~ s!<a href="([^"]*)">[^<]*</a>!$1!g;
		$FORM{value} =~ s/\x00/,/g;
		print <<"EOF";
<p>���ȉ��̓��e���e�͋L�^����܂���ł����B���e���e���R�s�[���̃����N����f���ɖ߂��ĉ������i�u���E�U��Back�ł͖߂�Ȃ��ꍇ������܂��j
<hr><pre>$FORM{value}</pre>
EOF
	}

	if ($error eq "x") {
		while (($a,$b) = each %ENV) {
			print "$a=$b<br><br>\n";
		}
	}

	if ($error eq "xx") {
		print "<table><tr><td>" x 60, "\n�@";
		print "</td></tr></table>" x 60, "\n\n";
	}

	&footer;

} # error end

1;