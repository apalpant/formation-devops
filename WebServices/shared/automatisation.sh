#!/bin/sh

create_git_repo(){
	echo "Attempt to create repository"

	curl -X POST -H "Accept: application/json" \
		-H "Authorization: Bearer ${TOKEN}" \
		-d @json_create_repo.txt \
		https://api.github.com/user/repos
}

post_message(){
	curl -X POST -F channel=$1 \
		-H "Authorization: Bearer ${BOT_SLACK_TOKEN}" \
		-F text="$2" \
		https://slack.com/api/chat.postMessage > /dev/null
}
	
get_conversations_list(){
	curl https://slack.com/api/conversations.list \
		-H "Authorization: Bearer ${BOT_SLACK_TOKEN}" > conversations.list
}


# create_git_repo

# get_conversations_list

post_message ${CANAL_BOT} "Reminder: we've got a coding game tonight!"

post_message ${CANAL_BOT} "In function"
