#!/usr/bin/env python3
# coding=utf-8

from qutescript import userscript
from shutil import copyfile
import micawber
from furl import furl
import logging
import subprocess
import shlex
import glob
import glob
import os


NOTES_PATH="/home/alex/Notes"


logging.basicConfig(filename="/var/log/qutebrowser_scripts.log", 
                    format='%(asctime)s - %(levelname)s - %(message)s', 
                    filemode='w')

logger = logging.getLogger("qutebrowserscripts")
logger.setLevel(logging.INFO) 





@userscript
def parse_youtube_url(request):

    logger.info("Analysing %s", request.url)

    f = furl(request.url)

    if f.host in ['www.youtube.com']:

        logger.debug("It really is a youtube link.")

        if 'list' in f.args:
            logger.info("Found a playlist %s", f.args['list'])

        for (key, _) in f.args.items():
            if key!='v':
                del f.args[key]

        providers = micawber.bootstrap_basic()
        analysis = providers.request(f.url)


        files = glob.glob(NOTES_PATH + '/**/*.md', recursive=True)
        files = map(lambda file: file.replace(NOTES_PATH+'/', '').replace('.md',''), files)
        all_files="\n".join(files)

        command_ask_rofi="rofi -dmenu -theme social -p 'Select the list to add this track ?'"
        res=subprocess.run(shlex.split(command_ask_rofi), input=all_files, encoding='utf-8', stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        chosen_note=str(res.stdout).strip("\n")
        logger.info("Chosen note is %s", chosen_note)

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

        try:
            fh = open(full_chosen_note, 'a+')
            text=fh.read()
            logger.info(text)
            if last_char != b'\n':
                fh.write('\n')
                logger.info("Adds an endofline")
            fh.write("- "+analysis['title'])
            fh.close()
        except IOError:
            logger.exception("There was an error while trying to create file %s", full_chosen_note)

        request.send_text(full_chosen_folder+" <br/> "+full_chosen_note+" <br/> "+analysis['title'])


if __name__ == '__main__':
    parse_youtube_url()
