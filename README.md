# regex-split

Example usage:

```
cat *.log | regex-split --regex '(..../../..)'
```

`regex-split` reads standard input, match each line with the specified regex
(that should have one capture group), and append the line to a file whose name
is determined by the captured text. The example command above will organize the
bunch of log files into files by the date of the log entries.

Here's a more elaborated example:

```
example $ ls
example.log

example $ cat example.log
[21/May/2015:10:06:21 +0000] Lorem ipsum dolor sit amet, consectetur adipiscing elit.
[21/May/2015:10:07:21 +0000] Integer eu massa placerat, tincidunt neque eget, eleifend risus.
[21/May/2015:11:06:21 +0000] Quisque vehicula diam ac enim tincidunt iaculis.
[21/May/2015:11:08:21 +0000] Vivamus eget purus pellentesque enim ultricies dapibus.
[21/May/2015:11:09:21 +0000] Nulla non est tincidunt, venenatis odio at, pretium dolor.
[21/May/2015:12:06:21 +0000] Duis pretium augue sed finibus rutrum.

example $ regex-split --regex='(21/May/2015:..)' < example.log

example $ ls
_21May201510  _21May201511  _21May201512  example.log

example $ cat _21May201510
[21/May/2015:10:06:21 +0000] Lorem ipsum dolor sit amet, consectetur adipiscing elit.
[21/May/2015:10:07:21 +0000] Integer eu massa placerat, tincidunt neque eget, eleifend risus.

example $ cat _21May201511
[21/May/2015:11:06:21 +0000] Quisque vehicula diam ac enim tincidunt iaculis.
[21/May/2015:11:08:21 +0000] Vivamus eget purus pellentesque enim ultricies dapibus.
[21/May/2015:11:09:21 +0000] Nulla non est tincidunt, venenatis odio at, pretium dolor.

example $ cat _21May201512
[21/May/2015:12:06:21 +0000] Duis pretium augue sed finibus rutrum.
```
