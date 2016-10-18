#! /usr/bin/env bash
echo $@
SESSIONNAME=$1
PASSPHRASE=$2
SOCK_SECRET=`echo $1 | openssl dgst -sha1 -hmac "$2" | sed 's/(stdin)= //'`
SOCKSECRET64=`echo $SOCK_SECRET | base64`
URL64SOCKSECRET=`echo $SOCKSECRET64 | tr '+' '-' | tr '/' '_'`
SHORTSECRET=`echo $URL64SOCKSECRET | cut -c-10`
SESSION_LINK=/tmp/ssh-$SHORTSECRET
echo $SESSION_LINK
echo $SSH_AUTH_SOCK
rm -f $SESSION_LINK
ln -s $SSH_AUTH_SOCK $SESSION_LINK
export SESSION_LINK
tmux new-session -A -s $SESSIONNAME
