# Continuous Integration + Continuous Deployment
## Continuous Integration
В качестве сервер CI используется [Jenknins](http://jenkins.io/)

**Конфигурирование**: работы в каждом проекте создаётся "Jenkninsfile" с описание
процесса извлечения тестирования и сборки результатов

**Доступ к репозитарию**: для получения доступа используются Deployment keys,
создаваемые для учётной записью под котторой работает сервер CI, при этом
соотвествующие записи делаются в `~/.ssh/config`. Т.е. нарпример, репозитарий
"story_line2_build" выглядит как "story_line2_build.github.com" и с
ключём "id_rsa.story_line2_build" -- это соотвественно находит своё отражение в
путях для git - "story_line2_crawler.github.com:fedor-malyshkin/story_line2_crawler.git"

Полезный скрипт для ключей:
```sh
for var in story_line2_crawler story_line2_build story_line2_deployment \
 story_line2_client-android story_line2_server_web story_line2_server_storm story_line2_morph \
 story_line2_config story_line2_glr_parser story_line2_analyser story_line2_glr_parser_debugger \
 story_line2_glr_parser_testing story_line2_token story_line2_geo
do
    ssh-keygen -b 4096 -t rsa -N "" -C "Jenkins $var repo key" -f id_rsa.$var
done
```

## Continuous Deployment
