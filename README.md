# MegaCURL folder

This folder is a massive collection of REST tests written in bash, with tools 
like curl, mariadb, mysql and jq. This document will guide you through.

This is just as easy as using a Postman (if not more) and since it's a git repo,
we can all sync it.

## Folder structure

For every project to be tested, we have its folder at root, and inside them, we
have two folders (if one is missing, its because GIT won't sync empty folders)
called *routes* and *scripts*. Inside *routes*, each route of your API should 
have at least one *.sh* to call it. The *scripts* folder contains scripts that
call multiple  *.sh* files from *routes* to run a bunch of commands all at once.

## Goals

1. Keep each *.sh* file simple;
2. Keep *.sh* files similar looking;
3. Avoid imports, keep all *.sh* in routes independent;

Yes, I know this folder has a bunch of copy and paste. But don't worry with that
yet, since it's a feature, not a bug. Each route *.sh* basically is code 
agnostic to the other routes, so that messing up with one route won't break the
others, and it gives you the flexibility to try really unique things on a route
without needing to refactor everything.

## Route files

### Beginning
```bash
#!/bin/bash

echo # Here you explain what this script does in one line
```

### Reading data
Later, I'll show how to save data once you've runned some code. For now, the
point is that we will save these in text files. By this repo's convention, we'll
use only hidden *.txt* files (names start with '.').
To read the contents of a *.var.txt* file into a *var* variable, you do this:
```bash
var=$(cat .var.txt)
```

You may also ask the user for some input.
To ask for input for a variable *var*, do this:
```bash
read -p "Please type a value: " var
```
The phrase will be shown to prompt the user. You better put that final space, 
since bash won't do it for you.

### Adding a body
If you need to pass a body, write is as such.
1. The whole body is in simple quotes ('), and fields in double ones (");
2. To add a variable, you *'exit'* from the body string with single quotes,
put the variable in, and open single quotes again. Remember to leave the double
quotes " as part of the body string. 

```bash
var="This is a variable"

body='{
    "string": "a string",
    "integer": 123,
    "float": 0.123,
    "array": [
        { "float": 0.123 },
        { "float": 0.123 },
        { "float": 0.123 }
    ],
    "object": {
        "middleObject": {
            "inner1": 1,
            "inner2": 2
        }
    },
    "variable": "'$var'"
}'
```
If the second rule sounds confusing, this is because in bash if you do this:
```bash
my_string='string 4'

var='string 1''string 2''string 3'$my_string
```
The result is that the strings are concatenated, so var becomes *"string 1string
2string 3string 4"*.

Oh, and remember this is a JSON, don't put commas at the end of an array or an
object!

### Calling the route

Here is where you use CURL. Please use this standard to make it more readable 
(copy from a route that already exists).

```bash
curl -X METHOD \
    -H "token: $token" \
    -H "Content-Type: application/json" \
    -d "$body" \
    link.to.your.route/subroute | jq
echo ""
```

OK, a few things. Where you see **METHOD**, you instead put one of these (don't
put quotes): **DELETE POST GET PUT ...**.

The -H lines are headers. You can just copy and paste these. Notice that here 
you pick variables in a different and easier way. The whole line is inside a 
pair of double quotes, and you just need '$' to refer to variables. The first
line shows how to take a variable and use it as the token, adjust accordingly.
The second is pretty much fixed, unless you are sending files. Just copy it as 
is.

And yes, -d "$body" refers to our body variable. If you don't need one, you just
don't create a body and then remove this line.

Oh, a very important thing: to split a command in multiple lines in bash, you 
end the lines with \\. This tells bash that the command continues in the next 
line. And you need a space in front of each. In fact, bash is often too picky 
about spaces.

As for jq, it is a terminal application that parses JSON. Install this package
if it is absent. By piping the output to it, the return is way easier to read.

In the end, we put an *echo ""*, just to break the line after the output, since
curl nor jq will care to do so.

### Calling a route that takes files

Just a few changes:

```bash
curl -X METHOD \
    -H "token: $token" \
    -H "Content-Type: multipart/form-data" \
    -F "field1=@file-you-want-1.ext" \
    -F "field2=@file-you-want-2.ext" \
    -d "$body" \
    link.to.your.route/subroute | jq
echo ""
```

First, in the headers, change the content type to *multipart/form-data*.
Then, for each file, add a *-F* line. Inside, you'll do '*field name*=@*file*'.
Easy. To make things simple, leave the files in the routes folder. And yes, send
them to the repo, so your test will still work for others easily.

### Saving data that came in the return

#### Part I - Fetching data from JSON

This might be the most complicated part, but do not worry, it's still very easy
to do.

First, change the route's call so that you save it in a variable, without jq.
Just do variable=$(*...the whole curl command...*).

```bash
response=$(curl -X METHOD \
    -H "token: $token" \
    -H "Content-Type: application/json" \
    -d "$body" \
    link.to.your.route/subroute
)
```

Right below it, you can print, so that when using the script, you can still see
stuff. This is because the output of curl went to the variable instead of the
terminal. Now you add jq again.

```bash
echo $response | jq
```

Now, we will extract the variable. Let's say the body you got was this:

```json
{
    "name": "Akina Nakamori",
    "genre": "jpop",
    "role": "vocals",
    "songs": [
        {
            "name": "Shoujo A",
            "year": 1984
        },
        {
            "name": "Southern Wind",
            "year": 1984
        },
        {
            "name": "Kaze wa Sora no Kanata",
            "year": 1989
        }
    ]
}
```

To save the name of the singer into the variable *name*, you'll do now:

```bash
name=$(echo $response | jq -r '.name')
```

Explanation:
- Everything is inside $() since you want to store the output of the command,
not the command as a string
- echo $response is the easiest way to pipe its content to jq
- jq -r removes wrapping quotes from the desired value
- '.name' is the path up to the value you want. Yes, it starts with a dot.

A harder one: the year of the first song.

```bash
name=$(echo $response | jq -r '.songs.[0].year')
```

Explanation:
- We navigate arrays with []
- We enter subfields with .

Really advanced: get the name of the song from 1989.

```bash
name=$(echo $response | jq -r '.songs.[] | select(.year==1984) | .name')
```

Explanation:
- We use [] to iterate all entries and return multiple results.
- Inner pipes in the jq request add filter on top of filter.
- The *select* gets only the entries that match the criteria
- We then get by pipe the name from whatever passed the select.

Just read more about jq to learn more tricks.

#### Part II - Saving it

With the data in a variable *var* into a file *.var.txt*, simply do this:
```bash
if [ $var != 'null' ]; then
    echo $var > .var.txt
fi
```

If the file already exists, it'll be **overwritten**.
The *if* checks if you found a value to begin with.

## Altering DB

First, you'll need to know SQL to do this, and have terminal access to your 
databases. Since this changes from person to person, here is my recommendation.
First, add these two files at the root of your project, next to the folders 
*routes* and *scripts*: *.dbPrompt.txt* and *.dbName.txt*.

The first, *.dbPrompt.txt*, should contain a command base for your db manager.
In my computer, it is *mariadb*, but in other Linux distros or settings and in 
Windows it usually is *mysql*.

Give it this content:
> mariadb -u USERNAME -pPASSWORD -e

Replace *mariadb*, USERNAME and PASSWORD accordingly. And yes, the spacing is 
right, *-u USERNAME* has a space in the middle, *-pPASSWORD* is all mushed 
together, and neither use quotes. The final *-e* will be useful later so we make
use of it in *.sh* files.

P.S. **MAKE SURE TO GIT IGNORE THESE, AS IT HAS YOUR PASSWORD!!**

The other file, *dbName.txt* is just the database name. Easy. Once you have 
created these files, within any route or script file, add these by the head:

```bash
dbPrompt=$(cat ../.dbPrompt.txt)
dbName=$(cat ../.dbName.txt)
```

This will make the script aware of how to call your DB. Now, you can, anywhere
in your script, run any SQL statement! Just do this:


```bash
dbPrompt=$(cat ../.dbPrompt.txt)
dbName=$(cat ../.dbName.txt)

# ... some code later

$dbPrompt 'SHOW TABLES' $dbName
```

## Scripts

Scripts are just *.sh* files that call a bunch of routes in sequence. Start them
like so:

```bash
#!/bin/bash
dbPrompt=$(cat .dbPrompt.txt)
dbName=$(cat .dbName.txt)

cd ../routes
```

From here on, just call routes, like you'd do on the terminal, line by line.
```bash
./my-route-1.sh
./my-route-2.sh
./my-route-3.sh
```

You can even call scripts!

```bash
../scripts/my-other-script.sh
```
