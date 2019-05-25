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

        if 'list' in f.args:
            logger.info("Found a playlist %s", f.args['list'])

        for (key, _) in f.args.items():
            if key!='v':
                del f.args[key]

        providers = micawber.bootstrap_basic()
        analysis = providers.request(f.url)

        command_ask_rofi="rofi -dmenu -theme social -p 'Select the list to add this track ?'"

        NOTES_PATH="/home/alex/Notes"

        files = glob.glob(NOTES_PATH + '/**/*.md', recursive=True)
        files = files.
        all_files="\n".join(files)

        res=subprocess.run(shlex.split(command_ask_rofi), input=all_files, encoding='utf-8', stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        chosen_folder=str(res.stdout)
        chosen_error=str(res.stderr)

        request.send_text(chosen_folder + "<br>"+ chosen_error)


if __name__ == '__main__':
    parse_youtube_url()
