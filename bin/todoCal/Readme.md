# TodoCal

## Description

A command line tool that helps me use Google/Apple Calendar as my todo list.

`todo taskA` --> creates an all day event on top of my calendar. I process these stack of tasks, by assigning them a time in my schedule for that day. 

## Prerequisites

Before you can use it/ modify it for your usecase, you must obtain a set of client credentials. 

Follow the [quickstart guide]() on Google's website.

1. Register the app following the steps in that website.
2. Once you have the `credentials.json` in your `secrets/` directory, you can run the application.
3. The app will initiate an OAuth flow that will ask you to login. Once you login, it will generate an OAuth token which will be stored in the `secrets/` directory. 
4. The token will last until a week with the refresh token before you need to login again once.

Make sure to install the required packages from `requirements.txt`.

```
pip install -r requirements.txt
```

## Usage

```bash
python todoCal.py taskA
```

I like to create a symlink that allows me to run it directly with `todo`. See below:

```bash
sudo ln -s ~/.dotfiles/bin/todoCal.py /usr/local/bin/todo
```

## Disclaimer

Right now, this is a very crude version, to be refined and updated, adding more usecases.

Feel free to modify and extend the functionality as needed. Contributions and suggestions are welcome!
