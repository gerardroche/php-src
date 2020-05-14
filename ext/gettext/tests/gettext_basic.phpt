--TEST--
Gettext basic test
--SKIPIF--
<?php
if (!extension_loaded("gettext")) {
    die('skip');
}
if (!setlocale(LC_ALL, 'fi_FI')) {
    die("skip requies locale 'fi_FI'");
}
?>
--FILE--
<?php

chdir(__DIR__);
putenv('LC_ALL=fi_FI');
putenv('LANGUAGE=fi_FI');
setlocale(LC_ALL, 'fi_FI');
bindtextdomain("messages", "./locale");
textdomain("messages");
echo gettext("Basic test"), "\n";
echo _("Basic test"), "\n";

?>
--EXPECT--
Perustesti
Perustesti
