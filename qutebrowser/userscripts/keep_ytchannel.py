#!/usr/bin/env python3
# coding=utf-8

from qutescript import userscript
from furl import furl
import logging
import os
import sys
import subprocess
import notify2
import yaml

NOTES_PATH="/home/alex/notes"
CONFIG_FILE="/home/alex/.config/perso/qutebrowser/userscripts/ytchannel_config.yml"



logging.basicConfig(filename="/var/log/qutebrowser_scripts.log", 
                    format='%(asctime)s - %(levelname)s - %(message)s', 
                    filemode='w')

logger = logging.getLogger("qutebrowserscripts")
logger.setLevel(logging.INFO) 

notify2.init('Qute_ytchannel saving')


@userscript
def parse_youtube_url(request):

    logger.info("Analysing %s", request.url)

    f = furl(request.url)


    logger.info("VIM", request.url)

    if f.path.segments[0] == "channel" and f.path.segments[1]:
        logger.info("Found a channel %s", f.[path.segments[1])

        try:
            with file(CONFIG_FILE, 'a') as stream:
                config = yaml.load(stream)
        except IOError:
            logger.exception("There was an error while trying to open config file %s", CONFIG_FILE)
            n = notify2.Notification("Error in saving channel","Could not read the config.".format(CONFIG_FILE))
            n.show()
            sys.exit(1)

    categories = config['categories'].keys()

    prompt="What category is this yt channel ? {}"

    if len(prompt)>50:
        cur=50
        while prompt[cur]!=' ':
            if cur==0:
                cur=50
                break
            else:
                cur=cur-1

        prompt=prompt[:cur]+'     \n'+"{:.50}".format(prompt[cur:].strip())

    command_ask_rofi="rofi -dmenu -matching fuzzy -columns 2 -theme social -p '{} ?'".format(prompt)

    res=subprocess.run(shlex.split(command_ask_rofi), input=categories, encoding='utf-8', stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    chosen_category=str(res.stdout).strip("\n")
    logger.info("Chosen ctaegory is %s", chosen_category)

    if chosen_note=="":
        logger.info("No chosen folder. Exiting.")
        n = notify2.Notification("Error in saving track","No destination note was chosen.")
        n.show()
        sys.exit(1)

    chosen_folder=os.path.dirname(chosen_note)
    chosen_filename=os.path.basename(chosen_note)+'.md'

    full_chosen_folder=os.path.join(NOTES_PATH, chosen_folder)
    full_chosen_note=os.path.join(full_chosen_folder, chosen_filename)


    try:
        os.makedirs(full_chosen_folder)
        logger.info("Created a new folder %s", full_chosen_folder)
    except FileExistsError:
        logger.debug("Folder %s already existed.", full_chosen_folder)
    except Exception as e:
        logger.exception("There was an error while trying to create folder %s", full_chosen_folder)
        n = notify2.Notification("Error in saving track","Could not create missing folder. {}".full_chosen_folder)
        n.show()
        sys.exit(1)

    try:
        #last_char
        read_note=open(full_chosen_note, 'rb')
        read_note.seek(-1,os.SEEK_END)
        last_char=read_note.read()
        read_note.close()
    except FileNotFoundError:
        logger.info("The desired note doesn't exist yet, will be created %s", full_chosen_note)
        last_char='\n'   #Needed to not start the file on a blank line
    except Exception as e:
        logger.exception("There was an error while trying to read file %s", full_chosen_note)
        n = notify2.Notification("Error in saving track","Could not read existing note {}.".format(chosen_note))
        n.show()
        sys.exit(1)

    try:
        with file('document.yaml', 'a') as stream:
            yt_channels = yaml.load(stream)

    except IOError:
        logger.exception("There was an error while trying to create file %s", full_chosen_note)
        n = notify2.Notification("Error in saving channel","Could not write to the yt_channels note.".format(chosen_note))
        n.show()
        sys.exit(1)

    n = notify2.Notification("Channel {} was added to note {}".format(analysis['title'], chosen_note))
    n.show()

    request.send_text(full_chosen_folder+" <br/> "+full_chosen_note+" <br/> "+analysis['title'])

if __name__ == '__main__':
    parse_youtube_url()
