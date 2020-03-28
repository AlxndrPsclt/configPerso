#!/usr/bin/env python3
# coding=utf-8

from qutescript import userscript
import micawber
from furl import furl
import logging
import subprocess
import shlex
import glob
import os
import sys
import notify2


NOTES_PATH="/home/alex/music/collection/index"
CONFIG_FILE="/home/alex/.config/perso/qutebrowser/userscripts/ytchannel_config.yml"

logging.basicConfig(filename="/var/log/qutebrowser_scripts.log", 
                    format='%(asctime)s - %(levelname)s - %(message)s', 
                    filemode='w')

logger = logging.getLogger("qutebrowserscripts")
logger.setLevel(logging.INFO) 

notify2.init('Qutetrack saving')


@userscript
def parse_youtube_url(request):

    logger.info("Analysing %s", request.url)


    files = glob.glob(NOTES_PATH + '/**/*.yml', recursive=True)
    files = map(lambda file: file.replace(NOTES_PATH+'/', '').replace('.yml',''), files)
    all_files="\n".join(files)

    #prompt="Where to add {}".format(analysis['title'].replace("'"," "))
    prompt="Where to add this video?"

#    if len(prompt)>50:
#        cur=50
#        while prompt[cur]!=' ':
#            if cur==0:
#                cur=50
#                break
#            else:
#                cur=cur-1
#
#        prompt=prompt[:cur]+'     \n'+"{:.50}".format(prompt[cur:].strip())

    command_ask_rofi="rofi -dmenu -matching fuzzy -columns 2 -theme social -p '{} ?'".format(prompt)
    res=subprocess.run(shlex.split(command_ask_rofi), input=all_files, encoding='utf-8', stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    chosen_note=str(res.stdout).strip("\n")
    logger.info("Chosen note is %s", chosen_note)

    if chosen_note=="":
        logger.info("No chosen folder. Exiting.")
        n = notify2.Notification("Error in saving track","No destination note was chosen.")
        n.show()
        sys.exit(1)

    chosen_folder=os.path.dirname(chosen_note)
    chosen_filename=os.path.basename(chosen_note)+'.yml'

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
        last_char=b'\n'   #Needed to not start the file on a blank line
    except Exception as e:
        logger.exception("There was an error while trying to read file %s", full_chosen_note)
        n = notify2.Notification("Error in saving link","Could not read existing note {}.".format(chosen_note))
        n.show()
        sys.exit(1)

    try:
        fh = open(full_chosen_note, 'a+')
        text=fh.read()
        logger.info(text)
        if last_char != b'\n':
            fh.write('\n')
            logger.info("Adds an endofline")
        fh.write("- {}".format(request.url))
        fh.close()
    except IOError:
        logger.exception("There was an error while trying to create file %s", full_chosen_note)
        n = notify2.Notification("Error in saving track","Could not write to {} note.".format(chosen_note))
        n.show()
        sys.exit(1)

    n = notify2.Notification("Track {} was added to note {}".format(request.url, chosen_note))
    n.show()

    request.send_text(full_chosen_folder+" <br/> "+full_chosen_note+" <br/> "+request.url)
else:
    logger.exception("A non youtube link was provided {}", request.url)
    n = notify2.Notification("Error in saving track","A non youtube link was provided {}. This is not yet supported.".format(request.url))
    n.show()
    sys.exit(1)


if __name__ == '__main__':
    parse_youtube_url()
