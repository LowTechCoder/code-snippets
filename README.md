# code-snippets

LowTech Code Snippets

This is a simple bash script for keeping track of code snippets.  Any key words you need to search for a snippet should be put into the file name, and that file placed into the snippets directory. The script comes with a very basic but functional command line UI.  

Add an alias to your ~/.bashrc like this, but use your path:
```
alias code_snippet="~/scripts/code_snippets/_main.bash"
```

Close and open that terminal or run this to reload that .bashrc file:
```
source ~/.bashrc
```

To use the script, run:
```
code_snippet s search terms here
```

The first 's' argument is to tell the script you are doing a search.  You can have up to 8 search terms.  The more search terms you use, the less results that will be shown. 

Example:
```
code_snippet s html headline
```

In that example, any snippets containing 'html' as a file name or extension, and 'headline' will be shown.

The UI in the script is very basic, and is explained in the script.  

To create a snippet, run this:
```
code_snippet c
```
The 'c' is for 'create' and doing this will open up vscode in the 'snippets' directory.  Feel free to change 'code' in the script to your prefered editor.

Another thing to know about this script, is I had to come up with a way to run this script on the Mac, Windows 10 WSL and Linux, so you'll need to add this line to your .bashrc to let the script know which OS you are running:
```
# my_os choices:
# linux on windows
# linux
# mac
export my_os="linux on windows"
```

Change the my_os variable to one of the choices.  