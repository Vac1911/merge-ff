FROM alpine:latest

LABEL repository="https://github.com/Vac1911/merge-ff"
LABEL homepage="https://github.com/Vac1911/merge-ff"
LABEL "com.github.actions.name"="Merge FF"
LABEL "com.github.actions.icon"="git-merge"
LABEL "com.github.actions.color"="orange"

RUN apk --no-cache add bash curl git git-lfs jq
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
