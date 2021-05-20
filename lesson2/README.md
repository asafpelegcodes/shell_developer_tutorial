# Lesson 2

## Exercises
1. Output text: `echo`
    * `echo hello world!`
1. Output file: `cat`
   * `cat hello_world.txt`
   * `cat hello_world.txt hello_file.txt`
   * `cat hello*`
1. File redirection: `>` & `>>`
   * A simple way of saving text to a file is using redirection
   * A single right caret `>` overwrites  
   * `echo hello world! > new_hello_file`
   * `cat new_hello_file`
   * `echo bonjour world! > new_hello_file`
   * `cat new_hello_file`  
   * A double right caret `>>` appends
   * `echo hola world! >> new_hello_file`
   * `cat new_hello_file`
   * Note: both redirections create a new file if it does not exist
1. Your first script:
   * `echo ls -ltr > myscript.sh`
   * `bash myscript.sh`
   * `./myscript.sh`
1. File permissions & ownership:
   * `ls -ltr`
   * `-rw-r--r--  1 apeleg  staff   18 May 13 16:39 hello_world.txt`
   * File permissions are denoted by 2nd to the 10th characters in the list output that are either `-`, `r`, `w`, & `x` 
      * `-` permission not granted
      * `r` read permission granted
      * `w` write permission granted
      * `x` execute permission granted
      * There are three pairs of permissions: owner (2nd-4th), group (5th-7th), and others (8th-10th)
      * Examples:
         * `-rwx------`: only owner has permissions on file and can read, write & execute
         * `----r-x---`: only group has permissions on file and can read and execute
         * `-rwxrw-r--`: owner has all permissions, group can read & write and others can only read 
         * `-r--r--r--`: everyone has just read only permissions
   * Note: the 1st character denotes if the item is a directory `d` or a file
   * File permissions are modified with `chmod` and only the owner can change them
      * Give owner execute permissions: `chmod u+x myscript.sh` 
         * `u` for owner
         * `+` for adding
         * `x` for execute
      * `ls -ltr`
      * Take away owner read permissions: `chmod u-r myscript.sh`
      * `ls -ltr`
      * `cat myscript.sh`
      * Add read & write permission to owner & group: `chmod ug+rw`
      * Remove read permission to group & others: `chmod go-r`
   * Test running your script `./myscript.sh`
   * Ownership is modified with `chown` and only the owner can change it
      * `sudo chown root:wheel myscript.sh` & enter your computer password
      * `cat myscript.sh`
      * `sudo chown apeleg:staff` (replace apeleg:staff with your local username & group)
      * Note: `sudo` is a command that tells the shell to run the command as root
1. Writing a bigger script using `vim`:
   * `vim` is a popular and versatile text editor available on most modern Unix & Unix like operating systems
   * `vim newscript.sh`
   * vim defaults to command mode, to enter insert mode press `i`
   * Enter a sequence of bash commands, one per line using the commands you have already learned
      * Example:
         ```shell
         touch script_file
         echo bash is fun > script_file
         cp script_file script_backup
         ls -lt
         ```
      * For a fun ending insert `wget -qO- git.io/unix` as your final command which will download & display a surprise
   * Once you are done inserting, press escape `Esc` to return to command mode
   * In order to save & quit enter colon `:` followed by `w` (write/save) `q` (quit)
   * Note: `w` & `q` can be entered separately but if used together must be in that order
   * Note: if you attempt to quit `q` with unsaved changes vim will warn you, in order to discard your changes enter `:!q`
   * Make your new script executable `chmod u+x newscript.sh` and run it `./newscript.sh`
   * Let's learn a few more simple commands, `vim newscript.sh`
      * Add `echo repeat` using insert mode anywhere in your file
      * Hit `Esc` to return to command mode and move your cursor to the beginning of the line with `echo` you just added
      * Type `yy` (yank) to copy this line of the file
      * Type `p` (put) to paste the line of the file 
      * Type `2yy` to copy 2 lines (any number can precede the yank) and press `p` to paste it
      * Note: like in other editors, paste can be repeated
      * Type `dd` to cut the current line
      * Move your cursor to a different line and paste it by pressing `p`  
      * Type `4dd` to cut 4 lines
      * Press `u` to undo your last command
1. Shell sessions
    * A session is the current state in a shell
    * Each time you open your terminal or create a new tab in iTerm it gets a new session
    * Items that are native to each session include
        * environment variables
        * aliases
        * running jobs
1. Environment variables    
    * Variables available in the current session
    * List current environment variables: `printenv`
    * Add new variable: `export MYVAR=hello`
    * Remove variable: `unset MYVAR`
    * Print variable: `echo $MYVAR`
1. Aliases
    * aliases are shortcuts to commands
    * `alias lr="ls -ltra"`
    * `lr`
1. Dot Files
    * Filenames that begin with a dot/period are hidden by default
    * The `-a` option of `ls` reveals them
    * `cd ~`
    * `lr`
1. Updating your profile
    * Open a new tab in iTerm by typing `CMD+t`
    * Try `lr` and you will see the alias is gone
    * Shell's provide a _profile_ to prime new sessions with all your favorite environment variables and aliases
    * ZSH profile is located in `~/.zshrc`
    * `vim ~/.zshrc`
    * Navigate to the end of the file and enter insert mode
    * Add `alias lr="ls -ltra"` then save & quit
    * Open a new tab in iTerm & type `lr`
