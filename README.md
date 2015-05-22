# regex-split

Example usage:

```
cat *.log | regex-split --regex '(..../../..)'
```

`regex-split` reads standard input, match each line with the specified regex (that should have one capture group), and append the line to a file whose name is determined by the captured text. The example command above will organize the bunch of log files into files by the date of the log entries.
