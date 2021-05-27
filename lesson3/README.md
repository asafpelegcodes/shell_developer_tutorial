# Lesson 3
These final exercises will cover some commands useful for development, operational purposes and the elegance of piping.

Before concluding we'll demystify command history and get a taste of some advanced shortcuts.

## Exercises
1. Simple file readers: `less` is `more`
    * Slightly more versatile versions of `cat` that contain simple text searches
    * `less hello_grep.txt`
    * Type `/` to enter search mode & then `hello` as your search string and hit `enter`
    * the up/down arrow keys and `space` (page down) will aid in page navigation   
    * sometimes `less` is not available on containers but `more` is
    * `more hello_grep.txt`
1. Display parts of a file: `head` and `tail`
    * Both commands give you a sample of a large flat file and `tail` is the workhorse of log watching
    * `head hello_grep.txt` prints the first 10 lines (default) of a file
    * `head -3 hello_grep.txt` prints the first 3 lines of a file
    * `tail -5 hello_grep.txt` prints the last 5 lines of a file (default is also 10)
1. The original computer-search noun that became a verb (no, not google) `grep`:
   * Simple & flexible command to locate text in a flat file
   * `grep hello hello_grep.txt`
   * Aside from simple searches grep also fully supports regular expressions
   * grep can also be used to ignore certain text `grep -v hello hello_grep.txt`
   * By default, grep is case-sensitive but ignoring case is also common `grep -i hello hello_grep.txt`
   * fun fact, grep stands for "**G**lobally search for a **R**egular **E**xpression and **P**rint matching lines"   
1. Simple web request tool: `curl`
   * `curl` comes in handy when testing out APIs or doing an investigation for front end work
   * It's light weight but also capable enough all varieties of HTTP requests
   * Get your ip address `curl ifconfig.me`
   * Check the headers for debugging `curl -v ifconfig.me`
   * Sample POST request `curl 'https://jsonplaceholder.typicode.com/posts' --data-raw '{"title":"foo","body":"bar","userId":1}' -H 'content-type: application/json; charset=UTF-8'`
   * Your favorite web browser can export curl commands from the network tab of the developer console
1. Putting it all together with pipe `|`
    * One of the most elegant features of shell programming is ability to easily tie multiple commands together using the pipe `|` operator.
    * Developers who created the early shell commands weren't focused on solving every possible use case for their tools but rather kept them simple for the purpose of efficiency & speed.
    * To allow for flexibility the `|` utility allowed users to stitch together various commands to accomplish their unique use case.
    * Specifically, a command on the left side of `|` feeds its output directly to the input of the command on the right side
    * `tail hello_grep.txt | grep hello`
    * `grep hello hello_grep.txt | grep twist`  
    * Execute the given script to create a simulated log file: `./log_generator.sh &` (note: the `&` sends the script execution to the background)
    * `tail -f grep.log`
    * `tail -f grep.log | grep hello`
    * Check the content type of a HTTP response  `curl -s -I ifconfig.me | grep content-type`
1. Command `history`
   * `history` will display a list of your previous commands in descending order
   * Using the up/down arrow keys at shell prompt traverses this history
   * It can be combined w/ pipe to find that nifty command you used yesterday `history | grep curl`
   * There's an even better way!
1. Basic shell keyboard shortcuts:
   * The best shortcut has already been covered `tab` for completion.
   * shortcut `ctrl + r` is used to recursively look up your previous history. Once prompted type characters and simple regex will be used to locate the previous command that matches it. Type `ctrl + r` again to locate the next oldest match
   * `ctrl + c` will kill whatever program you are running and is also handy to delete your current prompt
   * Start `./log_generator.sh` and then type `ctrl + c` to exit it prematurely
   * `ctrl + k` will clear your shell
   * `ctrl + d` is a shortcut to exit the current session (note: this will close your current tab)
1. If you forget use the manual: `man`
   * Anytime you forget how to use a command know that there are manuals for them all
   * `man curl`
   * It can be meta! `man man`
   
   
References:
* https://blogs.warwick.ac.uk/mikewillis/entry/random_words/
