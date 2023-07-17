#! /usr/bin/env sh

ansible-playbook -i inventory.yml --vault-password-file vault-password-file --extra-vars '@vars/passwords/passwords.yml' playbook.yml
