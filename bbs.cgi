#! /usr/local/bin/perl

# �G���[�`�F�b�N�B�X�N���v�g�ҏW���ɃR�����g���O���Ă��g����������(�vPerl5��)
use CGI::Carp qw(fatalsToBrowser); 

=header1 -- ���������� --

�����債���� + Team MIZUIRO ver3.10d  2022/07/22

���L�Ҍ�����CGI�������T�[�o�[�̏ꍇ�̃p�[�~�b�V�����ݒ��

  [public_html]�i�z�[���y�[�W�f�B���N�g���j
        |
        |---- [cgi-bin]�i701�j
                  |
                  |-- bbs.cgi  (700)
                  |-- core.pl  (600)
                  |-- css.pl   (600)
                  |-- jacode.pl(600)
                  |                  
                  |-- bbs.dat(600)
                  |-- img.dat(600)
                  |-- dirinfo.dat(600)
                  |-- password.pl(600)
                  |
                  |-- [count](700)
                  |-- [rank] (700)
                  |-- [tmp]  (700)
                  |-- [data] (701)
                  |-- [log]  (701)

�f������N�����͊Ǘ��҃p�X���[�h�o�^��ʂɂȂ�܂��B

�Í��V�X�e�����قȂ�T�[�o�ֈړ]�����ꍇ��password.pl���蓮�ŃN���A(���g��������0byte�ɂ���A
�܂��̓t�@�C�����̂��폜)���čĐݒ肵�ĉ������B

�Ǘ��҃��[�h�Ɉڍs������@�́u���e�Җ��ɊǗ��҃p�X���[�h�A���e���e��$adminkey�Őݒ肵��
�Ǘ����[�h�ڍs�L�[���L�����ē��e�{�^���������v�ł��B

���X�N���v�g�������������
���ݒ肨��ѕ\���p�����[�^�[�ݒ�/���򏈗��Őݒ肵�����ׂĂ̕ϐ���core.pl�f�R�[�h�I����̘A�z�z��
%FORM($FORM{'name'}..etc)%GLOB($GLOB{'img'}..etc)�̓O���[�o���Ƃ��Ăǂ�����ł��Q�Ɖ\�Ƃ��Ă��܂��B

�ڂ����͔z�z�y�[�W�������������B
 �����債���� + Team MIZUIRO BBS �z�z & �ݒu�̎����
 http://taiyaki.s8.xrea.com/TeamMIZUIRO/index.html

�o�O�񍐁A������͂�����ɂǂ��� �R(�L�[`)�m
 �����債���� + Team MIZUIRO �T���v���f����
 http://taiyaki.s8.xrea.com/TeamMIZUIRO/cgi-bin/bbs.cgi

=cut

##################################
# ���ݒ�
##################################

# ---------------- �Ǘ����[�h�ڍs�L�[(�v�ύX)

$adminkey = 'admin';

# ---------------- �ݒ�(�ݒu���ɍ��킹�ĕύX)

$title = '�����債���� + Team MIZUIRO �T���v���f����'; # �f���̖��O
$homeurl = ' http://taiyaki.s8.xrea.com/index.html';  # �z�[���y�[�W
$mailadd = 'renraku@mail.de.ne'; # �A����
$countdate = '2000/xx/xx';       # �A�N�Z�X�J�E���^�J�n��
$countlevel = 2;                 # �J�E���^���x

# �Ǘ��Җ��ݒ�B�Ōオ�u�\�v�ŏI���g�m�����g���̕��͖��O�̍Ō��\��t���ĉ������B
#�i�Ⴆ�΃G�f�\����̏ꍇ�F$namez='�G�f�\\';�j
$namez = '�Ǘ��l';       # �Ǘ��҃p�X���[�h�œ��e���ɕ\������閼�O
$mailz = $mailadd;       # �Ǘ��҃p�X���[�h�œ��e���ɓY�t����郁�[���A�h���X
$nameng = '�A�j�L';      # �m�f�l�[���i���̖��O�œ��e����ƃu���E�U���N���b�V���j

# �F�ݒ�(16�i�\�L�B�擪��#�͕s�v�j
$bgcdef = '004040';      # body���̐F
$textc  = 'ffffff';
$linkc  = 'eeffee';
$vlinkc = 'dddddd';
$alinkc = 'ff0000';

$subjc  = 'fffffe';       # �薼�̐F
$resc   = 'a0a0a0';       # ���p�s(> or �� �Ŏn�܂�s)�̐F

$numdef = 20;             # �P�y�[�W�ɕ\�����錏���̃f�t�H���g�l(PC�p)
$nummbdef = 10;           # �P�y�[�W�ɕ\�����錏���̃f�t�H���g�l(Mobile�p)
$nummin = 1;              # �P�y�[�W�ɕ\�����錏���̍ŏ��l
$nummax = 50;             # �P�y�[�W�ɕ\�����錏���̍ő�l
$l_record = 300;          # ���e�L���̍ő�L�^����

$l_all = 1024*1024;       # �摜���܂ޑS�Ă̑��M�f�[�^�̍��v(byte)
$l_width = 1920;          # �摜�̉����̍ő�l(px)
$l_height = 1920;         # �摜�̍����̍ő�l(px)

$imgctrl = 'size';        # �ۑ��摜�̊Ǘ����@ size:�ۑ��f�B���N�g���̗e�ʂŊǗ�(�vPerl5��) num:���v�t�@�C�����ŊǗ�(Perl4,Perl5���p)
$l_imgdir = 50*1024*1024; # �摜�ۑ��f�B���N�g���̍ő�e��(byte)($imgctrl = 'size';�̏ꍇ�K�p)
$l_imgnum = 50;           # �摜�̍ő�ۑ���($imgctrl = 'num';�̏ꍇ�K�p)

# �ϊ�/�\��checkbox�̃f�t�H���g�l
$autolinkdef = 1;         # URL��Link�����ϊ�(���e���ɓK�p)�̃f�t�H���g�l 0:�ϊ����� 1:�ϊ�����
$imgviewdef = 1;          # �摜�\���̃f�t�H���g�l�B0:Link�ŕ\�� 1:�摜�ŕ\��
$videodef = 0;            # Youtube����Link������v���[���\���̃f�t�H���g�l 0:�ʏ�Link�Ɠ������� 1:iframe�œ���v���[���[��\��
$videowidth = 480;        # YouTube����v���[���[�̉���(px)
$videoheight = 270;       # YouTube����v���[���[�̍���(px)

# �T�[�`�ݒ�
$ngsearch = 0;            # �e��T�[�`�ŏ��O����L�[���[�h 0:���O�L�[���[�h���� 1:���por�S�p�X�y�[�X1�� 2:1����(1byte)�̃L�[���[�h
$l_search2 = 200;         # ���{�^�����e�Җ��T�[�`���ʂ̍ő�\������
$l_thread = 200;          # ��/���{�^���X���b�h�\���̍ő�\������
$l_logsearch = 1000;      # �ߋ����O�������ʂ̍ő�\������
$l_keyword = 50;          # �ߋ����O�����L�[���[�h�̍ő�l(byte)

# ���e�R�[�h�ƃX�p���΍�
$codemode = 1;            # ���e�R�[�h���[�h 0:���e�R�[�h��\�� 1:PC�̂ݕ����G���e�R�[�h�\�� 2:PC/Mobile���ɕ����G���e�R�[�h�\��
$spammode = 1;            # ���e���e(URL��/�g�p���ꓙ)�ɂ��X�p���΍� 0:�s�g�p 1:�A�b�v���[�h�摜���������e�̂ݓK�p 2:���ׂĂ̓��e�ɓK�p

# ���e�R�[�h�ڍ�
$codekey = 12345678;      # ���e�R�[�h1 (8���̐��l�A�v�ύX)
$codesalt = 56;           # ���e�R�[�h2 (2���̐��l�A�v�ύX)
$l_time = 6*60*60;        # ���e�R�[�h�L������(sec �����蒷�����Ԃ��o�߂����ꍇ�͏������ݕs��)
$s_time = 5;              # ���e�Ԋu����(sec ������Z���Ԋu�̏������ݕs��)

# ---------------- �ݒ�(���̑�)

$bbsfile = './bbs.dat';         # ���e���������܂��L�^�t�@�C��
$imglog = './img.dat';          # �C���[�W�t�@�C���ԍ��̋L�^�t�@�C��
$passfile = './password.pl';    # �Ǘ��҃p�X���[�h�L�^�t�@�C��
$dirinfofile = './dirinfo.dat'; # �摜�f�B���N�g���g�p�ʋL�^�t�@�C��($imgctrl = 'size';�̏ꍇ�쐬/�g�p)
$jcpl =  './jacode.pl';         # ���{��R�[�h�ϊ����C�u����jaocode.pl�̃p�X
$bbscore = './core.pl';         # �f���R�A���C�u�����̃p�X
$cssloader = './css.pl';        # CSS���[�_�[�̃p�X
$countdir = './count';          # �J�E���g�f�[�^�ۑ��f�B���N�g��
$rankdir = './rank';            # �����L���O�f�[�^�ۑ��f�B���N�g��
$tmpdir = './tmp';              # �e���|�����t�@�C���p�f�B���N�g��
$logdir = './log';              # �ߋ����O�ۑ��f�B���N�g��
$imgdir = './data';             # ���e�摜�ۑ��f�B���N�g��

$l_name = 40;                   # ���O�̍ő�l(byte)
$l_email = 80;                  # ���[���A�h���X�̍ő�l(byte)
$l_subject = 80;                # �薼�̍ő�l(byte)
$l_value = 30*1024;             # ���e�̍ő�l(byte)
$l_line = 200;                  # ���e�̍s���̍ő�l
$check = 5;                     # ��d�������݃`�F�b�N����(�ŐV-$check���܂Ń`�F�b�N)

# �����e�����L���O�ɂ���
# ����2��ވȏ��DB�t�@�C����������������܂��B�����Ԏg�p����ꍇ�͒���I�ɌÂ��t�@�C����|�����Ă��������B
# �^�p�T�[�o�[��ύX�����ꍇ�͌Â�DB�t�@�C�����g�p�ł��Ȃ��ꍇ������܂��BPerl��T�[�o�[OS�̃o�[�W�����X�V��
# �g�p�ł��Ȃ��Ȃ�ꍇ������܂��B���X�ێ琫���Ⴂ�̂ł��̋@�\�𒷊��Ԏg��������͔̂񐄏��Ƃ��܂��B
$rankkey = 0;                # ���e�����L���O 0:�s�g�p 1:�g�p
$rankdef = 3;                # �����L���O�\�������i���P�ʁj
$action = "fuckin";          # ���e����action��
# $redirect='http://redirector��URL'; # redirector��URL�Bredirector���g�p���Ȃ��ꍇ�͋�''�܂���#�ŃR�����g�A�E�g���ĉ�����

# URL�����擾
$scriptname = substr($ENV{SCRIPT_NAME}, rindex($ENV{SCRIPT_NAME}, '/') + 1);              # bbs.cgi
if($ENV{'HTTPS'}){ $serverurl = 'https://' . $ENV{'SERVER_NAME'}; }
else{ $serverurl = 'http://' . $ENV{'SERVER_NAME'}; }
if ($ENV{'SERVER_PORT'} ne '80') { $serverurl .= ':' . $ENV{'SERVER_PORT'}; }             # hhtps?://taiyaki.s8.xrea.com(:port)?
$baseurl = $serverurl . substr($ENV{SCRIPT_NAME}, 0, rindex($ENV{SCRIPT_NAME}, '/') + 1); # https?://taiyaki.s8.xrea.com(:port)?/cgi-bin/
$scripturl = $baseurl . $scriptname;                                                      # https?://taiyaki.s8.xrea.com(:port)?/cgi-bin/bbs.cgi
$imgdirurl = $baseurl . substr($imgdir, rindex($imgdir, '/') + 1) . '/';                  # https?://taiyaki.s8.xrea.com(:port)?/cgi-bin/data/

# ����LURL�����擾�����삵�Ȃ��ꍇ�͂��ׂăR�����g�A�E�g���ĉ��L��2�̕ϐ����蓮�Őݒ肵�Ă��������B
# $scriptname = '�X�N���v�g�t�@�C����'; $baseurl = 'http://�ݒu�T�[�o�[�̃z�X�g��/�X�N���v�g�ݒuDir/'; 
# �ݒ��
# $scriptname = 'bbs.cgi';
# $baseurl = 'http://taiyaki.s8.xrea.com/cgi-bin/';

# ���̃X�N���v�g�̑��΃p�X
$scriptrel = './' . $scriptname;

##################################
# �p�����[�^�[����/���򏈗�
##################################

# �f���R�A���C�u�����ǂݍ���
require $bbscore;

# ���o�C������
if ($ENV{'QUERY_STRING'} =~ /mobile=1/) {
	$FORM{'mobile'} = 1;
	$scriptrel .= '?mobile=1' ;
}

# CSS�ǂݍ���
require $cssloader;
if (! $FORM{'mobile'}) { $css = &css($bgcdef, $textc, $linkc, $vlinkc, $alinkc, $subjc, $resc, 'pc'); }
else { $css = &css($bgcdef, $textc, $linkc, $vlinkc,$alinkc,$subjc, $resc, 'mobile'); }

# ��������
$time = time;
($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = gmtime($time + 9 * 60 * 60);
$mon++;
$year += 1900;
foreach ($sec, $min, $hour, $mday, $mon, $year) { $_ = sprintf("%02d", $_); }
$wdayja = ('��','��','��','��','��','��','�y')[$wday];
$datenow = "$year�N$mon��$mday��($wdayja)$hour��$min��$sec�b";

# ���e�R�[�h���s
$code = ($time + $codekey) * $codesalt;

# �ߋ����O�t�@�C�����擾
$logfiledate = "$logdir/$year$mon.html";

#�����L���O�t�@�C�����擾
$rankfile = "$rankdir/$year$mon";

# �\���p�P�ʒ���
$l_all_kb = int($l_all / 1024);
$l_all_mb = int(($l_all / 1024 / 1024) * 10) / 10;
$l_imgdir_mb = sprintf('%.f', $l_imgdir / 1024 / 1024);

# �f�R�[�h
&decode;

# �\�������̌���
if ($FORM{'num'} =~ /^\d+$/) {
	if ($FORM{'num'} < $nummin) { $num = $nummin; }
	elsif ($FORM{'num'} <= $nummax) { $num = $FORM{'num'}; }
	elsif ($nummax < $FORM{'num'}) { $num = $nummax; }
}
else {
	if (! $FORM{'mobile'}) { $num = $numdef; }
	else { $num = $nummbdef; }
}

# �\���F�̌���
if ($FORM{'bgcolor'} =~ /^([0-9]|[a-f]){6}$/i) { $bgc = $FORM{'bgcolor'}; }
else { $bgc = $bgcdef; }
$body  = "<body id='top' bgcolor='#$bgc' text='#$textc' link='#$linkc' vlink='#$vlinkc' alink='#$alinkc'>";

# URL�����ϊ���ON/OFF
if ($ENV{'REQUEST_METHOD'} eq 'GET' && !$FORM{'action'} && !$FORM{'autolink'}) { $autolink = $autolinkdef; }
elsif ($FORM{'autolink'} eq '1') { $autolink = 1; }
else { $autolink = 0; }
$chklink = ' checked' if ($autolink == 1);

# �A�b�v���[�h�摜�\����ON/OFF
if ($ENV{'REQUEST_METHOD'} eq 'GET' && !$FORM{'action'} && !$FORM{'imgview'} ) { $imgview = $imgviewdef; }
elsif ($FORM{'imgview'} eq '1') { $imgview = 1; }
else { $imgview = 0; }
$chkimg = ' checked' if ($imgview == 1);

# Youtube Video URL�����ϊ���ON/OFF
if ($ENV{REQUEST_METHOD} eq 'GET' && ! $FORM{'action'} && ! $FORM{video}){ $video = $videodef; }
elsif ($FORM{'video'} == '1') { $video = 1;}
else { $video = 0; }
$chkvideo = ' checked' if ($video == 1);

# �߂�Link���Ŏg�p�����{�p�����[�^�[�̃N�G��/input�^�O
$basequery = "num=$num&bgcolor=$bgc&autolink=$autolink&imgview=$imgview&video=$video";
$baseinput = <<"EOF";
<input type="hidden" name="name" value="$FORM{'name'}">
<input type="hidden" name="email" value="$FORM{'email'}">
<input type="hidden" name="num" value="$num">
<input type="hidden" name="bgcolor" value="$bgc">
<input type="hidden" name="autolink" value="$autolink">
<input type="hidden" name="imgview" value="$imgview">
<input type="hidden" name="video" value="$video">
EOF

# ���������Q�l�F�{�^���o�R�̃T�[�`�p�����[�^�[�Ē�`
if ($ENV{'REQUEST_METHOD'} eq 'POST' && !$FORM{'action'}) {
	foreach $key (keys %FORM) {
		if ($FORM{$key} eq '��' && $key =~ /^\d{14}$/) {
			$FORM{'action'} = 'search1';
			$FORM{'search'} = $key;
			last;
		}
		elsif ($FORM{$key} eq '��' && $key =~ /^(%25[0-9a-f][0-9a-f])+$/) {
			$FORM{'action'} = 'search2';
			$FORM{'searchname'} = $key;
			last;
		}
		elsif (($FORM{$key} eq '��' || $FORM{$key} eq '��') && $key =~ /^\d{14}$/) {
			$FORM{'action'} = 'thread';
			$FORM{'thread'} = $key;
			last;
		}
		elsif ($FORM{$key} eq '�Q�l�F' && $key =~ /^\d{14}$/) {
			$FORM{'action'} = 'search1';
			$FORM{'search'} = $key;
			last;
		}
	}
}

# �f������N����
if (!(-s $passfile)) {
	if (! $FORM{'action'}) { &passform; }
	else { &registerpass; }
	exit;
}

# ���򏈗�
if ($ENV{'REQUEST_METHOD'} eq 'POST' && $FORM{'action'} eq $action && ($FORM{'value'} || $GLOB{'img'})) { &register;  }
elsif ($FORM{'action'} eq 'ranking' && $rankkey) { &viewrank; }
elsif ($FORM{'action'} eq 'search1') { &search1; }
elsif ($FORM{'action'} eq 'search2') { &search2; }
elsif ($FORM{'action'} eq 'thread') { &thread; }
elsif ($FORM{'action'} eq 'selectlog') { &selectlog; }
elsif ($FORM{'action'} eq 'getlog') { &getlog; }
elsif ($ENV{'REQUEST_METHOD'} eq 'POST' && $FORM{'action'} eq 'admintop') {
	&chkpass;
	&admintop;
}
elsif ($ENV{'REQUEST_METHOD'} eq 'POST' && $FORM{'action'} eq 'passform') {
	&chkpass;
	&passform;
}
elsif ($ENV{'REQUEST_METHOD'} eq 'POST' && $FORM{'action'} eq 'registerpass') {
	&chkpass;
	&registerpass;
}
elsif ($ENV{'REQUEST_METHOD'} eq 'POST' && $FORM{'action'} eq 'delform') {
	&chkpass;
	&delform;
}
elsif ($ENV{'REQUEST_METHOD'} eq 'POST' && $FORM{'action'} eq 'delmsg') {
	&chkpass;
	&delmsg;
	&delform;
}
else { &html; }

##################################
# html�o��
##################################

# ---------------- �w�b�_�[
sub header {

	print "Content-type: text/html\n\n";
	print <<"EOF";
<!DOCTYPE html>
<html><head>
<meta charset="shift-jis">
<meta name="viewport" content="width=device-width, initial-scale=1">
<base href="$baseurl">
<link rel="canonical" href="$baseurl$scriptname">
EOF

}

# ---------------- HTML���C��
sub html {

	local ($usage, $imgnum, $info, @lines, $total, $page, $page_all, $start, $end, $next, $i, $j);
	local $rankinfo = qq(<a href="$scriptrel?action=ranking" target="_blank" rel="noopener noreferrer">���e�����L���OTOP10</a>) if ($rankkey);
	local $counter = &counter;

	if ($imgctrl eq 'size') {
		open(DB, $dirinfofile);
		$usage = <DB>;
		close(DB);
		$usage = 0 if(! $usage);
		$info = "$usage/${l_imgdir_mb}MB";
	}
	elsif ($imgctrl eq 'num') {
		opendir(DIR, $imgdir);
		$imgnum = grep(/^[^\.]/, readdir(DIR));
		close(DIR);
		$imgnum = 0 if(! $imgnum);
		$info = "$imgnum/${l_imgnum}Files";
	}

	open(DB, $bbsfile) || &error("$bbsfile���J���܂���ł����B0byte�̃t�@�C�����쐬���邩�p�X���m�F���Ă��������B", __LINE__);
	@lines = <DB>;
	close(DB);
	$total = @lines;

	if (0 < $total) {
		if ($total % $num) { $page_all = int($total / $num) + 1; }
		else{ $page_all = int($total / $num); }
	}
	else{
		$page_all = 1;
		$page = 1;
	}

	# �\���y�[�W�ԍ�����
	$FORM{'page'} =~ s/\D//g;
	if (! $page) {
		if ($FORM{'start'}  || $FORM{'reload'}) { $page = 1; }
		elsif ($FORM{'end'}) { $page = $page_all; }
		elsif( 0 < $FORM{'page'} && $FORM{'page'} <= $page_all ){
			if ($FORM{'prev'}) { $page = max($FORM{'page'} - 1 , 1); }
			elsif ($FORM{'next'}) { $page = min($FORM{'page'} + 1, $page_all); }
			else { $page = $FORM{'page'}; }
		}
		elsif ($page_all < $FORM{'page'}) { $page = $page_all; }
		else{ $page = 1; }
	}
	$start = &max(($page - 1) * $num, 0);
	$end = &min(($page * $num) - 1, $total - 1);

	&header;

	print <<"EOF";
<title>$title</title>
$css
</head>
EOF

# ---------------- �㕔�i�r/���e�t�H�[��
	if (! $FORM{'mobile'}) { # PC���[�h
		print <<"EOF";
$body

<font size="+1"><b>$title</b></font>
<font size="-1"><b>
<a href="./$scriptname?mobile=1">Mobile</a>
<a href="$homeurl" target="_blank" rel="noopener noreferrer">�z�[���y�[�W</a> $rankinfo
<a href="mailto:$mailadd">�A����</a>
</b></font><br><br>
EOF

	&form($FORM{'name'}, $FORM{'email'}, '', '', '', '���e�^�����[�h', ''); 

	print <<"EOF";
<br><br>
<font size="-1">$countdate���� $counter (�����ɂ������x��$countlevel)<br>
<hr>�ŋ߂̉ߋ����O��<a href="$scriptrel?action=getlog&data=$year$mon.html&start=1&end=31" target="_blank" rel="noopener noreferrer">����</a>�B
�̂̃��O��<a href="$scriptrel?action=selectlog"  target="_blank" rel="noopener noreferrer">����</a>�B
���₵����[��Ǌ֘A��<a href="http://www.geocities.com/Tokyo/Dojo/5886/link/" target="_blank" rel="noopener noreferrer">����</a>�Œ����B<br>
<hr>���t�H���[���e��� &nbsp;�����e�Ҍ��� &nbsp;���X���b�h(�V�K) &nbsp;���X���b�h(�q�L��)&nbsp;&nbsp; 
�ő�o�^���� $l_record�� &nbsp;&nbsp; �ۑ��摜 $info
</font>
<hr><input type="submit" value="���e�^�����[�h">
</form>
EOF
	}
	else { # Mobile���[�h
		print "$body\n";

		&mbform($FORM{'name'}, $FORM{'email'}, '', '', '', '���e�^�����[�h', '');

		print "</form>\n";
	}

# ---------------- �L���{��
	print "<form class='article' method='POST' action='$scriptrel'>\n";
	print "$baseinput\n";

	foreach (@lines[$start .. $end]) {
		if (! $FORM{'mobile'}) {
			&disp(split(/,/, $_));
		}
		else{
			&mbdisp(split(/,/, $_));
		}
	}

	print "</form><hr>\n";

# ---------------- �y�[�W����
	&pagination($num, $page, $page_all);

# ---------------- �����i�r
	if (! $FORM{'mobile'}) {
		print "<small>&nbsp;�V����", $start + 1, '-', $end + 1, "�Ԗڂ̋L����\\�����܂����B</small>\n";
		print "<small>����ȉ��̋L���͂���܂���B</small>\n" if ($page == $page_all);
		print "<br>\n";
	}
	else{
		print "<br><span class='c2'>", $start + 1, '-', $end + 1, "�Ԗڂ̋L����\\�����܂����B\n";
		print "����ȉ��̋L���͂���܂���B" if ($page == $page_all);
		print "</span>\n";
	}

	print "<br><a href='$scriptrel#top'>��TOP</a>\n";

	&footer;

} # html end


# ---------------- �t�b�^�[
sub footer{

	if (! $FORM{'mobile'}) {
	print <<"EOF";
<hr size="5"><div align="right"><font size="-1">
���₵����[��ǁ����債���� + <a href="http://taiyaki.s8.xrea.com/TeamMIZUIRO/index.html" target="_blank" rel="noopener noreferrer">TeamMIZUIRO</a> v3.10d
</font></div>
EOF
	}
print '</body></html>';
exit;

}

