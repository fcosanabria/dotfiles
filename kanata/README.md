A script to install and setup Kanata with a single command.
This script installs and sets up Kanata with a dedicated user (kanata) and a restricted systemd service for better security.

It pretty much does everything for you. From installation to auto-start at boot.
All you have to do is provide your Kantana .kbd config path in the script.
Prerequisites:

    You need sudo access.
    This script assumes an Ubuntu/Debian-based system.
    Have your Kanata config file somewhere in $HOME directory.
        ex: ~/dotfiles/kanata/kanata-config.kdb
        or ~/kanata-config.kdb

    Note: The script will copy the provided kanata config file into /etc/kanata/ system directory.

How to create and use the script:

    Copy the entire shell script provided below.

    Save the copied text into a file on your computer. Name it something like setup-kanata-hardened.sh.

    Make the script executable, open your terminal and run:
    chmod +x setup-kanata-hardened.sh

    Execute the script using sudo:
    sudo ./setup-kanata-hardened.sh

    The script will perform all steps:
        install Kanata (v1.7.0)
        copy your config into system location "/etc/kanata/kanata-config.kbd"
        create user/group
        set rules
        create/enable/start the systemd service.

    Finally, after running the script, reboot your computer.

Thanks to [iKnowRam](https://github.com/iKnowRam) for this script. You can find the post [here](https://github.com/jtroo/kanata/discussions/130#discussioncomment-12782201)
